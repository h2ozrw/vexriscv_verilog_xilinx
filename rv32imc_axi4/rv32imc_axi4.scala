package vexriscv.demo

import spinal.core._
import spinal.lib._
import spinal.lib.bus.amba4.axi.Axi4ReadOnly
import spinal.lib.bus.avalon.AvalonMM
import spinal.lib.com.jtag.Jtag
import spinal.lib.eda.altera.{InterruptReceiverTag, QSysify, ResetEmitterTag}
import vexriscv.ip.{DataCacheConfig, InstructionCacheConfig}
import vexriscv.plugin._
import vexriscv.{VexRiscv, VexRiscvConfig, plugin}

object rv32imc_axi4 {
    def main(args: Array[String]) {
        val report = SpinalVerilog{
            val cpuConfig = VexRiscvConfig(
                plugins = List(
                    new IBusCachedPlugin(
                        resetVector             = null,
                        prediction              = STATIC,
                        compressedGen           = true,
                        injectorStage           = false,
                        config = InstructionCacheConfig(
                            cacheSize           = 8192,
                            bytePerLine         = 32,
                            wayCount            = 2,
                            addressWidth        = 32,
                            cpuDataWidth        = 32,
                            memDataWidth        = 32,
                            catchIllegalAccess  = false,
                            catchAccessFault    = false,
                            asyncTagMemory      = false,
                            twoCycleRam         = false,
                            twoCycleCache       = true
                        )
                    ),
                    new DBusCachedPlugin(
                        config = new DataCacheConfig(
                            cacheSize           = 8192,
                            bytePerLine         = 32,
                            wayCount            = 2,
                            addressWidth        = 32,
                            cpuDataWidth        = 32,
                            memDataWidth        = 32,
                            catchAccessError    = false,
                            catchIllegal        = false,
                            catchUnaligned      = false
                        ),
                        memoryTranslatorPortConfig = null
                    ),
                    new StaticMemoryTranslatorPlugin(
                        ioRange = _(31 downto 28) === 0xF
                    ),
                    new DecoderSimplePlugin(
                        catchIllegalInstruction = false
                    ),
                    new RegFilePlugin(
                        regFileReadyKind = plugin.ASYNC,
                        zeroBoot         = false,
                        x0Init           = false
                    ),
                    new IntAluPlugin,
                    new SrcPlugin(
                        separatedAddSub  = false,
                        executeInsertion = true
                    ),
                    new FullBarrelShifterPlugin,
                    new MulPlugin,
                    new DivPlugin,
                    new HazardSimplePlugin(
                        bypassExecute           = true,
                        bypassMemory            = true,
                        bypassWriteBack         = true,
                        bypassWriteBackBuffer   = true,
                        pessimisticUseSrc       = false,
                        pessimisticWriteRegFile = false,
                        pessimisticAddressMatch = false
                    ),
                    new BranchPlugin(
                        earlyBranch             = false,
                        catchAddressMisaligned  = false
                    ),
                    new CsrPlugin(
                        config = CsrPluginConfig(
                            catchIllegalAccess  = false,
                            mvendorid           = null,
                            marchid             = null,
                            mimpid              = null,
                            mhartid             = null,
                            misaExtensionsInit  = 66,
                            misaAccess          = CsrAccess.NONE,
                            mtvecAccess         = CsrAccess.NONE,
                            mtvecInit           = 0x00000020l,
                            mepcAccess          = CsrAccess.READ_WRITE,
                            mscratchGen         = false,
                            mcauseAccess        = CsrAccess.READ_ONLY,
                            mbadaddrAccess      = CsrAccess.READ_ONLY,
                            mcycleAccess        = CsrAccess.READ_ONLY,
                            minstretAccess      = CsrAccess.NONE,
                            ecallGen            = false,
                            wfiGenAsWait        = false,
                            ucycleAccess        = CsrAccess.READ_ONLY
                        )
                    )
                )
            )

            val cpu = new VexRiscv(cpuConfig)

            cpu.setDefinitionName("rv32imc_axi4")

            cpu.rework {
                var iBus : Axi4ReadOnly = null
                for (plugin <- cpuConfig.plugins) plugin match {
                    case plugin: IBusCachedPlugin => {
                        plugin.iBus.setAsDirectionLess()
                        iBus = master(plugin.iBus.toAxi4ReadOnly().toFullConfig())
                            .setName("iBusAxi")
                            .addTag(ClockDomainTag(ClockDomain.current))
                    }
                    case plugin: DBusCachedPlugin => {
                        plugin.dBus.setAsDirectionLess()
                        master(plugin.dBus.toAxi4Shared().toAxi4().toFullConfig())
                            .setName("dBusAxi")
                            .addTag(ClockDomainTag(ClockDomain.current))
                    }
                    case _ =>
                }
                for (plugin <- cpuConfig.plugins) plugin match {
                    case plugin: CsrPlugin => {
                        plugin.externalInterrupt
                            .addTag(InterruptReceiverTag(iBus, ClockDomain.current))
                        plugin.timerInterrupt
                            .addTag(InterruptReceiverTag(iBus, ClockDomain.current))
                    }
                    case _ =>
                }
            }
            cpu
        }
    }
}
