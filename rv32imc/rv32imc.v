// VexRiscV  492310e6fa66e9d8a47a48ea6dc406fde961dcf8
// SpinalHDL 4e84e91b191e2e608958155e98f2ec7ba0fbed84


`define BranchCtrlEnum_defaultEncoding_type [1:0]
`define BranchCtrlEnum_defaultEncoding_INC 2'b00
`define BranchCtrlEnum_defaultEncoding_B 2'b01
`define BranchCtrlEnum_defaultEncoding_JAL 2'b10
`define BranchCtrlEnum_defaultEncoding_JALR 2'b11

`define Src1CtrlEnum_defaultEncoding_type [1:0]
`define Src1CtrlEnum_defaultEncoding_RS 2'b00
`define Src1CtrlEnum_defaultEncoding_IMU 2'b01
`define Src1CtrlEnum_defaultEncoding_PC_INCREMENT 2'b10
`define Src1CtrlEnum_defaultEncoding_URS1 2'b11

`define Src2CtrlEnum_defaultEncoding_type [1:0]
`define Src2CtrlEnum_defaultEncoding_RS 2'b00
`define Src2CtrlEnum_defaultEncoding_IMI 2'b01
`define Src2CtrlEnum_defaultEncoding_IMS 2'b10
`define Src2CtrlEnum_defaultEncoding_PC 2'b11

`define AluBitwiseCtrlEnum_defaultEncoding_type [1:0]
`define AluBitwiseCtrlEnum_defaultEncoding_XOR_1 2'b00
`define AluBitwiseCtrlEnum_defaultEncoding_OR_1 2'b01
`define AluBitwiseCtrlEnum_defaultEncoding_AND_1 2'b10

`define ShiftCtrlEnum_defaultEncoding_type [1:0]
`define ShiftCtrlEnum_defaultEncoding_DISABLE_1 2'b00
`define ShiftCtrlEnum_defaultEncoding_SLL_1 2'b01
`define ShiftCtrlEnum_defaultEncoding_SRL_1 2'b10
`define ShiftCtrlEnum_defaultEncoding_SRA_1 2'b11

`define AluCtrlEnum_defaultEncoding_type [1:0]
`define AluCtrlEnum_defaultEncoding_ADD_SUB 2'b00
`define AluCtrlEnum_defaultEncoding_SLT_SLTU 2'b01
`define AluCtrlEnum_defaultEncoding_BITWISE 2'b10


module rv32imc (
  input      [31:0]   externalResetVector,
  output              iBus_cmd_valid,
  input               iBus_cmd_ready,
  output     [31:0]   iBus_cmd_payload_pc,
  input               iBus_rsp_valid,
  input               iBus_rsp_payload_error,
  input      [31:0]   iBus_rsp_payload_inst,
  output              dBus_cmd_valid,
  input               dBus_cmd_ready,
  output              dBus_cmd_payload_wr,
  output     [31:0]   dBus_cmd_payload_address,
  output     [31:0]   dBus_cmd_payload_data,
  output     [1:0]    dBus_cmd_payload_size,
  input               dBus_rsp_ready,
  input               dBus_rsp_error,
  input      [31:0]   dBus_rsp_data,
  input               clk,
  input               reset
);
  wire       [31:0]   _zz_140;
  wire       [31:0]   _zz_141;
  wire                _zz_142;
  wire                _zz_143;
  wire                _zz_144;
  wire                _zz_145;
  wire                _zz_146;
  wire                _zz_147;
  wire                _zz_148;
  wire                _zz_149;
  wire                _zz_150;
  wire                _zz_151;
  wire                _zz_152;
  wire                _zz_153;
  wire       [1:0]    _zz_154;
  wire                _zz_155;
  wire                _zz_156;
  wire                _zz_157;
  wire       [4:0]    _zz_158;
  wire       [1:0]    _zz_159;
  wire       [1:0]    _zz_160;
  wire       [1:0]    _zz_161;
  wire       [1:0]    _zz_162;
  wire       [0:0]    _zz_163;
  wire       [51:0]   _zz_164;
  wire       [51:0]   _zz_165;
  wire       [51:0]   _zz_166;
  wire       [32:0]   _zz_167;
  wire       [51:0]   _zz_168;
  wire       [49:0]   _zz_169;
  wire       [51:0]   _zz_170;
  wire       [49:0]   _zz_171;
  wire       [51:0]   _zz_172;
  wire       [0:0]    _zz_173;
  wire       [0:0]    _zz_174;
  wire       [2:0]    _zz_175;
  wire       [31:0]   _zz_176;
  wire       [0:0]    _zz_177;
  wire       [0:0]    _zz_178;
  wire       [32:0]   _zz_179;
  wire       [31:0]   _zz_180;
  wire       [32:0]   _zz_181;
  wire       [0:0]    _zz_182;
  wire       [0:0]    _zz_183;
  wire       [0:0]    _zz_184;
  wire       [0:0]    _zz_185;
  wire       [0:0]    _zz_186;
  wire       [0:0]    _zz_187;
  wire       [0:0]    _zz_188;
  wire       [0:0]    _zz_189;
  wire       [0:0]    _zz_190;
  wire       [1:0]    _zz_191;
  wire       [1:0]    _zz_192;
  wire       [2:0]    _zz_193;
  wire       [31:0]   _zz_194;
  wire       [2:0]    _zz_195;
  wire       [31:0]   _zz_196;
  wire       [31:0]   _zz_197;
  wire       [11:0]   _zz_198;
  wire       [11:0]   _zz_199;
  wire       [11:0]   _zz_200;
  wire       [31:0]   _zz_201;
  wire       [19:0]   _zz_202;
  wire       [11:0]   _zz_203;
  wire       [2:0]    _zz_204;
  wire       [0:0]    _zz_205;
  wire       [2:0]    _zz_206;
  wire       [0:0]    _zz_207;
  wire       [2:0]    _zz_208;
  wire       [0:0]    _zz_209;
  wire       [2:0]    _zz_210;
  wire       [0:0]    _zz_211;
  wire       [2:0]    _zz_212;
  wire       [0:0]    _zz_213;
  wire       [2:0]    _zz_214;
  wire       [4:0]    _zz_215;
  wire       [11:0]   _zz_216;
  wire       [11:0]   _zz_217;
  wire       [31:0]   _zz_218;
  wire       [31:0]   _zz_219;
  wire       [31:0]   _zz_220;
  wire       [31:0]   _zz_221;
  wire       [31:0]   _zz_222;
  wire       [31:0]   _zz_223;
  wire       [31:0]   _zz_224;
  wire       [65:0]   _zz_225;
  wire       [65:0]   _zz_226;
  wire       [31:0]   _zz_227;
  wire       [31:0]   _zz_228;
  wire       [0:0]    _zz_229;
  wire       [5:0]    _zz_230;
  wire       [32:0]   _zz_231;
  wire       [32:0]   _zz_232;
  wire       [31:0]   _zz_233;
  wire       [31:0]   _zz_234;
  wire       [32:0]   _zz_235;
  wire       [32:0]   _zz_236;
  wire       [32:0]   _zz_237;
  wire       [0:0]    _zz_238;
  wire       [32:0]   _zz_239;
  wire       [0:0]    _zz_240;
  wire       [32:0]   _zz_241;
  wire       [0:0]    _zz_242;
  wire       [31:0]   _zz_243;
  wire       [11:0]   _zz_244;
  wire       [19:0]   _zz_245;
  wire       [11:0]   _zz_246;
  wire       [2:0]    _zz_247;
  wire                _zz_248;
  wire                _zz_249;
  wire       [6:0]    _zz_250;
  wire       [4:0]    _zz_251;
  wire                _zz_252;
  wire       [4:0]    _zz_253;
  wire       [0:0]    _zz_254;
  wire       [7:0]    _zz_255;
  wire                _zz_256;
  wire       [0:0]    _zz_257;
  wire       [0:0]    _zz_258;
  wire       [31:0]   _zz_259;
  wire       [31:0]   _zz_260;
  wire                _zz_261;
  wire                _zz_262;
  wire       [0:0]    _zz_263;
  wire       [0:0]    _zz_264;
  wire                _zz_265;
  wire       [0:0]    _zz_266;
  wire       [20:0]   _zz_267;
  wire       [31:0]   _zz_268;
  wire                _zz_269;
  wire       [0:0]    _zz_270;
  wire       [1:0]    _zz_271;
  wire                _zz_272;
  wire       [1:0]    _zz_273;
  wire       [1:0]    _zz_274;
  wire                _zz_275;
  wire       [0:0]    _zz_276;
  wire       [17:0]   _zz_277;
  wire       [31:0]   _zz_278;
  wire       [31:0]   _zz_279;
  wire       [31:0]   _zz_280;
  wire       [31:0]   _zz_281;
  wire       [31:0]   _zz_282;
  wire       [31:0]   _zz_283;
  wire       [31:0]   _zz_284;
  wire       [31:0]   _zz_285;
  wire                _zz_286;
  wire       [0:0]    _zz_287;
  wire       [0:0]    _zz_288;
  wire                _zz_289;
  wire       [0:0]    _zz_290;
  wire       [14:0]   _zz_291;
  wire       [0:0]    _zz_292;
  wire       [1:0]    _zz_293;
  wire       [0:0]    _zz_294;
  wire       [0:0]    _zz_295;
  wire       [2:0]    _zz_296;
  wire       [2:0]    _zz_297;
  wire                _zz_298;
  wire       [0:0]    _zz_299;
  wire       [10:0]   _zz_300;
  wire       [31:0]   _zz_301;
  wire       [31:0]   _zz_302;
  wire       [31:0]   _zz_303;
  wire       [31:0]   _zz_304;
  wire       [31:0]   _zz_305;
  wire       [31:0]   _zz_306;
  wire       [31:0]   _zz_307;
  wire       [31:0]   _zz_308;
  wire       [31:0]   _zz_309;
  wire                _zz_310;
  wire                _zz_311;
  wire       [31:0]   _zz_312;
  wire       [31:0]   _zz_313;
  wire                _zz_314;
  wire       [0:0]    _zz_315;
  wire       [0:0]    _zz_316;
  wire                _zz_317;
  wire       [0:0]    _zz_318;
  wire       [7:0]    _zz_319;
  wire       [31:0]   _zz_320;
  wire       [31:0]   _zz_321;
  wire                _zz_322;
  wire       [2:0]    _zz_323;
  wire       [2:0]    _zz_324;
  wire                _zz_325;
  wire       [0:0]    _zz_326;
  wire       [4:0]    _zz_327;
  wire       [31:0]   _zz_328;
  wire       [31:0]   _zz_329;
  wire                _zz_330;
  wire                _zz_331;
  wire       [0:0]    _zz_332;
  wire       [2:0]    _zz_333;
  wire                _zz_334;
  wire       [0:0]    _zz_335;
  wire       [0:0]    _zz_336;
  wire                _zz_337;
  wire       [0:0]    _zz_338;
  wire       [1:0]    _zz_339;
  wire       [31:0]   _zz_340;
  wire       [31:0]   _zz_341;
  wire       [31:0]   _zz_342;
  wire       [31:0]   _zz_343;
  wire                _zz_344;
  wire       [0:0]    _zz_345;
  wire       [0:0]    _zz_346;
  wire       [31:0]   _zz_347;
  wire       [31:0]   _zz_348;
  wire       [31:0]   _zz_349;
  wire       [0:0]    _zz_350;
  wire       [0:0]    _zz_351;
  wire       [1:0]    _zz_352;
  wire       [1:0]    _zz_353;
  wire                _zz_354;
  wire                _zz_355;
  wire       [31:0]   _zz_356;
  wire       [31:0]   _zz_357;
  wire       [31:0]   _zz_358;
  wire       [31:0]   _zz_359;
  wire       [31:0]   _zz_360;
  wire       [31:0]   _zz_361;
  wire       [31:0]   _zz_362;
  wire       [31:0]   _zz_363;
  wire       [31:0]   _zz_364;
  wire       [31:0]   _zz_365;
  wire       [31:0]   _zz_366;
  wire       [31:0]   _zz_367;
  wire                _zz_368;
  wire                _zz_369;
  wire                _zz_370;
  wire                decode_IS_DIV;
  wire       [51:0]   memory_MUL_LOW;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_1;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_2;
  wire       [1:0]    memory_MEMORY_ADDRESS_LOW;
  wire       [1:0]    execute_MEMORY_ADDRESS_LOW;
  wire       [33:0]   memory_MUL_HH;
  wire       [33:0]   execute_MUL_HH;
  wire                decode_IS_RS2_SIGNED;
  wire                decode_IS_RS1_SIGNED;
  wire                decode_SRC2_FORCE_ZERO;
  wire       [31:0]   memory_FORMAL_PC_NEXT;
  wire       [31:0]   execute_FORMAL_PC_NEXT;
  wire       [31:0]   decode_FORMAL_PC_NEXT;
  wire       [33:0]   execute_MUL_LH;
  wire                execute_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_MEMORY_STAGE;
  wire                decode_PREDICTION_HAD_BRANCHED2;
  wire       `Src1CtrlEnum_defaultEncoding_type decode_SRC1_CTRL;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_3;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_4;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_5;
  wire       [31:0]   memory_MEMORY_READ_DATA;
  wire       [31:0]   writeBack_REGFILE_WRITE_DATA;
  wire       [31:0]   memory_REGFILE_WRITE_DATA;
  wire       [31:0]   execute_REGFILE_WRITE_DATA;
  wire                decode_MEMORY_ENABLE;
  wire       [31:0]   execute_BRANCH_CALC;
  wire       [31:0]   execute_SHIFT_RIGHT;
  wire       [33:0]   execute_MUL_HL;
  wire       `Src2CtrlEnum_defaultEncoding_type decode_SRC2_CTRL;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_6;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_7;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_8;
  wire                memory_IS_MUL;
  wire                execute_IS_MUL;
  wire                decode_IS_MUL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type decode_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_9;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_10;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_11;
  wire       [31:0]   execute_MUL_LL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_12;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_13;
  wire       `ShiftCtrlEnum_defaultEncoding_type decode_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_14;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_15;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_16;
  wire       `AluCtrlEnum_defaultEncoding_type decode_ALU_CTRL;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_17;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_18;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_19;
  wire                execute_BRANCH_DO;
  wire                decode_BYPASSABLE_EXECUTE_STAGE;
  wire                decode_MEMORY_STORE;
  wire       [31:0]   memory_PC;
  wire                decode_SRC_LESS_UNSIGNED;
  wire       [31:0]   memory_BRANCH_CALC;
  wire                memory_BRANCH_DO;
  wire       [31:0]   execute_PC;
  wire                execute_BRANCH_COND_RESULT;
  wire                execute_PREDICTION_HAD_BRANCHED2;
  wire       `BranchCtrlEnum_defaultEncoding_type execute_BRANCH_CTRL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_20;
  wire                execute_IS_RS1_SIGNED;
  wire                execute_IS_DIV;
  wire                execute_IS_RS2_SIGNED;
  wire                memory_IS_DIV;
  wire                writeBack_IS_MUL;
  wire       [33:0]   writeBack_MUL_HH;
  wire       [51:0]   writeBack_MUL_LOW;
  wire       [33:0]   memory_MUL_HL;
  wire       [33:0]   memory_MUL_LH;
  wire       [31:0]   memory_MUL_LL;
  wire       [31:0]   execute_RS1;
  wire                decode_RS2_USE;
  wire                decode_RS1_USE;
  wire       [31:0]   _zz_21;
  wire                execute_REGFILE_WRITE_VALID;
  wire                execute_BYPASSABLE_EXECUTE_STAGE;
  wire                memory_REGFILE_WRITE_VALID;
  wire       [31:0]   memory_INSTRUCTION;
  wire                memory_BYPASSABLE_MEMORY_STAGE;
  wire                writeBack_REGFILE_WRITE_VALID;
  reg        [31:0]   decode_RS2;
  reg        [31:0]   decode_RS1;
  wire       [31:0]   memory_SHIFT_RIGHT;
  reg        [31:0]   _zz_22;
  wire       `ShiftCtrlEnum_defaultEncoding_type memory_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_23;
  wire       `ShiftCtrlEnum_defaultEncoding_type execute_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_24;
  wire                execute_SRC_LESS_UNSIGNED;
  wire                execute_SRC2_FORCE_ZERO;
  wire                execute_SRC_USE_SUB_LESS;
  wire       [31:0]   _zz_25;
  wire       `Src2CtrlEnum_defaultEncoding_type execute_SRC2_CTRL;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_26;
  wire                execute_IS_RVC;
  wire       `Src1CtrlEnum_defaultEncoding_type execute_SRC1_CTRL;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_27;
  wire                decode_SRC_USE_SUB_LESS;
  wire                decode_SRC_ADD_ZERO;
  wire       [31:0]   execute_SRC_ADD_SUB;
  wire                execute_SRC_LESS;
  wire       `AluCtrlEnum_defaultEncoding_type execute_ALU_CTRL;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_28;
  wire       [31:0]   execute_SRC2;
  wire       [31:0]   execute_SRC1;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type execute_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_29;
  wire       [31:0]   _zz_30;
  wire                _zz_31;
  reg                 _zz_32;
  reg                 decode_REGFILE_WRITE_VALID;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_33;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_34;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_35;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_36;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_37;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_38;
  wire                writeBack_MEMORY_STORE;
  reg        [31:0]   _zz_39;
  wire                writeBack_MEMORY_ENABLE;
  wire       [1:0]    writeBack_MEMORY_ADDRESS_LOW;
  wire       [31:0]   writeBack_MEMORY_READ_DATA;
  wire                memory_MEMORY_STORE;
  wire                memory_MEMORY_ENABLE;
  wire       [31:0]   execute_SRC_ADD;
  wire       [31:0]   execute_RS2;
  wire       [31:0]   execute_INSTRUCTION;
  wire                execute_MEMORY_STORE;
  wire                execute_MEMORY_ENABLE;
  wire                execute_ALIGNEMENT_FAULT;
  wire       `BranchCtrlEnum_defaultEncoding_type decode_BRANCH_CTRL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_40;
  reg        [31:0]   _zz_41;
  wire       [31:0]   decode_PC;
  wire       [31:0]   decode_INSTRUCTION;
  wire                decode_IS_RVC;
  wire       [31:0]   writeBack_PC;
  wire       [31:0]   writeBack_INSTRUCTION;
  wire                decode_arbitration_haltItself;
  reg                 decode_arbitration_haltByOther;
  reg                 decode_arbitration_removeIt;
  wire                decode_arbitration_flushIt;
  reg                 decode_arbitration_flushNext;
  wire                decode_arbitration_isValid;
  wire                decode_arbitration_isStuck;
  wire                decode_arbitration_isStuckByOthers;
  wire                decode_arbitration_isFlushed;
  wire                decode_arbitration_isMoving;
  wire                decode_arbitration_isFiring;
  reg                 execute_arbitration_haltItself;
  wire                execute_arbitration_haltByOther;
  reg                 execute_arbitration_removeIt;
  wire                execute_arbitration_flushIt;
  wire                execute_arbitration_flushNext;
  reg                 execute_arbitration_isValid;
  wire                execute_arbitration_isStuck;
  wire                execute_arbitration_isStuckByOthers;
  wire                execute_arbitration_isFlushed;
  wire                execute_arbitration_isMoving;
  wire                execute_arbitration_isFiring;
  reg                 memory_arbitration_haltItself;
  wire                memory_arbitration_haltByOther;
  reg                 memory_arbitration_removeIt;
  wire                memory_arbitration_flushIt;
  reg                 memory_arbitration_flushNext;
  reg                 memory_arbitration_isValid;
  wire                memory_arbitration_isStuck;
  wire                memory_arbitration_isStuckByOthers;
  wire                memory_arbitration_isFlushed;
  wire                memory_arbitration_isMoving;
  wire                memory_arbitration_isFiring;
  wire                writeBack_arbitration_haltItself;
  wire                writeBack_arbitration_haltByOther;
  reg                 writeBack_arbitration_removeIt;
  wire                writeBack_arbitration_flushIt;
  wire                writeBack_arbitration_flushNext;
  reg                 writeBack_arbitration_isValid;
  wire                writeBack_arbitration_isStuck;
  wire                writeBack_arbitration_isStuckByOthers;
  wire                writeBack_arbitration_isFlushed;
  wire                writeBack_arbitration_isMoving;
  wire                writeBack_arbitration_isFiring;
  wire       [31:0]   lastStageInstruction;
  wire       [31:0]   lastStagePc;
  wire                lastStageIsValid;
  wire                lastStageIsFiring;
  wire                IBusSimplePlugin_fetcherHalt;
  reg                 IBusSimplePlugin_incomingInstruction;
  wire                IBusSimplePlugin_predictionJumpInterface_valid;
  wire       [31:0]   IBusSimplePlugin_predictionJumpInterface_payload;
  wire                IBusSimplePlugin_decodePrediction_cmd_hadBranch;
  wire                IBusSimplePlugin_decodePrediction_rsp_wasWrong;
  wire                IBusSimplePlugin_pcValids_0;
  wire                IBusSimplePlugin_pcValids_1;
  wire                IBusSimplePlugin_pcValids_2;
  wire                IBusSimplePlugin_pcValids_3;
  wire                BranchPlugin_jumpInterface_valid;
  wire       [31:0]   BranchPlugin_jumpInterface_payload;
  wire                IBusSimplePlugin_fetcherflushIt;
  wire                IBusSimplePlugin_jump_pcLoad_valid;
  wire       [31:0]   IBusSimplePlugin_jump_pcLoad_payload;
  wire       [1:0]    _zz_42;
  wire                IBusSimplePlugin_fetchPc_output_valid;
  wire                IBusSimplePlugin_fetchPc_output_ready;
  wire       [31:0]   IBusSimplePlugin_fetchPc_output_payload;
  reg        [31:0]   IBusSimplePlugin_fetchPc_pcReg;
  reg                 IBusSimplePlugin_fetchPc_correction;
  reg                 IBusSimplePlugin_fetchPc_correctionReg;
  wire                IBusSimplePlugin_fetchPc_corrected;
  reg                 IBusSimplePlugin_fetchPc_pcRegPropagate;
  reg                 IBusSimplePlugin_fetchPc_booted;
  reg                 IBusSimplePlugin_fetchPc_inc;
  reg        [31:0]   IBusSimplePlugin_fetchPc_pc;
  reg                 IBusSimplePlugin_fetchPc_flushed;
  reg                 IBusSimplePlugin_decodePc_flushed;
  reg        [31:0]   IBusSimplePlugin_decodePc_pcReg;
  wire       [31:0]   IBusSimplePlugin_decodePc_pcPlus;
  wire                IBusSimplePlugin_decodePc_injectedDecode;
  wire                IBusSimplePlugin_iBusRsp_redoFetch;
  wire                IBusSimplePlugin_iBusRsp_stages_0_input_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_0_output_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_0_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_0_output_payload;
  reg                 IBusSimplePlugin_iBusRsp_stages_0_halt;
  wire                IBusSimplePlugin_iBusRsp_stages_0_flush;
  wire                IBusSimplePlugin_iBusRsp_stages_1_input_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_1_input_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_1_output_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_1_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_1_output_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_1_halt;
  wire                IBusSimplePlugin_iBusRsp_stages_1_flush;
  wire                _zz_43;
  wire                _zz_44;
  wire                _zz_45;
  wire                _zz_46;
  reg                 _zz_47;
  reg                 IBusSimplePlugin_iBusRsp_readyForError;
  wire                IBusSimplePlugin_iBusRsp_output_valid;
  wire                IBusSimplePlugin_iBusRsp_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_output_payload_pc;
  wire                IBusSimplePlugin_iBusRsp_output_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_output_payload_rsp_inst;
  wire                IBusSimplePlugin_iBusRsp_output_payload_isRvc;
  wire                IBusSimplePlugin_decompressor_input_valid;
  wire                IBusSimplePlugin_decompressor_input_ready;
  wire       [31:0]   IBusSimplePlugin_decompressor_input_payload_pc;
  wire                IBusSimplePlugin_decompressor_input_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_decompressor_input_payload_rsp_inst;
  wire                IBusSimplePlugin_decompressor_input_payload_isRvc;
  wire                IBusSimplePlugin_decompressor_output_valid;
  wire                IBusSimplePlugin_decompressor_output_ready;
  wire       [31:0]   IBusSimplePlugin_decompressor_output_payload_pc;
  wire                IBusSimplePlugin_decompressor_output_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_decompressor_output_payload_rsp_inst;
  wire                IBusSimplePlugin_decompressor_output_payload_isRvc;
  wire                IBusSimplePlugin_decompressor_flushNext;
  wire                IBusSimplePlugin_decompressor_consumeCurrent;
  reg                 IBusSimplePlugin_decompressor_bufferValid;
  reg        [15:0]   IBusSimplePlugin_decompressor_bufferData;
  wire                IBusSimplePlugin_decompressor_isInputLowRvc;
  wire                IBusSimplePlugin_decompressor_isInputHighRvc;
  reg                 IBusSimplePlugin_decompressor_throw2BytesReg;
  wire                IBusSimplePlugin_decompressor_throw2Bytes;
  wire                IBusSimplePlugin_decompressor_unaligned;
  wire       [31:0]   IBusSimplePlugin_decompressor_raw;
  wire                IBusSimplePlugin_decompressor_isRvc;
  wire       [15:0]   _zz_48;
  reg        [31:0]   IBusSimplePlugin_decompressor_decompressed;
  wire       [4:0]    _zz_49;
  wire       [4:0]    _zz_50;
  wire       [11:0]   _zz_51;
  wire                _zz_52;
  reg        [11:0]   _zz_53;
  wire                _zz_54;
  reg        [9:0]    _zz_55;
  wire       [20:0]   _zz_56;
  wire                _zz_57;
  reg        [14:0]   _zz_58;
  wire                _zz_59;
  reg        [2:0]    _zz_60;
  wire                _zz_61;
  reg        [9:0]    _zz_62;
  wire       [20:0]   _zz_63;
  wire                _zz_64;
  reg        [4:0]    _zz_65;
  wire       [12:0]   _zz_66;
  wire       [4:0]    _zz_67;
  wire       [4:0]    _zz_68;
  wire       [4:0]    _zz_69;
  wire                _zz_70;
  reg        [2:0]    _zz_71;
  reg        [2:0]    _zz_72;
  wire                _zz_73;
  reg        [6:0]    _zz_74;
  wire                IBusSimplePlugin_decompressor_bufferFill;
  wire                IBusSimplePlugin_injector_decodeInput_valid;
  wire                IBusSimplePlugin_injector_decodeInput_ready;
  wire       [31:0]   IBusSimplePlugin_injector_decodeInput_payload_pc;
  wire                IBusSimplePlugin_injector_decodeInput_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  wire                IBusSimplePlugin_injector_decodeInput_payload_isRvc;
  reg                 _zz_75;
  reg        [31:0]   _zz_76;
  reg                 _zz_77;
  reg        [31:0]   _zz_78;
  reg                 _zz_79;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_0;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_1;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_2;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_3;
  reg        [31:0]   IBusSimplePlugin_injector_formal_rawInDecode;
  wire                _zz_80;
  reg        [18:0]   _zz_81;
  wire                _zz_82;
  reg        [10:0]   _zz_83;
  wire                _zz_84;
  reg        [18:0]   _zz_85;
  wire                IBusSimplePlugin_cmd_valid;
  wire                IBusSimplePlugin_cmd_ready;
  wire       [31:0]   IBusSimplePlugin_cmd_payload_pc;
  reg        [2:0]    IBusSimplePlugin_pendingCmd;
  wire       [2:0]    IBusSimplePlugin_pendingCmdNext;
  reg        [2:0]    IBusSimplePlugin_rspJoin_discardCounter;
  reg                 IBusSimplePlugin_rspJoin_rspBufferOutput_valid;
  wire                IBusSimplePlugin_rspJoin_rspBufferOutput_ready;
  wire                IBusSimplePlugin_rspJoin_rspBufferOutput_payload_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_rspBufferOutput_payload_inst;
  wire                iBus_rsp_takeWhen_valid;
  wire                iBus_rsp_takeWhen_payload_error;
  wire       [31:0]   iBus_rsp_takeWhen_payload_inst;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_rspStream_valid;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_rspStream_ready;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_rspStream_payload_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_rspBuffer_rspStream_payload_inst;
  reg                 IBusSimplePlugin_rspJoin_rspBuffer_validReg;
  wire       [31:0]   IBusSimplePlugin_rspJoin_fetchRsp_pc;
  reg                 IBusSimplePlugin_rspJoin_fetchRsp_rsp_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst;
  wire                IBusSimplePlugin_rspJoin_fetchRsp_isRvc;
  wire                IBusSimplePlugin_rspJoin_join_valid;
  wire                IBusSimplePlugin_rspJoin_join_ready;
  wire       [31:0]   IBusSimplePlugin_rspJoin_join_payload_pc;
  wire                IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  wire                IBusSimplePlugin_rspJoin_join_payload_isRvc;
  wire                IBusSimplePlugin_rspJoin_exceptionDetected;
  wire                _zz_86;
  wire                _zz_87;
  reg                 execute_DBusSimplePlugin_skipCmd;
  reg        [31:0]   _zz_88;
  reg        [3:0]    _zz_89;
  wire       [3:0]    execute_DBusSimplePlugin_formalMask;
  reg        [31:0]   writeBack_DBusSimplePlugin_rspShifted;
  wire                _zz_90;
  reg        [31:0]   _zz_91;
  wire                _zz_92;
  reg        [31:0]   _zz_93;
  reg        [31:0]   writeBack_DBusSimplePlugin_rspFormated;
  wire       [26:0]   _zz_94;
  wire                _zz_95;
  wire                _zz_96;
  wire                _zz_97;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_98;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_99;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_100;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_101;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_102;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_103;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress1;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress2;
  wire       [31:0]   decode_RegFilePlugin_rs1Data;
  wire       [31:0]   decode_RegFilePlugin_rs2Data;
  wire                lastStageRegFileWrite_valid;
  wire       [4:0]    lastStageRegFileWrite_payload_address;
  wire       [31:0]   lastStageRegFileWrite_payload_data;
  reg        [31:0]   execute_IntAluPlugin_bitwise;
  reg        [31:0]   _zz_104;
  reg        [31:0]   _zz_105;
  wire                _zz_106;
  reg        [19:0]   _zz_107;
  wire                _zz_108;
  reg        [19:0]   _zz_109;
  reg        [31:0]   _zz_110;
  reg        [31:0]   execute_SrcPlugin_addSub;
  wire                execute_SrcPlugin_less;
  wire       [4:0]    execute_FullBarrelShifterPlugin_amplitude;
  reg        [31:0]   _zz_111;
  wire       [31:0]   execute_FullBarrelShifterPlugin_reversed;
  reg        [31:0]   _zz_112;
  reg                 _zz_113;
  reg                 _zz_114;
  reg                 _zz_115;
  reg        [4:0]    _zz_116;
  reg        [31:0]   _zz_117;
  wire                _zz_118;
  wire                _zz_119;
  wire                _zz_120;
  wire                _zz_121;
  wire                _zz_122;
  wire                _zz_123;
  reg                 execute_MulPlugin_aSigned;
  reg                 execute_MulPlugin_bSigned;
  wire       [31:0]   execute_MulPlugin_a;
  wire       [31:0]   execute_MulPlugin_b;
  wire       [15:0]   execute_MulPlugin_aULow;
  wire       [15:0]   execute_MulPlugin_bULow;
  wire       [16:0]   execute_MulPlugin_aSLow;
  wire       [16:0]   execute_MulPlugin_bSLow;
  wire       [16:0]   execute_MulPlugin_aHigh;
  wire       [16:0]   execute_MulPlugin_bHigh;
  wire       [65:0]   writeBack_MulPlugin_result;
  reg        [32:0]   memory_DivPlugin_rs1;
  reg        [31:0]   memory_DivPlugin_rs2;
  reg        [64:0]   memory_DivPlugin_accumulator;
  wire                memory_DivPlugin_frontendOk;
  reg                 memory_DivPlugin_div_needRevert;
  reg                 memory_DivPlugin_div_counter_willIncrement;
  reg                 memory_DivPlugin_div_counter_willClear;
  reg        [5:0]    memory_DivPlugin_div_counter_valueNext;
  reg        [5:0]    memory_DivPlugin_div_counter_value;
  wire                memory_DivPlugin_div_counter_willOverflowIfInc;
  wire                memory_DivPlugin_div_counter_willOverflow;
  reg                 memory_DivPlugin_div_done;
  reg        [31:0]   memory_DivPlugin_div_result;
  wire       [31:0]   _zz_124;
  wire       [32:0]   _zz_125;
  wire       [32:0]   _zz_126;
  wire       [31:0]   _zz_127;
  wire                _zz_128;
  wire                _zz_129;
  reg        [32:0]   _zz_130;
  wire                execute_BranchPlugin_eq;
  wire       [2:0]    _zz_131;
  reg                 _zz_132;
  reg                 _zz_133;
  wire                execute_BranchPlugin_missAlignedTarget;
  reg        [31:0]   execute_BranchPlugin_branch_src1;
  reg        [31:0]   execute_BranchPlugin_branch_src2;
  wire                _zz_134;
  reg        [19:0]   _zz_135;
  wire                _zz_136;
  reg        [10:0]   _zz_137;
  wire                _zz_138;
  reg        [18:0]   _zz_139;
  wire       [31:0]   execute_BranchPlugin_branchAdder;
  reg                 decode_to_execute_SRC_LESS_UNSIGNED;
  reg        [31:0]   decode_to_execute_PC;
  reg        [31:0]   execute_to_memory_PC;
  reg        [31:0]   memory_to_writeBack_PC;
  reg                 decode_to_execute_MEMORY_STORE;
  reg                 execute_to_memory_MEMORY_STORE;
  reg                 memory_to_writeBack_MEMORY_STORE;
  reg                 decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  reg                 execute_to_memory_BRANCH_DO;
  reg        `AluCtrlEnum_defaultEncoding_type decode_to_execute_ALU_CTRL;
  reg        `ShiftCtrlEnum_defaultEncoding_type decode_to_execute_SHIFT_CTRL;
  reg        `ShiftCtrlEnum_defaultEncoding_type execute_to_memory_SHIFT_CTRL;
  reg        [31:0]   execute_to_memory_MUL_LL;
  reg        `AluBitwiseCtrlEnum_defaultEncoding_type decode_to_execute_ALU_BITWISE_CTRL;
  reg                 decode_to_execute_IS_MUL;
  reg                 execute_to_memory_IS_MUL;
  reg                 memory_to_writeBack_IS_MUL;
  reg        `Src2CtrlEnum_defaultEncoding_type decode_to_execute_SRC2_CTRL;
  reg        [33:0]   execute_to_memory_MUL_HL;
  reg        [31:0]   execute_to_memory_SHIFT_RIGHT;
  reg        [31:0]   execute_to_memory_BRANCH_CALC;
  reg                 decode_to_execute_MEMORY_ENABLE;
  reg                 execute_to_memory_MEMORY_ENABLE;
  reg                 memory_to_writeBack_MEMORY_ENABLE;
  reg        [31:0]   execute_to_memory_REGFILE_WRITE_DATA;
  reg        [31:0]   memory_to_writeBack_REGFILE_WRITE_DATA;
  reg        [31:0]   memory_to_writeBack_MEMORY_READ_DATA;
  reg        `Src1CtrlEnum_defaultEncoding_type decode_to_execute_SRC1_CTRL;
  reg        [31:0]   decode_to_execute_RS2;
  reg                 decode_to_execute_PREDICTION_HAD_BRANCHED2;
  reg                 decode_to_execute_REGFILE_WRITE_VALID;
  reg                 execute_to_memory_REGFILE_WRITE_VALID;
  reg                 memory_to_writeBack_REGFILE_WRITE_VALID;
  reg                 decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  reg                 execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  reg        [33:0]   execute_to_memory_MUL_LH;
  reg        [31:0]   decode_to_execute_FORMAL_PC_NEXT;
  reg        [31:0]   execute_to_memory_FORMAL_PC_NEXT;
  reg        [31:0]   decode_to_execute_RS1;
  reg        [31:0]   decode_to_execute_INSTRUCTION;
  reg        [31:0]   execute_to_memory_INSTRUCTION;
  reg        [31:0]   memory_to_writeBack_INSTRUCTION;
  reg                 decode_to_execute_SRC2_FORCE_ZERO;
  reg                 decode_to_execute_IS_RS1_SIGNED;
  reg                 decode_to_execute_IS_RS2_SIGNED;
  reg        [33:0]   execute_to_memory_MUL_HH;
  reg        [33:0]   memory_to_writeBack_MUL_HH;
  reg                 decode_to_execute_SRC_USE_SUB_LESS;
  reg                 decode_to_execute_IS_RVC;
  reg        [1:0]    execute_to_memory_MEMORY_ADDRESS_LOW;
  reg        [1:0]    memory_to_writeBack_MEMORY_ADDRESS_LOW;
  reg        `BranchCtrlEnum_defaultEncoding_type decode_to_execute_BRANCH_CTRL;
  reg        [51:0]   memory_to_writeBack_MUL_LOW;
  reg                 decode_to_execute_IS_DIV;
  reg                 execute_to_memory_IS_DIV;
  `ifndef SYNTHESIS
  reg [31:0] _zz_1_string;
  reg [31:0] _zz_2_string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_3_string;
  reg [95:0] _zz_4_string;
  reg [95:0] _zz_5_string;
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] _zz_6_string;
  reg [23:0] _zz_7_string;
  reg [23:0] _zz_8_string;
  reg [39:0] decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_9_string;
  reg [39:0] _zz_10_string;
  reg [39:0] _zz_11_string;
  reg [71:0] _zz_12_string;
  reg [71:0] _zz_13_string;
  reg [71:0] decode_SHIFT_CTRL_string;
  reg [71:0] _zz_14_string;
  reg [71:0] _zz_15_string;
  reg [71:0] _zz_16_string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_17_string;
  reg [63:0] _zz_18_string;
  reg [63:0] _zz_19_string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] _zz_20_string;
  reg [71:0] memory_SHIFT_CTRL_string;
  reg [71:0] _zz_23_string;
  reg [71:0] execute_SHIFT_CTRL_string;
  reg [71:0] _zz_24_string;
  reg [23:0] execute_SRC2_CTRL_string;
  reg [23:0] _zz_26_string;
  reg [95:0] execute_SRC1_CTRL_string;
  reg [95:0] _zz_27_string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] _zz_28_string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_29_string;
  reg [23:0] _zz_33_string;
  reg [39:0] _zz_34_string;
  reg [31:0] _zz_35_string;
  reg [95:0] _zz_36_string;
  reg [71:0] _zz_37_string;
  reg [63:0] _zz_38_string;
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_40_string;
  reg [63:0] _zz_98_string;
  reg [71:0] _zz_99_string;
  reg [95:0] _zz_100_string;
  reg [31:0] _zz_101_string;
  reg [39:0] _zz_102_string;
  reg [23:0] _zz_103_string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  reg [71:0] decode_to_execute_SHIFT_CTRL_string;
  reg [71:0] execute_to_memory_SHIFT_CTRL_string;
  reg [39:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [23:0] decode_to_execute_SRC2_CTRL_string;
  reg [95:0] decode_to_execute_SRC1_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  `endif

  reg [31:0] RegFilePlugin_regFile [0:31];

  assign _zz_142 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign _zz_143 = 1'b1;
  assign _zz_144 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign _zz_145 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign _zz_146 = (memory_arbitration_isValid && memory_IS_DIV);
  assign _zz_147 = (IBusSimplePlugin_jump_pcLoad_valid && ((! decode_arbitration_isStuck) || decode_arbitration_removeIt));
  assign _zz_148 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign _zz_149 = (1'b0 || (! 1'b1));
  assign _zz_150 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign _zz_151 = (1'b0 || (! memory_BYPASSABLE_MEMORY_STAGE));
  assign _zz_152 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign _zz_153 = (1'b0 || (! execute_BYPASSABLE_EXECUTE_STAGE));
  assign _zz_154 = execute_INSTRUCTION[13 : 12];
  assign _zz_155 = (memory_DivPlugin_frontendOk && (! memory_DivPlugin_div_done));
  assign _zz_156 = (! memory_arbitration_isStuck);
  assign _zz_157 = (IBusSimplePlugin_decompressor_output_ready && IBusSimplePlugin_decompressor_input_valid);
  assign _zz_158 = {_zz_48[1 : 0],_zz_48[15 : 13]};
  assign _zz_159 = _zz_48[6 : 5];
  assign _zz_160 = _zz_48[11 : 10];
  assign _zz_161 = writeBack_INSTRUCTION[13 : 12];
  assign _zz_162 = writeBack_INSTRUCTION[13 : 12];
  assign _zz_163 = _zz_94[0 : 0];
  assign _zz_164 = ($signed(_zz_165) + $signed(_zz_170));
  assign _zz_165 = ($signed(_zz_166) + $signed(_zz_168));
  assign _zz_166 = 52'h0;
  assign _zz_167 = {1'b0,memory_MUL_LL};
  assign _zz_168 = {{19{_zz_167[32]}}, _zz_167};
  assign _zz_169 = ({16'd0,memory_MUL_LH} <<< 16);
  assign _zz_170 = {{2{_zz_169[49]}}, _zz_169};
  assign _zz_171 = ({16'd0,memory_MUL_HL} <<< 16);
  assign _zz_172 = {{2{_zz_171[49]}}, _zz_171};
  assign _zz_173 = _zz_94[10 : 10];
  assign _zz_174 = _zz_94[16 : 16];
  assign _zz_175 = (decode_IS_RVC ? 3'b010 : 3'b100);
  assign _zz_176 = {29'd0, _zz_175};
  assign _zz_177 = _zz_94[15 : 15];
  assign _zz_178 = _zz_94[1 : 1];
  assign _zz_179 = ($signed(_zz_181) >>> execute_FullBarrelShifterPlugin_amplitude);
  assign _zz_180 = _zz_179[31 : 0];
  assign _zz_181 = {((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SRA_1) && execute_FullBarrelShifterPlugin_reversed[31]),execute_FullBarrelShifterPlugin_reversed};
  assign _zz_182 = _zz_94[4 : 4];
  assign _zz_183 = _zz_94[6 : 6];
  assign _zz_184 = _zz_94[11 : 11];
  assign _zz_185 = _zz_94[2 : 2];
  assign _zz_186 = _zz_94[5 : 5];
  assign _zz_187 = _zz_94[3 : 3];
  assign _zz_188 = _zz_94[7 : 7];
  assign _zz_189 = _zz_94[12 : 12];
  assign _zz_190 = _zz_94[22 : 22];
  assign _zz_191 = (_zz_42 & (~ _zz_192));
  assign _zz_192 = (_zz_42 - 2'b01);
  assign _zz_193 = {IBusSimplePlugin_fetchPc_inc,2'b00};
  assign _zz_194 = {29'd0, _zz_193};
  assign _zz_195 = (decode_IS_RVC ? 3'b010 : 3'b100);
  assign _zz_196 = {29'd0, _zz_195};
  assign _zz_197 = {{_zz_58,_zz_48[6 : 2]},12'h0};
  assign _zz_198 = {{{4'b0000,_zz_48[8 : 7]},_zz_48[12 : 9]},2'b00};
  assign _zz_199 = {{{4'b0000,_zz_48[8 : 7]},_zz_48[12 : 9]},2'b00};
  assign _zz_200 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_201 = {{_zz_81,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz_202 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]};
  assign _zz_203 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_204 = (IBusSimplePlugin_pendingCmd + _zz_206);
  assign _zz_205 = (IBusSimplePlugin_cmd_valid && IBusSimplePlugin_cmd_ready);
  assign _zz_206 = {2'd0, _zz_205};
  assign _zz_207 = iBus_rsp_valid;
  assign _zz_208 = {2'd0, _zz_207};
  assign _zz_209 = (iBus_rsp_valid && (IBusSimplePlugin_rspJoin_discardCounter != 3'b000));
  assign _zz_210 = {2'd0, _zz_209};
  assign _zz_211 = iBus_rsp_valid;
  assign _zz_212 = {2'd0, _zz_211};
  assign _zz_213 = execute_SRC_LESS;
  assign _zz_214 = (execute_IS_RVC ? 3'b010 : 3'b100);
  assign _zz_215 = execute_INSTRUCTION[19 : 15];
  assign _zz_216 = execute_INSTRUCTION[31 : 20];
  assign _zz_217 = {execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]};
  assign _zz_218 = ($signed(_zz_219) + $signed(_zz_222));
  assign _zz_219 = ($signed(_zz_220) + $signed(_zz_221));
  assign _zz_220 = execute_SRC1;
  assign _zz_221 = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_222 = (execute_SRC_USE_SUB_LESS ? _zz_223 : _zz_224);
  assign _zz_223 = 32'h00000001;
  assign _zz_224 = 32'h0;
  assign _zz_225 = {{14{writeBack_MUL_LOW[51]}}, writeBack_MUL_LOW};
  assign _zz_226 = ({32'd0,writeBack_MUL_HH} <<< 32);
  assign _zz_227 = writeBack_MUL_LOW[31 : 0];
  assign _zz_228 = writeBack_MulPlugin_result[63 : 32];
  assign _zz_229 = memory_DivPlugin_div_counter_willIncrement;
  assign _zz_230 = {5'd0, _zz_229};
  assign _zz_231 = {1'd0, memory_DivPlugin_rs2};
  assign _zz_232 = {_zz_124,(! _zz_126[32])};
  assign _zz_233 = _zz_126[31:0];
  assign _zz_234 = _zz_125[31:0];
  assign _zz_235 = _zz_236;
  assign _zz_236 = _zz_237;
  assign _zz_237 = ({1'b0,(memory_DivPlugin_div_needRevert ? (~ _zz_127) : _zz_127)} + _zz_239);
  assign _zz_238 = memory_DivPlugin_div_needRevert;
  assign _zz_239 = {32'd0, _zz_238};
  assign _zz_240 = _zz_129;
  assign _zz_241 = {32'd0, _zz_240};
  assign _zz_242 = _zz_128;
  assign _zz_243 = {31'd0, _zz_242};
  assign _zz_244 = execute_INSTRUCTION[31 : 20];
  assign _zz_245 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_246 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_247 = (execute_IS_RVC ? 3'b010 : 3'b100);
  assign _zz_248 = (_zz_48[11 : 10] == 2'b01);
  assign _zz_249 = ((_zz_48[11 : 10] == 2'b11) && (_zz_48[6 : 5] == 2'b00));
  assign _zz_250 = 7'h0;
  assign _zz_251 = _zz_48[6 : 2];
  assign _zz_252 = _zz_48[12];
  assign _zz_253 = _zz_48[11 : 7];
  assign _zz_254 = decode_INSTRUCTION[31];
  assign _zz_255 = decode_INSTRUCTION[19 : 12];
  assign _zz_256 = decode_INSTRUCTION[20];
  assign _zz_257 = decode_INSTRUCTION[31];
  assign _zz_258 = decode_INSTRUCTION[7];
  assign _zz_259 = (decode_INSTRUCTION & 32'h00000070);
  assign _zz_260 = 32'h00000020;
  assign _zz_261 = ((decode_INSTRUCTION & 32'h00000020) == 32'h0);
  assign _zz_262 = ((decode_INSTRUCTION & 32'h00001000) == 32'h00001000);
  assign _zz_263 = ((decode_INSTRUCTION & _zz_268) == 32'h00002000);
  assign _zz_264 = 1'b0;
  assign _zz_265 = ({_zz_269,{_zz_270,_zz_271}} != 4'b0000);
  assign _zz_266 = (_zz_272 != 1'b0);
  assign _zz_267 = {(_zz_273 != _zz_274),{_zz_275,{_zz_276,_zz_277}}};
  assign _zz_268 = 32'h00003000;
  assign _zz_269 = ((decode_INSTRUCTION & 32'h00000010) == 32'h00000010);
  assign _zz_270 = _zz_97;
  assign _zz_271 = {(_zz_278 == _zz_279),(_zz_280 == _zz_281)};
  assign _zz_272 = ((decode_INSTRUCTION & 32'h00000040) == 32'h00000040);
  assign _zz_273 = {_zz_97,(_zz_282 == _zz_283)};
  assign _zz_274 = 2'b00;
  assign _zz_275 = ((_zz_284 == _zz_285) != 1'b0);
  assign _zz_276 = (_zz_286 != 1'b0);
  assign _zz_277 = {(_zz_287 != _zz_288),{_zz_289,{_zz_290,_zz_291}}};
  assign _zz_278 = (decode_INSTRUCTION & 32'h0000000c);
  assign _zz_279 = 32'h00000004;
  assign _zz_280 = (decode_INSTRUCTION & 32'h00000028);
  assign _zz_281 = 32'h0;
  assign _zz_282 = (decode_INSTRUCTION & 32'h0000001c);
  assign _zz_283 = 32'h00000004;
  assign _zz_284 = (decode_INSTRUCTION & 32'h00000048);
  assign _zz_285 = 32'h00000040;
  assign _zz_286 = ((decode_INSTRUCTION & 32'h00000014) == 32'h00000004);
  assign _zz_287 = ((decode_INSTRUCTION & 32'h00000044) == 32'h00000004);
  assign _zz_288 = 1'b0;
  assign _zz_289 = (_zz_96 != 1'b0);
  assign _zz_290 = ({_zz_95,{_zz_292,_zz_293}} != 4'b0000);
  assign _zz_291 = {({_zz_294,_zz_295} != 2'b00),{(_zz_296 != _zz_297),{_zz_298,{_zz_299,_zz_300}}}};
  assign _zz_292 = ((decode_INSTRUCTION & _zz_301) == 32'h00004020);
  assign _zz_293 = {(_zz_302 == _zz_303),(_zz_304 == _zz_305)};
  assign _zz_294 = ((decode_INSTRUCTION & _zz_306) == 32'h00005010);
  assign _zz_295 = ((decode_INSTRUCTION & _zz_307) == 32'h00005020);
  assign _zz_296 = {(_zz_308 == _zz_309),{_zz_310,_zz_311}};
  assign _zz_297 = 3'b000;
  assign _zz_298 = ((_zz_312 == _zz_313) != 1'b0);
  assign _zz_299 = (_zz_314 != 1'b0);
  assign _zz_300 = {(_zz_315 != _zz_316),{_zz_317,{_zz_318,_zz_319}}};
  assign _zz_301 = 32'h00004020;
  assign _zz_302 = (decode_INSTRUCTION & 32'h00000030);
  assign _zz_303 = 32'h00000010;
  assign _zz_304 = (decode_INSTRUCTION & 32'h02000020);
  assign _zz_305 = 32'h00000020;
  assign _zz_306 = 32'h00007034;
  assign _zz_307 = 32'h02007064;
  assign _zz_308 = (decode_INSTRUCTION & 32'h40003014);
  assign _zz_309 = 32'h40001010;
  assign _zz_310 = ((decode_INSTRUCTION & 32'h02007014) == 32'h00001010);
  assign _zz_311 = ((decode_INSTRUCTION & 32'h00007034) == 32'h00001010);
  assign _zz_312 = (decode_INSTRUCTION & 32'h00000064);
  assign _zz_313 = 32'h00000024;
  assign _zz_314 = ((decode_INSTRUCTION & 32'h00000020) == 32'h00000020);
  assign _zz_315 = _zz_96;
  assign _zz_316 = 1'b0;
  assign _zz_317 = ((_zz_320 == _zz_321) != 1'b0);
  assign _zz_318 = (_zz_322 != 1'b0);
  assign _zz_319 = {(_zz_323 != _zz_324),{_zz_325,{_zz_326,_zz_327}}};
  assign _zz_320 = (decode_INSTRUCTION & 32'h00004004);
  assign _zz_321 = 32'h00004000;
  assign _zz_322 = ((decode_INSTRUCTION & 32'h00006004) == 32'h00002000);
  assign _zz_323 = {(_zz_328 == _zz_329),{_zz_330,_zz_331}};
  assign _zz_324 = 3'b000;
  assign _zz_325 = ({_zz_95,{_zz_332,_zz_333}} != 5'h0);
  assign _zz_326 = (_zz_334 != 1'b0);
  assign _zz_327 = {(_zz_335 != _zz_336),{_zz_337,{_zz_338,_zz_339}}};
  assign _zz_328 = (decode_INSTRUCTION & 32'h00000044);
  assign _zz_329 = 32'h00000040;
  assign _zz_330 = ((decode_INSTRUCTION & _zz_340) == 32'h00002010);
  assign _zz_331 = ((decode_INSTRUCTION & _zz_341) == 32'h40000030);
  assign _zz_332 = (_zz_342 == _zz_343);
  assign _zz_333 = {_zz_344,{_zz_345,_zz_346}};
  assign _zz_334 = ((decode_INSTRUCTION & _zz_347) == 32'h00000020);
  assign _zz_335 = (_zz_348 == _zz_349);
  assign _zz_336 = 1'b0;
  assign _zz_337 = ({_zz_350,_zz_351} != 2'b00);
  assign _zz_338 = (_zz_352 != _zz_353);
  assign _zz_339 = {_zz_354,_zz_355};
  assign _zz_340 = 32'h00002014;
  assign _zz_341 = 32'h40000034;
  assign _zz_342 = (decode_INSTRUCTION & 32'h00002030);
  assign _zz_343 = 32'h00002010;
  assign _zz_344 = ((decode_INSTRUCTION & 32'h02002020) == 32'h00002020);
  assign _zz_345 = ((decode_INSTRUCTION & _zz_356) == 32'h00000020);
  assign _zz_346 = ((decode_INSTRUCTION & _zz_357) == 32'h00000010);
  assign _zz_347 = 32'h00000024;
  assign _zz_348 = (decode_INSTRUCTION & 32'h02004034);
  assign _zz_349 = 32'h02000030;
  assign _zz_350 = ((decode_INSTRUCTION & _zz_358) == 32'h0);
  assign _zz_351 = ((decode_INSTRUCTION & _zz_359) == 32'h0);
  assign _zz_352 = {(_zz_360 == _zz_361),(_zz_362 == _zz_363)};
  assign _zz_353 = 2'b00;
  assign _zz_354 = ((_zz_364 == _zz_365) != 1'b0);
  assign _zz_355 = ((_zz_366 == _zz_367) != 1'b0);
  assign _zz_356 = 32'h02001020;
  assign _zz_357 = 32'h00001030;
  assign _zz_358 = 32'h00000004;
  assign _zz_359 = 32'h00000018;
  assign _zz_360 = (decode_INSTRUCTION & 32'h00002010);
  assign _zz_361 = 32'h00002000;
  assign _zz_362 = (decode_INSTRUCTION & 32'h00005000);
  assign _zz_363 = 32'h00001000;
  assign _zz_364 = (decode_INSTRUCTION & 32'h00000058);
  assign _zz_365 = 32'h0;
  assign _zz_366 = (decode_INSTRUCTION & 32'h02004064);
  assign _zz_367 = 32'h02004020;
  assign _zz_368 = execute_INSTRUCTION[31];
  assign _zz_369 = execute_INSTRUCTION[31];
  assign _zz_370 = execute_INSTRUCTION[7];
  assign _zz_140 = RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress1];
  assign _zz_141 = RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress2];
  always @ (posedge clk) begin
    if(_zz_32) begin
      RegFilePlugin_regFile[lastStageRegFileWrite_payload_address] <= lastStageRegFileWrite_payload_data;
    end
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(_zz_1)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_1_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_1_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_1_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_1_string = "JALR";
      default : _zz_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_2)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_2_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_2_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_2_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_2_string = "JALR";
      default : _zz_2_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : decode_SRC1_CTRL_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : decode_SRC1_CTRL_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : decode_SRC1_CTRL_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : decode_SRC1_CTRL_string = "URS1        ";
      default : decode_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_3)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_3_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_3_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_3_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_3_string = "URS1        ";
      default : _zz_3_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_4)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_4_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_4_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_4_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_4_string = "URS1        ";
      default : _zz_4_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_5)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_5_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_5_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_5_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_5_string = "URS1        ";
      default : _zz_5_string = "????????????";
    endcase
  end
  always @(*) begin
    case(decode_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : decode_SRC2_CTRL_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : decode_SRC2_CTRL_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : decode_SRC2_CTRL_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : decode_SRC2_CTRL_string = "PC ";
      default : decode_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_6)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_6_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_6_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_6_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_6_string = "PC ";
      default : _zz_6_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_7)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_7_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_7_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_7_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_7_string = "PC ";
      default : _zz_7_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_8)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_8_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_8_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_8_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_8_string = "PC ";
      default : _zz_8_string = "???";
    endcase
  end
  always @(*) begin
    case(decode_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_9)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_9_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_9_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_9_string = "AND_1";
      default : _zz_9_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_10)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_10_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_10_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_10_string = "AND_1";
      default : _zz_10_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_11)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_11_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_11_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_11_string = "AND_1";
      default : _zz_11_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_12)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_12_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_12_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_12_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_12_string = "SRA_1    ";
      default : _zz_12_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_13)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_13_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_13_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_13_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_13_string = "SRA_1    ";
      default : _zz_13_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : decode_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : decode_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : decode_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : decode_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_14)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_14_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_14_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_14_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_14_string = "SRA_1    ";
      default : _zz_14_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_15)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_15_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_15_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_15_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_15_string = "SRA_1    ";
      default : _zz_15_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_16)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_16_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_16_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_16_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_16_string = "SRA_1    ";
      default : _zz_16_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : decode_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : decode_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : decode_ALU_CTRL_string = "BITWISE ";
      default : decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_17)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_17_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_17_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_17_string = "BITWISE ";
      default : _zz_17_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_18)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_18_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_18_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_18_string = "BITWISE ";
      default : _zz_18_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_19)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_19_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_19_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_19_string = "BITWISE ";
      default : _zz_19_string = "????????";
    endcase
  end
  always @(*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : execute_BRANCH_CTRL_string = "JALR";
      default : execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_20)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_20_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_20_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_20_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_20_string = "JALR";
      default : _zz_20_string = "????";
    endcase
  end
  always @(*) begin
    case(memory_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : memory_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : memory_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : memory_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : memory_SHIFT_CTRL_string = "SRA_1    ";
      default : memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_23)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_23_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_23_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_23_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_23_string = "SRA_1    ";
      default : _zz_23_string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : execute_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : execute_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : execute_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : execute_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_24)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_24_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_24_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_24_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_24_string = "SRA_1    ";
      default : _zz_24_string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : execute_SRC2_CTRL_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : execute_SRC2_CTRL_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : execute_SRC2_CTRL_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : execute_SRC2_CTRL_string = "PC ";
      default : execute_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_26)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_26_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_26_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_26_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_26_string = "PC ";
      default : _zz_26_string = "???";
    endcase
  end
  always @(*) begin
    case(execute_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : execute_SRC1_CTRL_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : execute_SRC1_CTRL_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : execute_SRC1_CTRL_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : execute_SRC1_CTRL_string = "URS1        ";
      default : execute_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_27)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_27_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_27_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_27_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_27_string = "URS1        ";
      default : _zz_27_string = "????????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : execute_ALU_CTRL_string = "BITWISE ";
      default : execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_28)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_28_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_28_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_28_string = "BITWISE ";
      default : _zz_28_string = "????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_29)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_29_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_29_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_29_string = "AND_1";
      default : _zz_29_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_33)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_33_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_33_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_33_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_33_string = "PC ";
      default : _zz_33_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_34)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_34_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_34_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_34_string = "AND_1";
      default : _zz_34_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_35)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_35_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_35_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_35_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_35_string = "JALR";
      default : _zz_35_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_36)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_36_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_36_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_36_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_36_string = "URS1        ";
      default : _zz_36_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_37)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_37_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_37_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_37_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_37_string = "SRA_1    ";
      default : _zz_37_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_38)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_38_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_38_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_38_string = "BITWISE ";
      default : _zz_38_string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : decode_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : decode_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : decode_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : decode_BRANCH_CTRL_string = "JALR";
      default : decode_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_40)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_40_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_40_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_40_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_40_string = "JALR";
      default : _zz_40_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_98)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_98_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_98_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_98_string = "BITWISE ";
      default : _zz_98_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_99)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_99_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_99_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_99_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_99_string = "SRA_1    ";
      default : _zz_99_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_100)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_100_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_100_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_100_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_100_string = "URS1        ";
      default : _zz_100_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_101)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_101_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_101_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_101_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_101_string = "JALR";
      default : _zz_101_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_102)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_102_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_102_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_102_string = "AND_1";
      default : _zz_102_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_103)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_103_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_103_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_103_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_103_string = "PC ";
      default : _zz_103_string = "???";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : decode_to_execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : decode_to_execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : decode_to_execute_ALU_CTRL_string = "BITWISE ";
      default : decode_to_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : decode_to_execute_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : decode_to_execute_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : decode_to_execute_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : decode_to_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_to_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : execute_to_memory_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : execute_to_memory_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : execute_to_memory_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : execute_to_memory_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_to_memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : decode_to_execute_SRC2_CTRL_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : decode_to_execute_SRC2_CTRL_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : decode_to_execute_SRC2_CTRL_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : decode_to_execute_SRC2_CTRL_string = "PC ";
      default : decode_to_execute_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : decode_to_execute_SRC1_CTRL_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : decode_to_execute_SRC1_CTRL_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : decode_to_execute_SRC1_CTRL_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : decode_to_execute_SRC1_CTRL_string = "URS1        ";
      default : decode_to_execute_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : decode_to_execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : decode_to_execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : decode_to_execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  `endif

  assign decode_IS_DIV = _zz_163[0];
  assign memory_MUL_LOW = ($signed(_zz_164) + $signed(_zz_172));
  assign _zz_1 = _zz_2;
  assign memory_MEMORY_ADDRESS_LOW = execute_to_memory_MEMORY_ADDRESS_LOW;
  assign execute_MEMORY_ADDRESS_LOW = dBus_cmd_payload_address[1 : 0];
  assign memory_MUL_HH = execute_to_memory_MUL_HH;
  assign execute_MUL_HH = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bHigh));
  assign decode_IS_RS2_SIGNED = _zz_173[0];
  assign decode_IS_RS1_SIGNED = _zz_174[0];
  assign decode_SRC2_FORCE_ZERO = (decode_SRC_ADD_ZERO && (! decode_SRC_USE_SUB_LESS));
  assign memory_FORMAL_PC_NEXT = execute_to_memory_FORMAL_PC_NEXT;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = (decode_PC + _zz_176);
  assign execute_MUL_LH = ($signed(execute_MulPlugin_aSLow) * $signed(execute_MulPlugin_bHigh));
  assign execute_BYPASSABLE_MEMORY_STAGE = decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  assign decode_BYPASSABLE_MEMORY_STAGE = _zz_177[0];
  assign decode_PREDICTION_HAD_BRANCHED2 = IBusSimplePlugin_decodePrediction_cmd_hadBranch;
  assign decode_SRC1_CTRL = _zz_3;
  assign _zz_4 = _zz_5;
  assign memory_MEMORY_READ_DATA = dBus_rsp_data;
  assign writeBack_REGFILE_WRITE_DATA = memory_to_writeBack_REGFILE_WRITE_DATA;
  assign memory_REGFILE_WRITE_DATA = execute_to_memory_REGFILE_WRITE_DATA;
  assign execute_REGFILE_WRITE_DATA = _zz_104;
  assign decode_MEMORY_ENABLE = _zz_178[0];
  assign execute_BRANCH_CALC = {execute_BranchPlugin_branchAdder[31 : 1],1'b0};
  assign execute_SHIFT_RIGHT = _zz_180;
  assign execute_MUL_HL = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bSLow));
  assign decode_SRC2_CTRL = _zz_6;
  assign _zz_7 = _zz_8;
  assign memory_IS_MUL = execute_to_memory_IS_MUL;
  assign execute_IS_MUL = decode_to_execute_IS_MUL;
  assign decode_IS_MUL = _zz_182[0];
  assign decode_ALU_BITWISE_CTRL = _zz_9;
  assign _zz_10 = _zz_11;
  assign execute_MUL_LL = (execute_MulPlugin_aULow * execute_MulPlugin_bULow);
  assign _zz_12 = _zz_13;
  assign decode_SHIFT_CTRL = _zz_14;
  assign _zz_15 = _zz_16;
  assign decode_ALU_CTRL = _zz_17;
  assign _zz_18 = _zz_19;
  assign execute_BRANCH_DO = ((execute_PREDICTION_HAD_BRANCHED2 != execute_BRANCH_COND_RESULT) || execute_BranchPlugin_missAlignedTarget);
  assign decode_BYPASSABLE_EXECUTE_STAGE = _zz_183[0];
  assign decode_MEMORY_STORE = _zz_184[0];
  assign memory_PC = execute_to_memory_PC;
  assign decode_SRC_LESS_UNSIGNED = _zz_185[0];
  assign memory_BRANCH_CALC = execute_to_memory_BRANCH_CALC;
  assign memory_BRANCH_DO = execute_to_memory_BRANCH_DO;
  assign execute_PC = decode_to_execute_PC;
  assign execute_BRANCH_COND_RESULT = _zz_133;
  assign execute_PREDICTION_HAD_BRANCHED2 = decode_to_execute_PREDICTION_HAD_BRANCHED2;
  assign execute_BRANCH_CTRL = _zz_20;
  assign execute_IS_RS1_SIGNED = decode_to_execute_IS_RS1_SIGNED;
  assign execute_IS_DIV = decode_to_execute_IS_DIV;
  assign execute_IS_RS2_SIGNED = decode_to_execute_IS_RS2_SIGNED;
  assign memory_IS_DIV = execute_to_memory_IS_DIV;
  assign writeBack_IS_MUL = memory_to_writeBack_IS_MUL;
  assign writeBack_MUL_HH = memory_to_writeBack_MUL_HH;
  assign writeBack_MUL_LOW = memory_to_writeBack_MUL_LOW;
  assign memory_MUL_HL = execute_to_memory_MUL_HL;
  assign memory_MUL_LH = execute_to_memory_MUL_LH;
  assign memory_MUL_LL = execute_to_memory_MUL_LL;
  assign execute_RS1 = decode_to_execute_RS1;
  assign decode_RS2_USE = _zz_186[0];
  assign decode_RS1_USE = _zz_187[0];
  assign _zz_21 = execute_REGFILE_WRITE_DATA;
  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign execute_BYPASSABLE_EXECUTE_STAGE = decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  assign memory_REGFILE_WRITE_VALID = execute_to_memory_REGFILE_WRITE_VALID;
  assign memory_INSTRUCTION = execute_to_memory_INSTRUCTION;
  assign memory_BYPASSABLE_MEMORY_STAGE = execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  assign writeBack_REGFILE_WRITE_VALID = memory_to_writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    decode_RS2 = decode_RegFilePlugin_rs2Data;
    if(_zz_115)begin
      if((_zz_116 == decode_INSTRUCTION[24 : 20]))begin
        decode_RS2 = _zz_117;
      end
    end
    if(_zz_142)begin
      if(_zz_143)begin
        if(_zz_119)begin
          decode_RS2 = _zz_39;
        end
      end
    end
    if(_zz_144)begin
      if(memory_BYPASSABLE_MEMORY_STAGE)begin
        if(_zz_121)begin
          decode_RS2 = _zz_22;
        end
      end
    end
    if(_zz_145)begin
      if(execute_BYPASSABLE_EXECUTE_STAGE)begin
        if(_zz_123)begin
          decode_RS2 = _zz_21;
        end
      end
    end
  end

  always @ (*) begin
    decode_RS1 = decode_RegFilePlugin_rs1Data;
    if(_zz_115)begin
      if((_zz_116 == decode_INSTRUCTION[19 : 15]))begin
        decode_RS1 = _zz_117;
      end
    end
    if(_zz_142)begin
      if(_zz_143)begin
        if(_zz_118)begin
          decode_RS1 = _zz_39;
        end
      end
    end
    if(_zz_144)begin
      if(memory_BYPASSABLE_MEMORY_STAGE)begin
        if(_zz_120)begin
          decode_RS1 = _zz_22;
        end
      end
    end
    if(_zz_145)begin
      if(execute_BYPASSABLE_EXECUTE_STAGE)begin
        if(_zz_122)begin
          decode_RS1 = _zz_21;
        end
      end
    end
  end

  assign memory_SHIFT_RIGHT = execute_to_memory_SHIFT_RIGHT;
  always @ (*) begin
    _zz_22 = memory_REGFILE_WRITE_DATA;
    if(memory_arbitration_isValid)begin
      case(memory_SHIFT_CTRL)
        `ShiftCtrlEnum_defaultEncoding_SLL_1 : begin
          _zz_22 = _zz_112;
        end
        `ShiftCtrlEnum_defaultEncoding_SRL_1, `ShiftCtrlEnum_defaultEncoding_SRA_1 : begin
          _zz_22 = memory_SHIFT_RIGHT;
        end
        default : begin
        end
      endcase
    end
    if(_zz_146)begin
      _zz_22 = memory_DivPlugin_div_result;
    end
  end

  assign memory_SHIFT_CTRL = _zz_23;
  assign execute_SHIFT_CTRL = _zz_24;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC2_FORCE_ZERO = decode_to_execute_SRC2_FORCE_ZERO;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign _zz_25 = execute_PC;
  assign execute_SRC2_CTRL = _zz_26;
  assign execute_IS_RVC = decode_to_execute_IS_RVC;
  assign execute_SRC1_CTRL = _zz_27;
  assign decode_SRC_USE_SUB_LESS = _zz_188[0];
  assign decode_SRC_ADD_ZERO = _zz_189[0];
  assign execute_SRC_ADD_SUB = execute_SrcPlugin_addSub;
  assign execute_SRC_LESS = execute_SrcPlugin_less;
  assign execute_ALU_CTRL = _zz_28;
  assign execute_SRC2 = _zz_110;
  assign execute_SRC1 = _zz_105;
  assign execute_ALU_BITWISE_CTRL = _zz_29;
  assign _zz_30 = writeBack_INSTRUCTION;
  assign _zz_31 = writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    _zz_32 = 1'b0;
    if(lastStageRegFileWrite_valid)begin
      _zz_32 = 1'b1;
    end
  end

  always @ (*) begin
    decode_REGFILE_WRITE_VALID = _zz_190[0];
    if((decode_INSTRUCTION[11 : 7] == 5'h0))begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  assign writeBack_MEMORY_STORE = memory_to_writeBack_MEMORY_STORE;
  always @ (*) begin
    _zz_39 = writeBack_REGFILE_WRITE_DATA;
    if((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE))begin
      _zz_39 = writeBack_DBusSimplePlugin_rspFormated;
    end
    if((writeBack_arbitration_isValid && writeBack_IS_MUL))begin
      case(_zz_162)
        2'b00 : begin
          _zz_39 = _zz_227;
        end
        default : begin
          _zz_39 = _zz_228;
        end
      endcase
    end
  end

  assign writeBack_MEMORY_ENABLE = memory_to_writeBack_MEMORY_ENABLE;
  assign writeBack_MEMORY_ADDRESS_LOW = memory_to_writeBack_MEMORY_ADDRESS_LOW;
  assign writeBack_MEMORY_READ_DATA = memory_to_writeBack_MEMORY_READ_DATA;
  assign memory_MEMORY_STORE = execute_to_memory_MEMORY_STORE;
  assign memory_MEMORY_ENABLE = execute_to_memory_MEMORY_ENABLE;
  assign execute_SRC_ADD = execute_SrcPlugin_addSub;
  assign execute_RS2 = decode_to_execute_RS2;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign execute_MEMORY_STORE = decode_to_execute_MEMORY_STORE;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign execute_ALIGNEMENT_FAULT = 1'b0;
  assign decode_BRANCH_CTRL = _zz_40;
  always @ (*) begin
    _zz_41 = decode_FORMAL_PC_NEXT;
    if(IBusSimplePlugin_predictionJumpInterface_valid)begin
      _zz_41 = IBusSimplePlugin_predictionJumpInterface_payload;
    end
  end

  assign decode_PC = IBusSimplePlugin_decodePc_pcReg;
  assign decode_INSTRUCTION = IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  assign decode_IS_RVC = IBusSimplePlugin_injector_decodeInput_payload_isRvc;
  assign writeBack_PC = memory_to_writeBack_PC;
  assign writeBack_INSTRUCTION = memory_to_writeBack_INSTRUCTION;
  assign decode_arbitration_haltItself = 1'b0;
  always @ (*) begin
    decode_arbitration_haltByOther = 1'b0;
    if((decode_arbitration_isValid && (_zz_113 || _zz_114)))begin
      decode_arbitration_haltByOther = 1'b1;
    end
  end

  always @ (*) begin
    decode_arbitration_removeIt = 1'b0;
    if(decode_arbitration_isFlushed)begin
      decode_arbitration_removeIt = 1'b1;
    end
  end

  assign decode_arbitration_flushIt = 1'b0;
  always @ (*) begin
    decode_arbitration_flushNext = 1'b0;
    if(IBusSimplePlugin_predictionJumpInterface_valid)begin
      decode_arbitration_flushNext = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_haltItself = 1'b0;
    if(((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! dBus_cmd_ready)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_87)))begin
      execute_arbitration_haltItself = 1'b1;
    end
  end

  assign execute_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    execute_arbitration_removeIt = 1'b0;
    if(execute_arbitration_isFlushed)begin
      execute_arbitration_removeIt = 1'b1;
    end
  end

  assign execute_arbitration_flushIt = 1'b0;
  assign execute_arbitration_flushNext = 1'b0;
  always @ (*) begin
    memory_arbitration_haltItself = 1'b0;
    if((((memory_arbitration_isValid && memory_MEMORY_ENABLE) && (! memory_MEMORY_STORE)) && ((! dBus_rsp_ready) || 1'b0)))begin
      memory_arbitration_haltItself = 1'b1;
    end
    if(_zz_146)begin
      if(((! memory_DivPlugin_frontendOk) || (! memory_DivPlugin_div_done)))begin
        memory_arbitration_haltItself = 1'b1;
      end
    end
  end

  assign memory_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    memory_arbitration_removeIt = 1'b0;
    if(memory_arbitration_isFlushed)begin
      memory_arbitration_removeIt = 1'b1;
    end
  end

  assign memory_arbitration_flushIt = 1'b0;
  always @ (*) begin
    memory_arbitration_flushNext = 1'b0;
    if(BranchPlugin_jumpInterface_valid)begin
      memory_arbitration_flushNext = 1'b1;
    end
  end

  assign writeBack_arbitration_haltItself = 1'b0;
  assign writeBack_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    writeBack_arbitration_removeIt = 1'b0;
    if(writeBack_arbitration_isFlushed)begin
      writeBack_arbitration_removeIt = 1'b1;
    end
  end

  assign writeBack_arbitration_flushIt = 1'b0;
  assign writeBack_arbitration_flushNext = 1'b0;
  assign lastStageInstruction = writeBack_INSTRUCTION;
  assign lastStagePc = writeBack_PC;
  assign lastStageIsValid = writeBack_arbitration_isValid;
  assign lastStageIsFiring = writeBack_arbitration_isFiring;
  assign IBusSimplePlugin_fetcherHalt = 1'b0;
  always @ (*) begin
    IBusSimplePlugin_incomingInstruction = 1'b0;
    if(IBusSimplePlugin_iBusRsp_stages_1_input_valid)begin
      IBusSimplePlugin_incomingInstruction = 1'b1;
    end
    if(IBusSimplePlugin_injector_decodeInput_valid)begin
      IBusSimplePlugin_incomingInstruction = 1'b1;
    end
  end

  assign IBusSimplePlugin_fetcherflushIt = ({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,{execute_arbitration_flushNext,decode_arbitration_flushNext}}} != 4'b0000);
  assign IBusSimplePlugin_jump_pcLoad_valid = ({BranchPlugin_jumpInterface_valid,IBusSimplePlugin_predictionJumpInterface_valid} != 2'b00);
  assign _zz_42 = {IBusSimplePlugin_predictionJumpInterface_valid,BranchPlugin_jumpInterface_valid};
  assign IBusSimplePlugin_jump_pcLoad_payload = (_zz_191[0] ? BranchPlugin_jumpInterface_payload : IBusSimplePlugin_predictionJumpInterface_payload);
  always @ (*) begin
    IBusSimplePlugin_fetchPc_correction = 1'b0;
    if(IBusSimplePlugin_jump_pcLoad_valid)begin
      IBusSimplePlugin_fetchPc_correction = 1'b1;
    end
  end

  assign IBusSimplePlugin_fetchPc_corrected = (IBusSimplePlugin_fetchPc_correction || IBusSimplePlugin_fetchPc_correctionReg);
  always @ (*) begin
    IBusSimplePlugin_fetchPc_pcRegPropagate = 1'b0;
    if(IBusSimplePlugin_iBusRsp_stages_1_input_ready)begin
      IBusSimplePlugin_fetchPc_pcRegPropagate = 1'b1;
    end
  end

  always @ (*) begin
    IBusSimplePlugin_fetchPc_pc = (IBusSimplePlugin_fetchPc_pcReg + _zz_194);
    if(IBusSimplePlugin_fetchPc_inc)begin
      IBusSimplePlugin_fetchPc_pc[1] = 1'b0;
    end
    if(IBusSimplePlugin_jump_pcLoad_valid)begin
      IBusSimplePlugin_fetchPc_pc = IBusSimplePlugin_jump_pcLoad_payload;
    end
    IBusSimplePlugin_fetchPc_pc[0] = 1'b0;
  end

  always @ (*) begin
    IBusSimplePlugin_fetchPc_flushed = 1'b0;
    if(IBusSimplePlugin_jump_pcLoad_valid)begin
      IBusSimplePlugin_fetchPc_flushed = 1'b1;
    end
  end

  assign IBusSimplePlugin_fetchPc_output_valid = ((! IBusSimplePlugin_fetcherHalt) && IBusSimplePlugin_fetchPc_booted);
  assign IBusSimplePlugin_fetchPc_output_payload = IBusSimplePlugin_fetchPc_pc;
  always @ (*) begin
    IBusSimplePlugin_decodePc_flushed = 1'b0;
    if(_zz_147)begin
      IBusSimplePlugin_decodePc_flushed = 1'b1;
    end
  end

  assign IBusSimplePlugin_decodePc_pcPlus = (IBusSimplePlugin_decodePc_pcReg + _zz_196);
  assign IBusSimplePlugin_decodePc_injectedDecode = 1'b0;
  assign IBusSimplePlugin_iBusRsp_redoFetch = 1'b0;
  assign IBusSimplePlugin_iBusRsp_stages_0_input_valid = IBusSimplePlugin_fetchPc_output_valid;
  assign IBusSimplePlugin_fetchPc_output_ready = IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  assign IBusSimplePlugin_iBusRsp_stages_0_input_payload = IBusSimplePlugin_fetchPc_output_payload;
  always @ (*) begin
    IBusSimplePlugin_iBusRsp_stages_0_halt = 1'b0;
    if((IBusSimplePlugin_iBusRsp_stages_0_input_valid && ((! IBusSimplePlugin_cmd_valid) || (! IBusSimplePlugin_cmd_ready))))begin
      IBusSimplePlugin_iBusRsp_stages_0_halt = 1'b1;
    end
  end

  assign _zz_43 = (! IBusSimplePlugin_iBusRsp_stages_0_halt);
  assign IBusSimplePlugin_iBusRsp_stages_0_input_ready = (IBusSimplePlugin_iBusRsp_stages_0_output_ready && _zz_43);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_valid = (IBusSimplePlugin_iBusRsp_stages_0_input_valid && _zz_43);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_payload = IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  assign IBusSimplePlugin_iBusRsp_stages_1_halt = 1'b0;
  assign _zz_44 = (! IBusSimplePlugin_iBusRsp_stages_1_halt);
  assign IBusSimplePlugin_iBusRsp_stages_1_input_ready = (IBusSimplePlugin_iBusRsp_stages_1_output_ready && _zz_44);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_valid = (IBusSimplePlugin_iBusRsp_stages_1_input_valid && _zz_44);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_payload = IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  assign IBusSimplePlugin_iBusRsp_stages_0_flush = 1'b0;
  assign IBusSimplePlugin_iBusRsp_stages_1_flush = (IBusSimplePlugin_fetcherflushIt || IBusSimplePlugin_iBusRsp_redoFetch);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_ready = _zz_45;
  assign _zz_45 = ((1'b0 && (! _zz_46)) || IBusSimplePlugin_iBusRsp_stages_1_input_ready);
  assign _zz_46 = _zz_47;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_valid = _zz_46;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_payload = IBusSimplePlugin_fetchPc_pcReg;
  always @ (*) begin
    IBusSimplePlugin_iBusRsp_readyForError = 1'b1;
    if(IBusSimplePlugin_injector_decodeInput_valid)begin
      IBusSimplePlugin_iBusRsp_readyForError = 1'b0;
    end
  end

  assign IBusSimplePlugin_decompressor_input_valid = (IBusSimplePlugin_iBusRsp_output_valid && (! IBusSimplePlugin_iBusRsp_redoFetch));
  assign IBusSimplePlugin_decompressor_input_payload_pc = IBusSimplePlugin_iBusRsp_output_payload_pc;
  assign IBusSimplePlugin_decompressor_input_payload_rsp_error = IBusSimplePlugin_iBusRsp_output_payload_rsp_error;
  assign IBusSimplePlugin_decompressor_input_payload_rsp_inst = IBusSimplePlugin_iBusRsp_output_payload_rsp_inst;
  assign IBusSimplePlugin_decompressor_input_payload_isRvc = IBusSimplePlugin_iBusRsp_output_payload_isRvc;
  assign IBusSimplePlugin_iBusRsp_output_ready = IBusSimplePlugin_decompressor_input_ready;
  assign IBusSimplePlugin_decompressor_flushNext = 1'b0;
  assign IBusSimplePlugin_decompressor_consumeCurrent = 1'b0;
  assign IBusSimplePlugin_decompressor_isInputLowRvc = (IBusSimplePlugin_decompressor_input_payload_rsp_inst[1 : 0] != 2'b11);
  assign IBusSimplePlugin_decompressor_isInputHighRvc = (IBusSimplePlugin_decompressor_input_payload_rsp_inst[17 : 16] != 2'b11);
  assign IBusSimplePlugin_decompressor_throw2Bytes = (IBusSimplePlugin_decompressor_throw2BytesReg || IBusSimplePlugin_decompressor_input_payload_pc[1]);
  assign IBusSimplePlugin_decompressor_unaligned = (IBusSimplePlugin_decompressor_throw2Bytes || IBusSimplePlugin_decompressor_bufferValid);
  assign IBusSimplePlugin_decompressor_raw = (IBusSimplePlugin_decompressor_bufferValid ? {IBusSimplePlugin_decompressor_input_payload_rsp_inst[15 : 0],IBusSimplePlugin_decompressor_bufferData} : {IBusSimplePlugin_decompressor_input_payload_rsp_inst[31 : 16],(IBusSimplePlugin_decompressor_throw2Bytes ? IBusSimplePlugin_decompressor_input_payload_rsp_inst[31 : 16] : IBusSimplePlugin_decompressor_input_payload_rsp_inst[15 : 0])});
  assign IBusSimplePlugin_decompressor_isRvc = (IBusSimplePlugin_decompressor_raw[1 : 0] != 2'b11);
  assign _zz_48 = IBusSimplePlugin_decompressor_raw[15 : 0];
  always @ (*) begin
    IBusSimplePlugin_decompressor_decompressed = 32'h0;
    case(_zz_158)
      5'h0 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{{{2'b00,_zz_48[10 : 7]},_zz_48[12 : 11]},_zz_48[5]},_zz_48[6]},2'b00},5'h02},3'b000},_zz_50},7'h13};
      end
      5'h02 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{_zz_51,_zz_49},3'b010},_zz_50},7'h03};
      end
      5'h06 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_51[11 : 5],_zz_50},_zz_49},3'b010},_zz_51[4 : 0]},7'h23};
      end
      5'h08 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{_zz_53,_zz_48[11 : 7]},3'b000},_zz_48[11 : 7]},7'h13};
      end
      5'h09 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_56[20],_zz_56[10 : 1]},_zz_56[11]},_zz_56[19 : 12]},_zz_68},7'h6f};
      end
      5'h0a : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{_zz_53,5'h0},3'b000},_zz_48[11 : 7]},7'h13};
      end
      5'h0b : begin
        IBusSimplePlugin_decompressor_decompressed = ((_zz_48[11 : 7] == 5'h02) ? {{{{{{{{{_zz_60,_zz_48[4 : 3]},_zz_48[5]},_zz_48[2]},_zz_48[6]},4'b0000},_zz_48[11 : 7]},3'b000},_zz_48[11 : 7]},7'h13} : {{_zz_197[31 : 12],_zz_48[11 : 7]},7'h37});
      end
      5'h0c : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{((_zz_48[11 : 10] == 2'b10) ? _zz_74 : {{1'b0,(_zz_248 || _zz_249)},5'h0}),(((! _zz_48[11]) || _zz_70) ? _zz_48[6 : 2] : _zz_50)},_zz_49},_zz_72},_zz_49},(_zz_70 ? 7'h13 : 7'h33)};
      end
      5'h0d : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_63[20],_zz_63[10 : 1]},_zz_63[11]},_zz_63[19 : 12]},_zz_67},7'h6f};
      end
      5'h0e : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{_zz_66[12],_zz_66[10 : 5]},_zz_67},_zz_49},3'b000},_zz_66[4 : 1]},_zz_66[11]},7'h63};
      end
      5'h0f : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{_zz_66[12],_zz_66[10 : 5]},_zz_67},_zz_49},3'b001},_zz_66[4 : 1]},_zz_66[11]},7'h63};
      end
      5'h10 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{7'h0,_zz_48[6 : 2]},_zz_48[11 : 7]},3'b001},_zz_48[11 : 7]},7'h13};
      end
      5'h12 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{{4'b0000,_zz_48[3 : 2]},_zz_48[12]},_zz_48[6 : 4]},2'b00},_zz_69},3'b010},_zz_48[11 : 7]},7'h03};
      end
      5'h14 : begin
        IBusSimplePlugin_decompressor_decompressed = ((_zz_48[12 : 2] == 11'h400) ? 32'h00100073 : ((_zz_48[6 : 2] == 5'h0) ? {{{{12'h0,_zz_48[11 : 7]},3'b000},(_zz_48[12] ? _zz_68 : _zz_67)},7'h67} : {{{{{_zz_250,_zz_251},(_zz_252 ? _zz_253 : _zz_67)},3'b000},_zz_48[11 : 7]},7'h33}));
      end
      5'h16 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_198[11 : 5],_zz_48[6 : 2]},_zz_69},3'b010},_zz_199[4 : 0]},7'h23};
      end
      default : begin
      end
    endcase
  end

  assign _zz_49 = {2'b01,_zz_48[9 : 7]};
  assign _zz_50 = {2'b01,_zz_48[4 : 2]};
  assign _zz_51 = {{{{5'h0,_zz_48[5]},_zz_48[12 : 10]},_zz_48[6]},2'b00};
  assign _zz_52 = _zz_48[12];
  always @ (*) begin
    _zz_53[11] = _zz_52;
    _zz_53[10] = _zz_52;
    _zz_53[9] = _zz_52;
    _zz_53[8] = _zz_52;
    _zz_53[7] = _zz_52;
    _zz_53[6] = _zz_52;
    _zz_53[5] = _zz_52;
    _zz_53[4 : 0] = _zz_48[6 : 2];
  end

  assign _zz_54 = _zz_48[12];
  always @ (*) begin
    _zz_55[9] = _zz_54;
    _zz_55[8] = _zz_54;
    _zz_55[7] = _zz_54;
    _zz_55[6] = _zz_54;
    _zz_55[5] = _zz_54;
    _zz_55[4] = _zz_54;
    _zz_55[3] = _zz_54;
    _zz_55[2] = _zz_54;
    _zz_55[1] = _zz_54;
    _zz_55[0] = _zz_54;
  end

  assign _zz_56 = {{{{{{{{_zz_55,_zz_48[8]},_zz_48[10 : 9]},_zz_48[6]},_zz_48[7]},_zz_48[2]},_zz_48[11]},_zz_48[5 : 3]},1'b0};
  assign _zz_57 = _zz_48[12];
  always @ (*) begin
    _zz_58[14] = _zz_57;
    _zz_58[13] = _zz_57;
    _zz_58[12] = _zz_57;
    _zz_58[11] = _zz_57;
    _zz_58[10] = _zz_57;
    _zz_58[9] = _zz_57;
    _zz_58[8] = _zz_57;
    _zz_58[7] = _zz_57;
    _zz_58[6] = _zz_57;
    _zz_58[5] = _zz_57;
    _zz_58[4] = _zz_57;
    _zz_58[3] = _zz_57;
    _zz_58[2] = _zz_57;
    _zz_58[1] = _zz_57;
    _zz_58[0] = _zz_57;
  end

  assign _zz_59 = _zz_48[12];
  always @ (*) begin
    _zz_60[2] = _zz_59;
    _zz_60[1] = _zz_59;
    _zz_60[0] = _zz_59;
  end

  assign _zz_61 = _zz_48[12];
  always @ (*) begin
    _zz_62[9] = _zz_61;
    _zz_62[8] = _zz_61;
    _zz_62[7] = _zz_61;
    _zz_62[6] = _zz_61;
    _zz_62[5] = _zz_61;
    _zz_62[4] = _zz_61;
    _zz_62[3] = _zz_61;
    _zz_62[2] = _zz_61;
    _zz_62[1] = _zz_61;
    _zz_62[0] = _zz_61;
  end

  assign _zz_63 = {{{{{{{{_zz_62,_zz_48[8]},_zz_48[10 : 9]},_zz_48[6]},_zz_48[7]},_zz_48[2]},_zz_48[11]},_zz_48[5 : 3]},1'b0};
  assign _zz_64 = _zz_48[12];
  always @ (*) begin
    _zz_65[4] = _zz_64;
    _zz_65[3] = _zz_64;
    _zz_65[2] = _zz_64;
    _zz_65[1] = _zz_64;
    _zz_65[0] = _zz_64;
  end

  assign _zz_66 = {{{{{_zz_65,_zz_48[6 : 5]},_zz_48[2]},_zz_48[11 : 10]},_zz_48[4 : 3]},1'b0};
  assign _zz_67 = 5'h0;
  assign _zz_68 = 5'h01;
  assign _zz_69 = 5'h02;
  assign _zz_70 = (_zz_48[11 : 10] != 2'b11);
  always @ (*) begin
    case(_zz_159)
      2'b00 : begin
        _zz_71 = 3'b000;
      end
      2'b01 : begin
        _zz_71 = 3'b100;
      end
      2'b10 : begin
        _zz_71 = 3'b110;
      end
      default : begin
        _zz_71 = 3'b111;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_160)
      2'b00 : begin
        _zz_72 = 3'b101;
      end
      2'b01 : begin
        _zz_72 = 3'b101;
      end
      2'b10 : begin
        _zz_72 = 3'b111;
      end
      default : begin
        _zz_72 = _zz_71;
      end
    endcase
  end

  assign _zz_73 = _zz_48[12];
  always @ (*) begin
    _zz_74[6] = _zz_73;
    _zz_74[5] = _zz_73;
    _zz_74[4] = _zz_73;
    _zz_74[3] = _zz_73;
    _zz_74[2] = _zz_73;
    _zz_74[1] = _zz_73;
    _zz_74[0] = _zz_73;
  end

  assign IBusSimplePlugin_decompressor_output_valid = (IBusSimplePlugin_decompressor_input_valid && (! ((IBusSimplePlugin_decompressor_throw2Bytes && (! IBusSimplePlugin_decompressor_bufferValid)) && (! IBusSimplePlugin_decompressor_isInputHighRvc))));
  assign IBusSimplePlugin_decompressor_output_payload_pc = IBusSimplePlugin_decompressor_input_payload_pc;
  assign IBusSimplePlugin_decompressor_output_payload_isRvc = IBusSimplePlugin_decompressor_isRvc;
  assign IBusSimplePlugin_decompressor_output_payload_rsp_inst = (IBusSimplePlugin_decompressor_isRvc ? IBusSimplePlugin_decompressor_decompressed : IBusSimplePlugin_decompressor_raw);
  assign IBusSimplePlugin_decompressor_input_ready = (IBusSimplePlugin_decompressor_output_ready && (((! IBusSimplePlugin_iBusRsp_stages_1_input_valid) || IBusSimplePlugin_decompressor_flushNext) || ((! (IBusSimplePlugin_decompressor_bufferValid && IBusSimplePlugin_decompressor_isInputHighRvc)) && (! (((! IBusSimplePlugin_decompressor_unaligned) && IBusSimplePlugin_decompressor_isInputLowRvc) && IBusSimplePlugin_decompressor_isInputHighRvc)))));
  assign IBusSimplePlugin_decompressor_bufferFill = (((((! IBusSimplePlugin_decompressor_unaligned) && IBusSimplePlugin_decompressor_isInputLowRvc) && (! IBusSimplePlugin_decompressor_isInputHighRvc)) || (IBusSimplePlugin_decompressor_bufferValid && (! IBusSimplePlugin_decompressor_isInputHighRvc))) || ((IBusSimplePlugin_decompressor_throw2Bytes && (! IBusSimplePlugin_decompressor_isRvc)) && (! IBusSimplePlugin_decompressor_isInputHighRvc)));
  assign IBusSimplePlugin_decompressor_output_ready = ((1'b0 && (! IBusSimplePlugin_injector_decodeInput_valid)) || IBusSimplePlugin_injector_decodeInput_ready);
  assign IBusSimplePlugin_injector_decodeInput_valid = _zz_75;
  assign IBusSimplePlugin_injector_decodeInput_payload_pc = _zz_76;
  assign IBusSimplePlugin_injector_decodeInput_payload_rsp_error = _zz_77;
  assign IBusSimplePlugin_injector_decodeInput_payload_rsp_inst = _zz_78;
  assign IBusSimplePlugin_injector_decodeInput_payload_isRvc = _zz_79;
  assign IBusSimplePlugin_pcValids_0 = IBusSimplePlugin_injector_nextPcCalc_valids_0;
  assign IBusSimplePlugin_pcValids_1 = IBusSimplePlugin_injector_nextPcCalc_valids_1;
  assign IBusSimplePlugin_pcValids_2 = IBusSimplePlugin_injector_nextPcCalc_valids_2;
  assign IBusSimplePlugin_pcValids_3 = IBusSimplePlugin_injector_nextPcCalc_valids_3;
  assign IBusSimplePlugin_injector_decodeInput_ready = (! decode_arbitration_isStuck);
  assign decode_arbitration_isValid = IBusSimplePlugin_injector_decodeInput_valid;
  assign _zz_80 = _zz_200[11];
  always @ (*) begin
    _zz_81[18] = _zz_80;
    _zz_81[17] = _zz_80;
    _zz_81[16] = _zz_80;
    _zz_81[15] = _zz_80;
    _zz_81[14] = _zz_80;
    _zz_81[13] = _zz_80;
    _zz_81[12] = _zz_80;
    _zz_81[11] = _zz_80;
    _zz_81[10] = _zz_80;
    _zz_81[9] = _zz_80;
    _zz_81[8] = _zz_80;
    _zz_81[7] = _zz_80;
    _zz_81[6] = _zz_80;
    _zz_81[5] = _zz_80;
    _zz_81[4] = _zz_80;
    _zz_81[3] = _zz_80;
    _zz_81[2] = _zz_80;
    _zz_81[1] = _zz_80;
    _zz_81[0] = _zz_80;
  end

  assign IBusSimplePlugin_decodePrediction_cmd_hadBranch = ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) || ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_B) && _zz_201[31]));
  assign IBusSimplePlugin_predictionJumpInterface_valid = (decode_arbitration_isValid && IBusSimplePlugin_decodePrediction_cmd_hadBranch);
  assign _zz_82 = _zz_202[19];
  always @ (*) begin
    _zz_83[10] = _zz_82;
    _zz_83[9] = _zz_82;
    _zz_83[8] = _zz_82;
    _zz_83[7] = _zz_82;
    _zz_83[6] = _zz_82;
    _zz_83[5] = _zz_82;
    _zz_83[4] = _zz_82;
    _zz_83[3] = _zz_82;
    _zz_83[2] = _zz_82;
    _zz_83[1] = _zz_82;
    _zz_83[0] = _zz_82;
  end

  assign _zz_84 = _zz_203[11];
  always @ (*) begin
    _zz_85[18] = _zz_84;
    _zz_85[17] = _zz_84;
    _zz_85[16] = _zz_84;
    _zz_85[15] = _zz_84;
    _zz_85[14] = _zz_84;
    _zz_85[13] = _zz_84;
    _zz_85[12] = _zz_84;
    _zz_85[11] = _zz_84;
    _zz_85[10] = _zz_84;
    _zz_85[9] = _zz_84;
    _zz_85[8] = _zz_84;
    _zz_85[7] = _zz_84;
    _zz_85[6] = _zz_84;
    _zz_85[5] = _zz_84;
    _zz_85[4] = _zz_84;
    _zz_85[3] = _zz_84;
    _zz_85[2] = _zz_84;
    _zz_85[1] = _zz_84;
    _zz_85[0] = _zz_84;
  end

  assign IBusSimplePlugin_predictionJumpInterface_payload = (decode_PC + ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) ? {{_zz_83,{{{_zz_254,_zz_255},_zz_256},decode_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_85,{{{_zz_257,_zz_258},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0}));
  assign iBus_cmd_valid = IBusSimplePlugin_cmd_valid;
  assign IBusSimplePlugin_cmd_ready = iBus_cmd_ready;
  assign iBus_cmd_payload_pc = IBusSimplePlugin_cmd_payload_pc;
  assign IBusSimplePlugin_pendingCmdNext = (_zz_204 - _zz_208);
  assign IBusSimplePlugin_cmd_valid = ((IBusSimplePlugin_iBusRsp_stages_0_input_valid && IBusSimplePlugin_iBusRsp_stages_0_output_ready) && (IBusSimplePlugin_pendingCmd != 3'b111));
  assign IBusSimplePlugin_cmd_payload_pc = {IBusSimplePlugin_iBusRsp_stages_0_input_payload[31 : 2],2'b00};
  assign iBus_rsp_takeWhen_valid = (iBus_rsp_valid && (! (IBusSimplePlugin_rspJoin_discardCounter != 3'b000)));
  assign iBus_rsp_takeWhen_payload_error = iBus_rsp_payload_error;
  assign iBus_rsp_takeWhen_payload_inst = iBus_rsp_payload_inst;
  assign IBusSimplePlugin_rspJoin_rspBuffer_rspStream_valid = iBus_rsp_takeWhen_valid;
  assign IBusSimplePlugin_rspJoin_rspBuffer_rspStream_payload_error = iBus_rsp_takeWhen_payload_error;
  assign IBusSimplePlugin_rspJoin_rspBuffer_rspStream_payload_inst = iBus_rsp_takeWhen_payload_inst;
  always @ (*) begin
    IBusSimplePlugin_rspJoin_rspBufferOutput_valid = IBusSimplePlugin_rspJoin_rspBuffer_rspStream_valid;
    if(IBusSimplePlugin_rspJoin_rspBuffer_validReg)begin
      IBusSimplePlugin_rspJoin_rspBufferOutput_valid = 1'b1;
    end
  end

  assign IBusSimplePlugin_rspJoin_rspBuffer_rspStream_ready = IBusSimplePlugin_rspJoin_rspBufferOutput_ready;
  assign IBusSimplePlugin_rspJoin_rspBufferOutput_payload_error = IBusSimplePlugin_rspJoin_rspBuffer_rspStream_payload_error;
  assign IBusSimplePlugin_rspJoin_rspBufferOutput_payload_inst = IBusSimplePlugin_rspJoin_rspBuffer_rspStream_payload_inst;
  assign IBusSimplePlugin_rspJoin_fetchRsp_pc = IBusSimplePlugin_iBusRsp_stages_1_output_payload;
  always @ (*) begin
    IBusSimplePlugin_rspJoin_fetchRsp_rsp_error = IBusSimplePlugin_rspJoin_rspBufferOutput_payload_error;
    if((! IBusSimplePlugin_rspJoin_rspBufferOutput_valid))begin
      IBusSimplePlugin_rspJoin_fetchRsp_rsp_error = 1'b0;
    end
  end

  assign IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst = IBusSimplePlugin_rspJoin_rspBufferOutput_payload_inst;
  assign IBusSimplePlugin_rspJoin_exceptionDetected = 1'b0;
  assign IBusSimplePlugin_rspJoin_join_valid = (IBusSimplePlugin_iBusRsp_stages_1_output_valid && IBusSimplePlugin_rspJoin_rspBufferOutput_valid);
  assign IBusSimplePlugin_rspJoin_join_payload_pc = IBusSimplePlugin_rspJoin_fetchRsp_pc;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_error = IBusSimplePlugin_rspJoin_fetchRsp_rsp_error;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_inst = IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst;
  assign IBusSimplePlugin_rspJoin_join_payload_isRvc = IBusSimplePlugin_rspJoin_fetchRsp_isRvc;
  assign IBusSimplePlugin_iBusRsp_stages_1_output_ready = (IBusSimplePlugin_iBusRsp_stages_1_output_valid ? (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_ready) : IBusSimplePlugin_rspJoin_join_ready);
  assign IBusSimplePlugin_rspJoin_rspBufferOutput_ready = (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_ready);
  assign _zz_86 = (! IBusSimplePlugin_rspJoin_exceptionDetected);
  assign IBusSimplePlugin_rspJoin_join_ready = (IBusSimplePlugin_iBusRsp_output_ready && _zz_86);
  assign IBusSimplePlugin_iBusRsp_output_valid = (IBusSimplePlugin_rspJoin_join_valid && _zz_86);
  assign IBusSimplePlugin_iBusRsp_output_payload_pc = IBusSimplePlugin_rspJoin_join_payload_pc;
  assign IBusSimplePlugin_iBusRsp_output_payload_rsp_error = IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  assign IBusSimplePlugin_iBusRsp_output_payload_rsp_inst = IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  assign IBusSimplePlugin_iBusRsp_output_payload_isRvc = IBusSimplePlugin_rspJoin_join_payload_isRvc;
  assign _zz_87 = 1'b0;
  always @ (*) begin
    execute_DBusSimplePlugin_skipCmd = 1'b0;
    if(execute_ALIGNEMENT_FAULT)begin
      execute_DBusSimplePlugin_skipCmd = 1'b1;
    end
  end

  assign dBus_cmd_valid = (((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! execute_arbitration_isStuckByOthers)) && (! execute_arbitration_isFlushed)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_87));
  assign dBus_cmd_payload_wr = execute_MEMORY_STORE;
  assign dBus_cmd_payload_size = execute_INSTRUCTION[13 : 12];
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_88 = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_88 = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_88 = execute_RS2[31 : 0];
      end
    endcase
  end

  assign dBus_cmd_payload_data = _zz_88;
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_89 = 4'b0001;
      end
      2'b01 : begin
        _zz_89 = 4'b0011;
      end
      default : begin
        _zz_89 = 4'b1111;
      end
    endcase
  end

  assign execute_DBusSimplePlugin_formalMask = (_zz_89 <<< dBus_cmd_payload_address[1 : 0]);
  assign dBus_cmd_payload_address = execute_SRC_ADD;
  always @ (*) begin
    writeBack_DBusSimplePlugin_rspShifted = writeBack_MEMORY_READ_DATA;
    case(writeBack_MEMORY_ADDRESS_LOW)
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspShifted[7 : 0] = writeBack_MEMORY_READ_DATA[15 : 8];
      end
      2'b10 : begin
        writeBack_DBusSimplePlugin_rspShifted[15 : 0] = writeBack_MEMORY_READ_DATA[31 : 16];
      end
      2'b11 : begin
        writeBack_DBusSimplePlugin_rspShifted[7 : 0] = writeBack_MEMORY_READ_DATA[31 : 24];
      end
      default : begin
      end
    endcase
  end

  assign _zz_90 = (writeBack_DBusSimplePlugin_rspShifted[7] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_91[31] = _zz_90;
    _zz_91[30] = _zz_90;
    _zz_91[29] = _zz_90;
    _zz_91[28] = _zz_90;
    _zz_91[27] = _zz_90;
    _zz_91[26] = _zz_90;
    _zz_91[25] = _zz_90;
    _zz_91[24] = _zz_90;
    _zz_91[23] = _zz_90;
    _zz_91[22] = _zz_90;
    _zz_91[21] = _zz_90;
    _zz_91[20] = _zz_90;
    _zz_91[19] = _zz_90;
    _zz_91[18] = _zz_90;
    _zz_91[17] = _zz_90;
    _zz_91[16] = _zz_90;
    _zz_91[15] = _zz_90;
    _zz_91[14] = _zz_90;
    _zz_91[13] = _zz_90;
    _zz_91[12] = _zz_90;
    _zz_91[11] = _zz_90;
    _zz_91[10] = _zz_90;
    _zz_91[9] = _zz_90;
    _zz_91[8] = _zz_90;
    _zz_91[7 : 0] = writeBack_DBusSimplePlugin_rspShifted[7 : 0];
  end

  assign _zz_92 = (writeBack_DBusSimplePlugin_rspShifted[15] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_93[31] = _zz_92;
    _zz_93[30] = _zz_92;
    _zz_93[29] = _zz_92;
    _zz_93[28] = _zz_92;
    _zz_93[27] = _zz_92;
    _zz_93[26] = _zz_92;
    _zz_93[25] = _zz_92;
    _zz_93[24] = _zz_92;
    _zz_93[23] = _zz_92;
    _zz_93[22] = _zz_92;
    _zz_93[21] = _zz_92;
    _zz_93[20] = _zz_92;
    _zz_93[19] = _zz_92;
    _zz_93[18] = _zz_92;
    _zz_93[17] = _zz_92;
    _zz_93[16] = _zz_92;
    _zz_93[15 : 0] = writeBack_DBusSimplePlugin_rspShifted[15 : 0];
  end

  always @ (*) begin
    case(_zz_161)
      2'b00 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_91;
      end
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_93;
      end
      default : begin
        writeBack_DBusSimplePlugin_rspFormated = writeBack_DBusSimplePlugin_rspShifted;
      end
    endcase
  end

  assign _zz_95 = ((decode_INSTRUCTION & 32'h00000004) == 32'h00000004);
  assign _zz_96 = ((decode_INSTRUCTION & 32'h00001000) == 32'h0);
  assign _zz_97 = ((decode_INSTRUCTION & 32'h00000048) == 32'h00000048);
  assign _zz_94 = {({_zz_95,(_zz_259 == _zz_260)} != 2'b00),{({_zz_95,_zz_261} != 2'b00),{(_zz_262 != 1'b0),{(_zz_263 != _zz_264),{_zz_265,{_zz_266,_zz_267}}}}}};
  assign _zz_98 = _zz_94[9 : 8];
  assign _zz_38 = _zz_98;
  assign _zz_99 = _zz_94[14 : 13];
  assign _zz_37 = _zz_99;
  assign _zz_100 = _zz_94[18 : 17];
  assign _zz_36 = _zz_100;
  assign _zz_101 = _zz_94[20 : 19];
  assign _zz_35 = _zz_101;
  assign _zz_102 = _zz_94[24 : 23];
  assign _zz_34 = _zz_102;
  assign _zz_103 = _zz_94[26 : 25];
  assign _zz_33 = _zz_103;
  assign decode_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION[19 : 15];
  assign decode_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION[24 : 20];
  assign decode_RegFilePlugin_rs1Data = _zz_140;
  assign decode_RegFilePlugin_rs2Data = _zz_141;
  assign lastStageRegFileWrite_valid = (_zz_31 && writeBack_arbitration_isFiring);
  assign lastStageRegFileWrite_payload_address = _zz_30[11 : 7];
  assign lastStageRegFileWrite_payload_data = _zz_39;
  always @ (*) begin
    case(execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 & execute_SRC2);
      end
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 | execute_SRC2);
      end
      default : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 ^ execute_SRC2);
      end
    endcase
  end

  always @ (*) begin
    case(execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_BITWISE : begin
        _zz_104 = execute_IntAluPlugin_bitwise;
      end
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : begin
        _zz_104 = {31'd0, _zz_213};
      end
      default : begin
        _zz_104 = execute_SRC_ADD_SUB;
      end
    endcase
  end

  always @ (*) begin
    case(execute_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : begin
        _zz_105 = execute_RS1;
      end
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : begin
        _zz_105 = {29'd0, _zz_214};
      end
      `Src1CtrlEnum_defaultEncoding_IMU : begin
        _zz_105 = {execute_INSTRUCTION[31 : 12],12'h0};
      end
      default : begin
        _zz_105 = {27'd0, _zz_215};
      end
    endcase
  end

  assign _zz_106 = _zz_216[11];
  always @ (*) begin
    _zz_107[19] = _zz_106;
    _zz_107[18] = _zz_106;
    _zz_107[17] = _zz_106;
    _zz_107[16] = _zz_106;
    _zz_107[15] = _zz_106;
    _zz_107[14] = _zz_106;
    _zz_107[13] = _zz_106;
    _zz_107[12] = _zz_106;
    _zz_107[11] = _zz_106;
    _zz_107[10] = _zz_106;
    _zz_107[9] = _zz_106;
    _zz_107[8] = _zz_106;
    _zz_107[7] = _zz_106;
    _zz_107[6] = _zz_106;
    _zz_107[5] = _zz_106;
    _zz_107[4] = _zz_106;
    _zz_107[3] = _zz_106;
    _zz_107[2] = _zz_106;
    _zz_107[1] = _zz_106;
    _zz_107[0] = _zz_106;
  end

  assign _zz_108 = _zz_217[11];
  always @ (*) begin
    _zz_109[19] = _zz_108;
    _zz_109[18] = _zz_108;
    _zz_109[17] = _zz_108;
    _zz_109[16] = _zz_108;
    _zz_109[15] = _zz_108;
    _zz_109[14] = _zz_108;
    _zz_109[13] = _zz_108;
    _zz_109[12] = _zz_108;
    _zz_109[11] = _zz_108;
    _zz_109[10] = _zz_108;
    _zz_109[9] = _zz_108;
    _zz_109[8] = _zz_108;
    _zz_109[7] = _zz_108;
    _zz_109[6] = _zz_108;
    _zz_109[5] = _zz_108;
    _zz_109[4] = _zz_108;
    _zz_109[3] = _zz_108;
    _zz_109[2] = _zz_108;
    _zz_109[1] = _zz_108;
    _zz_109[0] = _zz_108;
  end

  always @ (*) begin
    case(execute_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : begin
        _zz_110 = execute_RS2;
      end
      `Src2CtrlEnum_defaultEncoding_IMI : begin
        _zz_110 = {_zz_107,execute_INSTRUCTION[31 : 20]};
      end
      `Src2CtrlEnum_defaultEncoding_IMS : begin
        _zz_110 = {_zz_109,{execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_110 = _zz_25;
      end
    endcase
  end

  always @ (*) begin
    execute_SrcPlugin_addSub = _zz_218;
    if(execute_SRC2_FORCE_ZERO)begin
      execute_SrcPlugin_addSub = execute_SRC1;
    end
  end

  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign execute_FullBarrelShifterPlugin_amplitude = execute_SRC2[4 : 0];
  always @ (*) begin
    _zz_111[0] = execute_SRC1[31];
    _zz_111[1] = execute_SRC1[30];
    _zz_111[2] = execute_SRC1[29];
    _zz_111[3] = execute_SRC1[28];
    _zz_111[4] = execute_SRC1[27];
    _zz_111[5] = execute_SRC1[26];
    _zz_111[6] = execute_SRC1[25];
    _zz_111[7] = execute_SRC1[24];
    _zz_111[8] = execute_SRC1[23];
    _zz_111[9] = execute_SRC1[22];
    _zz_111[10] = execute_SRC1[21];
    _zz_111[11] = execute_SRC1[20];
    _zz_111[12] = execute_SRC1[19];
    _zz_111[13] = execute_SRC1[18];
    _zz_111[14] = execute_SRC1[17];
    _zz_111[15] = execute_SRC1[16];
    _zz_111[16] = execute_SRC1[15];
    _zz_111[17] = execute_SRC1[14];
    _zz_111[18] = execute_SRC1[13];
    _zz_111[19] = execute_SRC1[12];
    _zz_111[20] = execute_SRC1[11];
    _zz_111[21] = execute_SRC1[10];
    _zz_111[22] = execute_SRC1[9];
    _zz_111[23] = execute_SRC1[8];
    _zz_111[24] = execute_SRC1[7];
    _zz_111[25] = execute_SRC1[6];
    _zz_111[26] = execute_SRC1[5];
    _zz_111[27] = execute_SRC1[4];
    _zz_111[28] = execute_SRC1[3];
    _zz_111[29] = execute_SRC1[2];
    _zz_111[30] = execute_SRC1[1];
    _zz_111[31] = execute_SRC1[0];
  end

  assign execute_FullBarrelShifterPlugin_reversed = ((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SLL_1) ? _zz_111 : execute_SRC1);
  always @ (*) begin
    _zz_112[0] = memory_SHIFT_RIGHT[31];
    _zz_112[1] = memory_SHIFT_RIGHT[30];
    _zz_112[2] = memory_SHIFT_RIGHT[29];
    _zz_112[3] = memory_SHIFT_RIGHT[28];
    _zz_112[4] = memory_SHIFT_RIGHT[27];
    _zz_112[5] = memory_SHIFT_RIGHT[26];
    _zz_112[6] = memory_SHIFT_RIGHT[25];
    _zz_112[7] = memory_SHIFT_RIGHT[24];
    _zz_112[8] = memory_SHIFT_RIGHT[23];
    _zz_112[9] = memory_SHIFT_RIGHT[22];
    _zz_112[10] = memory_SHIFT_RIGHT[21];
    _zz_112[11] = memory_SHIFT_RIGHT[20];
    _zz_112[12] = memory_SHIFT_RIGHT[19];
    _zz_112[13] = memory_SHIFT_RIGHT[18];
    _zz_112[14] = memory_SHIFT_RIGHT[17];
    _zz_112[15] = memory_SHIFT_RIGHT[16];
    _zz_112[16] = memory_SHIFT_RIGHT[15];
    _zz_112[17] = memory_SHIFT_RIGHT[14];
    _zz_112[18] = memory_SHIFT_RIGHT[13];
    _zz_112[19] = memory_SHIFT_RIGHT[12];
    _zz_112[20] = memory_SHIFT_RIGHT[11];
    _zz_112[21] = memory_SHIFT_RIGHT[10];
    _zz_112[22] = memory_SHIFT_RIGHT[9];
    _zz_112[23] = memory_SHIFT_RIGHT[8];
    _zz_112[24] = memory_SHIFT_RIGHT[7];
    _zz_112[25] = memory_SHIFT_RIGHT[6];
    _zz_112[26] = memory_SHIFT_RIGHT[5];
    _zz_112[27] = memory_SHIFT_RIGHT[4];
    _zz_112[28] = memory_SHIFT_RIGHT[3];
    _zz_112[29] = memory_SHIFT_RIGHT[2];
    _zz_112[30] = memory_SHIFT_RIGHT[1];
    _zz_112[31] = memory_SHIFT_RIGHT[0];
  end

  always @ (*) begin
    _zz_113 = 1'b0;
    if(_zz_148)begin
      if(_zz_149)begin
        if(_zz_118)begin
          _zz_113 = 1'b1;
        end
      end
    end
    if(_zz_150)begin
      if(_zz_151)begin
        if(_zz_120)begin
          _zz_113 = 1'b1;
        end
      end
    end
    if(_zz_152)begin
      if(_zz_153)begin
        if(_zz_122)begin
          _zz_113 = 1'b1;
        end
      end
    end
    if((! decode_RS1_USE))begin
      _zz_113 = 1'b0;
    end
  end

  always @ (*) begin
    _zz_114 = 1'b0;
    if(_zz_148)begin
      if(_zz_149)begin
        if(_zz_119)begin
          _zz_114 = 1'b1;
        end
      end
    end
    if(_zz_150)begin
      if(_zz_151)begin
        if(_zz_121)begin
          _zz_114 = 1'b1;
        end
      end
    end
    if(_zz_152)begin
      if(_zz_153)begin
        if(_zz_123)begin
          _zz_114 = 1'b1;
        end
      end
    end
    if((! decode_RS2_USE))begin
      _zz_114 = 1'b0;
    end
  end

  assign _zz_118 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_119 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign _zz_120 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_121 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign _zz_122 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_123 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign execute_MulPlugin_a = execute_RS1;
  assign execute_MulPlugin_b = execute_RS2;
  always @ (*) begin
    case(_zz_154)
      2'b01 : begin
        execute_MulPlugin_aSigned = 1'b1;
      end
      2'b10 : begin
        execute_MulPlugin_aSigned = 1'b1;
      end
      default : begin
        execute_MulPlugin_aSigned = 1'b0;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_154)
      2'b01 : begin
        execute_MulPlugin_bSigned = 1'b1;
      end
      2'b10 : begin
        execute_MulPlugin_bSigned = 1'b0;
      end
      default : begin
        execute_MulPlugin_bSigned = 1'b0;
      end
    endcase
  end

  assign execute_MulPlugin_aULow = execute_MulPlugin_a[15 : 0];
  assign execute_MulPlugin_bULow = execute_MulPlugin_b[15 : 0];
  assign execute_MulPlugin_aSLow = {1'b0,execute_MulPlugin_a[15 : 0]};
  assign execute_MulPlugin_bSLow = {1'b0,execute_MulPlugin_b[15 : 0]};
  assign execute_MulPlugin_aHigh = {(execute_MulPlugin_aSigned && execute_MulPlugin_a[31]),execute_MulPlugin_a[31 : 16]};
  assign execute_MulPlugin_bHigh = {(execute_MulPlugin_bSigned && execute_MulPlugin_b[31]),execute_MulPlugin_b[31 : 16]};
  assign writeBack_MulPlugin_result = ($signed(_zz_225) + $signed(_zz_226));
  assign memory_DivPlugin_frontendOk = 1'b1;
  always @ (*) begin
    memory_DivPlugin_div_counter_willIncrement = 1'b0;
    if(_zz_146)begin
      if(_zz_155)begin
        memory_DivPlugin_div_counter_willIncrement = 1'b1;
      end
    end
  end

  always @ (*) begin
    memory_DivPlugin_div_counter_willClear = 1'b0;
    if(_zz_156)begin
      memory_DivPlugin_div_counter_willClear = 1'b1;
    end
  end

  assign memory_DivPlugin_div_counter_willOverflowIfInc = (memory_DivPlugin_div_counter_value == 6'h21);
  assign memory_DivPlugin_div_counter_willOverflow = (memory_DivPlugin_div_counter_willOverflowIfInc && memory_DivPlugin_div_counter_willIncrement);
  always @ (*) begin
    if(memory_DivPlugin_div_counter_willOverflow)begin
      memory_DivPlugin_div_counter_valueNext = 6'h0;
    end else begin
      memory_DivPlugin_div_counter_valueNext = (memory_DivPlugin_div_counter_value + _zz_230);
    end
    if(memory_DivPlugin_div_counter_willClear)begin
      memory_DivPlugin_div_counter_valueNext = 6'h0;
    end
  end

  assign _zz_124 = memory_DivPlugin_rs1[31 : 0];
  assign _zz_125 = {memory_DivPlugin_accumulator[31 : 0],_zz_124[31]};
  assign _zz_126 = (_zz_125 - _zz_231);
  assign _zz_127 = (memory_INSTRUCTION[13] ? memory_DivPlugin_accumulator[31 : 0] : memory_DivPlugin_rs1[31 : 0]);
  assign _zz_128 = (execute_RS2[31] && execute_IS_RS2_SIGNED);
  assign _zz_129 = (1'b0 || ((execute_IS_DIV && execute_RS1[31]) && execute_IS_RS1_SIGNED));
  always @ (*) begin
    _zz_130[32] = (execute_IS_RS1_SIGNED && execute_RS1[31]);
    _zz_130[31 : 0] = execute_RS1;
  end

  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign _zz_131 = execute_INSTRUCTION[14 : 12];
  always @ (*) begin
    if((_zz_131 == 3'b000)) begin
        _zz_132 = execute_BranchPlugin_eq;
    end else if((_zz_131 == 3'b001)) begin
        _zz_132 = (! execute_BranchPlugin_eq);
    end else if((((_zz_131 & 3'b101) == 3'b101))) begin
        _zz_132 = (! execute_SRC_LESS);
    end else begin
        _zz_132 = execute_SRC_LESS;
    end
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : begin
        _zz_133 = 1'b0;
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_133 = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_133 = 1'b1;
      end
      default : begin
        _zz_133 = _zz_132;
      end
    endcase
  end

  assign execute_BranchPlugin_missAlignedTarget = 1'b0;
  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        execute_BranchPlugin_branch_src1 = execute_RS1;
      end
      default : begin
        execute_BranchPlugin_branch_src1 = execute_PC;
      end
    endcase
  end

  assign _zz_134 = _zz_244[11];
  always @ (*) begin
    _zz_135[19] = _zz_134;
    _zz_135[18] = _zz_134;
    _zz_135[17] = _zz_134;
    _zz_135[16] = _zz_134;
    _zz_135[15] = _zz_134;
    _zz_135[14] = _zz_134;
    _zz_135[13] = _zz_134;
    _zz_135[12] = _zz_134;
    _zz_135[11] = _zz_134;
    _zz_135[10] = _zz_134;
    _zz_135[9] = _zz_134;
    _zz_135[8] = _zz_134;
    _zz_135[7] = _zz_134;
    _zz_135[6] = _zz_134;
    _zz_135[5] = _zz_134;
    _zz_135[4] = _zz_134;
    _zz_135[3] = _zz_134;
    _zz_135[2] = _zz_134;
    _zz_135[1] = _zz_134;
    _zz_135[0] = _zz_134;
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        execute_BranchPlugin_branch_src2 = {_zz_135,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        execute_BranchPlugin_branch_src2 = ((execute_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) ? {{_zz_137,{{{_zz_368,execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_139,{{{_zz_369,_zz_370},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0});
        if(execute_PREDICTION_HAD_BRANCHED2)begin
          execute_BranchPlugin_branch_src2 = {29'd0, _zz_247};
        end
      end
    endcase
  end

  assign _zz_136 = _zz_245[19];
  always @ (*) begin
    _zz_137[10] = _zz_136;
    _zz_137[9] = _zz_136;
    _zz_137[8] = _zz_136;
    _zz_137[7] = _zz_136;
    _zz_137[6] = _zz_136;
    _zz_137[5] = _zz_136;
    _zz_137[4] = _zz_136;
    _zz_137[3] = _zz_136;
    _zz_137[2] = _zz_136;
    _zz_137[1] = _zz_136;
    _zz_137[0] = _zz_136;
  end

  assign _zz_138 = _zz_246[11];
  always @ (*) begin
    _zz_139[18] = _zz_138;
    _zz_139[17] = _zz_138;
    _zz_139[16] = _zz_138;
    _zz_139[15] = _zz_138;
    _zz_139[14] = _zz_138;
    _zz_139[13] = _zz_138;
    _zz_139[12] = _zz_138;
    _zz_139[11] = _zz_138;
    _zz_139[10] = _zz_138;
    _zz_139[9] = _zz_138;
    _zz_139[8] = _zz_138;
    _zz_139[7] = _zz_138;
    _zz_139[6] = _zz_138;
    _zz_139[5] = _zz_138;
    _zz_139[4] = _zz_138;
    _zz_139[3] = _zz_138;
    _zz_139[2] = _zz_138;
    _zz_139[1] = _zz_138;
    _zz_139[0] = _zz_138;
  end

  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign BranchPlugin_jumpInterface_valid = ((memory_arbitration_isValid && memory_BRANCH_DO) && (! 1'b0));
  assign BranchPlugin_jumpInterface_payload = memory_BRANCH_CALC;
  assign IBusSimplePlugin_decodePrediction_rsp_wasWrong = BranchPlugin_jumpInterface_valid;
  assign _zz_19 = decode_ALU_CTRL;
  assign _zz_17 = _zz_38;
  assign _zz_28 = decode_to_execute_ALU_CTRL;
  assign _zz_16 = decode_SHIFT_CTRL;
  assign _zz_13 = execute_SHIFT_CTRL;
  assign _zz_14 = _zz_37;
  assign _zz_24 = decode_to_execute_SHIFT_CTRL;
  assign _zz_23 = execute_to_memory_SHIFT_CTRL;
  assign _zz_11 = decode_ALU_BITWISE_CTRL;
  assign _zz_9 = _zz_34;
  assign _zz_29 = decode_to_execute_ALU_BITWISE_CTRL;
  assign _zz_8 = decode_SRC2_CTRL;
  assign _zz_6 = _zz_33;
  assign _zz_26 = decode_to_execute_SRC2_CTRL;
  assign _zz_5 = decode_SRC1_CTRL;
  assign _zz_3 = _zz_36;
  assign _zz_27 = decode_to_execute_SRC1_CTRL;
  assign _zz_2 = decode_BRANCH_CTRL;
  assign _zz_40 = _zz_35;
  assign _zz_20 = decode_to_execute_BRANCH_CTRL;
  assign decode_arbitration_isFlushed = (({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,execute_arbitration_flushNext}} != 3'b000) || ({writeBack_arbitration_flushIt,{memory_arbitration_flushIt,{execute_arbitration_flushIt,decode_arbitration_flushIt}}} != 4'b0000));
  assign execute_arbitration_isFlushed = (({writeBack_arbitration_flushNext,memory_arbitration_flushNext} != 2'b00) || ({writeBack_arbitration_flushIt,{memory_arbitration_flushIt,execute_arbitration_flushIt}} != 3'b000));
  assign memory_arbitration_isFlushed = ((writeBack_arbitration_flushNext != 1'b0) || ({writeBack_arbitration_flushIt,memory_arbitration_flushIt} != 2'b00));
  assign writeBack_arbitration_isFlushed = (1'b0 || (writeBack_arbitration_flushIt != 1'b0));
  assign decode_arbitration_isStuckByOthers = (decode_arbitration_haltByOther || (((1'b0 || execute_arbitration_isStuck) || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign decode_arbitration_isStuck = (decode_arbitration_haltItself || decode_arbitration_isStuckByOthers);
  assign decode_arbitration_isMoving = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign decode_arbitration_isFiring = ((decode_arbitration_isValid && (! decode_arbitration_isStuck)) && (! decode_arbitration_removeIt));
  assign execute_arbitration_isStuckByOthers = (execute_arbitration_haltByOther || ((1'b0 || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign execute_arbitration_isStuck = (execute_arbitration_haltItself || execute_arbitration_isStuckByOthers);
  assign execute_arbitration_isMoving = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign execute_arbitration_isFiring = ((execute_arbitration_isValid && (! execute_arbitration_isStuck)) && (! execute_arbitration_removeIt));
  assign memory_arbitration_isStuckByOthers = (memory_arbitration_haltByOther || (1'b0 || writeBack_arbitration_isStuck));
  assign memory_arbitration_isStuck = (memory_arbitration_haltItself || memory_arbitration_isStuckByOthers);
  assign memory_arbitration_isMoving = ((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt));
  assign memory_arbitration_isFiring = ((memory_arbitration_isValid && (! memory_arbitration_isStuck)) && (! memory_arbitration_removeIt));
  assign writeBack_arbitration_isStuckByOthers = (writeBack_arbitration_haltByOther || 1'b0);
  assign writeBack_arbitration_isStuck = (writeBack_arbitration_haltItself || writeBack_arbitration_isStuckByOthers);
  assign writeBack_arbitration_isMoving = ((! writeBack_arbitration_isStuck) && (! writeBack_arbitration_removeIt));
  assign writeBack_arbitration_isFiring = ((writeBack_arbitration_isValid && (! writeBack_arbitration_isStuck)) && (! writeBack_arbitration_removeIt));
  always @ (posedge clk) begin
    if (reset) begin
      IBusSimplePlugin_fetchPc_pcReg <= externalResetVector;
      IBusSimplePlugin_fetchPc_correctionReg <= 1'b0;
      IBusSimplePlugin_fetchPc_booted <= 1'b0;
      IBusSimplePlugin_fetchPc_inc <= 1'b0;
      IBusSimplePlugin_decodePc_pcReg <= externalResetVector;
      _zz_47 <= 1'b0;
      IBusSimplePlugin_decompressor_bufferValid <= 1'b0;
      IBusSimplePlugin_decompressor_throw2BytesReg <= 1'b0;
      _zz_75 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      IBusSimplePlugin_pendingCmd <= 3'b000;
      IBusSimplePlugin_rspJoin_discardCounter <= 3'b000;
      IBusSimplePlugin_rspJoin_rspBuffer_validReg <= 1'b0;
      _zz_115 <= 1'b0;
      memory_DivPlugin_div_counter_value <= 6'h0;
      execute_arbitration_isValid <= 1'b0;
      memory_arbitration_isValid <= 1'b0;
      writeBack_arbitration_isValid <= 1'b0;
    end else begin
      if(IBusSimplePlugin_fetchPc_correction)begin
        IBusSimplePlugin_fetchPc_correctionReg <= 1'b1;
      end
      if((IBusSimplePlugin_fetchPc_output_valid && IBusSimplePlugin_fetchPc_output_ready))begin
        IBusSimplePlugin_fetchPc_correctionReg <= 1'b0;
      end
      IBusSimplePlugin_fetchPc_booted <= 1'b1;
      if((IBusSimplePlugin_fetchPc_correction || IBusSimplePlugin_fetchPc_pcRegPropagate))begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if((IBusSimplePlugin_fetchPc_output_valid && IBusSimplePlugin_fetchPc_output_ready))begin
        IBusSimplePlugin_fetchPc_inc <= 1'b1;
      end
      if(((! IBusSimplePlugin_fetchPc_output_valid) && IBusSimplePlugin_fetchPc_output_ready))begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if((IBusSimplePlugin_fetchPc_booted && ((IBusSimplePlugin_fetchPc_output_ready || IBusSimplePlugin_fetchPc_correction) || IBusSimplePlugin_fetchPc_pcRegPropagate)))begin
        IBusSimplePlugin_fetchPc_pcReg <= IBusSimplePlugin_fetchPc_pc;
      end
      if((decode_arbitration_isFiring && (! IBusSimplePlugin_decodePc_injectedDecode)))begin
        IBusSimplePlugin_decodePc_pcReg <= IBusSimplePlugin_decodePc_pcPlus;
      end
      if(_zz_147)begin
        IBusSimplePlugin_decodePc_pcReg <= IBusSimplePlugin_jump_pcLoad_payload;
      end
      if(IBusSimplePlugin_iBusRsp_stages_1_flush)begin
        _zz_47 <= 1'b0;
      end
      if(_zz_45)begin
        _zz_47 <= (IBusSimplePlugin_iBusRsp_stages_0_output_valid && (! IBusSimplePlugin_iBusRsp_stages_0_flush));
      end
      if((IBusSimplePlugin_decompressor_output_valid && IBusSimplePlugin_decompressor_output_ready))begin
        IBusSimplePlugin_decompressor_throw2BytesReg <= ((((! IBusSimplePlugin_decompressor_unaligned) && IBusSimplePlugin_decompressor_isInputLowRvc) && IBusSimplePlugin_decompressor_isInputHighRvc) || (IBusSimplePlugin_decompressor_bufferValid && IBusSimplePlugin_decompressor_isInputHighRvc));
      end
      if((IBusSimplePlugin_decompressor_output_ready && IBusSimplePlugin_decompressor_input_valid))begin
        IBusSimplePlugin_decompressor_bufferValid <= 1'b0;
      end
      if(_zz_157)begin
        if(IBusSimplePlugin_decompressor_bufferFill)begin
          IBusSimplePlugin_decompressor_bufferValid <= 1'b1;
        end
      end
      if((IBusSimplePlugin_fetcherflushIt || IBusSimplePlugin_decompressor_consumeCurrent))begin
        IBusSimplePlugin_decompressor_throw2BytesReg <= 1'b0;
        IBusSimplePlugin_decompressor_bufferValid <= 1'b0;
      end
      if(decode_arbitration_removeIt)begin
        _zz_75 <= 1'b0;
      end
      if(IBusSimplePlugin_decompressor_output_ready)begin
        _zz_75 <= (IBusSimplePlugin_decompressor_output_valid && (! IBusSimplePlugin_fetcherflushIt));
      end
      if((! 1'b0))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b1;
      end
      if(IBusSimplePlugin_decodePc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      end
      if((! execute_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= IBusSimplePlugin_injector_nextPcCalc_valids_0;
      end
      if(IBusSimplePlugin_decodePc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if((! memory_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= IBusSimplePlugin_injector_nextPcCalc_valids_1;
      end
      if(IBusSimplePlugin_decodePc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if((! writeBack_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= IBusSimplePlugin_injector_nextPcCalc_valids_2;
      end
      if(IBusSimplePlugin_decodePc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      IBusSimplePlugin_pendingCmd <= IBusSimplePlugin_pendingCmdNext;
      IBusSimplePlugin_rspJoin_discardCounter <= (IBusSimplePlugin_rspJoin_discardCounter - _zz_210);
      if(IBusSimplePlugin_iBusRsp_stages_1_flush)begin
        IBusSimplePlugin_rspJoin_discardCounter <= (IBusSimplePlugin_pendingCmd - _zz_212);
      end
      if(IBusSimplePlugin_rspJoin_rspBuffer_rspStream_valid)begin
        IBusSimplePlugin_rspJoin_rspBuffer_validReg <= 1'b1;
      end
      if(IBusSimplePlugin_rspJoin_rspBufferOutput_ready)begin
        IBusSimplePlugin_rspJoin_rspBuffer_validReg <= 1'b0;
      end
      _zz_115 <= (_zz_31 && writeBack_arbitration_isFiring);
      memory_DivPlugin_div_counter_value <= memory_DivPlugin_div_counter_valueNext;
      if(((! execute_arbitration_isStuck) || execute_arbitration_removeIt))begin
        execute_arbitration_isValid <= 1'b0;
      end
      if(((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt)))begin
        execute_arbitration_isValid <= decode_arbitration_isValid;
      end
      if(((! memory_arbitration_isStuck) || memory_arbitration_removeIt))begin
        memory_arbitration_isValid <= 1'b0;
      end
      if(((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt)))begin
        memory_arbitration_isValid <= execute_arbitration_isValid;
      end
      if(((! writeBack_arbitration_isStuck) || writeBack_arbitration_removeIt))begin
        writeBack_arbitration_isValid <= 1'b0;
      end
      if(((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt)))begin
        writeBack_arbitration_isValid <= memory_arbitration_isValid;
      end
    end
  end

  always @ (posedge clk) begin
    if(_zz_157)begin
      IBusSimplePlugin_decompressor_bufferData <= IBusSimplePlugin_decompressor_input_payload_rsp_inst[31 : 16];
    end
    if(IBusSimplePlugin_decompressor_output_ready)begin
      _zz_76 <= IBusSimplePlugin_decompressor_output_payload_pc;
      _zz_77 <= IBusSimplePlugin_decompressor_output_payload_rsp_error;
      _zz_78 <= IBusSimplePlugin_decompressor_output_payload_rsp_inst;
      _zz_79 <= IBusSimplePlugin_decompressor_output_payload_isRvc;
    end
    if(IBusSimplePlugin_injector_decodeInput_ready)begin
      IBusSimplePlugin_injector_formal_rawInDecode <= IBusSimplePlugin_decompressor_raw;
    end
    `ifndef SYNTHESIS
      `ifdef FORMAL
        assert((! (((dBus_rsp_ready && memory_MEMORY_ENABLE) && memory_arbitration_isValid) && memory_arbitration_isStuck)))
      `else
        if(!(! (((dBus_rsp_ready && memory_MEMORY_ENABLE) && memory_arbitration_isValid) && memory_arbitration_isStuck))) begin
          $display("FAILURE DBusSimplePlugin doesn't allow memory stage stall when read happend");
          $finish;
        end
      `endif
    `endif
    `ifndef SYNTHESIS
      `ifdef FORMAL
        assert((! (((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE) && (! writeBack_MEMORY_STORE)) && writeBack_arbitration_isStuck)))
      `else
        if(!(! (((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE) && (! writeBack_MEMORY_STORE)) && writeBack_arbitration_isStuck))) begin
          $display("FAILURE DBusSimplePlugin doesn't allow writeback stage stall when read happend");
          $finish;
        end
      `endif
    `endif
    _zz_116 <= _zz_30[11 : 7];
    _zz_117 <= _zz_39;
    if((memory_DivPlugin_div_counter_value == 6'h20))begin
      memory_DivPlugin_div_done <= 1'b1;
    end
    if((! memory_arbitration_isStuck))begin
      memory_DivPlugin_div_done <= 1'b0;
    end
    if(_zz_146)begin
      if(_zz_155)begin
        memory_DivPlugin_rs1[31 : 0] <= _zz_232[31:0];
        memory_DivPlugin_accumulator[31 : 0] <= ((! _zz_126[32]) ? _zz_233 : _zz_234);
        if((memory_DivPlugin_div_counter_value == 6'h20))begin
          memory_DivPlugin_div_result <= _zz_235[31:0];
        end
      end
    end
    if(_zz_156)begin
      memory_DivPlugin_accumulator <= 65'h0;
      memory_DivPlugin_rs1 <= ((_zz_129 ? (~ _zz_130) : _zz_130) + _zz_241);
      memory_DivPlugin_rs2 <= ((_zz_128 ? (~ execute_RS2) : execute_RS2) + _zz_243);
      memory_DivPlugin_div_needRevert <= ((_zz_129 ^ (_zz_128 && (! execute_INSTRUCTION[13]))) && (! (((execute_RS2 == 32'h0) && execute_IS_RS2_SIGNED) && (! execute_INSTRUCTION[13]))));
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PC <= decode_PC;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_PC <= _zz_25;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_PC <= memory_PC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_STORE <= decode_MEMORY_STORE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_STORE <= execute_MEMORY_STORE;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_STORE <= memory_MEMORY_STORE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BYPASSABLE_EXECUTE_STAGE <= decode_BYPASSABLE_EXECUTE_STAGE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_DO <= execute_BRANCH_DO;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_CTRL <= _zz_18;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SHIFT_CTRL <= _zz_15;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_SHIFT_CTRL <= _zz_12;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_LL <= execute_MUL_LL;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_10;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_MUL <= decode_IS_MUL;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_IS_MUL <= execute_IS_MUL;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_IS_MUL <= memory_IS_MUL;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_CTRL <= _zz_7;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_HL <= execute_MUL_HL;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_SHIFT_RIGHT <= execute_SHIFT_RIGHT;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_CALC <= execute_BRANCH_CALC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_ENABLE <= decode_MEMORY_ENABLE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ENABLE <= execute_MEMORY_ENABLE;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_ENABLE <= memory_MEMORY_ENABLE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_REGFILE_WRITE_DATA <= _zz_21;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_REGFILE_WRITE_DATA <= _zz_22;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_READ_DATA <= memory_MEMORY_READ_DATA;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC1_CTRL <= _zz_4;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS2 <= decode_RS2;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PREDICTION_HAD_BRANCHED2 <= decode_PREDICTION_HAD_BRANCHED2;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_REGFILE_WRITE_VALID <= decode_REGFILE_WRITE_VALID;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_REGFILE_WRITE_VALID <= execute_REGFILE_WRITE_VALID;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_REGFILE_WRITE_VALID <= memory_REGFILE_WRITE_VALID;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BYPASSABLE_MEMORY_STAGE <= decode_BYPASSABLE_MEMORY_STAGE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BYPASSABLE_MEMORY_STAGE <= execute_BYPASSABLE_MEMORY_STAGE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_LH <= execute_MUL_LH;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_FORMAL_PC_NEXT <= _zz_41;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_FORMAL_PC_NEXT <= execute_FORMAL_PC_NEXT;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS1 <= decode_RS1;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_INSTRUCTION <= decode_INSTRUCTION;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_INSTRUCTION <= execute_INSTRUCTION;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_INSTRUCTION <= memory_INSTRUCTION;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_FORCE_ZERO <= decode_SRC2_FORCE_ZERO;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RS1_SIGNED <= decode_IS_RS1_SIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RS2_SIGNED <= decode_IS_RS2_SIGNED;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_HH <= execute_MUL_HH;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MUL_HH <= memory_MUL_HH;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RVC <= decode_IS_RVC;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ADDRESS_LOW <= execute_MEMORY_ADDRESS_LOW;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_ADDRESS_LOW <= memory_MEMORY_ADDRESS_LOW;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BRANCH_CTRL <= _zz_1;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MUL_LOW <= memory_MUL_LOW;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_DIV <= decode_IS_DIV;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_IS_DIV <= execute_IS_DIV;
    end
  end


endmodule
