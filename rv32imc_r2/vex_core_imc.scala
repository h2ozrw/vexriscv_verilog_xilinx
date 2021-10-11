package vexriscv.demo

import vexriscv.plugin._
import vexriscv.{plugin, VexRiscv, VexRiscvConfig}
import spinal.core._

object vex_core_imc extends {
    def main(args: Array[String]) {
        val report = SpinalVerilog{
            val cpuConfig = VexRiscvConfig(
                plugins = List(
                    new IBusSimplePlugin(
                        resetVector                 = null,
                        cmdForkOnSecondStage        = false,
                        cmdForkPersistence          = false,
                        prediction                  = STATIC,
                        catchAccessFault            = false,
                        injectorStage               = true,
                        compressedGen               = true
                    ),
                    new DBusSimplePlugin(
                        catchAddressMisaligned      = false,
                        catchAccessFault            = false,
                        earlyInjection              = true,
                        onlyLoadWords               = false
                    ),
                    new DecoderSimplePlugin(
                        catchIllegalInstruction     = false
                    ),
                    new RegFilePlugin(
                        regFileReadyKind            = plugin.ASYNC,
                        zeroBoot                    = false,
                        x0Init                      = false
                    ),
                    new IntAluPlugin,
                    new SrcPlugin(
                        separatedAddSub             = false,
                        executeInsertion            = true
                    ),
                    new FullBarrelShifterPlugin(
                        earlyInjection              = true
                    ),
                    new HazardSimplePlugin(
                        bypassExecute               = true,
                        bypassMemory                = true,
                        bypassWriteBack             = true,
                        bypassWriteBackBuffer       = true,
                        pessimisticUseSrc           = false,
                        pessimisticWriteRegFile     = false,
                        pessimisticAddressMatch     = false
                    ),
                    new MulPlugin,
                    new DivPlugin,
                    new BranchPlugin(
                        earlyBranch                 = true,
                        catchAddressMisaligned      = false
                    )
                )
            )

            val cpu = new VexRiscv(cpuConfig)

            cpu.setDefinitionName("rv32_core_imc")

            cpu
        }
    }
}
