##  VexRiscV, RV32IMC core, r2.

`36b3cd918896c94c4e8a224d97c559ab6dbf3ec9` VexRiscV

`adf552d8f500e7419fff395b7049228e4bc5de26` SpinalHDL

Seems a stable state after fetch stage rework, but before lots work of FPU support.

##  ChangeLog:
-   internal instruction fifo is enabled and can not be disabled anymore.
-   enable "early" injection settings, to improve performance. Xilinx Vivado P&R shows these are not critical path.

##  Xilinx Vivado OOC Syn Result
```
+--------------+---------------------------+----------------+----------------------+---------------+
|Module Name   | RTL Object                | Inference      | Size (Depth x Width) | Primitives    |
+--------------+---------------------------+----------------+----------------------+---------------+
|rv32_core_imc | RegFilePlugin_regFile_reg | User Attribute | 32 x 32              | RAM32M x 12   |
+--------------+---------------------------+----------------+----------------------+---------------+

+--------------+-------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
|Module Name   | DSP Mapping | A Size | B Size | C Size | D Size | P Size | AREG | BREG | CREG | DREG | ADREG | MREG | PREG |
+--------------+-------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
|rv32_core_imc | (A*B)'      | 17     | 17     | -      | -      | 34     | 0    | 0    | -    | -    | -     | 1    | 1    |
|rv32_core_imc | (A2*B)'     | 17     | 17     | -      | -      | 34     | 1    | 0    | -    | -    | -     | 1    | 0    |
|rv32_core_imc | (A*B2)'     | 17     | 17     | -      | -      | 34     | 0    | 1    | -    | -    | -     | 1    | 0    |
|rv32_core_imc | (A2*B2)'    | 16     | 16     | -      | -      | 32     | 1    | 1    | -    | -    | -     | 1    | 0    |
+--------------+-------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+


+----------------------------+------+-------+-----------+-------+
|          Site Type         | Used | Fixed | Available | Util% |
+----------------------------+------+-------+-----------+-------+
| Slice LUTs*                | 1462 |     0 |     32600 |  4.48 |
|   LUT as Logic             | 1414 |     0 |     32600 |  4.34 |
|   LUT as Memory            |   48 |     0 |      9600 |  0.50 |
|     LUT as Distributed RAM |   48 |     0 |           |       |
|     LUT as Shift Register  |    0 |     0 |           |       |
| Slice Registers            |  618 |     0 |     65200 |  0.95 |
|   Register as Flip Flop    |  618 |     0 |     65200 |  0.95 |
|   Register as Latch        |    0 |     0 |     65200 |  0.00 |
| F7 Muxes                   |    1 |     0 |     16300 | <0.01 |
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
| 618   |          Yes |       Reset |            - |
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
| LUT6     |  682 |                 LUT |
| FDRE     |  618 |        Flop & Latch |
| LUT5     |  307 |                 LUT |
| LUT3     |  255 |                 LUT |
| LUT4     |  201 |                 LUT |
| LUT2     |  153 |                 LUT |
| CARRY4   |   94 |          CarryLogic |
| RAMD32   |   72 |  Distributed Memory |
| LUT1     |   38 |                 LUT |
| RAMS32   |   24 |  Distributed Memory |
| DSP48E1  |    4 |    Block Arithmetic |
| MUXF7    |    1 |               MuxFx |
+----------+------+---------------------+
```
