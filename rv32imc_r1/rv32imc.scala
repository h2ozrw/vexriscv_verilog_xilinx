package vexriscv.demo

import vexriscv.plugin._
import vexriscv.{plugin, VexRiscv, VexRiscvConfig}
import spinal.core._

object rv32imc extends App{
  def cpu() = new VexRiscv(
    config = VexRiscvConfig(
      plugins = List(
        new IBusSimplePlugin(
          resetVector          = null,   // externalResetVector port sets reset vector
          cmdForkOnSecondStage = false,
          cmdForkPersistence   = false,
          prediction           = STATIC,
          catchAccessFault     = false,
          compressedGen        = true,   // RVC support
          rspHoldValue         = true    // ibus rsp holds value, e.g. output enable controlled output
        ),
        new DBusSimplePlugin(
          catchAddressMisaligned = false,
          catchAccessFault       = false,
          onlyLoadWords          = false
        ),
        new DecoderSimplePlugin(
          catchIllegalInstruction = false
        ),
        new RegFilePlugin(
          regFileReadyKind = plugin.ASYNC, // distributed memory, SYNC is OK for in slice register
          zeroBoot         = false,
          x0Init           = false
        ),
        new IntAluPlugin,
        new SrcPlugin(
          separatedAddSub  = false,
          executeInsertion = true
        ),
        new FullBarrelShifterPlugin,
        new HazardSimplePlugin(
          bypassExecute           = true,
          bypassMemory            = true,
          bypassWriteBack         = true,
          bypassWriteBackBuffer   = true,
          pessimisticUseSrc       = false,
          pessimisticWriteRegFile = false,
          pessimisticAddressMatch = false
        ),
        new MulPlugin,
        new DivPlugin,
        new BranchPlugin(
          earlyBranch            = false,
          catchAddressMisaligned = false
        )
      )
    )
  )

  SpinalVerilog(cpu())
}
