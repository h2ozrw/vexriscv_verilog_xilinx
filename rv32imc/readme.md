VexRiscV commit 492310e6fa66e9d8a47a48ea6dc406fde961dcf8 is the last commit before its fetch stage rework.
Before it, VexRiscV allows removing the internal instruction fifo, if ibus-rsp keeps stable between ibus-cmd.
This feature requires using of inst memory's operation enable signal to keep its output stable between inst reads.

To make the core smaller, almost all error checking is disabled.

CSR is NOT implemented, thus NO Interrupt support.

Typical Memory Verilog Code (Xilinx FPGA Block RAM)
```
    (* ram_style = "block" *) reg [31 : 0] mem [4095 : 0];

    initial begin
        for(idx = 0; idx < 4096; idx = idx + 1) begin
            mem[idx] = 0;
        end
    end

    always @(posedge CLK) begin
        if(mem_open) begin
            mem_read <= #1 mem[mem_addr];

            for(idx = 0; idx < 4; idx = idx + 1) begin
                if(mem_strb[idx]) begin
                    mem[mem_addr][idx*8 +: 8] <= #1 mem_write[idx*8 +: 8];
                end
            end
        end
    end
```

Reference Connection
```
    inst_addr       iBus_cmd_payload_pc
    inst_open       iBus_cmd_valid
    inst_strb       0

    data_addr       dBus_cmd_payload_address
    data_open       dBus_cmd_valid
    data_strb       dBus_cmd_payload_wr ? conv(dBus_cmd_payload_size) : 0
```

Xilinx Vivado OOC Syn Result
```
+------------+---------------------------+----------------+----------------------+---------------+
|Module Name | RTL Object                | Inference      | Size (Depth x Width) | Primitives    |
+------------+---------------------------+----------------+----------------------+---------------+
|rv32imc     | RegFilePlugin_regFile_reg | User Attribute | 32 x 32              | RAM32M x 12   |
+------------+---------------------------+----------------+----------------------+---------------+

+------------+-------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
|Module Name | DSP Mapping | A Size | B Size | C Size | D Size | P Size | AREG | BREG | CREG | DREG | ADREG | MREG | PREG |
+------------+-------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
|rv32imc     | (A*B)'      | 17     | 17     | -      | -      | 34     | 0    | 0    | -    | -    | -     | 1    | 1    |
|rv32imc     | (A2*B)'     | 17     | 17     | -      | -      | 34     | 1    | 0    | -    | -    | -     | 1    | 0    |
|rv32imc     | (A*B2)'     | 17     | 17     | -      | -      | 34     | 0    | 1    | -    | -    | -     | 1    | 0    |
|rv32imc     | (A2*B2)'    | 16     | 16     | -      | -      | 32     | 1    | 1    | -    | -    | -     | 1    | 0    |
+------------+-------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+




+----------------------------+------+-------+-----------+-------+
|          Site Type         | Used | Fixed | Available | Util% |
+----------------------------+------+-------+-----------+-------+
| Slice LUTs*                | 1327 |     0 |     32600 |  4.07 |
|   LUT as Logic             | 1279 |     0 |     32600 |  3.92 |
|   LUT as Memory            |   48 |     0 |      9600 |  0.50 |
|     LUT as Distributed RAM |   48 |     0 |           |       |
|     LUT as Shift Register  |    0 |     0 |           |       |
| Slice Registers            |  688 |     0 |     65200 |  1.06 |
|   Register as Flip Flop    |  688 |     0 |     65200 |  1.06 |
|   Register as Latch        |    0 |     0 |     65200 |  0.00 |
| F7 Muxes                   |    0 |     0 |     16300 |  0.00 |
| F8 Muxes                   |    0 |     0 |      8150 |  0.00 |
+----------------------------+------+-------+-----------+-------+

+-------+--------------+-------------+--------------+
| Total | Clock Enable | Synchronous | Asynchronous |
+-------+--------------+-------------+--------------+
| 0     |            _ |           - |            - |
| 0     |            _ |           - |          Set |
| 0     |            _ |           - |        Reset |
| 0     |            _ |         Set |            - |
| 0     |            _ |       Reset |            - |
| 0     |          Yes |           - |            - |
| 0     |          Yes |           - |          Set |
| 0     |          Yes |           - |        Reset |
| 0     |          Yes |         Set |            - |
| 688   |          Yes |       Reset |            - |
+-------+--------------+-------------+--------------+

+----------------+------+-------+-----------+-------+
|    Site Type   | Used | Fixed | Available | Util% |
+----------------+------+-------+-----------+-------+
| DSPs           |    4 |     0 |       120 |  3.33 |
|   DSP48E1 only |    4 |       |           |       |
+----------------+------+-------+-----------+-------+

+----------+------+---------------------+
| Ref Name | Used | Functional Category |
+----------+------+---------------------+
| FDRE     |  688 |        Flop & Latch |
| LUT6     |  610 |                 LUT |
| LUT5     |  239 |                 LUT |
| LUT4     |  225 |                 LUT |
| LUT3     |  193 |                 LUT |
| LUT2     |  155 |                 LUT |
| CARRY4   |   94 |          CarryLogic |
| RAMD32   |   72 |  Distributed Memory |
| RAMS32   |   24 |  Distributed Memory |
| LUT1     |   17 |                 LUT |
| DSP48E1  |    4 |    Block Arithmetic |
+----------+------+---------------------+
```
