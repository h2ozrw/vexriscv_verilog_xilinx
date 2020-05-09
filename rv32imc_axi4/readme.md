To make the core smaller, almost all error checking is disabled.

CSR is partially implemented, check scala file for details.

Xilinx Vivado OOC Syn Result
```
+-----------------------+---------------------------+----------------+----------------------+-----------------------------+
|Module Name            | RTL Object                | Inference      | Size (Depth x Width) | Primitives                  |
+-----------------------+---------------------------+----------------+----------------------+-----------------------------+
|IBusCachedPlugin_cache | ways_1_tags_reg           | User Attribute | 128 x 22             | RAM64X1D x 2  RAM64M x 14   |
|IBusCachedPlugin_cache | ways_0_tags_reg           | User Attribute | 128 x 22             | RAM64X1D x 2  RAM64M x 14   |
|dataCache_1            | ways_0_tags_reg           | User Attribute | 128 x 22             | RAM64X1D x 2  RAM64M x 14   |
|dataCache_1            | ways_1_tags_reg           | User Attribute | 128 x 22             | RAM64X1D x 2  RAM64M x 14   |
|rv32imc_axi4           | RegFilePlugin_regFile_reg | User Attribute | 32 x 32              | RAM32M x 12                 |
+-----------------------+---------------------------+----------------+----------------------+-----------------------------+

+------------------+------------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+
|Module Name       | RTL Object       | PORT A (Depth x Width) | W | R | PORT B (Depth x Width) | W | R | Ports driving FF | RAMB18 | RAMB36 |
+------------------+------------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+
|InstructionCache: | ways_1_datas_reg | 1 K x 32(READ_FIRST)   | W |   | 1 K x 32(WRITE_FIRST)  |   | R | Port A and B     | 0      | 1      |
|InstructionCache: | ways_0_datas_reg | 1 K x 32(READ_FIRST)   | W |   | 1 K x 32(WRITE_FIRST)  |   | R | Port A and B     | 0      | 1      |
|DataCache:        | ways_1_datas_reg | 1 K x 32(WRITE_FIRST)  |   | R | 1 K x 32(READ_FIRST)   | W |   | Port A and B     | 0      | 1      |
|DataCache:        | ways_0_datas_reg | 1 K x 32(WRITE_FIRST)  |   | R | 1 K x 32(READ_FIRST)   | W |   | Port A and B     | 0      | 1      |
+------------------+------------------+------------------------+---+---+------------------------+---+---+------------------+--------+--------+

+-------------+-------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
|Module Name  | DSP Mapping | A Size | B Size | C Size | D Size | P Size | AREG | BREG | CREG | DREG | ADREG | MREG | PREG |
+-------------+-------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
|rv32imc_axi4 | (A*B)'      | 17     | 17     | -      | -      | 34     | 0    | 0    | -    | -    | -     | 1    | 1    |
|rv32imc_axi4 | (A2*B)'     | 17     | 17     | -      | -      | 34     | 1    | 0    | -    | -    | -     | 1    | 0    |
|rv32imc_axi4 | (A*B2)'     | 17     | 17     | -      | -      | 34     | 0    | 1    | -    | -    | -     | 1    | 0    |
|rv32imc_axi4 | (A2*B2)'    | 16     | 16     | -      | -      | 32     | 1    | 1    | -    | -    | -     | 1    | 0    |
+-------------+-------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+




+----------------------------+------+-------+-----------+-------+
|          Site Type         | Used | Fixed | Available | Util% |
+----------------------------+------+-------+-----------+-------+
| Slice LUTs*                | 2212 |     0 |     32600 |  6.79 |
|   LUT as Logic             | 1924 |     0 |     32600 |  5.90 |
|   LUT as Memory            |  288 |     0 |      9600 |  3.00 |
|     LUT as Distributed RAM |  288 |     0 |           |       |
|     LUT as Shift Register  |    0 |     0 |           |       |
| Slice Registers            | 1123 |     0 |     65200 |  1.72 |
|   Register as Flip Flop    | 1123 |     0 |     65200 |  1.72 |
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
| 4     |          Yes |         Set |            - |
| 1119  |          Yes |       Reset |            - |
+-------+--------------+-------------+--------------+

+-------------------+------+-------+-----------+-------+
|     Site Type     | Used | Fixed | Available | Util% |
+-------------------+------+-------+-----------+-------+
| Block RAM Tile    |    4 |     0 |        75 |  5.33 |
|   RAMB36/FIFO*    |    4 |     0 |        75 |  5.33 |
|     RAMB36E1 only |    4 |       |           |       |
|   RAMB18          |    0 |     0 |       150 |  0.00 |
+-------------------+------+-------+-----------+-------+

+----------------+------+-------+-----------+-------+
|    Site Type   | Used | Fixed | Available | Util% |
+----------------+------+-------+-----------+-------+
| DSPs           |    4 |     0 |       120 |  3.33 |
|   DSP48E1 only |    4 |       |           |       |
+----------------+------+-------+-----------+-------+

+----------+------+---------------------+
| Ref Name | Used | Functional Category |
+----------+------+---------------------+
| FDRE     | 1119 |        Flop & Latch |
| LUT6     |  882 |                 LUT |
| LUT5     |  448 |                 LUT |
| LUT4     |  336 |                 LUT |
| LUT3     |  278 |                 LUT |
| RAMD64E  |  240 |  Distributed Memory |
| LUT2     |  165 |                 LUT |
| CARRY4   |  120 |          CarryLogic |
| RAMD32   |   72 |  Distributed Memory |
| LUT1     |   67 |                 LUT |
| RAMS32   |   24 |  Distributed Memory |
| RAMB36E1 |    4 |        Block Memory |
| FDSE     |    4 |        Flop & Latch |
| DSP48E1  |    4 |    Block Arithmetic |
| MUXF7    |    1 |               MuxFx |
+----------+------+---------------------+
```
