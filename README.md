# vexriscv_verilog_xilinx

Generated Verilog files of VexRiscV for Xilinx FPGA

##  Generated Cores Brief

**/rv32imc_r1**

-   Git commit log illustrates how to modify generated code for FPGA.
-   "C" is supported but front end is not so good at it yet.
-   Xilinx A7-2I, max system frequency is about 150MHz.

**/rv32imc_r2**

-   Seems a stable state for core generation.
-   Target frequency is 125MHz, Xilinx A7-2I, 64KiB BlockRAM as Dual Port I+D memory. All possible optimizations enabled.
-   ~2.4 CoreMarks/MHz.

**/rv32imc_axi4**

-   Git commit log illustrates how to modify generated code for FPGA.
