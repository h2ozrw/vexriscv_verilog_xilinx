// VexRiscV   36b3cd918896c94c4e8a224d97c559ab6dbf3ec9
// SpinalHDL  adf552d8f500e7419fff395b7049228e4bc5de26

`define BranchCtrlEnum_defaultEncoding_type [1:0]
`define BranchCtrlEnum_defaultEncoding_INC 2'b00
`define BranchCtrlEnum_defaultEncoding_B 2'b01
`define BranchCtrlEnum_defaultEncoding_JAL 2'b10
`define BranchCtrlEnum_defaultEncoding_JALR 2'b11

`define ShiftCtrlEnum_defaultEncoding_type [1:0]
`define ShiftCtrlEnum_defaultEncoding_DISABLE_1 2'b00
`define ShiftCtrlEnum_defaultEncoding_SLL_1 2'b01
`define ShiftCtrlEnum_defaultEncoding_SRL_1 2'b10
`define ShiftCtrlEnum_defaultEncoding_SRA_1 2'b11

`define AluBitwiseCtrlEnum_defaultEncoding_type [1:0]
`define AluBitwiseCtrlEnum_defaultEncoding_XOR_1 2'b00
`define AluBitwiseCtrlEnum_defaultEncoding_OR_1 2'b01
`define AluBitwiseCtrlEnum_defaultEncoding_AND_1 2'b10

`define AluCtrlEnum_defaultEncoding_type [1:0]
`define AluCtrlEnum_defaultEncoding_ADD_SUB 2'b00
`define AluCtrlEnum_defaultEncoding_SLT_SLTU 2'b01
`define AluCtrlEnum_defaultEncoding_BITWISE 2'b10

`define Src2CtrlEnum_defaultEncoding_type [1:0]
`define Src2CtrlEnum_defaultEncoding_RS 2'b00
`define Src2CtrlEnum_defaultEncoding_IMI 2'b01
`define Src2CtrlEnum_defaultEncoding_IMS 2'b10
`define Src2CtrlEnum_defaultEncoding_PC 2'b11

`define Src1CtrlEnum_defaultEncoding_type [1:0]
`define Src1CtrlEnum_defaultEncoding_RS 2'b00
`define Src1CtrlEnum_defaultEncoding_IMU 2'b01
`define Src1CtrlEnum_defaultEncoding_PC_INCREMENT 2'b10
`define Src1CtrlEnum_defaultEncoding_URS1 2'b11


module rv32_core_imc (
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
  wire                _zz_136;
  wire                _zz_137;
  wire       [31:0]   _zz_138;
  wire       [31:0]   _zz_139;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_push_ready;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst;
  wire       [0:0]    IBusSimplePlugin_rspJoin_rspBuffer_c_io_occupancy;
  wire                _zz_140;
  wire                _zz_141;
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
  wire       [1:0]    _zz_152;
  wire                _zz_153;
  wire                _zz_154;
  wire                _zz_155;
  wire       [4:0]    _zz_156;
  wire       [1:0]    _zz_157;
  wire       [1:0]    _zz_158;
  wire       [1:0]    _zz_159;
  wire       [1:0]    _zz_160;
  wire       [51:0]   _zz_161;
  wire       [51:0]   _zz_162;
  wire       [51:0]   _zz_163;
  wire       [32:0]   _zz_164;
  wire       [51:0]   _zz_165;
  wire       [49:0]   _zz_166;
  wire       [51:0]   _zz_167;
  wire       [49:0]   _zz_168;
  wire       [51:0]   _zz_169;
  wire       [0:0]    _zz_170;
  wire       [0:0]    _zz_171;
  wire       [0:0]    _zz_172;
  wire       [0:0]    _zz_173;
  wire       [0:0]    _zz_174;
  wire       [0:0]    _zz_175;
  wire       [0:0]    _zz_176;
  wire       [0:0]    _zz_177;
  wire       [0:0]    _zz_178;
  wire       [2:0]    _zz_179;
  wire       [31:0]   _zz_180;
  wire       [0:0]    _zz_181;
  wire       [0:0]    _zz_182;
  wire       [32:0]   _zz_183;
  wire       [31:0]   _zz_184;
  wire       [32:0]   _zz_185;
  wire       [0:0]    _zz_186;
  wire       [0:0]    _zz_187;
  wire       [0:0]    _zz_188;
  wire       [1:0]    _zz_189;
  wire       [1:0]    _zz_190;
  wire       [2:0]    _zz_191;
  wire       [31:0]   _zz_192;
  wire       [2:0]    _zz_193;
  wire       [31:0]   _zz_194;
  wire       [31:0]   _zz_195;
  wire       [11:0]   _zz_196;
  wire       [11:0]   _zz_197;
  wire       [11:0]   _zz_198;
  wire       [31:0]   _zz_199;
  wire       [19:0]   _zz_200;
  wire       [11:0]   _zz_201;
  wire       [2:0]    _zz_202;
  wire       [0:0]    _zz_203;
  wire       [2:0]    _zz_204;
  wire       [0:0]    _zz_205;
  wire       [2:0]    _zz_206;
  wire       [0:0]    _zz_207;
  wire       [2:0]    _zz_208;
  wire       [0:0]    _zz_209;
  wire       [2:0]    _zz_210;
  wire       [0:0]    _zz_211;
  wire       [2:0]    _zz_212;
  wire       [4:0]    _zz_213;
  wire       [11:0]   _zz_214;
  wire       [11:0]   _zz_215;
  wire       [31:0]   _zz_216;
  wire       [31:0]   _zz_217;
  wire       [31:0]   _zz_218;
  wire       [31:0]   _zz_219;
  wire       [31:0]   _zz_220;
  wire       [31:0]   _zz_221;
  wire       [31:0]   _zz_222;
  wire       [65:0]   _zz_223;
  wire       [65:0]   _zz_224;
  wire       [31:0]   _zz_225;
  wire       [31:0]   _zz_226;
  wire       [0:0]    _zz_227;
  wire       [5:0]    _zz_228;
  wire       [32:0]   _zz_229;
  wire       [31:0]   _zz_230;
  wire       [31:0]   _zz_231;
  wire       [32:0]   _zz_232;
  wire       [32:0]   _zz_233;
  wire       [32:0]   _zz_234;
  wire       [32:0]   _zz_235;
  wire       [0:0]    _zz_236;
  wire       [32:0]   _zz_237;
  wire       [0:0]    _zz_238;
  wire       [32:0]   _zz_239;
  wire       [0:0]    _zz_240;
  wire       [31:0]   _zz_241;
  wire       [11:0]   _zz_242;
  wire       [19:0]   _zz_243;
  wire       [11:0]   _zz_244;
  wire       [2:0]    _zz_245;
  wire                _zz_246;
  wire                _zz_247;
  wire       [6:0]    _zz_248;
  wire       [4:0]    _zz_249;
  wire                _zz_250;
  wire       [4:0]    _zz_251;
  wire       [0:0]    _zz_252;
  wire       [7:0]    _zz_253;
  wire                _zz_254;
  wire       [0:0]    _zz_255;
  wire       [0:0]    _zz_256;
  wire       [31:0]   _zz_257;
  wire       [31:0]   _zz_258;
  wire       [31:0]   _zz_259;
  wire       [31:0]   _zz_260;
  wire                _zz_261;
  wire       [0:0]    _zz_262;
  wire       [0:0]    _zz_263;
  wire                _zz_264;
  wire       [0:0]    _zz_265;
  wire       [20:0]   _zz_266;
  wire       [31:0]   _zz_267;
  wire       [31:0]   _zz_268;
  wire       [31:0]   _zz_269;
  wire       [0:0]    _zz_270;
  wire       [0:0]    _zz_271;
  wire       [2:0]    _zz_272;
  wire       [2:0]    _zz_273;
  wire                _zz_274;
  wire       [0:0]    _zz_275;
  wire       [15:0]   _zz_276;
  wire       [31:0]   _zz_277;
  wire       [31:0]   _zz_278;
  wire       [31:0]   _zz_279;
  wire       [31:0]   _zz_280;
  wire                _zz_281;
  wire                _zz_282;
  wire       [31:0]   _zz_283;
  wire       [31:0]   _zz_284;
  wire                _zz_285;
  wire       [0:0]    _zz_286;
  wire       [0:0]    _zz_287;
  wire                _zz_288;
  wire       [0:0]    _zz_289;
  wire       [12:0]   _zz_290;
  wire       [31:0]   _zz_291;
  wire                _zz_292;
  wire                _zz_293;
  wire                _zz_294;
  wire       [0:0]    _zz_295;
  wire       [0:0]    _zz_296;
  wire                _zz_297;
  wire       [0:0]    _zz_298;
  wire       [9:0]    _zz_299;
  wire       [31:0]   _zz_300;
  wire       [31:0]   _zz_301;
  wire       [31:0]   _zz_302;
  wire                _zz_303;
  wire       [3:0]    _zz_304;
  wire       [3:0]    _zz_305;
  wire                _zz_306;
  wire       [0:0]    _zz_307;
  wire       [6:0]    _zz_308;
  wire       [31:0]   _zz_309;
  wire       [31:0]   _zz_310;
  wire       [0:0]    _zz_311;
  wire       [0:0]    _zz_312;
  wire       [0:0]    _zz_313;
  wire       [0:0]    _zz_314;
  wire       [0:0]    _zz_315;
  wire       [2:0]    _zz_316;
  wire       [1:0]    _zz_317;
  wire       [1:0]    _zz_318;
  wire                _zz_319;
  wire       [0:0]    _zz_320;
  wire       [3:0]    _zz_321;
  wire       [31:0]   _zz_322;
  wire       [31:0]   _zz_323;
  wire       [31:0]   _zz_324;
  wire       [31:0]   _zz_325;
  wire       [31:0]   _zz_326;
  wire       [31:0]   _zz_327;
  wire       [31:0]   _zz_328;
  wire       [31:0]   _zz_329;
  wire       [0:0]    _zz_330;
  wire       [0:0]    _zz_331;
  wire                _zz_332;
  wire       [0:0]    _zz_333;
  wire       [0:0]    _zz_334;
  wire       [1:0]    _zz_335;
  wire       [1:0]    _zz_336;
  wire                _zz_337;
  wire       [0:0]    _zz_338;
  wire       [1:0]    _zz_339;
  wire       [31:0]   _zz_340;
  wire       [31:0]   _zz_341;
  wire       [31:0]   _zz_342;
  wire       [31:0]   _zz_343;
  wire       [31:0]   _zz_344;
  wire       [31:0]   _zz_345;
  wire       [31:0]   _zz_346;
  wire       [31:0]   _zz_347;
  wire       [0:0]    _zz_348;
  wire       [1:0]    _zz_349;
  wire       [0:0]    _zz_350;
  wire       [0:0]    _zz_351;
  wire       [0:0]    _zz_352;
  wire       [0:0]    _zz_353;
  wire                _zz_354;
  wire                _zz_355;
  wire                _zz_356;
  wire       [51:0]   memory_MUL_LOW;
  wire       [33:0]   memory_MUL_HH;
  wire       [33:0]   execute_MUL_HH;
  wire       [33:0]   execute_MUL_HL;
  wire       [33:0]   execute_MUL_LH;
  wire       [31:0]   execute_MUL_LL;
  wire       [31:0]   writeBack_REGFILE_WRITE_DATA;
  wire       [31:0]   memory_REGFILE_WRITE_DATA;
  wire       [31:0]   execute_REGFILE_WRITE_DATA;
  wire       [1:0]    execute_MEMORY_ADDRESS_LOW;
  wire                decode_PREDICTION_HAD_BRANCHED2;
  wire                decode_SRC2_FORCE_ZERO;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_1;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_2;
  wire                decode_IS_RS2_SIGNED;
  wire                decode_IS_RS1_SIGNED;
  wire                decode_IS_DIV;
  wire                memory_IS_MUL;
  wire                execute_IS_MUL;
  wire                decode_IS_MUL;
  wire       `ShiftCtrlEnum_defaultEncoding_type decode_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_3;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_4;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_5;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type decode_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_6;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_7;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_8;
  wire                decode_SRC_LESS_UNSIGNED;
  wire       `AluCtrlEnum_defaultEncoding_type decode_ALU_CTRL;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_9;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_10;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_11;
  wire                decode_MEMORY_STORE;
  wire                execute_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_EXECUTE_STAGE;
  wire       `Src2CtrlEnum_defaultEncoding_type decode_SRC2_CTRL;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_12;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_13;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_14;
  wire                decode_MEMORY_ENABLE;
  wire       `Src1CtrlEnum_defaultEncoding_type decode_SRC1_CTRL;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_15;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_16;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_17;
  wire       [31:0]   execute_FORMAL_PC_NEXT;
  wire       [31:0]   decode_FORMAL_PC_NEXT;
  wire       [31:0]   memory_PC;
  wire       [31:0]   execute_BRANCH_CALC;
  wire                execute_BRANCH_DO;
  wire       [31:0]   execute_PC;
  wire                execute_BRANCH_COND_RESULT;
  wire                execute_PREDICTION_HAD_BRANCHED2;
  wire       `BranchCtrlEnum_defaultEncoding_type execute_BRANCH_CTRL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_18;
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
  wire                execute_REGFILE_WRITE_VALID;
  wire                execute_BYPASSABLE_EXECUTE_STAGE;
  wire                memory_REGFILE_WRITE_VALID;
  wire                memory_BYPASSABLE_MEMORY_STAGE;
  wire                writeBack_REGFILE_WRITE_VALID;
  reg        [31:0]   decode_RS2;
  reg        [31:0]   decode_RS1;
  wire       [31:0]   execute_SHIFT_RIGHT;
  reg        [31:0]   _zz_19;
  wire       `ShiftCtrlEnum_defaultEncoding_type execute_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_20;
  wire                execute_SRC_LESS_UNSIGNED;
  wire                execute_SRC2_FORCE_ZERO;
  wire                execute_SRC_USE_SUB_LESS;
  wire       [31:0]   _zz_21;
  wire       `Src2CtrlEnum_defaultEncoding_type execute_SRC2_CTRL;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_22;
  wire                execute_IS_RVC;
  wire       `Src1CtrlEnum_defaultEncoding_type execute_SRC1_CTRL;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_23;
  wire                decode_SRC_USE_SUB_LESS;
  wire                decode_SRC_ADD_ZERO;
  wire       [31:0]   execute_SRC_ADD_SUB;
  wire                execute_SRC_LESS;
  wire       `AluCtrlEnum_defaultEncoding_type execute_ALU_CTRL;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_24;
  wire       [31:0]   execute_SRC2;
  wire       [31:0]   execute_SRC1;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type execute_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_25;
  reg        [31:0]   _zz_26;
  wire       [31:0]   _zz_27;
  wire                _zz_28;
  reg                 _zz_29;
  reg                 decode_REGFILE_WRITE_VALID;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_30;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_31;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_32;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_33;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_34;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_35;
  reg        [31:0]   _zz_36;
  wire       [31:0]   memory_INSTRUCTION;
  wire       [1:0]    memory_MEMORY_ADDRESS_LOW;
  wire       [31:0]   memory_MEMORY_READ_DATA;
  wire                memory_MEMORY_STORE;
  wire                memory_MEMORY_ENABLE;
  wire       [31:0]   execute_SRC_ADD;
  wire       [31:0]   execute_RS2;
  wire       [31:0]   execute_INSTRUCTION;
  wire                execute_MEMORY_STORE;
  wire                execute_MEMORY_ENABLE;
  wire                execute_ALIGNEMENT_FAULT;
  wire       `BranchCtrlEnum_defaultEncoding_type decode_BRANCH_CTRL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_37;
  reg        [31:0]   _zz_38;
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
  reg                 execute_arbitration_flushNext;
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
  wire                memory_arbitration_flushNext;
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
  wire                IBusSimplePlugin_externalFlush;
  wire                IBusSimplePlugin_jump_pcLoad_valid;
  wire       [31:0]   IBusSimplePlugin_jump_pcLoad_payload;
  wire       [1:0]    _zz_39;
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
  wire                IBusSimplePlugin_iBusRsp_stages_1_input_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_1_input_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_1_output_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_1_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_1_output_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_1_halt;
  wire                _zz_40;
  wire                _zz_41;
  wire                IBusSimplePlugin_iBusRsp_flush;
  wire                _zz_42;
  wire                _zz_43;
  reg                 _zz_44;
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
  wire       [15:0]   _zz_45;
  reg        [31:0]   IBusSimplePlugin_decompressor_decompressed;
  wire       [4:0]    _zz_46;
  wire       [4:0]    _zz_47;
  wire       [11:0]   _zz_48;
  wire                _zz_49;
  reg        [11:0]   _zz_50;
  wire                _zz_51;
  reg        [9:0]    _zz_52;
  wire       [20:0]   _zz_53;
  wire                _zz_54;
  reg        [14:0]   _zz_55;
  wire                _zz_56;
  reg        [2:0]    _zz_57;
  wire                _zz_58;
  reg        [9:0]    _zz_59;
  wire       [20:0]   _zz_60;
  wire                _zz_61;
  reg        [4:0]    _zz_62;
  wire       [12:0]   _zz_63;
  wire       [4:0]    _zz_64;
  wire       [4:0]    _zz_65;
  wire       [4:0]    _zz_66;
  wire                _zz_67;
  reg        [2:0]    _zz_68;
  reg        [2:0]    _zz_69;
  wire                _zz_70;
  reg        [6:0]    _zz_71;
  wire                IBusSimplePlugin_decompressor_bufferFill;
  wire                IBusSimplePlugin_injector_decodeInput_valid;
  wire                IBusSimplePlugin_injector_decodeInput_ready;
  wire       [31:0]   IBusSimplePlugin_injector_decodeInput_payload_pc;
  wire                IBusSimplePlugin_injector_decodeInput_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  wire                IBusSimplePlugin_injector_decodeInput_payload_isRvc;
  reg                 _zz_72;
  reg        [31:0]   _zz_73;
  reg                 _zz_74;
  reg        [31:0]   _zz_75;
  reg                 _zz_76;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_0;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_1;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_2;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_3;
  reg        [31:0]   IBusSimplePlugin_injector_formal_rawInDecode;
  wire                _zz_77;
  reg        [18:0]   _zz_78;
  wire                _zz_79;
  reg        [10:0]   _zz_80;
  wire                _zz_81;
  reg        [18:0]   _zz_82;
  wire                IBusSimplePlugin_cmd_valid;
  wire                IBusSimplePlugin_cmd_ready;
  wire       [31:0]   IBusSimplePlugin_cmd_payload_pc;
  wire                IBusSimplePlugin_pending_inc;
  wire                IBusSimplePlugin_pending_dec;
  reg        [2:0]    IBusSimplePlugin_pending_value;
  wire       [2:0]    IBusSimplePlugin_pending_next;
  wire                IBusSimplePlugin_cmdFork_canEmit;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_valid;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_ready;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst;
  reg        [2:0]    IBusSimplePlugin_rspJoin_rspBuffer_discardCounter;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_flush;
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
  wire                _zz_83;
  wire                _zz_84;
  reg                 execute_DBusSimplePlugin_skipCmd;
  reg        [31:0]   _zz_85;
  reg        [3:0]    _zz_86;
  wire       [3:0]    execute_DBusSimplePlugin_formalMask;
  reg        [31:0]   memory_DBusSimplePlugin_rspShifted;
  wire                _zz_87;
  reg        [31:0]   _zz_88;
  wire                _zz_89;
  reg        [31:0]   _zz_90;
  reg        [31:0]   memory_DBusSimplePlugin_rspFormated;
  wire       [26:0]   _zz_91;
  wire                _zz_92;
  wire                _zz_93;
  wire                _zz_94;
  wire                _zz_95;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_96;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_97;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_98;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_99;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_100;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_101;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress1;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress2;
  wire       [31:0]   decode_RegFilePlugin_rs1Data;
  wire       [31:0]   decode_RegFilePlugin_rs2Data;
  wire                lastStageRegFileWrite_valid;
  wire       [4:0]    lastStageRegFileWrite_payload_address;
  wire       [31:0]   lastStageRegFileWrite_payload_data;
  reg        [31:0]   execute_IntAluPlugin_bitwise;
  reg        [31:0]   _zz_102;
  reg        [31:0]   _zz_103;
  wire                _zz_104;
  reg        [19:0]   _zz_105;
  wire                _zz_106;
  reg        [19:0]   _zz_107;
  reg        [31:0]   _zz_108;
  reg        [31:0]   execute_SrcPlugin_addSub;
  wire                execute_SrcPlugin_less;
  wire       [4:0]    execute_FullBarrelShifterPlugin_amplitude;
  reg        [31:0]   _zz_109;
  wire       [31:0]   execute_FullBarrelShifterPlugin_reversed;
  reg        [31:0]   _zz_110;
  reg                 _zz_111;
  reg                 _zz_112;
  reg                 _zz_113;
  reg        [4:0]    _zz_114;
  reg        [31:0]   _zz_115;
  wire                _zz_116;
  wire                _zz_117;
  wire                _zz_118;
  wire                _zz_119;
  wire                _zz_120;
  wire                _zz_121;
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
  wire       [31:0]   _zz_122;
  wire       [32:0]   memory_DivPlugin_div_stage_0_remainderShifted;
  wire       [32:0]   memory_DivPlugin_div_stage_0_remainderMinusDenominator;
  wire       [31:0]   memory_DivPlugin_div_stage_0_outRemainder;
  wire       [31:0]   memory_DivPlugin_div_stage_0_outNumerator;
  wire       [31:0]   _zz_123;
  wire                _zz_124;
  wire                _zz_125;
  reg        [32:0]   _zz_126;
  wire                execute_BranchPlugin_eq;
  wire       [2:0]    _zz_127;
  reg                 _zz_128;
  reg                 _zz_129;
  wire                execute_BranchPlugin_missAlignedTarget;
  reg        [31:0]   execute_BranchPlugin_branch_src1;
  reg        [31:0]   execute_BranchPlugin_branch_src2;
  wire                _zz_130;
  reg        [19:0]   _zz_131;
  wire                _zz_132;
  reg        [10:0]   _zz_133;
  wire                _zz_134;
  reg        [18:0]   _zz_135;
  wire       [31:0]   execute_BranchPlugin_branchAdder;
  reg        [31:0]   decode_to_execute_PC;
  reg        [31:0]   execute_to_memory_PC;
  reg        [31:0]   memory_to_writeBack_PC;
  reg        [31:0]   decode_to_execute_INSTRUCTION;
  reg        [31:0]   execute_to_memory_INSTRUCTION;
  reg        [31:0]   memory_to_writeBack_INSTRUCTION;
  reg                 decode_to_execute_IS_RVC;
  reg        [31:0]   decode_to_execute_FORMAL_PC_NEXT;
  reg        `Src1CtrlEnum_defaultEncoding_type decode_to_execute_SRC1_CTRL;
  reg                 decode_to_execute_SRC_USE_SUB_LESS;
  reg                 decode_to_execute_MEMORY_ENABLE;
  reg                 execute_to_memory_MEMORY_ENABLE;
  reg        `Src2CtrlEnum_defaultEncoding_type decode_to_execute_SRC2_CTRL;
  reg                 decode_to_execute_REGFILE_WRITE_VALID;
  reg                 execute_to_memory_REGFILE_WRITE_VALID;
  reg                 memory_to_writeBack_REGFILE_WRITE_VALID;
  reg                 decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  reg                 decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  reg                 execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  reg                 decode_to_execute_MEMORY_STORE;
  reg                 execute_to_memory_MEMORY_STORE;
  reg        `AluCtrlEnum_defaultEncoding_type decode_to_execute_ALU_CTRL;
  reg                 decode_to_execute_SRC_LESS_UNSIGNED;
  reg        `AluBitwiseCtrlEnum_defaultEncoding_type decode_to_execute_ALU_BITWISE_CTRL;
  reg        `ShiftCtrlEnum_defaultEncoding_type decode_to_execute_SHIFT_CTRL;
  reg                 decode_to_execute_IS_MUL;
  reg                 execute_to_memory_IS_MUL;
  reg                 memory_to_writeBack_IS_MUL;
  reg                 decode_to_execute_IS_DIV;
  reg                 execute_to_memory_IS_DIV;
  reg                 decode_to_execute_IS_RS1_SIGNED;
  reg                 decode_to_execute_IS_RS2_SIGNED;
  reg        `BranchCtrlEnum_defaultEncoding_type decode_to_execute_BRANCH_CTRL;
  reg        [31:0]   decode_to_execute_RS1;
  reg        [31:0]   decode_to_execute_RS2;
  reg                 decode_to_execute_SRC2_FORCE_ZERO;
  reg                 decode_to_execute_PREDICTION_HAD_BRANCHED2;
  reg        [1:0]    execute_to_memory_MEMORY_ADDRESS_LOW;
  reg        [31:0]   execute_to_memory_REGFILE_WRITE_DATA;
  reg        [31:0]   memory_to_writeBack_REGFILE_WRITE_DATA;
  reg        [31:0]   execute_to_memory_MUL_LL;
  reg        [33:0]   execute_to_memory_MUL_LH;
  reg        [33:0]   execute_to_memory_MUL_HL;
  reg        [33:0]   execute_to_memory_MUL_HH;
  reg        [33:0]   memory_to_writeBack_MUL_HH;
  reg        [51:0]   memory_to_writeBack_MUL_LOW;

  (* ram_style = "distributed" *)
  reg [31:0] RegFilePlugin_regFile [0:31];

  integer idx_reg;
  initial begin
      for(idx_reg = 0; idx_reg < 32; idx_reg = idx_reg + 1) begin
          RegFilePlugin_regFile[idx_reg] = 0;
      end
  end

  assign _zz_140 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign _zz_141 = 1'b1;
  assign _zz_142 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign _zz_143 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign _zz_144 = (memory_arbitration_isValid && memory_IS_DIV);
  assign _zz_145 = (IBusSimplePlugin_jump_pcLoad_valid && ((! decode_arbitration_isStuck) || decode_arbitration_removeIt));
  assign _zz_146 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign _zz_147 = (1'b0 || (! 1'b1));
  assign _zz_148 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign _zz_149 = (1'b0 || (! memory_BYPASSABLE_MEMORY_STAGE));
  assign _zz_150 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign _zz_151 = (1'b0 || (! execute_BYPASSABLE_EXECUTE_STAGE));
  assign _zz_152 = execute_INSTRUCTION[13 : 12];
  assign _zz_153 = (memory_DivPlugin_frontendOk && (! memory_DivPlugin_div_done));
  assign _zz_154 = (! memory_arbitration_isStuck);
  assign _zz_155 = (IBusSimplePlugin_decompressor_output_ready && IBusSimplePlugin_decompressor_input_valid);
  assign _zz_156 = {_zz_45[1 : 0],_zz_45[15 : 13]};
  assign _zz_157 = _zz_45[6 : 5];
  assign _zz_158 = _zz_45[11 : 10];
  assign _zz_159 = memory_INSTRUCTION[13 : 12];
  assign _zz_160 = writeBack_INSTRUCTION[13 : 12];
  assign _zz_161 = ($signed(_zz_162) + $signed(_zz_167));
  assign _zz_162 = ($signed(_zz_163) + $signed(_zz_165));
  assign _zz_163 = 52'h0;
  assign _zz_164 = {1'b0,memory_MUL_LL};
  assign _zz_165 = {{19{_zz_164[32]}}, _zz_164};
  assign _zz_166 = ({16'd0,memory_MUL_LH} <<< 16);
  assign _zz_167 = {{2{_zz_166[49]}}, _zz_166};
  assign _zz_168 = ({16'd0,memory_MUL_HL} <<< 16);
  assign _zz_169 = {{2{_zz_168[49]}}, _zz_168};
  assign _zz_170 = _zz_91[23 : 23];
  assign _zz_171 = _zz_91[22 : 22];
  assign _zz_172 = _zz_91[21 : 21];
  assign _zz_173 = _zz_91[20 : 20];
  assign _zz_174 = _zz_91[14 : 14];
  assign _zz_175 = _zz_91[10 : 10];
  assign _zz_176 = _zz_91[9 : 9];
  assign _zz_177 = _zz_91[8 : 8];
  assign _zz_178 = _zz_91[3 : 3];
  assign _zz_179 = (decode_IS_RVC ? 3'b010 : 3'b100);
  assign _zz_180 = {29'd0, _zz_179};
  assign _zz_181 = _zz_91[11 : 11];
  assign _zz_182 = _zz_91[4 : 4];
  assign _zz_183 = ($signed(_zz_185) >>> execute_FullBarrelShifterPlugin_amplitude);
  assign _zz_184 = _zz_183[31 : 0];
  assign _zz_185 = {((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SRA_1) && execute_FullBarrelShifterPlugin_reversed[31]),execute_FullBarrelShifterPlugin_reversed};
  assign _zz_186 = _zz_91[2 : 2];
  assign _zz_187 = _zz_91[17 : 17];
  assign _zz_188 = _zz_91[7 : 7];
  assign _zz_189 = (_zz_39 & (~ _zz_190));
  assign _zz_190 = (_zz_39 - 2'b01);
  assign _zz_191 = {IBusSimplePlugin_fetchPc_inc,2'b00};
  assign _zz_192 = {29'd0, _zz_191};
  assign _zz_193 = (decode_IS_RVC ? 3'b010 : 3'b100);
  assign _zz_194 = {29'd0, _zz_193};
  assign _zz_195 = {{_zz_55,_zz_45[6 : 2]},12'h0};
  assign _zz_196 = {{{4'b0000,_zz_45[8 : 7]},_zz_45[12 : 9]},2'b00};
  assign _zz_197 = {{{4'b0000,_zz_45[8 : 7]},_zz_45[12 : 9]},2'b00};
  assign _zz_198 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_199 = {{_zz_78,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz_200 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]};
  assign _zz_201 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_202 = (IBusSimplePlugin_pending_value + _zz_204);
  assign _zz_203 = IBusSimplePlugin_pending_inc;
  assign _zz_204 = {2'd0, _zz_203};
  assign _zz_205 = IBusSimplePlugin_pending_dec;
  assign _zz_206 = {2'd0, _zz_205};
  assign _zz_207 = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter != 3'b000));
  assign _zz_208 = {2'd0, _zz_207};
  assign _zz_209 = IBusSimplePlugin_pending_dec;
  assign _zz_210 = {2'd0, _zz_209};
  assign _zz_211 = execute_SRC_LESS;
  assign _zz_212 = (execute_IS_RVC ? 3'b010 : 3'b100);
  assign _zz_213 = execute_INSTRUCTION[19 : 15];
  assign _zz_214 = execute_INSTRUCTION[31 : 20];
  assign _zz_215 = {execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]};
  assign _zz_216 = ($signed(_zz_217) + $signed(_zz_220));
  assign _zz_217 = ($signed(_zz_218) + $signed(_zz_219));
  assign _zz_218 = execute_SRC1;
  assign _zz_219 = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_220 = (execute_SRC_USE_SUB_LESS ? _zz_221 : _zz_222);
  assign _zz_221 = 32'h00000001;
  assign _zz_222 = 32'h0;
  assign _zz_223 = {{14{writeBack_MUL_LOW[51]}}, writeBack_MUL_LOW};
  assign _zz_224 = ({32'd0,writeBack_MUL_HH} <<< 32);
  assign _zz_225 = writeBack_MUL_LOW[31 : 0];
  assign _zz_226 = writeBack_MulPlugin_result[63 : 32];
  assign _zz_227 = memory_DivPlugin_div_counter_willIncrement;
  assign _zz_228 = {5'd0, _zz_227};
  assign _zz_229 = {1'd0, memory_DivPlugin_rs2};
  assign _zz_230 = memory_DivPlugin_div_stage_0_remainderMinusDenominator[31:0];
  assign _zz_231 = memory_DivPlugin_div_stage_0_remainderShifted[31:0];
  assign _zz_232 = {_zz_122,(! memory_DivPlugin_div_stage_0_remainderMinusDenominator[32])};
  assign _zz_233 = _zz_234;
  assign _zz_234 = _zz_235;
  assign _zz_235 = ({memory_DivPlugin_div_needRevert,(memory_DivPlugin_div_needRevert ? (~ _zz_123) : _zz_123)} + _zz_237);
  assign _zz_236 = memory_DivPlugin_div_needRevert;
  assign _zz_237 = {32'd0, _zz_236};
  assign _zz_238 = _zz_125;
  assign _zz_239 = {32'd0, _zz_238};
  assign _zz_240 = _zz_124;
  assign _zz_241 = {31'd0, _zz_240};
  assign _zz_242 = execute_INSTRUCTION[31 : 20];
  assign _zz_243 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_244 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_245 = (execute_IS_RVC ? 3'b010 : 3'b100);
  assign _zz_246 = (_zz_45[11 : 10] == 2'b01);
  assign _zz_247 = ((_zz_45[11 : 10] == 2'b11) && (_zz_45[6 : 5] == 2'b00));
  assign _zz_248 = 7'h0;
  assign _zz_249 = _zz_45[6 : 2];
  assign _zz_250 = _zz_45[12];
  assign _zz_251 = _zz_45[11 : 7];
  assign _zz_252 = decode_INSTRUCTION[31];
  assign _zz_253 = decode_INSTRUCTION[19 : 12];
  assign _zz_254 = decode_INSTRUCTION[20];
  assign _zz_255 = decode_INSTRUCTION[31];
  assign _zz_256 = decode_INSTRUCTION[7];
  assign _zz_257 = (decode_INSTRUCTION & 32'h0000001c);
  assign _zz_258 = 32'h00000004;
  assign _zz_259 = (decode_INSTRUCTION & 32'h00000048);
  assign _zz_260 = 32'h00000040;
  assign _zz_261 = ((decode_INSTRUCTION & 32'h00000040) == 32'h00000040);
  assign _zz_262 = _zz_95;
  assign _zz_263 = 1'b0;
  assign _zz_264 = (_zz_95 != 1'b0);
  assign _zz_265 = (((decode_INSTRUCTION & _zz_267) == 32'h02004020) != 1'b0);
  assign _zz_266 = {((_zz_268 == _zz_269) != 1'b0),{({_zz_270,_zz_271} != 2'b00),{(_zz_272 != _zz_273),{_zz_274,{_zz_275,_zz_276}}}}};
  assign _zz_267 = 32'h02004064;
  assign _zz_268 = (decode_INSTRUCTION & 32'h02004034);
  assign _zz_269 = 32'h02000030;
  assign _zz_270 = ((decode_INSTRUCTION & _zz_277) == 32'h00005010);
  assign _zz_271 = ((decode_INSTRUCTION & _zz_278) == 32'h00005020);
  assign _zz_272 = {(_zz_279 == _zz_280),{_zz_281,_zz_282}};
  assign _zz_273 = 3'b000;
  assign _zz_274 = ((_zz_283 == _zz_284) != 1'b0);
  assign _zz_275 = (_zz_285 != 1'b0);
  assign _zz_276 = {(_zz_286 != _zz_287),{_zz_288,{_zz_289,_zz_290}}};
  assign _zz_277 = 32'h00007034;
  assign _zz_278 = 32'h02007064;
  assign _zz_279 = (decode_INSTRUCTION & 32'h40003014);
  assign _zz_280 = 32'h40001010;
  assign _zz_281 = ((decode_INSTRUCTION & 32'h02007014) == 32'h00001010);
  assign _zz_282 = ((decode_INSTRUCTION & 32'h00007034) == 32'h00001010);
  assign _zz_283 = (decode_INSTRUCTION & 32'h00000064);
  assign _zz_284 = 32'h00000024;
  assign _zz_285 = ((decode_INSTRUCTION & 32'h00001000) == 32'h00001000);
  assign _zz_286 = ((decode_INSTRUCTION & _zz_291) == 32'h00002000);
  assign _zz_287 = 1'b0;
  assign _zz_288 = ({_zz_292,_zz_293} != 2'b00);
  assign _zz_289 = (_zz_294 != 1'b0);
  assign _zz_290 = {(_zz_295 != _zz_296),{_zz_297,{_zz_298,_zz_299}}};
  assign _zz_291 = 32'h00003000;
  assign _zz_292 = ((decode_INSTRUCTION & 32'h00002010) == 32'h00002000);
  assign _zz_293 = ((decode_INSTRUCTION & 32'h00005000) == 32'h00001000);
  assign _zz_294 = ((decode_INSTRUCTION & 32'h00004004) == 32'h00004000);
  assign _zz_295 = ((decode_INSTRUCTION & _zz_300) == 32'h00002000);
  assign _zz_296 = 1'b0;
  assign _zz_297 = ((_zz_301 == _zz_302) != 1'b0);
  assign _zz_298 = (_zz_303 != 1'b0);
  assign _zz_299 = {(_zz_304 != _zz_305),{_zz_306,{_zz_307,_zz_308}}};
  assign _zz_300 = 32'h00006004;
  assign _zz_301 = (decode_INSTRUCTION & 32'h00000024);
  assign _zz_302 = 32'h00000020;
  assign _zz_303 = ((decode_INSTRUCTION & 32'h00000020) == 32'h00000020);
  assign _zz_304 = {(_zz_309 == _zz_310),{_zz_93,{_zz_311,_zz_312}}};
  assign _zz_305 = 4'b0000;
  assign _zz_306 = ({_zz_93,{_zz_313,_zz_314}} != 3'b000);
  assign _zz_307 = ({_zz_315,_zz_316} != 4'b0000);
  assign _zz_308 = {(_zz_317 != _zz_318),{_zz_319,{_zz_320,_zz_321}}};
  assign _zz_309 = (decode_INSTRUCTION & 32'h00004000);
  assign _zz_310 = 32'h00004000;
  assign _zz_311 = (_zz_322 == _zz_323);
  assign _zz_312 = _zz_92;
  assign _zz_313 = (_zz_324 == _zz_325);
  assign _zz_314 = (_zz_326 == _zz_327);
  assign _zz_315 = (_zz_328 == _zz_329);
  assign _zz_316 = {_zz_94,{_zz_330,_zz_331}};
  assign _zz_317 = {_zz_93,_zz_332};
  assign _zz_318 = 2'b00;
  assign _zz_319 = ({_zz_333,_zz_334} != 2'b00);
  assign _zz_320 = (_zz_335 != _zz_336);
  assign _zz_321 = {_zz_337,{_zz_338,_zz_339}};
  assign _zz_322 = (decode_INSTRUCTION & 32'h02000000);
  assign _zz_323 = 32'h0;
  assign _zz_324 = (decode_INSTRUCTION & 32'h00000030);
  assign _zz_325 = 32'h00000010;
  assign _zz_326 = (decode_INSTRUCTION & 32'h02000020);
  assign _zz_327 = 32'h00000020;
  assign _zz_328 = (decode_INSTRUCTION & 32'h00000010);
  assign _zz_329 = 32'h00000010;
  assign _zz_330 = ((decode_INSTRUCTION & _zz_340) == 32'h00000004);
  assign _zz_331 = ((decode_INSTRUCTION & _zz_341) == 32'h0);
  assign _zz_332 = ((decode_INSTRUCTION & 32'h00000070) == 32'h00000020);
  assign _zz_333 = _zz_93;
  assign _zz_334 = _zz_92;
  assign _zz_335 = {(_zz_342 == _zz_343),(_zz_344 == _zz_345)};
  assign _zz_336 = 2'b00;
  assign _zz_337 = ((_zz_346 == _zz_347) != 1'b0);
  assign _zz_338 = ({_zz_348,_zz_349} != 3'b000);
  assign _zz_339 = {(_zz_350 != _zz_351),(_zz_352 != _zz_353)};
  assign _zz_340 = 32'h0000000c;
  assign _zz_341 = 32'h00000028;
  assign _zz_342 = (decode_INSTRUCTION & 32'h00000004);
  assign _zz_343 = 32'h0;
  assign _zz_344 = (decode_INSTRUCTION & 32'h00000018);
  assign _zz_345 = 32'h0;
  assign _zz_346 = (decode_INSTRUCTION & 32'h00000058);
  assign _zz_347 = 32'h0;
  assign _zz_348 = ((decode_INSTRUCTION & 32'h00000044) == 32'h00000040);
  assign _zz_349 = {((decode_INSTRUCTION & 32'h00002014) == 32'h00002010),((decode_INSTRUCTION & 32'h40000034) == 32'h40000030)};
  assign _zz_350 = ((decode_INSTRUCTION & 32'h00000014) == 32'h00000004);
  assign _zz_351 = 1'b0;
  assign _zz_352 = ((decode_INSTRUCTION & 32'h00000044) == 32'h00000004);
  assign _zz_353 = 1'b0;
  assign _zz_354 = execute_INSTRUCTION[31];
  assign _zz_355 = execute_INSTRUCTION[31];
  assign _zz_356 = execute_INSTRUCTION[7];
  assign _zz_138 = RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress1];
  assign _zz_139 = RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress2];
  always @ (posedge clk) begin
    if(_zz_29) begin
      RegFilePlugin_regFile[lastStageRegFileWrite_payload_address] <= lastStageRegFileWrite_payload_data;
    end
  end

  StreamFifoLowLatency IBusSimplePlugin_rspJoin_rspBuffer_c (
    .io_push_valid            (iBus_rsp_valid                                                  ), //i
    .io_push_ready            (IBusSimplePlugin_rspJoin_rspBuffer_c_io_push_ready              ), //o
    .io_push_payload_error    (iBus_rsp_payload_error                                          ), //i
    .io_push_payload_inst     (iBus_rsp_payload_inst[31:0]                                     ), //i
    .io_pop_valid             (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid               ), //o
    .io_pop_ready             (_zz_136                                                         ), //i
    .io_pop_payload_error     (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error       ), //o
    .io_pop_payload_inst      (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst[31:0]  ), //o
    .io_flush                 (_zz_137                                                         ), //i
    .io_occupancy             (IBusSimplePlugin_rspJoin_rspBuffer_c_io_occupancy               ), //o
    .clk                      (clk                                                             ), //i
    .reset                    (reset                                                           )  //i
  );

  assign memory_MUL_LOW = ($signed(_zz_161) + $signed(_zz_169));
  assign memory_MUL_HH = execute_to_memory_MUL_HH;
  assign execute_MUL_HH = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bHigh));
  assign execute_MUL_HL = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bSLow));
  assign execute_MUL_LH = ($signed(execute_MulPlugin_aSLow) * $signed(execute_MulPlugin_bHigh));
  assign execute_MUL_LL = (execute_MulPlugin_aULow * execute_MulPlugin_bULow);
  assign writeBack_REGFILE_WRITE_DATA = memory_to_writeBack_REGFILE_WRITE_DATA;
  assign memory_REGFILE_WRITE_DATA = execute_to_memory_REGFILE_WRITE_DATA;
  assign execute_REGFILE_WRITE_DATA = _zz_102;
  assign execute_MEMORY_ADDRESS_LOW = dBus_cmd_payload_address[1 : 0];
  assign decode_PREDICTION_HAD_BRANCHED2 = IBusSimplePlugin_decodePrediction_cmd_hadBranch;
  assign decode_SRC2_FORCE_ZERO = (decode_SRC_ADD_ZERO && (! decode_SRC_USE_SUB_LESS));
  assign _zz_1 = _zz_2;
  assign decode_IS_RS2_SIGNED = _zz_170[0];
  assign decode_IS_RS1_SIGNED = _zz_171[0];
  assign decode_IS_DIV = _zz_172[0];
  assign memory_IS_MUL = execute_to_memory_IS_MUL;
  assign execute_IS_MUL = decode_to_execute_IS_MUL;
  assign decode_IS_MUL = _zz_173[0];
  assign decode_SHIFT_CTRL = _zz_3;
  assign _zz_4 = _zz_5;
  assign decode_ALU_BITWISE_CTRL = _zz_6;
  assign _zz_7 = _zz_8;
  assign decode_SRC_LESS_UNSIGNED = _zz_174[0];
  assign decode_ALU_CTRL = _zz_9;
  assign _zz_10 = _zz_11;
  assign decode_MEMORY_STORE = _zz_175[0];
  assign execute_BYPASSABLE_MEMORY_STAGE = decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  assign decode_BYPASSABLE_MEMORY_STAGE = _zz_176[0];
  assign decode_BYPASSABLE_EXECUTE_STAGE = _zz_177[0];
  assign decode_SRC2_CTRL = _zz_12;
  assign _zz_13 = _zz_14;
  assign decode_MEMORY_ENABLE = _zz_178[0];
  assign decode_SRC1_CTRL = _zz_15;
  assign _zz_16 = _zz_17;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = (decode_PC + _zz_180);
  assign memory_PC = execute_to_memory_PC;
  assign execute_BRANCH_CALC = {execute_BranchPlugin_branchAdder[31 : 1],1'b0};
  assign execute_BRANCH_DO = ((execute_PREDICTION_HAD_BRANCHED2 != execute_BRANCH_COND_RESULT) || execute_BranchPlugin_missAlignedTarget);
  assign execute_PC = decode_to_execute_PC;
  assign execute_BRANCH_COND_RESULT = _zz_129;
  assign execute_PREDICTION_HAD_BRANCHED2 = decode_to_execute_PREDICTION_HAD_BRANCHED2;
  assign execute_BRANCH_CTRL = _zz_18;
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
  assign decode_RS2_USE = _zz_181[0];
  assign decode_RS1_USE = _zz_182[0];
  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign execute_BYPASSABLE_EXECUTE_STAGE = decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  assign memory_REGFILE_WRITE_VALID = execute_to_memory_REGFILE_WRITE_VALID;
  assign memory_BYPASSABLE_MEMORY_STAGE = execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  assign writeBack_REGFILE_WRITE_VALID = memory_to_writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    decode_RS2 = decode_RegFilePlugin_rs2Data;
    if(_zz_113)begin
      if((_zz_114 == decode_INSTRUCTION[24 : 20]))begin
        decode_RS2 = _zz_115;
      end
    end
    if(_zz_140)begin
      if(_zz_141)begin
        if(_zz_117)begin
          decode_RS2 = _zz_26;
        end
      end
    end
    if(_zz_142)begin
      if(memory_BYPASSABLE_MEMORY_STAGE)begin
        if(_zz_119)begin
          decode_RS2 = _zz_36;
        end
      end
    end
    if(_zz_143)begin
      if(execute_BYPASSABLE_EXECUTE_STAGE)begin
        if(_zz_121)begin
          decode_RS2 = _zz_19;
        end
      end
    end
  end

  always @ (*) begin
    decode_RS1 = decode_RegFilePlugin_rs1Data;
    if(_zz_113)begin
      if((_zz_114 == decode_INSTRUCTION[19 : 15]))begin
        decode_RS1 = _zz_115;
      end
    end
    if(_zz_140)begin
      if(_zz_141)begin
        if(_zz_116)begin
          decode_RS1 = _zz_26;
        end
      end
    end
    if(_zz_142)begin
      if(memory_BYPASSABLE_MEMORY_STAGE)begin
        if(_zz_118)begin
          decode_RS1 = _zz_36;
        end
      end
    end
    if(_zz_143)begin
      if(execute_BYPASSABLE_EXECUTE_STAGE)begin
        if(_zz_120)begin
          decode_RS1 = _zz_19;
        end
      end
    end
  end

  assign execute_SHIFT_RIGHT = _zz_184;
  always @ (*) begin
    _zz_19 = execute_REGFILE_WRITE_DATA;
    if(execute_arbitration_isValid)begin
      case(execute_SHIFT_CTRL)
        `ShiftCtrlEnum_defaultEncoding_SLL_1 : begin
          _zz_19 = _zz_110;
        end
        `ShiftCtrlEnum_defaultEncoding_SRL_1, `ShiftCtrlEnum_defaultEncoding_SRA_1 : begin
          _zz_19 = execute_SHIFT_RIGHT;
        end
        default : begin
        end
      endcase
    end
  end

  assign execute_SHIFT_CTRL = _zz_20;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC2_FORCE_ZERO = decode_to_execute_SRC2_FORCE_ZERO;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign _zz_21 = execute_PC;
  assign execute_SRC2_CTRL = _zz_22;
  assign execute_IS_RVC = decode_to_execute_IS_RVC;
  assign execute_SRC1_CTRL = _zz_23;
  assign decode_SRC_USE_SUB_LESS = _zz_186[0];
  assign decode_SRC_ADD_ZERO = _zz_187[0];
  assign execute_SRC_ADD_SUB = execute_SrcPlugin_addSub;
  assign execute_SRC_LESS = execute_SrcPlugin_less;
  assign execute_ALU_CTRL = _zz_24;
  assign execute_SRC2 = _zz_108;
  assign execute_SRC1 = _zz_103;
  assign execute_ALU_BITWISE_CTRL = _zz_25;
  always @ (*) begin
    _zz_26 = writeBack_REGFILE_WRITE_DATA;
    if((writeBack_arbitration_isValid && writeBack_IS_MUL))begin
      case(_zz_160)
        2'b00 : begin
          _zz_26 = _zz_225;
        end
        default : begin
          _zz_26 = _zz_226;
        end
      endcase
    end
  end

  assign _zz_27 = writeBack_INSTRUCTION;
  assign _zz_28 = writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    _zz_29 = 1'b0;
    if(lastStageRegFileWrite_valid)begin
      _zz_29 = 1'b1;
    end
  end

  always @ (*) begin
    decode_REGFILE_WRITE_VALID = _zz_188[0];
    if((decode_INSTRUCTION[11 : 7] == 5'h0))begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  always @ (*) begin
    _zz_36 = memory_REGFILE_WRITE_DATA;
    if((memory_arbitration_isValid && memory_MEMORY_ENABLE))begin
      _zz_36 = memory_DBusSimplePlugin_rspFormated;
    end
    if(_zz_144)begin
      _zz_36 = memory_DivPlugin_div_result;
    end
  end

  assign memory_INSTRUCTION = execute_to_memory_INSTRUCTION;
  assign memory_MEMORY_ADDRESS_LOW = execute_to_memory_MEMORY_ADDRESS_LOW;
  assign memory_MEMORY_READ_DATA = dBus_rsp_data;
  assign memory_MEMORY_STORE = execute_to_memory_MEMORY_STORE;
  assign memory_MEMORY_ENABLE = execute_to_memory_MEMORY_ENABLE;
  assign execute_SRC_ADD = execute_SrcPlugin_addSub;
  assign execute_RS2 = decode_to_execute_RS2;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign execute_MEMORY_STORE = decode_to_execute_MEMORY_STORE;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign execute_ALIGNEMENT_FAULT = 1'b0;
  assign decode_BRANCH_CTRL = _zz_37;
  always @ (*) begin
    _zz_38 = decode_FORMAL_PC_NEXT;
    if(IBusSimplePlugin_predictionJumpInterface_valid)begin
      _zz_38 = IBusSimplePlugin_predictionJumpInterface_payload;
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
    if((decode_arbitration_isValid && (_zz_111 || _zz_112)))begin
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
    if(((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! dBus_cmd_ready)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_84)))begin
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
  always @ (*) begin
    execute_arbitration_flushNext = 1'b0;
    if(BranchPlugin_jumpInterface_valid)begin
      execute_arbitration_flushNext = 1'b1;
    end
  end

  always @ (*) begin
    memory_arbitration_haltItself = 1'b0;
    if((((memory_arbitration_isValid && memory_MEMORY_ENABLE) && (! memory_MEMORY_STORE)) && ((! dBus_rsp_ready) || 1'b0)))begin
      memory_arbitration_haltItself = 1'b1;
    end
    if(_zz_144)begin
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
  assign memory_arbitration_flushNext = 1'b0;
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

  assign IBusSimplePlugin_externalFlush = ({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,{execute_arbitration_flushNext,decode_arbitration_flushNext}}} != 4'b0000);
  assign IBusSimplePlugin_jump_pcLoad_valid = ({BranchPlugin_jumpInterface_valid,IBusSimplePlugin_predictionJumpInterface_valid} != 2'b00);
  assign _zz_39 = {IBusSimplePlugin_predictionJumpInterface_valid,BranchPlugin_jumpInterface_valid};
  assign IBusSimplePlugin_jump_pcLoad_payload = (_zz_189[0] ? BranchPlugin_jumpInterface_payload : IBusSimplePlugin_predictionJumpInterface_payload);
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
    IBusSimplePlugin_fetchPc_pc = (IBusSimplePlugin_fetchPc_pcReg + _zz_192);
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
    if(_zz_145)begin
      IBusSimplePlugin_decodePc_flushed = 1'b1;
    end
  end

  assign IBusSimplePlugin_decodePc_pcPlus = (IBusSimplePlugin_decodePc_pcReg + _zz_194);
  assign IBusSimplePlugin_decodePc_injectedDecode = 1'b0;
  assign IBusSimplePlugin_iBusRsp_redoFetch = 1'b0;
  assign IBusSimplePlugin_iBusRsp_stages_0_input_valid = IBusSimplePlugin_fetchPc_output_valid;
  assign IBusSimplePlugin_fetchPc_output_ready = IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  assign IBusSimplePlugin_iBusRsp_stages_0_input_payload = IBusSimplePlugin_fetchPc_output_payload;
  always @ (*) begin
    IBusSimplePlugin_iBusRsp_stages_0_halt = 1'b0;
    if((IBusSimplePlugin_iBusRsp_stages_0_input_valid && ((! IBusSimplePlugin_cmdFork_canEmit) || (! IBusSimplePlugin_cmd_ready))))begin
      IBusSimplePlugin_iBusRsp_stages_0_halt = 1'b1;
    end
  end

  assign _zz_40 = (! IBusSimplePlugin_iBusRsp_stages_0_halt);
  assign IBusSimplePlugin_iBusRsp_stages_0_input_ready = (IBusSimplePlugin_iBusRsp_stages_0_output_ready && _zz_40);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_valid = (IBusSimplePlugin_iBusRsp_stages_0_input_valid && _zz_40);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_payload = IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  assign IBusSimplePlugin_iBusRsp_stages_1_halt = 1'b0;
  assign _zz_41 = (! IBusSimplePlugin_iBusRsp_stages_1_halt);
  assign IBusSimplePlugin_iBusRsp_stages_1_input_ready = (IBusSimplePlugin_iBusRsp_stages_1_output_ready && _zz_41);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_valid = (IBusSimplePlugin_iBusRsp_stages_1_input_valid && _zz_41);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_payload = IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  assign IBusSimplePlugin_iBusRsp_flush = (IBusSimplePlugin_externalFlush || IBusSimplePlugin_iBusRsp_redoFetch);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_ready = _zz_42;
  assign _zz_42 = ((1'b0 && (! _zz_43)) || IBusSimplePlugin_iBusRsp_stages_1_input_ready);
  assign _zz_43 = _zz_44;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_valid = _zz_43;
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
  assign _zz_45 = IBusSimplePlugin_decompressor_raw[15 : 0];
  always @ (*) begin
    IBusSimplePlugin_decompressor_decompressed = 32'h0;
    case(_zz_156)
      5'h0 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{{{2'b00,_zz_45[10 : 7]},_zz_45[12 : 11]},_zz_45[5]},_zz_45[6]},2'b00},5'h02},3'b000},_zz_47},7'h13};
      end
      5'h02 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{_zz_48,_zz_46},3'b010},_zz_47},7'h03};
      end
      5'h06 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_48[11 : 5],_zz_47},_zz_46},3'b010},_zz_48[4 : 0]},7'h23};
      end
      5'h08 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{_zz_50,_zz_45[11 : 7]},3'b000},_zz_45[11 : 7]},7'h13};
      end
      5'h09 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_53[20],_zz_53[10 : 1]},_zz_53[11]},_zz_53[19 : 12]},_zz_65},7'h6f};
      end
      5'h0a : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{_zz_50,5'h0},3'b000},_zz_45[11 : 7]},7'h13};
      end
      5'h0b : begin
        IBusSimplePlugin_decompressor_decompressed = ((_zz_45[11 : 7] == 5'h02) ? {{{{{{{{{_zz_57,_zz_45[4 : 3]},_zz_45[5]},_zz_45[2]},_zz_45[6]},4'b0000},_zz_45[11 : 7]},3'b000},_zz_45[11 : 7]},7'h13} : {{_zz_195[31 : 12],_zz_45[11 : 7]},7'h37});
      end
      5'h0c : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{((_zz_45[11 : 10] == 2'b10) ? _zz_71 : {{1'b0,(_zz_246 || _zz_247)},5'h0}),(((! _zz_45[11]) || _zz_67) ? _zz_45[6 : 2] : _zz_47)},_zz_46},_zz_69},_zz_46},(_zz_67 ? 7'h13 : 7'h33)};
      end
      5'h0d : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_60[20],_zz_60[10 : 1]},_zz_60[11]},_zz_60[19 : 12]},_zz_64},7'h6f};
      end
      5'h0e : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{_zz_63[12],_zz_63[10 : 5]},_zz_64},_zz_46},3'b000},_zz_63[4 : 1]},_zz_63[11]},7'h63};
      end
      5'h0f : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{_zz_63[12],_zz_63[10 : 5]},_zz_64},_zz_46},3'b001},_zz_63[4 : 1]},_zz_63[11]},7'h63};
      end
      5'h10 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{7'h0,_zz_45[6 : 2]},_zz_45[11 : 7]},3'b001},_zz_45[11 : 7]},7'h13};
      end
      5'h12 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{{4'b0000,_zz_45[3 : 2]},_zz_45[12]},_zz_45[6 : 4]},2'b00},_zz_66},3'b010},_zz_45[11 : 7]},7'h03};
      end
      5'h14 : begin
        IBusSimplePlugin_decompressor_decompressed = ((_zz_45[12 : 2] == 11'h400) ? 32'h00100073 : ((_zz_45[6 : 2] == 5'h0) ? {{{{12'h0,_zz_45[11 : 7]},3'b000},(_zz_45[12] ? _zz_65 : _zz_64)},7'h67} : {{{{{_zz_248,_zz_249},(_zz_250 ? _zz_251 : _zz_64)},3'b000},_zz_45[11 : 7]},7'h33}));
      end
      5'h16 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_196[11 : 5],_zz_45[6 : 2]},_zz_66},3'b010},_zz_197[4 : 0]},7'h23};
      end
      default : begin
      end
    endcase
  end

  assign _zz_46 = {2'b01,_zz_45[9 : 7]};
  assign _zz_47 = {2'b01,_zz_45[4 : 2]};
  assign _zz_48 = {{{{5'h0,_zz_45[5]},_zz_45[12 : 10]},_zz_45[6]},2'b00};
  assign _zz_49 = _zz_45[12];
  always @ (*) begin
    _zz_50[11] = _zz_49;
    _zz_50[10] = _zz_49;
    _zz_50[9] = _zz_49;
    _zz_50[8] = _zz_49;
    _zz_50[7] = _zz_49;
    _zz_50[6] = _zz_49;
    _zz_50[5] = _zz_49;
    _zz_50[4 : 0] = _zz_45[6 : 2];
  end

  assign _zz_51 = _zz_45[12];
  always @ (*) begin
    _zz_52[9] = _zz_51;
    _zz_52[8] = _zz_51;
    _zz_52[7] = _zz_51;
    _zz_52[6] = _zz_51;
    _zz_52[5] = _zz_51;
    _zz_52[4] = _zz_51;
    _zz_52[3] = _zz_51;
    _zz_52[2] = _zz_51;
    _zz_52[1] = _zz_51;
    _zz_52[0] = _zz_51;
  end

  assign _zz_53 = {{{{{{{{_zz_52,_zz_45[8]},_zz_45[10 : 9]},_zz_45[6]},_zz_45[7]},_zz_45[2]},_zz_45[11]},_zz_45[5 : 3]},1'b0};
  assign _zz_54 = _zz_45[12];
  always @ (*) begin
    _zz_55[14] = _zz_54;
    _zz_55[13] = _zz_54;
    _zz_55[12] = _zz_54;
    _zz_55[11] = _zz_54;
    _zz_55[10] = _zz_54;
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

  assign _zz_56 = _zz_45[12];
  always @ (*) begin
    _zz_57[2] = _zz_56;
    _zz_57[1] = _zz_56;
    _zz_57[0] = _zz_56;
  end

  assign _zz_58 = _zz_45[12];
  always @ (*) begin
    _zz_59[9] = _zz_58;
    _zz_59[8] = _zz_58;
    _zz_59[7] = _zz_58;
    _zz_59[6] = _zz_58;
    _zz_59[5] = _zz_58;
    _zz_59[4] = _zz_58;
    _zz_59[3] = _zz_58;
    _zz_59[2] = _zz_58;
    _zz_59[1] = _zz_58;
    _zz_59[0] = _zz_58;
  end

  assign _zz_60 = {{{{{{{{_zz_59,_zz_45[8]},_zz_45[10 : 9]},_zz_45[6]},_zz_45[7]},_zz_45[2]},_zz_45[11]},_zz_45[5 : 3]},1'b0};
  assign _zz_61 = _zz_45[12];
  always @ (*) begin
    _zz_62[4] = _zz_61;
    _zz_62[3] = _zz_61;
    _zz_62[2] = _zz_61;
    _zz_62[1] = _zz_61;
    _zz_62[0] = _zz_61;
  end

  assign _zz_63 = {{{{{_zz_62,_zz_45[6 : 5]},_zz_45[2]},_zz_45[11 : 10]},_zz_45[4 : 3]},1'b0};
  assign _zz_64 = 5'h0;
  assign _zz_65 = 5'h01;
  assign _zz_66 = 5'h02;
  assign _zz_67 = (_zz_45[11 : 10] != 2'b11);
  always @ (*) begin
    case(_zz_157)
      2'b00 : begin
        _zz_68 = 3'b000;
      end
      2'b01 : begin
        _zz_68 = 3'b100;
      end
      2'b10 : begin
        _zz_68 = 3'b110;
      end
      default : begin
        _zz_68 = 3'b111;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_158)
      2'b00 : begin
        _zz_69 = 3'b101;
      end
      2'b01 : begin
        _zz_69 = 3'b101;
      end
      2'b10 : begin
        _zz_69 = 3'b111;
      end
      default : begin
        _zz_69 = _zz_68;
      end
    endcase
  end

  assign _zz_70 = _zz_45[12];
  always @ (*) begin
    _zz_71[6] = _zz_70;
    _zz_71[5] = _zz_70;
    _zz_71[4] = _zz_70;
    _zz_71[3] = _zz_70;
    _zz_71[2] = _zz_70;
    _zz_71[1] = _zz_70;
    _zz_71[0] = _zz_70;
  end

  assign IBusSimplePlugin_decompressor_output_valid = (IBusSimplePlugin_decompressor_input_valid && (! ((IBusSimplePlugin_decompressor_throw2Bytes && (! IBusSimplePlugin_decompressor_bufferValid)) && (! IBusSimplePlugin_decompressor_isInputHighRvc))));
  assign IBusSimplePlugin_decompressor_output_payload_pc = IBusSimplePlugin_decompressor_input_payload_pc;
  assign IBusSimplePlugin_decompressor_output_payload_isRvc = IBusSimplePlugin_decompressor_isRvc;
  assign IBusSimplePlugin_decompressor_output_payload_rsp_inst = (IBusSimplePlugin_decompressor_isRvc ? IBusSimplePlugin_decompressor_decompressed : IBusSimplePlugin_decompressor_raw);
  assign IBusSimplePlugin_decompressor_input_ready = (IBusSimplePlugin_decompressor_output_ready && (((! IBusSimplePlugin_iBusRsp_stages_1_input_valid) || IBusSimplePlugin_decompressor_flushNext) || ((! (IBusSimplePlugin_decompressor_bufferValid && IBusSimplePlugin_decompressor_isInputHighRvc)) && (! (((! IBusSimplePlugin_decompressor_unaligned) && IBusSimplePlugin_decompressor_isInputLowRvc) && IBusSimplePlugin_decompressor_isInputHighRvc)))));
  assign IBusSimplePlugin_decompressor_bufferFill = (((((! IBusSimplePlugin_decompressor_unaligned) && IBusSimplePlugin_decompressor_isInputLowRvc) && (! IBusSimplePlugin_decompressor_isInputHighRvc)) || (IBusSimplePlugin_decompressor_bufferValid && (! IBusSimplePlugin_decompressor_isInputHighRvc))) || ((IBusSimplePlugin_decompressor_throw2Bytes && (! IBusSimplePlugin_decompressor_isRvc)) && (! IBusSimplePlugin_decompressor_isInputHighRvc)));
  assign IBusSimplePlugin_decompressor_output_ready = ((1'b0 && (! IBusSimplePlugin_injector_decodeInput_valid)) || IBusSimplePlugin_injector_decodeInput_ready);
  assign IBusSimplePlugin_injector_decodeInput_valid = _zz_72;
  assign IBusSimplePlugin_injector_decodeInput_payload_pc = _zz_73;
  assign IBusSimplePlugin_injector_decodeInput_payload_rsp_error = _zz_74;
  assign IBusSimplePlugin_injector_decodeInput_payload_rsp_inst = _zz_75;
  assign IBusSimplePlugin_injector_decodeInput_payload_isRvc = _zz_76;
  assign IBusSimplePlugin_pcValids_0 = IBusSimplePlugin_injector_nextPcCalc_valids_0;
  assign IBusSimplePlugin_pcValids_1 = IBusSimplePlugin_injector_nextPcCalc_valids_1;
  assign IBusSimplePlugin_pcValids_2 = IBusSimplePlugin_injector_nextPcCalc_valids_2;
  assign IBusSimplePlugin_pcValids_3 = IBusSimplePlugin_injector_nextPcCalc_valids_3;
  assign IBusSimplePlugin_injector_decodeInput_ready = (! decode_arbitration_isStuck);
  assign decode_arbitration_isValid = IBusSimplePlugin_injector_decodeInput_valid;
  assign _zz_77 = _zz_198[11];
  always @ (*) begin
    _zz_78[18] = _zz_77;
    _zz_78[17] = _zz_77;
    _zz_78[16] = _zz_77;
    _zz_78[15] = _zz_77;
    _zz_78[14] = _zz_77;
    _zz_78[13] = _zz_77;
    _zz_78[12] = _zz_77;
    _zz_78[11] = _zz_77;
    _zz_78[10] = _zz_77;
    _zz_78[9] = _zz_77;
    _zz_78[8] = _zz_77;
    _zz_78[7] = _zz_77;
    _zz_78[6] = _zz_77;
    _zz_78[5] = _zz_77;
    _zz_78[4] = _zz_77;
    _zz_78[3] = _zz_77;
    _zz_78[2] = _zz_77;
    _zz_78[1] = _zz_77;
    _zz_78[0] = _zz_77;
  end

  assign IBusSimplePlugin_decodePrediction_cmd_hadBranch = ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) || ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_B) && _zz_199[31]));
  assign IBusSimplePlugin_predictionJumpInterface_valid = (decode_arbitration_isValid && IBusSimplePlugin_decodePrediction_cmd_hadBranch);
  assign _zz_79 = _zz_200[19];
  always @ (*) begin
    _zz_80[10] = _zz_79;
    _zz_80[9] = _zz_79;
    _zz_80[8] = _zz_79;
    _zz_80[7] = _zz_79;
    _zz_80[6] = _zz_79;
    _zz_80[5] = _zz_79;
    _zz_80[4] = _zz_79;
    _zz_80[3] = _zz_79;
    _zz_80[2] = _zz_79;
    _zz_80[1] = _zz_79;
    _zz_80[0] = _zz_79;
  end

  assign _zz_81 = _zz_201[11];
  always @ (*) begin
    _zz_82[18] = _zz_81;
    _zz_82[17] = _zz_81;
    _zz_82[16] = _zz_81;
    _zz_82[15] = _zz_81;
    _zz_82[14] = _zz_81;
    _zz_82[13] = _zz_81;
    _zz_82[12] = _zz_81;
    _zz_82[11] = _zz_81;
    _zz_82[10] = _zz_81;
    _zz_82[9] = _zz_81;
    _zz_82[8] = _zz_81;
    _zz_82[7] = _zz_81;
    _zz_82[6] = _zz_81;
    _zz_82[5] = _zz_81;
    _zz_82[4] = _zz_81;
    _zz_82[3] = _zz_81;
    _zz_82[2] = _zz_81;
    _zz_82[1] = _zz_81;
    _zz_82[0] = _zz_81;
  end

  assign IBusSimplePlugin_predictionJumpInterface_payload = (decode_PC + ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) ? {{_zz_80,{{{_zz_252,_zz_253},_zz_254},decode_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_82,{{{_zz_255,_zz_256},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0}));
  assign iBus_cmd_valid = IBusSimplePlugin_cmd_valid;
  assign IBusSimplePlugin_cmd_ready = iBus_cmd_ready;
  assign iBus_cmd_payload_pc = IBusSimplePlugin_cmd_payload_pc;
  assign IBusSimplePlugin_pending_next = (_zz_202 - _zz_206);
  assign IBusSimplePlugin_cmdFork_canEmit = (IBusSimplePlugin_iBusRsp_stages_0_output_ready && (IBusSimplePlugin_pending_value != 3'b111));
  assign IBusSimplePlugin_cmd_valid = (IBusSimplePlugin_iBusRsp_stages_0_input_valid && IBusSimplePlugin_cmdFork_canEmit);
  assign IBusSimplePlugin_pending_inc = (IBusSimplePlugin_cmd_valid && IBusSimplePlugin_cmd_ready);
  assign IBusSimplePlugin_cmd_payload_pc = {IBusSimplePlugin_iBusRsp_stages_0_input_payload[31 : 2],2'b00};
  assign IBusSimplePlugin_rspJoin_rspBuffer_flush = ((IBusSimplePlugin_rspJoin_rspBuffer_discardCounter != 3'b000) || IBusSimplePlugin_iBusRsp_flush);
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_valid = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter == 3'b000));
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error;
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst;
  assign _zz_136 = (IBusSimplePlugin_rspJoin_rspBuffer_output_ready || IBusSimplePlugin_rspJoin_rspBuffer_flush);
  assign IBusSimplePlugin_pending_dec = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && _zz_136);
  assign IBusSimplePlugin_rspJoin_fetchRsp_pc = IBusSimplePlugin_iBusRsp_stages_1_output_payload;
  always @ (*) begin
    IBusSimplePlugin_rspJoin_fetchRsp_rsp_error = IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error;
    if((! IBusSimplePlugin_rspJoin_rspBuffer_output_valid))begin
      IBusSimplePlugin_rspJoin_fetchRsp_rsp_error = 1'b0;
    end
  end

  assign IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst = IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst;
  assign IBusSimplePlugin_rspJoin_exceptionDetected = 1'b0;
  assign IBusSimplePlugin_rspJoin_join_valid = (IBusSimplePlugin_iBusRsp_stages_1_output_valid && IBusSimplePlugin_rspJoin_rspBuffer_output_valid);
  assign IBusSimplePlugin_rspJoin_join_payload_pc = IBusSimplePlugin_rspJoin_fetchRsp_pc;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_error = IBusSimplePlugin_rspJoin_fetchRsp_rsp_error;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_inst = IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst;
  assign IBusSimplePlugin_rspJoin_join_payload_isRvc = IBusSimplePlugin_rspJoin_fetchRsp_isRvc;
  assign IBusSimplePlugin_iBusRsp_stages_1_output_ready = (IBusSimplePlugin_iBusRsp_stages_1_output_valid ? (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_ready) : IBusSimplePlugin_rspJoin_join_ready);
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_ready = (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_ready);
  assign _zz_83 = (! IBusSimplePlugin_rspJoin_exceptionDetected);
  assign IBusSimplePlugin_rspJoin_join_ready = (IBusSimplePlugin_iBusRsp_output_ready && _zz_83);
  assign IBusSimplePlugin_iBusRsp_output_valid = (IBusSimplePlugin_rspJoin_join_valid && _zz_83);
  assign IBusSimplePlugin_iBusRsp_output_payload_pc = IBusSimplePlugin_rspJoin_join_payload_pc;
  assign IBusSimplePlugin_iBusRsp_output_payload_rsp_error = IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  assign IBusSimplePlugin_iBusRsp_output_payload_rsp_inst = IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  assign IBusSimplePlugin_iBusRsp_output_payload_isRvc = IBusSimplePlugin_rspJoin_join_payload_isRvc;
  assign _zz_84 = 1'b0;
  always @ (*) begin
    execute_DBusSimplePlugin_skipCmd = 1'b0;
    if(execute_ALIGNEMENT_FAULT)begin
      execute_DBusSimplePlugin_skipCmd = 1'b1;
    end
  end

  assign dBus_cmd_valid = (((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! execute_arbitration_isStuckByOthers)) && (! execute_arbitration_isFlushed)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_84));
  assign dBus_cmd_payload_wr = execute_MEMORY_STORE;
  assign dBus_cmd_payload_size = execute_INSTRUCTION[13 : 12];
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_85 = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_85 = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_85 = execute_RS2[31 : 0];
      end
    endcase
  end

  assign dBus_cmd_payload_data = _zz_85;
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_86 = 4'b0001;
      end
      2'b01 : begin
        _zz_86 = 4'b0011;
      end
      default : begin
        _zz_86 = 4'b1111;
      end
    endcase
  end

  assign execute_DBusSimplePlugin_formalMask = (_zz_86 <<< dBus_cmd_payload_address[1 : 0]);
  assign dBus_cmd_payload_address = execute_SRC_ADD;
  always @ (*) begin
    memory_DBusSimplePlugin_rspShifted = memory_MEMORY_READ_DATA;
    case(memory_MEMORY_ADDRESS_LOW)
      2'b01 : begin
        memory_DBusSimplePlugin_rspShifted[7 : 0] = memory_MEMORY_READ_DATA[15 : 8];
      end
      2'b10 : begin
        memory_DBusSimplePlugin_rspShifted[15 : 0] = memory_MEMORY_READ_DATA[31 : 16];
      end
      2'b11 : begin
        memory_DBusSimplePlugin_rspShifted[7 : 0] = memory_MEMORY_READ_DATA[31 : 24];
      end
      default : begin
      end
    endcase
  end

  assign _zz_87 = (memory_DBusSimplePlugin_rspShifted[7] && (! memory_INSTRUCTION[14]));
  always @ (*) begin
    _zz_88[31] = _zz_87;
    _zz_88[30] = _zz_87;
    _zz_88[29] = _zz_87;
    _zz_88[28] = _zz_87;
    _zz_88[27] = _zz_87;
    _zz_88[26] = _zz_87;
    _zz_88[25] = _zz_87;
    _zz_88[24] = _zz_87;
    _zz_88[23] = _zz_87;
    _zz_88[22] = _zz_87;
    _zz_88[21] = _zz_87;
    _zz_88[20] = _zz_87;
    _zz_88[19] = _zz_87;
    _zz_88[18] = _zz_87;
    _zz_88[17] = _zz_87;
    _zz_88[16] = _zz_87;
    _zz_88[15] = _zz_87;
    _zz_88[14] = _zz_87;
    _zz_88[13] = _zz_87;
    _zz_88[12] = _zz_87;
    _zz_88[11] = _zz_87;
    _zz_88[10] = _zz_87;
    _zz_88[9] = _zz_87;
    _zz_88[8] = _zz_87;
    _zz_88[7 : 0] = memory_DBusSimplePlugin_rspShifted[7 : 0];
  end

  assign _zz_89 = (memory_DBusSimplePlugin_rspShifted[15] && (! memory_INSTRUCTION[14]));
  always @ (*) begin
    _zz_90[31] = _zz_89;
    _zz_90[30] = _zz_89;
    _zz_90[29] = _zz_89;
    _zz_90[28] = _zz_89;
    _zz_90[27] = _zz_89;
    _zz_90[26] = _zz_89;
    _zz_90[25] = _zz_89;
    _zz_90[24] = _zz_89;
    _zz_90[23] = _zz_89;
    _zz_90[22] = _zz_89;
    _zz_90[21] = _zz_89;
    _zz_90[20] = _zz_89;
    _zz_90[19] = _zz_89;
    _zz_90[18] = _zz_89;
    _zz_90[17] = _zz_89;
    _zz_90[16] = _zz_89;
    _zz_90[15 : 0] = memory_DBusSimplePlugin_rspShifted[15 : 0];
  end

  always @ (*) begin
    case(_zz_159)
      2'b00 : begin
        memory_DBusSimplePlugin_rspFormated = _zz_88;
      end
      2'b01 : begin
        memory_DBusSimplePlugin_rspFormated = _zz_90;
      end
      default : begin
        memory_DBusSimplePlugin_rspFormated = memory_DBusSimplePlugin_rspShifted;
      end
    endcase
  end

  assign _zz_92 = ((decode_INSTRUCTION & 32'h00000020) == 32'h0);
  assign _zz_93 = ((decode_INSTRUCTION & 32'h00000004) == 32'h00000004);
  assign _zz_94 = ((decode_INSTRUCTION & 32'h00000048) == 32'h00000048);
  assign _zz_95 = ((decode_INSTRUCTION & 32'h00001000) == 32'h0);
  assign _zz_91 = {({_zz_94,(_zz_257 == _zz_258)} != 2'b00),{((_zz_259 == _zz_260) != 1'b0),{(_zz_261 != 1'b0),{(_zz_262 != _zz_263),{_zz_264,{_zz_265,_zz_266}}}}}};
  assign _zz_96 = _zz_91[1 : 0];
  assign _zz_35 = _zz_96;
  assign _zz_97 = _zz_91[6 : 5];
  assign _zz_34 = _zz_97;
  assign _zz_98 = _zz_91[13 : 12];
  assign _zz_33 = _zz_98;
  assign _zz_99 = _zz_91[16 : 15];
  assign _zz_32 = _zz_99;
  assign _zz_100 = _zz_91[19 : 18];
  assign _zz_31 = _zz_100;
  assign _zz_101 = _zz_91[26 : 25];
  assign _zz_30 = _zz_101;
  assign decode_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION[19 : 15];
  assign decode_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION[24 : 20];
  assign decode_RegFilePlugin_rs1Data = _zz_138;
  assign decode_RegFilePlugin_rs2Data = _zz_139;
  assign lastStageRegFileWrite_valid = (_zz_28 && writeBack_arbitration_isFiring);
  assign lastStageRegFileWrite_payload_address = _zz_27[11 : 7];
  assign lastStageRegFileWrite_payload_data = _zz_26;
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
        _zz_102 = execute_IntAluPlugin_bitwise;
      end
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : begin
        _zz_102 = {31'd0, _zz_211};
      end
      default : begin
        _zz_102 = execute_SRC_ADD_SUB;
      end
    endcase
  end

  always @ (*) begin
    case(execute_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : begin
        _zz_103 = execute_RS1;
      end
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : begin
        _zz_103 = {29'd0, _zz_212};
      end
      `Src1CtrlEnum_defaultEncoding_IMU : begin
        _zz_103 = {execute_INSTRUCTION[31 : 12],12'h0};
      end
      default : begin
        _zz_103 = {27'd0, _zz_213};
      end
    endcase
  end

  assign _zz_104 = _zz_214[11];
  always @ (*) begin
    _zz_105[19] = _zz_104;
    _zz_105[18] = _zz_104;
    _zz_105[17] = _zz_104;
    _zz_105[16] = _zz_104;
    _zz_105[15] = _zz_104;
    _zz_105[14] = _zz_104;
    _zz_105[13] = _zz_104;
    _zz_105[12] = _zz_104;
    _zz_105[11] = _zz_104;
    _zz_105[10] = _zz_104;
    _zz_105[9] = _zz_104;
    _zz_105[8] = _zz_104;
    _zz_105[7] = _zz_104;
    _zz_105[6] = _zz_104;
    _zz_105[5] = _zz_104;
    _zz_105[4] = _zz_104;
    _zz_105[3] = _zz_104;
    _zz_105[2] = _zz_104;
    _zz_105[1] = _zz_104;
    _zz_105[0] = _zz_104;
  end

  assign _zz_106 = _zz_215[11];
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

  always @ (*) begin
    case(execute_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : begin
        _zz_108 = execute_RS2;
      end
      `Src2CtrlEnum_defaultEncoding_IMI : begin
        _zz_108 = {_zz_105,execute_INSTRUCTION[31 : 20]};
      end
      `Src2CtrlEnum_defaultEncoding_IMS : begin
        _zz_108 = {_zz_107,{execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_108 = _zz_21;
      end
    endcase
  end

  always @ (*) begin
    execute_SrcPlugin_addSub = _zz_216;
    if(execute_SRC2_FORCE_ZERO)begin
      execute_SrcPlugin_addSub = execute_SRC1;
    end
  end

  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign execute_FullBarrelShifterPlugin_amplitude = execute_SRC2[4 : 0];
  always @ (*) begin
    _zz_109[0] = execute_SRC1[31];
    _zz_109[1] = execute_SRC1[30];
    _zz_109[2] = execute_SRC1[29];
    _zz_109[3] = execute_SRC1[28];
    _zz_109[4] = execute_SRC1[27];
    _zz_109[5] = execute_SRC1[26];
    _zz_109[6] = execute_SRC1[25];
    _zz_109[7] = execute_SRC1[24];
    _zz_109[8] = execute_SRC1[23];
    _zz_109[9] = execute_SRC1[22];
    _zz_109[10] = execute_SRC1[21];
    _zz_109[11] = execute_SRC1[20];
    _zz_109[12] = execute_SRC1[19];
    _zz_109[13] = execute_SRC1[18];
    _zz_109[14] = execute_SRC1[17];
    _zz_109[15] = execute_SRC1[16];
    _zz_109[16] = execute_SRC1[15];
    _zz_109[17] = execute_SRC1[14];
    _zz_109[18] = execute_SRC1[13];
    _zz_109[19] = execute_SRC1[12];
    _zz_109[20] = execute_SRC1[11];
    _zz_109[21] = execute_SRC1[10];
    _zz_109[22] = execute_SRC1[9];
    _zz_109[23] = execute_SRC1[8];
    _zz_109[24] = execute_SRC1[7];
    _zz_109[25] = execute_SRC1[6];
    _zz_109[26] = execute_SRC1[5];
    _zz_109[27] = execute_SRC1[4];
    _zz_109[28] = execute_SRC1[3];
    _zz_109[29] = execute_SRC1[2];
    _zz_109[30] = execute_SRC1[1];
    _zz_109[31] = execute_SRC1[0];
  end

  assign execute_FullBarrelShifterPlugin_reversed = ((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SLL_1) ? _zz_109 : execute_SRC1);
  always @ (*) begin
    _zz_110[0] = execute_SHIFT_RIGHT[31];
    _zz_110[1] = execute_SHIFT_RIGHT[30];
    _zz_110[2] = execute_SHIFT_RIGHT[29];
    _zz_110[3] = execute_SHIFT_RIGHT[28];
    _zz_110[4] = execute_SHIFT_RIGHT[27];
    _zz_110[5] = execute_SHIFT_RIGHT[26];
    _zz_110[6] = execute_SHIFT_RIGHT[25];
    _zz_110[7] = execute_SHIFT_RIGHT[24];
    _zz_110[8] = execute_SHIFT_RIGHT[23];
    _zz_110[9] = execute_SHIFT_RIGHT[22];
    _zz_110[10] = execute_SHIFT_RIGHT[21];
    _zz_110[11] = execute_SHIFT_RIGHT[20];
    _zz_110[12] = execute_SHIFT_RIGHT[19];
    _zz_110[13] = execute_SHIFT_RIGHT[18];
    _zz_110[14] = execute_SHIFT_RIGHT[17];
    _zz_110[15] = execute_SHIFT_RIGHT[16];
    _zz_110[16] = execute_SHIFT_RIGHT[15];
    _zz_110[17] = execute_SHIFT_RIGHT[14];
    _zz_110[18] = execute_SHIFT_RIGHT[13];
    _zz_110[19] = execute_SHIFT_RIGHT[12];
    _zz_110[20] = execute_SHIFT_RIGHT[11];
    _zz_110[21] = execute_SHIFT_RIGHT[10];
    _zz_110[22] = execute_SHIFT_RIGHT[9];
    _zz_110[23] = execute_SHIFT_RIGHT[8];
    _zz_110[24] = execute_SHIFT_RIGHT[7];
    _zz_110[25] = execute_SHIFT_RIGHT[6];
    _zz_110[26] = execute_SHIFT_RIGHT[5];
    _zz_110[27] = execute_SHIFT_RIGHT[4];
    _zz_110[28] = execute_SHIFT_RIGHT[3];
    _zz_110[29] = execute_SHIFT_RIGHT[2];
    _zz_110[30] = execute_SHIFT_RIGHT[1];
    _zz_110[31] = execute_SHIFT_RIGHT[0];
  end

  always @ (*) begin
    _zz_111 = 1'b0;
    if(_zz_146)begin
      if(_zz_147)begin
        if(_zz_116)begin
          _zz_111 = 1'b1;
        end
      end
    end
    if(_zz_148)begin
      if(_zz_149)begin
        if(_zz_118)begin
          _zz_111 = 1'b1;
        end
      end
    end
    if(_zz_150)begin
      if(_zz_151)begin
        if(_zz_120)begin
          _zz_111 = 1'b1;
        end
      end
    end
    if((! decode_RS1_USE))begin
      _zz_111 = 1'b0;
    end
  end

  always @ (*) begin
    _zz_112 = 1'b0;
    if(_zz_146)begin
      if(_zz_147)begin
        if(_zz_117)begin
          _zz_112 = 1'b1;
        end
      end
    end
    if(_zz_148)begin
      if(_zz_149)begin
        if(_zz_119)begin
          _zz_112 = 1'b1;
        end
      end
    end
    if(_zz_150)begin
      if(_zz_151)begin
        if(_zz_121)begin
          _zz_112 = 1'b1;
        end
      end
    end
    if((! decode_RS2_USE))begin
      _zz_112 = 1'b0;
    end
  end

  assign _zz_116 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_117 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign _zz_118 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_119 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign _zz_120 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_121 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign execute_MulPlugin_a = execute_RS1;
  assign execute_MulPlugin_b = execute_RS2;
  always @ (*) begin
    case(_zz_152)
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
    case(_zz_152)
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
  assign writeBack_MulPlugin_result = ($signed(_zz_223) + $signed(_zz_224));
  assign memory_DivPlugin_frontendOk = 1'b1;
  always @ (*) begin
    memory_DivPlugin_div_counter_willIncrement = 1'b0;
    if(_zz_144)begin
      if(_zz_153)begin
        memory_DivPlugin_div_counter_willIncrement = 1'b1;
      end
    end
  end

  always @ (*) begin
    memory_DivPlugin_div_counter_willClear = 1'b0;
    if(_zz_154)begin
      memory_DivPlugin_div_counter_willClear = 1'b1;
    end
  end

  assign memory_DivPlugin_div_counter_willOverflowIfInc = (memory_DivPlugin_div_counter_value == 6'h21);
  assign memory_DivPlugin_div_counter_willOverflow = (memory_DivPlugin_div_counter_willOverflowIfInc && memory_DivPlugin_div_counter_willIncrement);
  always @ (*) begin
    if(memory_DivPlugin_div_counter_willOverflow)begin
      memory_DivPlugin_div_counter_valueNext = 6'h0;
    end else begin
      memory_DivPlugin_div_counter_valueNext = (memory_DivPlugin_div_counter_value + _zz_228);
    end
    if(memory_DivPlugin_div_counter_willClear)begin
      memory_DivPlugin_div_counter_valueNext = 6'h0;
    end
  end

  assign _zz_122 = memory_DivPlugin_rs1[31 : 0];
  assign memory_DivPlugin_div_stage_0_remainderShifted = {memory_DivPlugin_accumulator[31 : 0],_zz_122[31]};
  assign memory_DivPlugin_div_stage_0_remainderMinusDenominator = (memory_DivPlugin_div_stage_0_remainderShifted - _zz_229);
  assign memory_DivPlugin_div_stage_0_outRemainder = ((! memory_DivPlugin_div_stage_0_remainderMinusDenominator[32]) ? _zz_230 : _zz_231);
  assign memory_DivPlugin_div_stage_0_outNumerator = _zz_232[31:0];
  assign _zz_123 = (memory_INSTRUCTION[13] ? memory_DivPlugin_accumulator[31 : 0] : memory_DivPlugin_rs1[31 : 0]);
  assign _zz_124 = (execute_RS2[31] && execute_IS_RS2_SIGNED);
  assign _zz_125 = (1'b0 || ((execute_IS_DIV && execute_RS1[31]) && execute_IS_RS1_SIGNED));
  always @ (*) begin
    _zz_126[32] = (execute_IS_RS1_SIGNED && execute_RS1[31]);
    _zz_126[31 : 0] = execute_RS1;
  end

  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign _zz_127 = execute_INSTRUCTION[14 : 12];
  always @ (*) begin
    if((_zz_127 == 3'b000)) begin
        _zz_128 = execute_BranchPlugin_eq;
    end else if((_zz_127 == 3'b001)) begin
        _zz_128 = (! execute_BranchPlugin_eq);
    end else if((((_zz_127 & 3'b101) == 3'b101))) begin
        _zz_128 = (! execute_SRC_LESS);
    end else begin
        _zz_128 = execute_SRC_LESS;
    end
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : begin
        _zz_129 = 1'b0;
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_129 = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_129 = 1'b1;
      end
      default : begin
        _zz_129 = _zz_128;
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

  assign _zz_130 = _zz_242[11];
  always @ (*) begin
    _zz_131[19] = _zz_130;
    _zz_131[18] = _zz_130;
    _zz_131[17] = _zz_130;
    _zz_131[16] = _zz_130;
    _zz_131[15] = _zz_130;
    _zz_131[14] = _zz_130;
    _zz_131[13] = _zz_130;
    _zz_131[12] = _zz_130;
    _zz_131[11] = _zz_130;
    _zz_131[10] = _zz_130;
    _zz_131[9] = _zz_130;
    _zz_131[8] = _zz_130;
    _zz_131[7] = _zz_130;
    _zz_131[6] = _zz_130;
    _zz_131[5] = _zz_130;
    _zz_131[4] = _zz_130;
    _zz_131[3] = _zz_130;
    _zz_131[2] = _zz_130;
    _zz_131[1] = _zz_130;
    _zz_131[0] = _zz_130;
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        execute_BranchPlugin_branch_src2 = {_zz_131,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        execute_BranchPlugin_branch_src2 = ((execute_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) ? {{_zz_133,{{{_zz_354,execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_135,{{{_zz_355,_zz_356},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0});
        if(execute_PREDICTION_HAD_BRANCHED2)begin
          execute_BranchPlugin_branch_src2 = {29'd0, _zz_245};
        end
      end
    endcase
  end

  assign _zz_132 = _zz_243[19];
  always @ (*) begin
    _zz_133[10] = _zz_132;
    _zz_133[9] = _zz_132;
    _zz_133[8] = _zz_132;
    _zz_133[7] = _zz_132;
    _zz_133[6] = _zz_132;
    _zz_133[5] = _zz_132;
    _zz_133[4] = _zz_132;
    _zz_133[3] = _zz_132;
    _zz_133[2] = _zz_132;
    _zz_133[1] = _zz_132;
    _zz_133[0] = _zz_132;
  end

  assign _zz_134 = _zz_244[11];
  always @ (*) begin
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

  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign BranchPlugin_jumpInterface_valid = ((execute_arbitration_isValid && execute_BRANCH_DO) && (! 1'b0));
  assign BranchPlugin_jumpInterface_payload = execute_BRANCH_CALC;
  assign IBusSimplePlugin_decodePrediction_rsp_wasWrong = BranchPlugin_jumpInterface_valid;
  assign _zz_17 = decode_SRC1_CTRL;
  assign _zz_15 = _zz_35;
  assign _zz_23 = decode_to_execute_SRC1_CTRL;
  assign _zz_14 = decode_SRC2_CTRL;
  assign _zz_12 = _zz_34;
  assign _zz_22 = decode_to_execute_SRC2_CTRL;
  assign _zz_11 = decode_ALU_CTRL;
  assign _zz_9 = _zz_33;
  assign _zz_24 = decode_to_execute_ALU_CTRL;
  assign _zz_8 = decode_ALU_BITWISE_CTRL;
  assign _zz_6 = _zz_32;
  assign _zz_25 = decode_to_execute_ALU_BITWISE_CTRL;
  assign _zz_5 = decode_SHIFT_CTRL;
  assign _zz_3 = _zz_31;
  assign _zz_20 = decode_to_execute_SHIFT_CTRL;
  assign _zz_2 = decode_BRANCH_CTRL;
  assign _zz_37 = _zz_30;
  assign _zz_18 = decode_to_execute_BRANCH_CTRL;
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
  assign _zz_137 = 1'b0;
  always @ (posedge clk) begin
    if (reset) begin
      IBusSimplePlugin_fetchPc_pcReg <= externalResetVector;
      IBusSimplePlugin_fetchPc_correctionReg <= 1'b0;
      IBusSimplePlugin_fetchPc_booted <= 1'b0;
      IBusSimplePlugin_fetchPc_inc <= 1'b0;
      IBusSimplePlugin_decodePc_pcReg <= externalResetVector;
      _zz_44 <= 1'b0;
      IBusSimplePlugin_decompressor_bufferValid <= 1'b0;
      IBusSimplePlugin_decompressor_throw2BytesReg <= 1'b0;
      _zz_72 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      IBusSimplePlugin_pending_value <= 3'b000;
      IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= 3'b000;
      _zz_113 <= 1'b0;
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
      if(_zz_145)begin
        IBusSimplePlugin_decodePc_pcReg <= IBusSimplePlugin_jump_pcLoad_payload;
      end
      if(IBusSimplePlugin_iBusRsp_flush)begin
        _zz_44 <= 1'b0;
      end
      if(_zz_42)begin
        _zz_44 <= (IBusSimplePlugin_iBusRsp_stages_0_output_valid && (! 1'b0));
      end
      if((IBusSimplePlugin_decompressor_output_valid && IBusSimplePlugin_decompressor_output_ready))begin
        IBusSimplePlugin_decompressor_throw2BytesReg <= ((((! IBusSimplePlugin_decompressor_unaligned) && IBusSimplePlugin_decompressor_isInputLowRvc) && IBusSimplePlugin_decompressor_isInputHighRvc) || (IBusSimplePlugin_decompressor_bufferValid && IBusSimplePlugin_decompressor_isInputHighRvc));
      end
      if((IBusSimplePlugin_decompressor_output_ready && IBusSimplePlugin_decompressor_input_valid))begin
        IBusSimplePlugin_decompressor_bufferValid <= 1'b0;
      end
      if(_zz_155)begin
        if(IBusSimplePlugin_decompressor_bufferFill)begin
          IBusSimplePlugin_decompressor_bufferValid <= 1'b1;
        end
      end
      if((IBusSimplePlugin_externalFlush || IBusSimplePlugin_decompressor_consumeCurrent))begin
        IBusSimplePlugin_decompressor_throw2BytesReg <= 1'b0;
        IBusSimplePlugin_decompressor_bufferValid <= 1'b0;
      end
      if(decode_arbitration_removeIt)begin
        _zz_72 <= 1'b0;
      end
      if(IBusSimplePlugin_decompressor_output_ready)begin
        _zz_72 <= (IBusSimplePlugin_decompressor_output_valid && (! IBusSimplePlugin_externalFlush));
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
      IBusSimplePlugin_pending_value <= IBusSimplePlugin_pending_next;
      IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter - _zz_208);
      if(IBusSimplePlugin_iBusRsp_flush)begin
        IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= (IBusSimplePlugin_pending_value - _zz_210);
      end
      _zz_113 <= (_zz_28 && writeBack_arbitration_isFiring);
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
    if(_zz_155)begin
      IBusSimplePlugin_decompressor_bufferData <= IBusSimplePlugin_decompressor_input_payload_rsp_inst[31 : 16];
    end
    if(IBusSimplePlugin_decompressor_output_ready)begin
      _zz_73 <= IBusSimplePlugin_decompressor_output_payload_pc;
      _zz_74 <= IBusSimplePlugin_decompressor_output_payload_rsp_error;
      _zz_75 <= IBusSimplePlugin_decompressor_output_payload_rsp_inst;
      _zz_76 <= IBusSimplePlugin_decompressor_output_payload_isRvc;
    end
    if(IBusSimplePlugin_injector_decodeInput_ready)begin
      IBusSimplePlugin_injector_formal_rawInDecode <= IBusSimplePlugin_decompressor_raw;
    end
    _zz_114 <= _zz_27[11 : 7];
    _zz_115 <= _zz_26;
    if((memory_DivPlugin_div_counter_value == 6'h20))begin
      memory_DivPlugin_div_done <= 1'b1;
    end
    if((! memory_arbitration_isStuck))begin
      memory_DivPlugin_div_done <= 1'b0;
    end
    if(_zz_144)begin
      if(_zz_153)begin
        memory_DivPlugin_rs1[31 : 0] <= memory_DivPlugin_div_stage_0_outNumerator;
        memory_DivPlugin_accumulator[31 : 0] <= memory_DivPlugin_div_stage_0_outRemainder;
        if((memory_DivPlugin_div_counter_value == 6'h20))begin
          memory_DivPlugin_div_result <= _zz_233[31:0];
        end
      end
    end
    if(_zz_154)begin
      memory_DivPlugin_accumulator <= 65'h0;
      memory_DivPlugin_rs1 <= ((_zz_125 ? (~ _zz_126) : _zz_126) + _zz_239);
      memory_DivPlugin_rs2 <= ((_zz_124 ? (~ execute_RS2) : execute_RS2) + _zz_241);
      memory_DivPlugin_div_needRevert <= ((_zz_125 ^ (_zz_124 && (! execute_INSTRUCTION[13]))) && (! (((execute_RS2 == 32'h0) && execute_IS_RS2_SIGNED) && (! execute_INSTRUCTION[13]))));
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PC <= decode_PC;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_PC <= _zz_21;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_PC <= memory_PC;
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
      decode_to_execute_IS_RVC <= decode_IS_RVC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_FORMAL_PC_NEXT <= _zz_38;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC1_CTRL <= _zz_16;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_ENABLE <= decode_MEMORY_ENABLE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ENABLE <= execute_MEMORY_ENABLE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_CTRL <= _zz_13;
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
      decode_to_execute_BYPASSABLE_EXECUTE_STAGE <= decode_BYPASSABLE_EXECUTE_STAGE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BYPASSABLE_MEMORY_STAGE <= decode_BYPASSABLE_MEMORY_STAGE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BYPASSABLE_MEMORY_STAGE <= execute_BYPASSABLE_MEMORY_STAGE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_STORE <= decode_MEMORY_STORE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_STORE <= execute_MEMORY_STORE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_CTRL <= _zz_10;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_7;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SHIFT_CTRL <= _zz_4;
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
      decode_to_execute_IS_DIV <= decode_IS_DIV;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_IS_DIV <= execute_IS_DIV;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RS1_SIGNED <= decode_IS_RS1_SIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RS2_SIGNED <= decode_IS_RS2_SIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BRANCH_CTRL <= _zz_1;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS1 <= decode_RS1;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS2 <= decode_RS2;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_FORCE_ZERO <= decode_SRC2_FORCE_ZERO;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PREDICTION_HAD_BRANCHED2 <= decode_PREDICTION_HAD_BRANCHED2;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ADDRESS_LOW <= execute_MEMORY_ADDRESS_LOW;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_REGFILE_WRITE_DATA <= _zz_19;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_REGFILE_WRITE_DATA <= _zz_36;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_LL <= execute_MUL_LL;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_LH <= execute_MUL_LH;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_HL <= execute_MUL_HL;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_HH <= execute_MUL_HH;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MUL_HH <= memory_MUL_HH;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MUL_LOW <= memory_MUL_LOW;
    end
  end


endmodule

`undef BranchCtrlEnum_defaultEncoding_type
`undef BranchCtrlEnum_defaultEncoding_INC
`undef BranchCtrlEnum_defaultEncoding_B
`undef BranchCtrlEnum_defaultEncoding_JAL
`undef BranchCtrlEnum_defaultEncoding_JALR

`undef ShiftCtrlEnum_defaultEncoding_type
`undef ShiftCtrlEnum_defaultEncoding_DISABLE_1
`undef ShiftCtrlEnum_defaultEncoding_SLL_1
`undef ShiftCtrlEnum_defaultEncoding_SRL_1
`undef ShiftCtrlEnum_defaultEncoding_SRA_1

`undef AluBitwiseCtrlEnum_defaultEncoding_type
`undef AluBitwiseCtrlEnum_defaultEncoding_XOR_1
`undef AluBitwiseCtrlEnum_defaultEncoding_OR_1
`undef AluBitwiseCtrlEnum_defaultEncoding_AND_1

`undef AluCtrlEnum_defaultEncoding_type
`undef AluCtrlEnum_defaultEncoding_ADD_SUB
`undef AluCtrlEnum_defaultEncoding_SLT_SLTU
`undef AluCtrlEnum_defaultEncoding_BITWISE

`undef Src2CtrlEnum_defaultEncoding_type
`undef Src2CtrlEnum_defaultEncoding_RS
`undef Src2CtrlEnum_defaultEncoding_IMI
`undef Src2CtrlEnum_defaultEncoding_IMS
`undef Src2CtrlEnum_defaultEncoding_PC

`undef Src1CtrlEnum_defaultEncoding_type
`undef Src1CtrlEnum_defaultEncoding_RS
`undef Src1CtrlEnum_defaultEncoding_IMU
`undef Src1CtrlEnum_defaultEncoding_PC_INCREMENT
`undef Src1CtrlEnum_defaultEncoding_URS1

module StreamFifoLowLatency (
  input               io_push_valid,
  output              io_push_ready,
  input               io_push_payload_error,
  input      [31:0]   io_push_payload_inst,
  output reg          io_pop_valid,
  input               io_pop_ready,
  output reg          io_pop_payload_error,
  output reg [31:0]   io_pop_payload_inst,
  input               io_flush,
  output     [0:0]    io_occupancy,
  input               clk,
  input               reset
);
  wire                _zz_4;
  wire       [0:0]    _zz_5;
  reg                 _zz_1;
  reg                 pushPtr_willIncrement;
  reg                 pushPtr_willClear;
  wire                pushPtr_willOverflowIfInc;
  wire                pushPtr_willOverflow;
  reg                 popPtr_willIncrement;
  reg                 popPtr_willClear;
  wire                popPtr_willOverflowIfInc;
  wire                popPtr_willOverflow;
  wire                ptrMatch;
  reg                 risingOccupancy;
  wire                empty;
  wire                full;
  wire                pushing;
  wire                popping;
  wire       [32:0]   _zz_2;
  reg        [32:0]   _zz_3;

  assign _zz_4 = (! empty);
  assign _zz_5 = _zz_2[0 : 0];
  always @ (*) begin
    _zz_1 = 1'b0;
    if(pushing)begin
      _zz_1 = 1'b1;
    end
  end

  always @ (*) begin
    pushPtr_willIncrement = 1'b0;
    if(pushing)begin
      pushPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    pushPtr_willClear = 1'b0;
    if(io_flush)begin
      pushPtr_willClear = 1'b1;
    end
  end

  assign pushPtr_willOverflowIfInc = 1'b1;
  assign pushPtr_willOverflow = (pushPtr_willOverflowIfInc && pushPtr_willIncrement);
  always @ (*) begin
    popPtr_willIncrement = 1'b0;
    if(popping)begin
      popPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    popPtr_willClear = 1'b0;
    if(io_flush)begin
      popPtr_willClear = 1'b1;
    end
  end

  assign popPtr_willOverflowIfInc = 1'b1;
  assign popPtr_willOverflow = (popPtr_willOverflowIfInc && popPtr_willIncrement);
  assign ptrMatch = 1'b1;
  assign empty = (ptrMatch && (! risingOccupancy));
  assign full = (ptrMatch && risingOccupancy);
  assign pushing = (io_push_valid && io_push_ready);
  assign popping = (io_pop_valid && io_pop_ready);
  assign io_push_ready = (! full);
  always @ (*) begin
    if(_zz_4)begin
      io_pop_valid = 1'b1;
    end else begin
      io_pop_valid = io_push_valid;
    end
  end

  assign _zz_2 = _zz_3;
  always @ (*) begin
    if(_zz_4)begin
      io_pop_payload_error = _zz_5[0];
    end else begin
      io_pop_payload_error = io_push_payload_error;
    end
  end

  always @ (*) begin
    if(_zz_4)begin
      io_pop_payload_inst = _zz_2[32 : 1];
    end else begin
      io_pop_payload_inst = io_push_payload_inst;
    end
  end

  assign io_occupancy = (risingOccupancy && ptrMatch);
  always @ (posedge clk) begin
    if (reset) begin
      risingOccupancy <= 1'b0;
    end else begin
      if((pushing != popping))begin
        risingOccupancy <= pushing;
      end
      if(io_flush)begin
        risingOccupancy <= 1'b0;
      end
    end
  end

  always @ (posedge clk) begin
    if(_zz_1)begin
      _zz_3 <= {io_push_payload_inst,io_push_payload_error};
    end
  end


endmodule
