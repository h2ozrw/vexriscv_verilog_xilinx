// VexRiscV  492310e6fa66e9d8a47a48ea6dc406fde961dcf8
// SpinalHDL 4e84e91b191e2e608958155e98f2ec7ba0fbed84


`define BranchCtrlEnum_defaultEncoding_type [1:0]
`define BranchCtrlEnum_defaultEncoding_INC 2'b00
`define BranchCtrlEnum_defaultEncoding_B 2'b01
`define BranchCtrlEnum_defaultEncoding_JAL 2'b10
`define BranchCtrlEnum_defaultEncoding_JALR 2'b11

`define AluBitwiseCtrlEnum_defaultEncoding_type [1:0]
`define AluBitwiseCtrlEnum_defaultEncoding_XOR_1 2'b00
`define AluBitwiseCtrlEnum_defaultEncoding_OR_1 2'b01
`define AluBitwiseCtrlEnum_defaultEncoding_AND_1 2'b10

`define Src1CtrlEnum_defaultEncoding_type [1:0]
`define Src1CtrlEnum_defaultEncoding_RS 2'b00
`define Src1CtrlEnum_defaultEncoding_IMU 2'b01
`define Src1CtrlEnum_defaultEncoding_PC_INCREMENT 2'b10
`define Src1CtrlEnum_defaultEncoding_URS1 2'b11

`define ShiftCtrlEnum_defaultEncoding_type [1:0]
`define ShiftCtrlEnum_defaultEncoding_DISABLE_1 2'b00
`define ShiftCtrlEnum_defaultEncoding_SLL_1 2'b01
`define ShiftCtrlEnum_defaultEncoding_SRL_1 2'b10
`define ShiftCtrlEnum_defaultEncoding_SRA_1 2'b11

`define AluCtrlEnum_defaultEncoding_type [1:0]
`define AluCtrlEnum_defaultEncoding_ADD_SUB 2'b00
`define AluCtrlEnum_defaultEncoding_SLT_SLTU 2'b01
`define AluCtrlEnum_defaultEncoding_BITWISE 2'b10

`define Src2CtrlEnum_defaultEncoding_type [1:0]
`define Src2CtrlEnum_defaultEncoding_RS 2'b00
`define Src2CtrlEnum_defaultEncoding_IMI 2'b01
`define Src2CtrlEnum_defaultEncoding_IMS 2'b10
`define Src2CtrlEnum_defaultEncoding_PC 2'b11

`define EnvCtrlEnum_defaultEncoding_type [0:0]
`define EnvCtrlEnum_defaultEncoding_NONE 1'b0
`define EnvCtrlEnum_defaultEncoding_XRET 1'b1


module rv32imc_axi4 (
  input      [31:0]   externalResetVector,
  input               timerInterrupt,
  input               externalInterrupt,
  input               softwareInterrupt,
  output              iBusAxi_ar_valid,
  input               iBusAxi_ar_ready,
  output     [31:0]   iBusAxi_ar_payload_addr,
  output     [0:0]    iBusAxi_ar_payload_id,
  output     [3:0]    iBusAxi_ar_payload_region,
  output     [7:0]    iBusAxi_ar_payload_len,
  output     [2:0]    iBusAxi_ar_payload_size,
  output     [1:0]    iBusAxi_ar_payload_burst,
  output     [0:0]    iBusAxi_ar_payload_lock,
  output     [3:0]    iBusAxi_ar_payload_cache,
  output     [3:0]    iBusAxi_ar_payload_qos,
  output     [2:0]    iBusAxi_ar_payload_prot,
  input               iBusAxi_r_valid,
  output              iBusAxi_r_ready,
  input      [31:0]   iBusAxi_r_payload_data,
  input      [0:0]    iBusAxi_r_payload_id,
  input      [1:0]    iBusAxi_r_payload_resp,
  input               iBusAxi_r_payload_last,
  output              dBusAxi_aw_valid,
  input               dBusAxi_aw_ready,
  output     [31:0]   dBusAxi_aw_payload_addr,
  output     [0:0]    dBusAxi_aw_payload_id,
  output     [3:0]    dBusAxi_aw_payload_region,
  output     [7:0]    dBusAxi_aw_payload_len,
  output     [2:0]    dBusAxi_aw_payload_size,
  output     [1:0]    dBusAxi_aw_payload_burst,
  output     [0:0]    dBusAxi_aw_payload_lock,
  output     [3:0]    dBusAxi_aw_payload_cache,
  output     [3:0]    dBusAxi_aw_payload_qos,
  output     [2:0]    dBusAxi_aw_payload_prot,
  output              dBusAxi_w_valid,
  input               dBusAxi_w_ready,
  output     [31:0]   dBusAxi_w_payload_data,
  output     [3:0]    dBusAxi_w_payload_strb,
  output              dBusAxi_w_payload_last,
  input               dBusAxi_b_valid,
  output              dBusAxi_b_ready,
  input      [0:0]    dBusAxi_b_payload_id,
  input      [1:0]    dBusAxi_b_payload_resp,
  output              dBusAxi_ar_valid,
  input               dBusAxi_ar_ready,
  output     [31:0]   dBusAxi_ar_payload_addr,
  output     [0:0]    dBusAxi_ar_payload_id,
  output     [3:0]    dBusAxi_ar_payload_region,
  output     [7:0]    dBusAxi_ar_payload_len,
  output     [2:0]    dBusAxi_ar_payload_size,
  output     [1:0]    dBusAxi_ar_payload_burst,
  output     [0:0]    dBusAxi_ar_payload_lock,
  output     [3:0]    dBusAxi_ar_payload_cache,
  output     [3:0]    dBusAxi_ar_payload_qos,
  output     [2:0]    dBusAxi_ar_payload_prot,
  input               dBusAxi_r_valid,
  output              dBusAxi_r_ready,
  input      [31:0]   dBusAxi_r_payload_data,
  input      [0:0]    dBusAxi_r_payload_id,
  input      [1:0]    dBusAxi_r_payload_resp,
  input               dBusAxi_r_payload_last,
  input               clk,
  input               reset
);
  wire                _zz_176;
  wire                _zz_177;
  wire                _zz_178;
  wire                _zz_179;
  wire                _zz_180;
  wire                _zz_181;
  wire                _zz_182;
  reg                 _zz_183;
  wire                _zz_184;
  wire       [31:0]   _zz_185;
  wire                _zz_186;
  wire       [31:0]   _zz_187;
  reg                 _zz_188;
  wire                _zz_189;
  wire                _zz_190;
  wire       [31:0]   _zz_191;
  wire                _zz_192;
  wire                _zz_193;
  reg                 _zz_194;
  reg                 _zz_195;
  wire       [31:0]   _zz_196;
  wire       [31:0]   _zz_197;
  reg        [31:0]   _zz_198;
  wire                IBusCachedPlugin_cache_io_cpu_prefetch_haltIt;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_fetch_data;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_fetch_physicalAddress;
  wire                IBusCachedPlugin_cache_io_cpu_fetch_haltIt;
  wire                IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_isValid;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_virtualAddress;
  wire                IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_bypassTranslation;
  wire                IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_end;
  wire                IBusCachedPlugin_cache_io_cpu_decode_error;
  wire                IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling;
  wire                IBusCachedPlugin_cache_io_cpu_decode_mmuException;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_decode_data;
  wire                IBusCachedPlugin_cache_io_cpu_decode_cacheMiss;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_decode_physicalAddress;
  wire                IBusCachedPlugin_cache_io_mem_cmd_valid;
  wire       [31:0]   IBusCachedPlugin_cache_io_mem_cmd_payload_address;
  wire       [2:0]    IBusCachedPlugin_cache_io_mem_cmd_payload_size;
  wire                dataCache_1_io_cpu_memory_isWrite;
  wire                dataCache_1_io_cpu_memory_mmuBus_cmd_isValid;
  wire       [31:0]   dataCache_1_io_cpu_memory_mmuBus_cmd_virtualAddress;
  wire                dataCache_1_io_cpu_memory_mmuBus_cmd_bypassTranslation;
  wire                dataCache_1_io_cpu_memory_mmuBus_end;
  wire                dataCache_1_io_cpu_writeBack_haltIt;
  wire       [31:0]   dataCache_1_io_cpu_writeBack_data;
  wire                dataCache_1_io_cpu_writeBack_mmuException;
  wire                dataCache_1_io_cpu_writeBack_unalignedAccess;
  wire                dataCache_1_io_cpu_writeBack_accessError;
  wire                dataCache_1_io_cpu_writeBack_isWrite;
  wire                dataCache_1_io_cpu_flush_ready;
  wire                dataCache_1_io_cpu_redo;
  wire                dataCache_1_io_mem_cmd_valid;
  wire                dataCache_1_io_mem_cmd_payload_wr;
  wire       [31:0]   dataCache_1_io_mem_cmd_payload_address;
  wire       [31:0]   dataCache_1_io_mem_cmd_payload_data;
  wire       [3:0]    dataCache_1_io_mem_cmd_payload_mask;
  wire       [2:0]    dataCache_1_io_mem_cmd_payload_length;
  wire                dataCache_1_io_mem_cmd_payload_last;
  wire                streamFork_1_io_input_ready;
  wire                streamFork_1_io_outputs_0_valid;
  wire                streamFork_1_io_outputs_0_payload_wr;
  wire       [31:0]   streamFork_1_io_outputs_0_payload_address;
  wire       [31:0]   streamFork_1_io_outputs_0_payload_data;
  wire       [3:0]    streamFork_1_io_outputs_0_payload_mask;
  wire       [2:0]    streamFork_1_io_outputs_0_payload_length;
  wire                streamFork_1_io_outputs_0_payload_last;
  wire                streamFork_1_io_outputs_1_valid;
  wire                streamFork_1_io_outputs_1_payload_wr;
  wire       [31:0]   streamFork_1_io_outputs_1_payload_address;
  wire       [31:0]   streamFork_1_io_outputs_1_payload_data;
  wire       [3:0]    streamFork_1_io_outputs_1_payload_mask;
  wire       [2:0]    streamFork_1_io_outputs_1_payload_length;
  wire                streamFork_1_io_outputs_1_payload_last;
  wire                _zz_199;
  wire                _zz_200;
  wire                _zz_201;
  wire                _zz_202;
  wire                _zz_203;
  wire                _zz_204;
  wire                _zz_205;
  wire                _zz_206;
  wire                _zz_207;
  wire                _zz_208;
  wire       [1:0]    _zz_209;
  wire                _zz_210;
  wire       [1:0]    _zz_211;
  wire                _zz_212;
  wire                _zz_213;
  wire                _zz_214;
  wire                _zz_215;
  wire                _zz_216;
  wire                _zz_217;
  wire                _zz_218;
  wire                _zz_219;
  wire                _zz_220;
  wire                _zz_221;
  wire                _zz_222;
  wire                _zz_223;
  wire                _zz_224;
  wire                _zz_225;
  wire       [4:0]    _zz_226;
  wire       [1:0]    _zz_227;
  wire       [1:0]    _zz_228;
  wire       [1:0]    _zz_229;
  wire       [1:0]    _zz_230;
  wire                _zz_231;
  wire       [0:0]    _zz_232;
  wire       [2:0]    _zz_233;
  wire       [31:0]   _zz_234;
  wire       [0:0]    _zz_235;
  wire       [0:0]    _zz_236;
  wire       [0:0]    _zz_237;
  wire       [0:0]    _zz_238;
  wire       [0:0]    _zz_239;
  wire       [51:0]   _zz_240;
  wire       [51:0]   _zz_241;
  wire       [51:0]   _zz_242;
  wire       [32:0]   _zz_243;
  wire       [51:0]   _zz_244;
  wire       [49:0]   _zz_245;
  wire       [51:0]   _zz_246;
  wire       [49:0]   _zz_247;
  wire       [51:0]   _zz_248;
  wire       [32:0]   _zz_249;
  wire       [31:0]   _zz_250;
  wire       [32:0]   _zz_251;
  wire       [0:0]    _zz_252;
  wire       [0:0]    _zz_253;
  wire       [0:0]    _zz_254;
  wire       [0:0]    _zz_255;
  wire       [0:0]    _zz_256;
  wire       [0:0]    _zz_257;
  wire       [0:0]    _zz_258;
  wire       [0:0]    _zz_259;
  wire       [0:0]    _zz_260;
  wire       [0:0]    _zz_261;
  wire       [0:0]    _zz_262;
  wire       [3:0]    _zz_263;
  wire       [2:0]    _zz_264;
  wire       [31:0]   _zz_265;
  wire       [2:0]    _zz_266;
  wire       [31:0]   _zz_267;
  wire       [31:0]   _zz_268;
  wire       [11:0]   _zz_269;
  wire       [11:0]   _zz_270;
  wire       [11:0]   _zz_271;
  wire       [31:0]   _zz_272;
  wire       [19:0]   _zz_273;
  wire       [11:0]   _zz_274;
  wire       [0:0]    _zz_275;
  wire       [2:0]    _zz_276;
  wire       [4:0]    _zz_277;
  wire       [11:0]   _zz_278;
  wire       [11:0]   _zz_279;
  wire       [31:0]   _zz_280;
  wire       [31:0]   _zz_281;
  wire       [31:0]   _zz_282;
  wire       [31:0]   _zz_283;
  wire       [31:0]   _zz_284;
  wire       [31:0]   _zz_285;
  wire       [31:0]   _zz_286;
  wire       [65:0]   _zz_287;
  wire       [65:0]   _zz_288;
  wire       [31:0]   _zz_289;
  wire       [31:0]   _zz_290;
  wire       [0:0]    _zz_291;
  wire       [5:0]    _zz_292;
  wire       [32:0]   _zz_293;
  wire       [32:0]   _zz_294;
  wire       [31:0]   _zz_295;
  wire       [31:0]   _zz_296;
  wire       [32:0]   _zz_297;
  wire       [32:0]   _zz_298;
  wire       [32:0]   _zz_299;
  wire       [0:0]    _zz_300;
  wire       [32:0]   _zz_301;
  wire       [0:0]    _zz_302;
  wire       [32:0]   _zz_303;
  wire       [0:0]    _zz_304;
  wire       [31:0]   _zz_305;
  wire       [11:0]   _zz_306;
  wire       [19:0]   _zz_307;
  wire       [11:0]   _zz_308;
  wire       [2:0]    _zz_309;
  wire       [0:0]    _zz_310;
  wire       [0:0]    _zz_311;
  wire       [0:0]    _zz_312;
  wire       [0:0]    _zz_313;
  wire       [0:0]    _zz_314;
  wire       [0:0]    _zz_315;
  wire       [1:0]    _zz_316;
  wire                _zz_317;
  wire                _zz_318;
  wire       [6:0]    _zz_319;
  wire       [4:0]    _zz_320;
  wire                _zz_321;
  wire       [4:0]    _zz_322;
  wire       [0:0]    _zz_323;
  wire       [7:0]    _zz_324;
  wire                _zz_325;
  wire       [0:0]    _zz_326;
  wire       [0:0]    _zz_327;
  wire       [31:0]   _zz_328;
  wire       [31:0]   _zz_329;
  wire       [31:0]   _zz_330;
  wire       [0:0]    _zz_331;
  wire       [2:0]    _zz_332;
  wire       [0:0]    _zz_333;
  wire       [0:0]    _zz_334;
  wire                _zz_335;
  wire       [0:0]    _zz_336;
  wire       [24:0]   _zz_337;
  wire       [31:0]   _zz_338;
  wire       [31:0]   _zz_339;
  wire       [31:0]   _zz_340;
  wire                _zz_341;
  wire                _zz_342;
  wire       [31:0]   _zz_343;
  wire       [31:0]   _zz_344;
  wire       [0:0]    _zz_345;
  wire       [0:0]    _zz_346;
  wire       [0:0]    _zz_347;
  wire       [0:0]    _zz_348;
  wire                _zz_349;
  wire       [0:0]    _zz_350;
  wire       [21:0]   _zz_351;
  wire       [31:0]   _zz_352;
  wire       [31:0]   _zz_353;
  wire       [0:0]    _zz_354;
  wire       [2:0]    _zz_355;
  wire                _zz_356;
  wire       [1:0]    _zz_357;
  wire       [1:0]    _zz_358;
  wire                _zz_359;
  wire       [0:0]    _zz_360;
  wire       [18:0]   _zz_361;
  wire       [31:0]   _zz_362;
  wire       [31:0]   _zz_363;
  wire       [31:0]   _zz_364;
  wire                _zz_365;
  wire                _zz_366;
  wire       [31:0]   _zz_367;
  wire       [31:0]   _zz_368;
  wire       [31:0]   _zz_369;
  wire       [31:0]   _zz_370;
  wire       [31:0]   _zz_371;
  wire       [31:0]   _zz_372;
  wire       [0:0]    _zz_373;
  wire       [0:0]    _zz_374;
  wire       [1:0]    _zz_375;
  wire       [1:0]    _zz_376;
  wire                _zz_377;
  wire       [0:0]    _zz_378;
  wire       [15:0]   _zz_379;
  wire       [31:0]   _zz_380;
  wire       [31:0]   _zz_381;
  wire       [31:0]   _zz_382;
  wire       [31:0]   _zz_383;
  wire       [31:0]   _zz_384;
  wire       [31:0]   _zz_385;
  wire                _zz_386;
  wire       [0:0]    _zz_387;
  wire       [0:0]    _zz_388;
  wire       [0:0]    _zz_389;
  wire       [0:0]    _zz_390;
  wire                _zz_391;
  wire       [0:0]    _zz_392;
  wire       [13:0]   _zz_393;
  wire       [31:0]   _zz_394;
  wire       [31:0]   _zz_395;
  wire                _zz_396;
  wire       [0:0]    _zz_397;
  wire       [2:0]    _zz_398;
  wire       [5:0]    _zz_399;
  wire       [5:0]    _zz_400;
  wire                _zz_401;
  wire       [0:0]    _zz_402;
  wire       [10:0]   _zz_403;
  wire       [31:0]   _zz_404;
  wire       [31:0]   _zz_405;
  wire                _zz_406;
  wire                _zz_407;
  wire                _zz_408;
  wire       [0:0]    _zz_409;
  wire       [2:0]    _zz_410;
  wire                _zz_411;
  wire                _zz_412;
  wire       [0:0]    _zz_413;
  wire       [1:0]    _zz_414;
  wire       [0:0]    _zz_415;
  wire       [0:0]    _zz_416;
  wire                _zz_417;
  wire       [0:0]    _zz_418;
  wire       [7:0]    _zz_419;
  wire       [31:0]   _zz_420;
  wire       [31:0]   _zz_421;
  wire       [31:0]   _zz_422;
  wire       [31:0]   _zz_423;
  wire       [31:0]   _zz_424;
  wire                _zz_425;
  wire       [0:0]    _zz_426;
  wire       [0:0]    _zz_427;
  wire       [31:0]   _zz_428;
  wire       [31:0]   _zz_429;
  wire       [31:0]   _zz_430;
  wire       [31:0]   _zz_431;
  wire                _zz_432;
  wire                _zz_433;
  wire       [31:0]   _zz_434;
  wire       [31:0]   _zz_435;
  wire                _zz_436;
  wire       [0:0]    _zz_437;
  wire       [0:0]    _zz_438;
  wire                _zz_439;
  wire       [0:0]    _zz_440;
  wire       [5:0]    _zz_441;
  wire       [31:0]   _zz_442;
  wire       [31:0]   _zz_443;
  wire       [31:0]   _zz_444;
  wire       [31:0]   _zz_445;
  wire       [31:0]   _zz_446;
  wire       [31:0]   _zz_447;
  wire       [31:0]   _zz_448;
  wire       [31:0]   _zz_449;
  wire       [31:0]   _zz_450;
  wire       [31:0]   _zz_451;
  wire                _zz_452;
  wire       [0:0]    _zz_453;
  wire       [0:0]    _zz_454;
  wire                _zz_455;
  wire       [0:0]    _zz_456;
  wire       [3:0]    _zz_457;
  wire       [31:0]   _zz_458;
  wire                _zz_459;
  wire       [0:0]    _zz_460;
  wire       [0:0]    _zz_461;
  wire       [0:0]    _zz_462;
  wire       [0:0]    _zz_463;
  wire       [0:0]    _zz_464;
  wire       [0:0]    _zz_465;
  wire                _zz_466;
  wire       [0:0]    _zz_467;
  wire       [0:0]    _zz_468;
  wire       [31:0]   _zz_469;
  wire       [31:0]   _zz_470;
  wire       [31:0]   _zz_471;
  wire       [31:0]   _zz_472;
  wire       [31:0]   _zz_473;
  wire                _zz_474;
  wire                _zz_475;
  wire       [0:0]    _zz_476;
  wire       [0:0]    _zz_477;
  wire       [0:0]    _zz_478;
  wire       [0:0]    _zz_479;
  wire                _zz_480;
  wire                _zz_481;
  wire                _zz_482;
  wire                decode_CSR_WRITE_OPCODE;
  wire                decode_MEMORY_MANAGMENT;
  wire       [31:0]   execute_REGFILE_WRITE_DATA;
  wire       [31:0]   writeBack_FORMAL_PC_NEXT;
  wire       [31:0]   memory_FORMAL_PC_NEXT;
  wire       [31:0]   execute_FORMAL_PC_NEXT;
  wire       [31:0]   decode_FORMAL_PC_NEXT;
  wire                decode_IS_CSR;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_1;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_2;
  wire                decode_IS_DIV;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type decode_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_3;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_4;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_5;
  wire       [33:0]   execute_MUL_HL;
  wire                decode_SRC_LESS_UNSIGNED;
  wire                execute_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_MEMORY_STAGE;
  wire       [1:0]    memory_MEMORY_ADDRESS_LOW;
  wire       [1:0]    execute_MEMORY_ADDRESS_LOW;
  wire       `Src1CtrlEnum_defaultEncoding_type decode_SRC1_CTRL;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_6;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_7;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_8;
  wire       [33:0]   execute_MUL_LH;
  wire                decode_SRC2_FORCE_ZERO;
  wire       [31:0]   execute_MUL_LL;
  wire                decode_BYPASSABLE_EXECUTE_STAGE;
  wire                execute_BRANCH_DO;
  wire       [51:0]   memory_MUL_LOW;
  wire       [31:0]   execute_SHIFT_RIGHT;
  wire       [33:0]   memory_MUL_HH;
  wire       [33:0]   execute_MUL_HH;
  wire                decode_IS_RS2_SIGNED;
  wire       [31:0]   execute_BRANCH_CALC;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_9;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_10;
  wire       `ShiftCtrlEnum_defaultEncoding_type decode_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_11;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_12;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_13;
  wire                decode_CSR_READ_OPCODE;
  wire       `AluCtrlEnum_defaultEncoding_type decode_ALU_CTRL;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_14;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_15;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_16;
  wire                decode_MEMORY_WR;
  wire       `Src2CtrlEnum_defaultEncoding_type decode_SRC2_CTRL;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_17;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_18;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_19;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_20;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_21;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_22;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_23;
  wire       `EnvCtrlEnum_defaultEncoding_type decode_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_24;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_25;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_26;
  wire                decode_PREDICTION_HAD_BRANCHED2;
  wire       [31:0]   memory_PC;
  wire                decode_IS_RS1_SIGNED;
  wire                memory_IS_MUL;
  wire                execute_IS_MUL;
  wire                decode_IS_MUL;
  wire                execute_CSR_READ_OPCODE;
  wire                execute_CSR_WRITE_OPCODE;
  wire                execute_IS_CSR;
  wire       `EnvCtrlEnum_defaultEncoding_type memory_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_27;
  wire       `EnvCtrlEnum_defaultEncoding_type execute_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_28;
  wire       `EnvCtrlEnum_defaultEncoding_type writeBack_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_29;
  wire       [31:0]   memory_BRANCH_CALC;
  wire                memory_BRANCH_DO;
  wire       [31:0]   execute_PC;
  wire                execute_BRANCH_COND_RESULT;
  wire                execute_PREDICTION_HAD_BRANCHED2;
  wire       `BranchCtrlEnum_defaultEncoding_type execute_BRANCH_CTRL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_30;
  wire                decode_RS2_USE;
  wire                decode_RS1_USE;
  reg        [31:0]   _zz_31;
  wire                execute_REGFILE_WRITE_VALID;
  wire                execute_BYPASSABLE_EXECUTE_STAGE;
  wire                memory_REGFILE_WRITE_VALID;
  wire                memory_BYPASSABLE_MEMORY_STAGE;
  wire                writeBack_REGFILE_WRITE_VALID;
  reg        [31:0]   decode_RS2;
  reg        [31:0]   decode_RS1;
  wire                execute_IS_RS1_SIGNED;
  wire                execute_IS_DIV;
  wire                execute_IS_RS2_SIGNED;
  wire       [31:0]   memory_INSTRUCTION;
  wire                memory_IS_DIV;
  wire                writeBack_IS_MUL;
  wire       [33:0]   writeBack_MUL_HH;
  wire       [51:0]   writeBack_MUL_LOW;
  wire       [33:0]   memory_MUL_HL;
  wire       [33:0]   memory_MUL_LH;
  wire       [31:0]   memory_MUL_LL;
  (* keep , syn_keep *) wire       [31:0]   execute_RS1;
  wire       [31:0]   memory_SHIFT_RIGHT;
  reg        [31:0]   _zz_32;
  wire       `ShiftCtrlEnum_defaultEncoding_type memory_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_33;
  wire       `ShiftCtrlEnum_defaultEncoding_type execute_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_34;
  wire                execute_SRC_LESS_UNSIGNED;
  wire                execute_SRC2_FORCE_ZERO;
  wire                execute_SRC_USE_SUB_LESS;
  wire       [31:0]   _zz_35;
  wire       `Src2CtrlEnum_defaultEncoding_type execute_SRC2_CTRL;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_36;
  wire                execute_IS_RVC;
  wire       `Src1CtrlEnum_defaultEncoding_type execute_SRC1_CTRL;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_37;
  wire                decode_SRC_USE_SUB_LESS;
  wire                decode_SRC_ADD_ZERO;
  wire       [31:0]   execute_SRC_ADD_SUB;
  wire                execute_SRC_LESS;
  wire       `AluCtrlEnum_defaultEncoding_type execute_ALU_CTRL;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_38;
  wire       [31:0]   execute_SRC2;
  wire       [31:0]   execute_SRC1;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type execute_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_39;
  wire       [31:0]   _zz_40;
  wire                _zz_41;
  reg                 _zz_42;
  reg                 decode_REGFILE_WRITE_VALID;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_43;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_44;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_45;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_46;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_47;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_48;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_49;
  reg        [31:0]   _zz_50;
  wire       [1:0]    writeBack_MEMORY_ADDRESS_LOW;
  wire       [31:0]   writeBack_REGFILE_WRITE_DATA;
  wire                writeBack_MEMORY_ENABLE;
  wire       [31:0]   memory_REGFILE_WRITE_DATA;
  wire                memory_MEMORY_ENABLE;
  wire                execute_MEMORY_MANAGMENT;
  (* keep , syn_keep *) wire       [31:0]   execute_RS2;
  wire                execute_MEMORY_WR;
  wire       [31:0]   execute_SRC_ADD;
  wire                execute_MEMORY_ENABLE;
  wire       [31:0]   execute_INSTRUCTION;
  wire                decode_MEMORY_ENABLE;
  wire                decode_FLUSH_ALL;
  reg                 _zz_51;
  reg                 _zz_51_0;
  wire       `BranchCtrlEnum_defaultEncoding_type decode_BRANCH_CTRL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_52;
  wire       [31:0]   decode_INSTRUCTION;
  reg        [31:0]   _zz_53;
  reg        [31:0]   _zz_54;
  wire       [31:0]   decode_PC;
  wire                decode_IS_RVC;
  wire       [31:0]   writeBack_PC;
  wire       [31:0]   writeBack_INSTRUCTION;
  reg                 decode_arbitration_haltItself;
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
  reg                 writeBack_arbitration_haltItself;
  wire                writeBack_arbitration_haltByOther;
  reg                 writeBack_arbitration_removeIt;
  reg                 writeBack_arbitration_flushIt;
  reg                 writeBack_arbitration_flushNext;
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
  reg                 IBusCachedPlugin_fetcherHalt;
  reg                 IBusCachedPlugin_incomingInstruction;
  wire                IBusCachedPlugin_predictionJumpInterface_valid;
  (* keep , syn_keep *) wire       [31:0]   IBusCachedPlugin_predictionJumpInterface_payload;
  wire                IBusCachedPlugin_decodePrediction_cmd_hadBranch;
  wire                IBusCachedPlugin_decodePrediction_rsp_wasWrong;
  wire                IBusCachedPlugin_pcValids_0;
  wire                IBusCachedPlugin_pcValids_1;
  wire                IBusCachedPlugin_pcValids_2;
  wire                IBusCachedPlugin_pcValids_3;
  wire                IBusCachedPlugin_mmuBus_cmd_isValid;
  wire       [31:0]   IBusCachedPlugin_mmuBus_cmd_virtualAddress;
  wire                IBusCachedPlugin_mmuBus_cmd_bypassTranslation;
  wire       [31:0]   IBusCachedPlugin_mmuBus_rsp_physicalAddress;
  wire                IBusCachedPlugin_mmuBus_rsp_isIoAccess;
  wire                IBusCachedPlugin_mmuBus_rsp_allowRead;
  wire                IBusCachedPlugin_mmuBus_rsp_allowWrite;
  wire                IBusCachedPlugin_mmuBus_rsp_allowExecute;
  wire                IBusCachedPlugin_mmuBus_rsp_exception;
  wire                IBusCachedPlugin_mmuBus_rsp_refilling;
  wire                IBusCachedPlugin_mmuBus_end;
  wire                IBusCachedPlugin_mmuBus_busy;
  wire                DBusCachedPlugin_mmuBus_cmd_isValid;
  wire       [31:0]   DBusCachedPlugin_mmuBus_cmd_virtualAddress;
  wire                DBusCachedPlugin_mmuBus_cmd_bypassTranslation;
  wire       [31:0]   DBusCachedPlugin_mmuBus_rsp_physicalAddress;
  wire                DBusCachedPlugin_mmuBus_rsp_isIoAccess;
  wire                DBusCachedPlugin_mmuBus_rsp_allowRead;
  wire                DBusCachedPlugin_mmuBus_rsp_allowWrite;
  wire                DBusCachedPlugin_mmuBus_rsp_allowExecute;
  wire                DBusCachedPlugin_mmuBus_rsp_exception;
  wire                DBusCachedPlugin_mmuBus_rsp_refilling;
  wire                DBusCachedPlugin_mmuBus_end;
  wire                DBusCachedPlugin_mmuBus_busy;
  reg                 DBusCachedPlugin_redoBranch_valid;
  wire       [31:0]   DBusCachedPlugin_redoBranch_payload;
  wire                BranchPlugin_jumpInterface_valid;
  wire       [31:0]   BranchPlugin_jumpInterface_payload;
  wire                CsrPlugin_inWfi;
  wire                CsrPlugin_thirdPartyWake;
  reg                 CsrPlugin_jumpInterface_valid;
  reg        [31:0]   CsrPlugin_jumpInterface_payload;
  wire                CsrPlugin_exceptionPendings_0;
  wire                CsrPlugin_exceptionPendings_1;
  wire                CsrPlugin_exceptionPendings_2;
  wire                CsrPlugin_exceptionPendings_3;
  wire                contextSwitching;
  reg        [1:0]    CsrPlugin_privilege;
  wire                CsrPlugin_forceMachineWire;
  wire                CsrPlugin_allowInterrupts;
  wire                CsrPlugin_allowException;
  wire                IBusCachedPlugin_fetcherflushIt;
  wire                IBusCachedPlugin_jump_pcLoad_valid;
  wire       [31:0]   IBusCachedPlugin_jump_pcLoad_payload;
  wire       [3:0]    _zz_55;
  wire       [3:0]    _zz_56;
  wire                _zz_57;
  wire                _zz_58;
  wire                _zz_59;
  wire                IBusCachedPlugin_fetchPc_output_valid;
  wire                IBusCachedPlugin_fetchPc_output_ready;
  wire       [31:0]   IBusCachedPlugin_fetchPc_output_payload;
  reg        [31:0]   IBusCachedPlugin_fetchPc_pcReg;
  reg                 IBusCachedPlugin_fetchPc_correction;
  reg                 IBusCachedPlugin_fetchPc_correctionReg;
  wire                IBusCachedPlugin_fetchPc_corrected;
  reg                 IBusCachedPlugin_fetchPc_pcRegPropagate;
  reg                 IBusCachedPlugin_fetchPc_booted;
  reg                 IBusCachedPlugin_fetchPc_inc;
  reg        [31:0]   IBusCachedPlugin_fetchPc_pc;
  wire                IBusCachedPlugin_fetchPc_redo_valid;
  reg        [31:0]   IBusCachedPlugin_fetchPc_redo_payload;
  reg                 IBusCachedPlugin_fetchPc_flushed;
  reg                 IBusCachedPlugin_decodePc_flushed;
  reg        [31:0]   IBusCachedPlugin_decodePc_pcReg;
  wire       [31:0]   IBusCachedPlugin_decodePc_pcPlus;
  wire                IBusCachedPlugin_decodePc_injectedDecode;
  reg                 IBusCachedPlugin_iBusRsp_redoFetch;
  wire                IBusCachedPlugin_iBusRsp_stages_0_input_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_0_input_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_0_input_payload;
  wire                IBusCachedPlugin_iBusRsp_stages_0_output_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_0_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_0_output_payload;
  reg                 IBusCachedPlugin_iBusRsp_stages_0_halt;
  wire                IBusCachedPlugin_iBusRsp_stages_0_flush;
  wire                IBusCachedPlugin_iBusRsp_stages_1_input_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_1_input_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  wire                IBusCachedPlugin_iBusRsp_stages_1_output_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_1_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_1_output_payload;
  reg                 IBusCachedPlugin_iBusRsp_stages_1_halt;
  wire                IBusCachedPlugin_iBusRsp_stages_1_flush;
  wire                IBusCachedPlugin_iBusRsp_stages_2_input_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_2_input_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_2_input_payload;
  wire                IBusCachedPlugin_iBusRsp_stages_2_output_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_2_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_2_output_payload;
  reg                 IBusCachedPlugin_iBusRsp_stages_2_halt;
  wire                IBusCachedPlugin_iBusRsp_stages_2_flush;
  wire                _zz_60;
  wire                _zz_61;
  wire                _zz_62;
  wire                _zz_63;
  wire                _zz_64;
  reg                 _zz_65;
  wire                _zz_66;
  reg                 _zz_67;
  reg        [31:0]   _zz_68;
  wire                IBusCachedPlugin_iBusRsp_readyForError;
  wire                IBusCachedPlugin_iBusRsp_output_valid;
  wire                IBusCachedPlugin_iBusRsp_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_output_payload_pc;
  wire                IBusCachedPlugin_iBusRsp_output_payload_rsp_error;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_output_payload_rsp_inst;
  wire                IBusCachedPlugin_iBusRsp_output_payload_isRvc;
  wire                IBusCachedPlugin_decompressor_input_valid;
  wire                IBusCachedPlugin_decompressor_input_ready;
  wire       [31:0]   IBusCachedPlugin_decompressor_input_payload_pc;
  wire                IBusCachedPlugin_decompressor_input_payload_rsp_error;
  wire       [31:0]   IBusCachedPlugin_decompressor_input_payload_rsp_inst;
  wire                IBusCachedPlugin_decompressor_input_payload_isRvc;
  wire                IBusCachedPlugin_decompressor_output_valid;
  wire                IBusCachedPlugin_decompressor_output_ready;
  wire       [31:0]   IBusCachedPlugin_decompressor_output_payload_pc;
  wire                IBusCachedPlugin_decompressor_output_payload_rsp_error;
  wire       [31:0]   IBusCachedPlugin_decompressor_output_payload_rsp_inst;
  wire                IBusCachedPlugin_decompressor_output_payload_isRvc;
  wire                IBusCachedPlugin_decompressor_consumeCurrent;
  reg                 IBusCachedPlugin_decompressor_bufferValid;
  reg        [15:0]   IBusCachedPlugin_decompressor_bufferData;
  wire                IBusCachedPlugin_decompressor_isInputLowRvc;
  wire                IBusCachedPlugin_decompressor_isInputHighRvc;
  reg                 IBusCachedPlugin_decompressor_throw2BytesReg;
  wire                IBusCachedPlugin_decompressor_throw2Bytes;
  wire                IBusCachedPlugin_decompressor_unaligned;
  wire       [31:0]   IBusCachedPlugin_decompressor_raw;
  wire                IBusCachedPlugin_decompressor_isRvc;
  wire       [15:0]   _zz_69;
  reg        [31:0]   IBusCachedPlugin_decompressor_decompressed;
  wire       [4:0]    _zz_70;
  wire       [4:0]    _zz_71;
  wire       [11:0]   _zz_72;
  wire                _zz_73;
  reg        [11:0]   _zz_74;
  wire                _zz_75;
  reg        [9:0]    _zz_76;
  wire       [20:0]   _zz_77;
  wire                _zz_78;
  reg        [14:0]   _zz_79;
  wire                _zz_80;
  reg        [2:0]    _zz_81;
  wire                _zz_82;
  reg        [9:0]    _zz_83;
  wire       [20:0]   _zz_84;
  wire                _zz_85;
  reg        [4:0]    _zz_86;
  wire       [12:0]   _zz_87;
  wire       [4:0]    _zz_88;
  wire       [4:0]    _zz_89;
  wire       [4:0]    _zz_90;
  wire                _zz_91;
  reg        [2:0]    _zz_92;
  reg        [2:0]    _zz_93;
  wire                _zz_94;
  reg        [6:0]    _zz_95;
  wire                IBusCachedPlugin_decompressor_bufferFill;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_0;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_1;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_2;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_3;
  wire                _zz_96;
  reg        [18:0]   _zz_97;
  wire                _zz_98;
  reg        [10:0]   _zz_99;
  wire                _zz_100;
  reg        [18:0]   _zz_101;
  wire                iBus_cmd_valid;
  wire                iBus_cmd_ready;
  reg        [31:0]   iBus_cmd_payload_address;
  wire       [2:0]    iBus_cmd_payload_size;
  wire                iBus_rsp_valid;
  wire       [31:0]   iBus_rsp_payload_data;
  wire                iBus_rsp_payload_error;
  wire       [31:0]   _zz_102;
  reg        [31:0]   IBusCachedPlugin_rspCounter;
  wire                IBusCachedPlugin_s0_tightlyCoupledHit;
  reg                 IBusCachedPlugin_s1_tightlyCoupledHit;
  reg                 IBusCachedPlugin_s2_tightlyCoupledHit;
  wire                IBusCachedPlugin_rsp_iBusRspOutputHalt;
  wire                IBusCachedPlugin_rsp_issueDetected;
  reg                 IBusCachedPlugin_rsp_redoFetch;
  wire                dBus_cmd_valid;
  wire                dBus_cmd_ready;
  wire                dBus_cmd_payload_wr;
  wire       [31:0]   dBus_cmd_payload_address;
  wire       [31:0]   dBus_cmd_payload_data;
  wire       [3:0]    dBus_cmd_payload_mask;
  wire       [2:0]    dBus_cmd_payload_length;
  wire                dBus_cmd_payload_last;
  wire                dBus_rsp_valid;
  wire       [31:0]   dBus_rsp_payload_data;
  wire                dBus_rsp_payload_error;
  wire       [31:0]   _zz_103;
  reg        [31:0]   DBusCachedPlugin_rspCounter;
  wire       [1:0]    execute_DBusCachedPlugin_size;
  reg        [31:0]   _zz_104;
  reg        [31:0]   writeBack_DBusCachedPlugin_rspShifted;
  wire                _zz_105;
  reg        [31:0]   _zz_106;
  wire                _zz_107;
  reg        [31:0]   _zz_108;
  reg        [31:0]   writeBack_DBusCachedPlugin_rspFormated;
  wire       [30:0]   _zz_109;
  wire                _zz_110;
  wire                _zz_111;
  wire                _zz_112;
  wire                _zz_113;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_114;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_115;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_116;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_117;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_118;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_119;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_120;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress1;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress2;
  wire       [31:0]   decode_RegFilePlugin_rs1Data;
  wire       [31:0]   decode_RegFilePlugin_rs2Data;
  wire                lastStageRegFileWrite_valid;
  wire       [4:0]    lastStageRegFileWrite_payload_address;
  wire       [31:0]   lastStageRegFileWrite_payload_data;
  reg        [31:0]   execute_IntAluPlugin_bitwise;
  reg        [31:0]   _zz_121;
  reg        [31:0]   _zz_122;
  wire                _zz_123;
  reg        [19:0]   _zz_124;
  wire                _zz_125;
  reg        [19:0]   _zz_126;
  reg        [31:0]   _zz_127;
  reg        [31:0]   execute_SrcPlugin_addSub;
  wire                execute_SrcPlugin_less;
  wire       [4:0]    execute_FullBarrelShifterPlugin_amplitude;
  reg        [31:0]   _zz_128;
  wire       [31:0]   execute_FullBarrelShifterPlugin_reversed;
  reg        [31:0]   _zz_129;
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
  wire       [31:0]   _zz_130;
  wire       [32:0]   _zz_131;
  wire       [32:0]   _zz_132;
  wire       [31:0]   _zz_133;
  wire                _zz_134;
  wire                _zz_135;
  reg        [32:0]   _zz_136;
  reg                 _zz_137;
  reg                 _zz_138;
  reg                 _zz_139;
  reg        [4:0]    _zz_140;
  reg        [31:0]   _zz_141;
  wire                _zz_142;
  wire                _zz_143;
  wire                _zz_144;
  wire                _zz_145;
  wire                _zz_146;
  wire                _zz_147;
  wire                execute_BranchPlugin_eq;
  wire       [2:0]    _zz_148;
  reg                 _zz_149;
  reg                 _zz_150;
  wire                execute_BranchPlugin_missAlignedTarget;
  reg        [31:0]   execute_BranchPlugin_branch_src1;
  reg        [31:0]   execute_BranchPlugin_branch_src2;
  wire                _zz_151;
  reg        [19:0]   _zz_152;
  wire                _zz_153;
  reg        [10:0]   _zz_154;
  wire                _zz_155;
  reg        [18:0]   _zz_156;
  wire       [31:0]   execute_BranchPlugin_branchAdder;
  wire       [1:0]    CsrPlugin_misa_base;
  wire       [25:0]   CsrPlugin_misa_extensions;
  wire       [1:0]    CsrPlugin_mtvec_mode;
  wire       [29:0]   CsrPlugin_mtvec_base;
  reg        [31:0]   CsrPlugin_mepc;
  reg                 CsrPlugin_mstatus_MIE;
  reg                 CsrPlugin_mstatus_MPIE;
  reg        [1:0]    CsrPlugin_mstatus_MPP;
  reg                 CsrPlugin_mip_MEIP;
  reg                 CsrPlugin_mip_MTIP;
  reg                 CsrPlugin_mip_MSIP;
  reg                 CsrPlugin_mie_MEIE;
  reg                 CsrPlugin_mie_MTIE;
  reg                 CsrPlugin_mie_MSIE;
  reg                 CsrPlugin_mcause_interrupt;
  reg        [3:0]    CsrPlugin_mcause_exceptionCode;
  reg        [31:0]   CsrPlugin_mtval;
  reg        [63:0]   CsrPlugin_mcycle = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  reg        [63:0]   CsrPlugin_minstret = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  wire                _zz_157;
  wire                _zz_158;
  wire                _zz_159;
  reg                 CsrPlugin_interrupt_valid;
  reg        [3:0]    CsrPlugin_interrupt_code;
  reg        [1:0]    CsrPlugin_interrupt_targetPrivilege;
  wire                CsrPlugin_exception;
  wire                CsrPlugin_lastStageWasWfi;
  reg                 CsrPlugin_pipelineLiberator_pcValids_0;
  reg                 CsrPlugin_pipelineLiberator_pcValids_1;
  reg                 CsrPlugin_pipelineLiberator_pcValids_2;
  wire                CsrPlugin_pipelineLiberator_active;
  reg                 CsrPlugin_pipelineLiberator_done;
  wire                CsrPlugin_interruptJump;
  reg                 CsrPlugin_hadException;
  wire       [1:0]    CsrPlugin_targetPrivilege;
  wire       [3:0]    CsrPlugin_trapCause;
  reg        [1:0]    CsrPlugin_xtvec_mode;
  reg        [29:0]   CsrPlugin_xtvec_base;
  reg                 execute_CsrPlugin_wfiWake;
  wire                execute_CsrPlugin_blockedBySideEffects;
  reg                 execute_CsrPlugin_illegalAccess;
  reg                 execute_CsrPlugin_illegalInstruction;
  reg        [31:0]   execute_CsrPlugin_readData;
  wire                execute_CsrPlugin_writeInstruction;
  wire                execute_CsrPlugin_readInstruction;
  wire                execute_CsrPlugin_writeEnable;
  wire                execute_CsrPlugin_readEnable;
  wire       [31:0]   execute_CsrPlugin_readToWriteData;
  reg        [31:0]   execute_CsrPlugin_writeData;
  wire       [11:0]   execute_CsrPlugin_csrAddress;
  reg                 decode_to_execute_IS_MUL;
  reg                 execute_to_memory_IS_MUL;
  reg                 memory_to_writeBack_IS_MUL;
  reg                 decode_to_execute_IS_RS1_SIGNED;
  reg        [31:0]   decode_to_execute_RS2;
  reg        [31:0]   decode_to_execute_PC;
  reg        [31:0]   execute_to_memory_PC;
  reg        [31:0]   memory_to_writeBack_PC;
  reg                 decode_to_execute_SRC_USE_SUB_LESS;
  reg                 decode_to_execute_PREDICTION_HAD_BRANCHED2;
  reg        `EnvCtrlEnum_defaultEncoding_type decode_to_execute_ENV_CTRL;
  reg        `EnvCtrlEnum_defaultEncoding_type execute_to_memory_ENV_CTRL;
  reg        `EnvCtrlEnum_defaultEncoding_type memory_to_writeBack_ENV_CTRL;
  reg                 decode_to_execute_MEMORY_ENABLE;
  reg                 execute_to_memory_MEMORY_ENABLE;
  reg                 memory_to_writeBack_MEMORY_ENABLE;
  reg        `Src2CtrlEnum_defaultEncoding_type decode_to_execute_SRC2_CTRL;
  reg                 decode_to_execute_MEMORY_WR;
  reg                 decode_to_execute_REGFILE_WRITE_VALID;
  reg                 execute_to_memory_REGFILE_WRITE_VALID;
  reg                 memory_to_writeBack_REGFILE_WRITE_VALID;
  reg        `AluCtrlEnum_defaultEncoding_type decode_to_execute_ALU_CTRL;
  reg                 decode_to_execute_CSR_READ_OPCODE;
  reg        `ShiftCtrlEnum_defaultEncoding_type decode_to_execute_SHIFT_CTRL;
  reg        `ShiftCtrlEnum_defaultEncoding_type execute_to_memory_SHIFT_CTRL;
  reg        [31:0]   execute_to_memory_BRANCH_CALC;
  reg                 decode_to_execute_IS_RS2_SIGNED;
  reg        [33:0]   execute_to_memory_MUL_HH;
  reg        [33:0]   memory_to_writeBack_MUL_HH;
  reg        [31:0]   execute_to_memory_SHIFT_RIGHT;
  reg        [51:0]   memory_to_writeBack_MUL_LOW;
  reg                 execute_to_memory_BRANCH_DO;
  reg                 decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  reg        [31:0]   execute_to_memory_MUL_LL;
  reg        [31:0]   decode_to_execute_RS1;
  reg                 decode_to_execute_SRC2_FORCE_ZERO;
  reg        [33:0]   execute_to_memory_MUL_LH;
  reg        `Src1CtrlEnum_defaultEncoding_type decode_to_execute_SRC1_CTRL;
  reg        [1:0]    execute_to_memory_MEMORY_ADDRESS_LOW;
  reg        [1:0]    memory_to_writeBack_MEMORY_ADDRESS_LOW;
  reg                 decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  reg                 execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  reg        [31:0]   decode_to_execute_INSTRUCTION;
  reg        [31:0]   execute_to_memory_INSTRUCTION;
  reg        [31:0]   memory_to_writeBack_INSTRUCTION;
  reg                 decode_to_execute_SRC_LESS_UNSIGNED;
  reg        [33:0]   execute_to_memory_MUL_HL;
  reg        `AluBitwiseCtrlEnum_defaultEncoding_type decode_to_execute_ALU_BITWISE_CTRL;
  reg                 decode_to_execute_IS_DIV;
  reg                 execute_to_memory_IS_DIV;
  reg                 decode_to_execute_IS_RVC;
  reg        `BranchCtrlEnum_defaultEncoding_type decode_to_execute_BRANCH_CTRL;
  reg                 decode_to_execute_IS_CSR;
  reg        [31:0]   decode_to_execute_FORMAL_PC_NEXT;
  reg        [31:0]   execute_to_memory_FORMAL_PC_NEXT;
  reg        [31:0]   memory_to_writeBack_FORMAL_PC_NEXT;
  reg        [31:0]   execute_to_memory_REGFILE_WRITE_DATA;
  reg        [31:0]   memory_to_writeBack_REGFILE_WRITE_DATA;
  reg                 decode_to_execute_MEMORY_MANAGMENT;
  reg                 decode_to_execute_CSR_WRITE_OPCODE;
  wire       [0:0]    _zz_160;
  wire       [3:0]    _zz_161;
  reg                 _zz_162;
  reg                 _zz_163;
  reg        [2:0]    _zz_164;
  reg        [2:0]    _zz_165;
  wire                _zz_166;
  reg                 _zz_167;
  reg                 streamFork_1_io_outputs_0_thrown_valid;
  wire                streamFork_1_io_outputs_0_thrown_ready;
  wire                streamFork_1_io_outputs_0_thrown_payload_wr;
  wire       [31:0]   streamFork_1_io_outputs_0_thrown_payload_address;
  wire       [31:0]   streamFork_1_io_outputs_0_thrown_payload_data;
  wire       [3:0]    streamFork_1_io_outputs_0_thrown_payload_mask;
  wire       [2:0]    streamFork_1_io_outputs_0_thrown_payload_length;
  wire                streamFork_1_io_outputs_0_thrown_payload_last;
  reg                 streamFork_1_io_outputs_1_thrown_valid;
  wire                streamFork_1_io_outputs_1_thrown_ready;
  wire                streamFork_1_io_outputs_1_thrown_payload_wr;
  wire       [31:0]   streamFork_1_io_outputs_1_thrown_payload_address;
  wire       [31:0]   streamFork_1_io_outputs_1_thrown_payload_data;
  wire       [3:0]    streamFork_1_io_outputs_1_thrown_payload_mask;
  wire       [2:0]    streamFork_1_io_outputs_1_thrown_payload_length;
  wire                streamFork_1_io_outputs_1_thrown_payload_last;
  wire                _zz_168;
  wire       [31:0]   _zz_169;
  wire       [7:0]    _zz_170;
  wire                _zz_171;
  wire       [0:0]    _zz_172;
  wire       [3:0]    _zz_173;
  wire       [0:0]    _zz_174;
  wire       [3:0]    _zz_175;
  `ifndef SYNTHESIS
  reg [31:0] _zz_1_string;
  reg [31:0] _zz_2_string;
  reg [39:0] decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_3_string;
  reg [39:0] _zz_4_string;
  reg [39:0] _zz_5_string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_6_string;
  reg [95:0] _zz_7_string;
  reg [95:0] _zz_8_string;
  reg [71:0] _zz_9_string;
  reg [71:0] _zz_10_string;
  reg [71:0] decode_SHIFT_CTRL_string;
  reg [71:0] _zz_11_string;
  reg [71:0] _zz_12_string;
  reg [71:0] _zz_13_string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_14_string;
  reg [63:0] _zz_15_string;
  reg [63:0] _zz_16_string;
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] _zz_17_string;
  reg [23:0] _zz_18_string;
  reg [23:0] _zz_19_string;
  reg [31:0] _zz_20_string;
  reg [31:0] _zz_21_string;
  reg [31:0] _zz_22_string;
  reg [31:0] _zz_23_string;
  reg [31:0] decode_ENV_CTRL_string;
  reg [31:0] _zz_24_string;
  reg [31:0] _zz_25_string;
  reg [31:0] _zz_26_string;
  reg [31:0] memory_ENV_CTRL_string;
  reg [31:0] _zz_27_string;
  reg [31:0] execute_ENV_CTRL_string;
  reg [31:0] _zz_28_string;
  reg [31:0] writeBack_ENV_CTRL_string;
  reg [31:0] _zz_29_string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] _zz_30_string;
  reg [71:0] memory_SHIFT_CTRL_string;
  reg [71:0] _zz_33_string;
  reg [71:0] execute_SHIFT_CTRL_string;
  reg [71:0] _zz_34_string;
  reg [23:0] execute_SRC2_CTRL_string;
  reg [23:0] _zz_36_string;
  reg [95:0] execute_SRC1_CTRL_string;
  reg [95:0] _zz_37_string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] _zz_38_string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_39_string;
  reg [63:0] _zz_43_string;
  reg [31:0] _zz_44_string;
  reg [95:0] _zz_45_string;
  reg [71:0] _zz_46_string;
  reg [31:0] _zz_47_string;
  reg [39:0] _zz_48_string;
  reg [23:0] _zz_49_string;
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_52_string;
  reg [23:0] _zz_114_string;
  reg [39:0] _zz_115_string;
  reg [31:0] _zz_116_string;
  reg [71:0] _zz_117_string;
  reg [95:0] _zz_118_string;
  reg [31:0] _zz_119_string;
  reg [63:0] _zz_120_string;
  reg [31:0] decode_to_execute_ENV_CTRL_string;
  reg [31:0] execute_to_memory_ENV_CTRL_string;
  reg [31:0] memory_to_writeBack_ENV_CTRL_string;
  reg [23:0] decode_to_execute_SRC2_CTRL_string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  reg [71:0] decode_to_execute_SHIFT_CTRL_string;
  reg [71:0] execute_to_memory_SHIFT_CTRL_string;
  reg [95:0] decode_to_execute_SRC1_CTRL_string;
  reg [39:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  `endif

  reg [31:0] RegFilePlugin_regFile [0:31];

  assign _zz_199 = (execute_arbitration_isValid && execute_IS_CSR);
  assign _zz_200 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign _zz_201 = 1'b1;
  assign _zz_202 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign _zz_203 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign _zz_204 = (memory_arbitration_isValid && memory_IS_DIV);
  assign _zz_205 = ((_zz_180 && IBusCachedPlugin_cache_io_cpu_decode_cacheMiss) && (! _zz_51_0));
  assign _zz_206 = ((_zz_180 && IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling) && (! IBusCachedPlugin_rsp_issueDetected));
  assign _zz_207 = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign _zz_208 = (writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET));
  assign _zz_209 = writeBack_INSTRUCTION[29 : 28];
  assign _zz_210 = (IBusCachedPlugin_jump_pcLoad_valid && ((! decode_arbitration_isStuck) || decode_arbitration_removeIt));
  assign _zz_211 = execute_INSTRUCTION[13 : 12];
  assign _zz_212 = (memory_DivPlugin_frontendOk && (! memory_DivPlugin_div_done));
  assign _zz_213 = (! memory_arbitration_isStuck);
  assign _zz_214 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign _zz_215 = (1'b0 || (! 1'b1));
  assign _zz_216 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign _zz_217 = (1'b0 || (! memory_BYPASSABLE_MEMORY_STAGE));
  assign _zz_218 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign _zz_219 = (1'b0 || (! execute_BYPASSABLE_EXECUTE_STAGE));
  assign _zz_220 = (! streamFork_1_io_outputs_1_payload_wr);
  assign _zz_221 = (IBusCachedPlugin_decompressor_output_ready && IBusCachedPlugin_decompressor_input_valid);
  assign _zz_222 = (CsrPlugin_mstatus_MIE || (CsrPlugin_privilege < 2'b11));
  assign _zz_223 = ((_zz_157 && 1'b1) && (! 1'b0));
  assign _zz_224 = ((_zz_158 && 1'b1) && (! 1'b0));
  assign _zz_225 = ((_zz_159 && 1'b1) && (! 1'b0));
  assign _zz_226 = {_zz_69[1 : 0],_zz_69[15 : 13]};
  assign _zz_227 = _zz_69[6 : 5];
  assign _zz_228 = _zz_69[11 : 10];
  assign _zz_229 = writeBack_INSTRUCTION[13 : 12];
  assign _zz_230 = writeBack_INSTRUCTION[13 : 12];
  assign _zz_231 = execute_INSTRUCTION[13];
  assign _zz_232 = _zz_109[22 : 22];
  assign _zz_233 = (decode_IS_RVC ? 3'b010 : 3'b100);
  assign _zz_234 = {29'd0, _zz_233};
  assign _zz_235 = _zz_109[2 : 2];
  assign _zz_236 = _zz_109[7 : 7];
  assign _zz_237 = _zz_109[21 : 21];
  assign _zz_238 = _zz_109[15 : 15];
  assign _zz_239 = _zz_109[23 : 23];
  assign _zz_240 = ($signed(_zz_241) + $signed(_zz_246));
  assign _zz_241 = ($signed(_zz_242) + $signed(_zz_244));
  assign _zz_242 = 52'h0;
  assign _zz_243 = {1'b0,memory_MUL_LL};
  assign _zz_244 = {{19{_zz_243[32]}}, _zz_243};
  assign _zz_245 = ({16'd0,memory_MUL_LH} <<< 16);
  assign _zz_246 = {{2{_zz_245[49]}}, _zz_245};
  assign _zz_247 = ({16'd0,memory_MUL_HL} <<< 16);
  assign _zz_248 = {{2{_zz_247[49]}}, _zz_247};
  assign _zz_249 = ($signed(_zz_251) >>> execute_FullBarrelShifterPlugin_amplitude);
  assign _zz_250 = _zz_249[31 : 0];
  assign _zz_251 = {((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SRA_1) && execute_FullBarrelShifterPlugin_reversed[31]),execute_FullBarrelShifterPlugin_reversed};
  assign _zz_252 = _zz_109[27 : 27];
  assign _zz_253 = _zz_109[16 : 16];
  assign _zz_254 = _zz_109[14 : 14];
  assign _zz_255 = _zz_109[6 : 6];
  assign _zz_256 = _zz_109[4 : 4];
  assign _zz_257 = _zz_109[28 : 28];
  assign _zz_258 = _zz_109[5 : 5];
  assign _zz_259 = _zz_109[26 : 26];
  assign _zz_260 = _zz_109[13 : 13];
  assign _zz_261 = _zz_109[3 : 3];
  assign _zz_262 = _zz_109[20 : 20];
  assign _zz_263 = (_zz_55 - 4'b0001);
  assign _zz_264 = {IBusCachedPlugin_fetchPc_inc,2'b00};
  assign _zz_265 = {29'd0, _zz_264};
  assign _zz_266 = (decode_IS_RVC ? 3'b010 : 3'b100);
  assign _zz_267 = {29'd0, _zz_266};
  assign _zz_268 = {{_zz_79,_zz_69[6 : 2]},12'h0};
  assign _zz_269 = {{{4'b0000,_zz_69[8 : 7]},_zz_69[12 : 9]},2'b00};
  assign _zz_270 = {{{4'b0000,_zz_69[8 : 7]},_zz_69[12 : 9]},2'b00};
  assign _zz_271 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_272 = {{_zz_97,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz_273 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]};
  assign _zz_274 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_275 = execute_SRC_LESS;
  assign _zz_276 = (execute_IS_RVC ? 3'b010 : 3'b100);
  assign _zz_277 = execute_INSTRUCTION[19 : 15];
  assign _zz_278 = execute_INSTRUCTION[31 : 20];
  assign _zz_279 = {execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]};
  assign _zz_280 = ($signed(_zz_281) + $signed(_zz_284));
  assign _zz_281 = ($signed(_zz_282) + $signed(_zz_283));
  assign _zz_282 = execute_SRC1;
  assign _zz_283 = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_284 = (execute_SRC_USE_SUB_LESS ? _zz_285 : _zz_286);
  assign _zz_285 = 32'h00000001;
  assign _zz_286 = 32'h0;
  assign _zz_287 = {{14{writeBack_MUL_LOW[51]}}, writeBack_MUL_LOW};
  assign _zz_288 = ({32'd0,writeBack_MUL_HH} <<< 32);
  assign _zz_289 = writeBack_MUL_LOW[31 : 0];
  assign _zz_290 = writeBack_MulPlugin_result[63 : 32];
  assign _zz_291 = memory_DivPlugin_div_counter_willIncrement;
  assign _zz_292 = {5'd0, _zz_291};
  assign _zz_293 = {1'd0, memory_DivPlugin_rs2};
  assign _zz_294 = {_zz_130,(! _zz_132[32])};
  assign _zz_295 = _zz_132[31:0];
  assign _zz_296 = _zz_131[31:0];
  assign _zz_297 = _zz_298;
  assign _zz_298 = _zz_299;
  assign _zz_299 = ({1'b0,(memory_DivPlugin_div_needRevert ? (~ _zz_133) : _zz_133)} + _zz_301);
  assign _zz_300 = memory_DivPlugin_div_needRevert;
  assign _zz_301 = {32'd0, _zz_300};
  assign _zz_302 = _zz_135;
  assign _zz_303 = {32'd0, _zz_302};
  assign _zz_304 = _zz_134;
  assign _zz_305 = {31'd0, _zz_304};
  assign _zz_306 = execute_INSTRUCTION[31 : 20];
  assign _zz_307 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_308 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_309 = (execute_IS_RVC ? 3'b010 : 3'b100);
  assign _zz_310 = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_311 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_312 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_313 = execute_CsrPlugin_writeData[11 : 11];
  assign _zz_314 = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_315 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_316 = {_zz_59,_zz_58};
  assign _zz_317 = (_zz_69[11 : 10] == 2'b01);
  assign _zz_318 = ((_zz_69[11 : 10] == 2'b11) && (_zz_69[6 : 5] == 2'b00));
  assign _zz_319 = 7'h0;
  assign _zz_320 = _zz_69[6 : 2];
  assign _zz_321 = _zz_69[12];
  assign _zz_322 = _zz_69[11 : 7];
  assign _zz_323 = decode_INSTRUCTION[31];
  assign _zz_324 = decode_INSTRUCTION[19 : 12];
  assign _zz_325 = decode_INSTRUCTION[20];
  assign _zz_326 = decode_INSTRUCTION[31];
  assign _zz_327 = decode_INSTRUCTION[7];
  assign _zz_328 = 32'h00004014;
  assign _zz_329 = (decode_INSTRUCTION & 32'h00006014);
  assign _zz_330 = 32'h00002010;
  assign _zz_331 = ((decode_INSTRUCTION & _zz_338) == 32'h0);
  assign _zz_332 = {(_zz_339 == _zz_340),{_zz_341,_zz_342}};
  assign _zz_333 = _zz_112;
  assign _zz_334 = 1'b0;
  assign _zz_335 = ((_zz_343 == _zz_344) != 1'b0);
  assign _zz_336 = ({_zz_345,_zz_346} != 2'b00);
  assign _zz_337 = {(_zz_347 != _zz_348),{_zz_349,{_zz_350,_zz_351}}};
  assign _zz_338 = 32'h00000044;
  assign _zz_339 = (decode_INSTRUCTION & 32'h00000018);
  assign _zz_340 = 32'h0;
  assign _zz_341 = ((decode_INSTRUCTION & 32'h00006004) == 32'h00002000);
  assign _zz_342 = ((decode_INSTRUCTION & 32'h00005004) == 32'h00001000);
  assign _zz_343 = (decode_INSTRUCTION & 32'h00000064);
  assign _zz_344 = 32'h00000024;
  assign _zz_345 = _zz_111;
  assign _zz_346 = ((decode_INSTRUCTION & _zz_352) == 32'h00000004);
  assign _zz_347 = ((decode_INSTRUCTION & _zz_353) == 32'h00000040);
  assign _zz_348 = 1'b0;
  assign _zz_349 = ({_zz_110,{_zz_354,_zz_355}} != 5'h0);
  assign _zz_350 = (_zz_356 != 1'b0);
  assign _zz_351 = {(_zz_357 != _zz_358),{_zz_359,{_zz_360,_zz_361}}};
  assign _zz_352 = 32'h0000001c;
  assign _zz_353 = 32'h00000058;
  assign _zz_354 = ((decode_INSTRUCTION & _zz_362) == 32'h00002010);
  assign _zz_355 = {(_zz_363 == _zz_364),{_zz_365,_zz_366}};
  assign _zz_356 = ((decode_INSTRUCTION & 32'h00004048) == 32'h00004008);
  assign _zz_357 = {(_zz_367 == _zz_368),(_zz_369 == _zz_370)};
  assign _zz_358 = 2'b00;
  assign _zz_359 = ((_zz_371 == _zz_372) != 1'b0);
  assign _zz_360 = ({_zz_373,_zz_374} != 2'b00);
  assign _zz_361 = {(_zz_375 != _zz_376),{_zz_377,{_zz_378,_zz_379}}};
  assign _zz_362 = 32'h00002030;
  assign _zz_363 = (decode_INSTRUCTION & 32'h00001030);
  assign _zz_364 = 32'h00000010;
  assign _zz_365 = ((decode_INSTRUCTION & _zz_380) == 32'h00002020);
  assign _zz_366 = ((decode_INSTRUCTION & _zz_381) == 32'h00000020);
  assign _zz_367 = (decode_INSTRUCTION & 32'h00002010);
  assign _zz_368 = 32'h00002000;
  assign _zz_369 = (decode_INSTRUCTION & 32'h00005000);
  assign _zz_370 = 32'h00001000;
  assign _zz_371 = (decode_INSTRUCTION & 32'h00005048);
  assign _zz_372 = 32'h00001008;
  assign _zz_373 = (_zz_382 == _zz_383);
  assign _zz_374 = (_zz_384 == _zz_385);
  assign _zz_375 = {_zz_386,_zz_113};
  assign _zz_376 = 2'b00;
  assign _zz_377 = ({_zz_387,_zz_388} != 2'b00);
  assign _zz_378 = (_zz_389 != _zz_390);
  assign _zz_379 = {_zz_391,{_zz_392,_zz_393}};
  assign _zz_380 = 32'h02002060;
  assign _zz_381 = 32'h02003020;
  assign _zz_382 = (decode_INSTRUCTION & 32'h00000050);
  assign _zz_383 = 32'h00000040;
  assign _zz_384 = (decode_INSTRUCTION & 32'h00003040);
  assign _zz_385 = 32'h00000040;
  assign _zz_386 = ((decode_INSTRUCTION & 32'h00000014) == 32'h00000004);
  assign _zz_387 = ((decode_INSTRUCTION & _zz_394) == 32'h00000004);
  assign _zz_388 = _zz_113;
  assign _zz_389 = ((decode_INSTRUCTION & _zz_395) == 32'h00000020);
  assign _zz_390 = 1'b0;
  assign _zz_391 = ({_zz_396,{_zz_397,_zz_398}} != 5'h0);
  assign _zz_392 = (_zz_112 != 1'b0);
  assign _zz_393 = {(_zz_399 != _zz_400),{_zz_401,{_zz_402,_zz_403}}};
  assign _zz_394 = 32'h00000044;
  assign _zz_395 = 32'h00000020;
  assign _zz_396 = ((decode_INSTRUCTION & 32'h00000040) == 32'h00000040);
  assign _zz_397 = _zz_110;
  assign _zz_398 = {(_zz_404 == _zz_405),{_zz_406,_zz_407}};
  assign _zz_399 = {_zz_111,{_zz_408,{_zz_409,_zz_410}}};
  assign _zz_400 = 6'h0;
  assign _zz_401 = ({_zz_411,_zz_412} != 2'b00);
  assign _zz_402 = ({_zz_413,_zz_414} != 3'b000);
  assign _zz_403 = {(_zz_415 != _zz_416),{_zz_417,{_zz_418,_zz_419}}};
  assign _zz_404 = (decode_INSTRUCTION & 32'h00004020);
  assign _zz_405 = 32'h00004020;
  assign _zz_406 = ((decode_INSTRUCTION & _zz_420) == 32'h00000010);
  assign _zz_407 = ((decode_INSTRUCTION & _zz_421) == 32'h00000020);
  assign _zz_408 = ((decode_INSTRUCTION & _zz_422) == 32'h00001010);
  assign _zz_409 = (_zz_423 == _zz_424);
  assign _zz_410 = {_zz_425,{_zz_426,_zz_427}};
  assign _zz_411 = ((decode_INSTRUCTION & _zz_428) == 32'h00005010);
  assign _zz_412 = ((decode_INSTRUCTION & _zz_429) == 32'h00005020);
  assign _zz_413 = (_zz_430 == _zz_431);
  assign _zz_414 = {_zz_432,_zz_433};
  assign _zz_415 = (_zz_434 == _zz_435);
  assign _zz_416 = 1'b0;
  assign _zz_417 = (_zz_436 != 1'b0);
  assign _zz_418 = (_zz_437 != _zz_438);
  assign _zz_419 = {_zz_439,{_zz_440,_zz_441}};
  assign _zz_420 = 32'h00000030;
  assign _zz_421 = 32'h02000020;
  assign _zz_422 = 32'h00001010;
  assign _zz_423 = (decode_INSTRUCTION & 32'h00002010);
  assign _zz_424 = 32'h00002010;
  assign _zz_425 = ((decode_INSTRUCTION & _zz_442) == 32'h00000010);
  assign _zz_426 = (_zz_443 == _zz_444);
  assign _zz_427 = (_zz_445 == _zz_446);
  assign _zz_428 = 32'h00007034;
  assign _zz_429 = 32'h02007064;
  assign _zz_430 = (decode_INSTRUCTION & 32'h40003054);
  assign _zz_431 = 32'h40001010;
  assign _zz_432 = ((decode_INSTRUCTION & _zz_447) == 32'h00001010);
  assign _zz_433 = ((decode_INSTRUCTION & _zz_448) == 32'h00001010);
  assign _zz_434 = (decode_INSTRUCTION & 32'h00003050);
  assign _zz_435 = 32'h00000050;
  assign _zz_436 = ((decode_INSTRUCTION & _zz_449) == 32'h00001000);
  assign _zz_437 = (_zz_450 == _zz_451);
  assign _zz_438 = 1'b0;
  assign _zz_439 = (_zz_452 != 1'b0);
  assign _zz_440 = (_zz_453 != _zz_454);
  assign _zz_441 = {_zz_455,{_zz_456,_zz_457}};
  assign _zz_442 = 32'h00000050;
  assign _zz_443 = (decode_INSTRUCTION & 32'h0000000c);
  assign _zz_444 = 32'h00000004;
  assign _zz_445 = (decode_INSTRUCTION & 32'h00000028);
  assign _zz_446 = 32'h0;
  assign _zz_447 = 32'h00007034;
  assign _zz_448 = 32'h02007054;
  assign _zz_449 = 32'h00001000;
  assign _zz_450 = (decode_INSTRUCTION & 32'h00003000);
  assign _zz_451 = 32'h00002000;
  assign _zz_452 = ((decode_INSTRUCTION & 32'h02004064) == 32'h02004020);
  assign _zz_453 = ((decode_INSTRUCTION & _zz_458) == 32'h02000030);
  assign _zz_454 = 1'b0;
  assign _zz_455 = ({_zz_459,{_zz_460,_zz_461}} != 3'b000);
  assign _zz_456 = ({_zz_462,_zz_463} != 2'b00);
  assign _zz_457 = {(_zz_464 != _zz_465),{_zz_466,{_zz_467,_zz_468}}};
  assign _zz_458 = 32'h02004074;
  assign _zz_459 = ((decode_INSTRUCTION & 32'h00000044) == 32'h00000040);
  assign _zz_460 = ((decode_INSTRUCTION & _zz_469) == 32'h00002010);
  assign _zz_461 = ((decode_INSTRUCTION & _zz_470) == 32'h40000030);
  assign _zz_462 = ((decode_INSTRUCTION & _zz_471) == 32'h00000020);
  assign _zz_463 = ((decode_INSTRUCTION & _zz_472) == 32'h00000020);
  assign _zz_464 = ((decode_INSTRUCTION & _zz_473) == 32'h0);
  assign _zz_465 = 1'b0;
  assign _zz_466 = ({_zz_474,_zz_475} != 2'b00);
  assign _zz_467 = ({_zz_476,_zz_477} != 2'b00);
  assign _zz_468 = ({_zz_478,_zz_479} != 2'b00);
  assign _zz_469 = 32'h00002014;
  assign _zz_470 = 32'h40000034;
  assign _zz_471 = 32'h00000034;
  assign _zz_472 = 32'h00000064;
  assign _zz_473 = 32'h00000058;
  assign _zz_474 = ((decode_INSTRUCTION & 32'h00001050) == 32'h00001050);
  assign _zz_475 = ((decode_INSTRUCTION & 32'h00002050) == 32'h00002050);
  assign _zz_476 = _zz_110;
  assign _zz_477 = ((decode_INSTRUCTION & 32'h00000070) == 32'h00000020);
  assign _zz_478 = _zz_110;
  assign _zz_479 = ((decode_INSTRUCTION & 32'h00000020) == 32'h0);
  assign _zz_480 = execute_INSTRUCTION[31];
  assign _zz_481 = execute_INSTRUCTION[31];
  assign _zz_482 = execute_INSTRUCTION[7];
  assign _zz_196 = RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress1];
  assign _zz_197 = RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress2];
  always @ (posedge clk) begin
    if(_zz_42) begin
      RegFilePlugin_regFile[lastStageRegFileWrite_payload_address] <= lastStageRegFileWrite_payload_data;
    end
  end

  InstructionCache IBusCachedPlugin_cache (
    .io_flush                                     (_zz_176                                                              ), //i
    .io_cpu_prefetch_isValid                      (_zz_177                                                              ), //i
    .io_cpu_prefetch_haltIt                       (IBusCachedPlugin_cache_io_cpu_prefetch_haltIt                        ), //o
    .io_cpu_prefetch_pc                           (IBusCachedPlugin_iBusRsp_stages_0_input_payload[31:0]                ), //i
    .io_cpu_fetch_isValid                         (_zz_178                                                              ), //i
    .io_cpu_fetch_isStuck                         (_zz_179                                                              ), //i
    .io_cpu_fetch_isRemoved                       (IBusCachedPlugin_fetcherflushIt                                      ), //i
    .io_cpu_fetch_pc                              (IBusCachedPlugin_iBusRsp_stages_1_input_payload[31:0]                ), //i
    .io_cpu_fetch_data                            (IBusCachedPlugin_cache_io_cpu_fetch_data[31:0]                       ), //o
    .io_cpu_fetch_mmuBus_cmd_isValid              (IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_isValid               ), //o
    .io_cpu_fetch_mmuBus_cmd_virtualAddress       (IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_virtualAddress[31:0]  ), //o
    .io_cpu_fetch_mmuBus_cmd_bypassTranslation    (IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_bypassTranslation     ), //o
    .io_cpu_fetch_mmuBus_rsp_physicalAddress      (IBusCachedPlugin_mmuBus_rsp_physicalAddress[31:0]                    ), //i
    .io_cpu_fetch_mmuBus_rsp_isIoAccess           (IBusCachedPlugin_mmuBus_rsp_isIoAccess                               ), //i
    .io_cpu_fetch_mmuBus_rsp_allowRead            (IBusCachedPlugin_mmuBus_rsp_allowRead                                ), //i
    .io_cpu_fetch_mmuBus_rsp_allowWrite           (IBusCachedPlugin_mmuBus_rsp_allowWrite                               ), //i
    .io_cpu_fetch_mmuBus_rsp_allowExecute         (IBusCachedPlugin_mmuBus_rsp_allowExecute                             ), //i
    .io_cpu_fetch_mmuBus_rsp_exception            (IBusCachedPlugin_mmuBus_rsp_exception                                ), //i
    .io_cpu_fetch_mmuBus_rsp_refilling            (IBusCachedPlugin_mmuBus_rsp_refilling                                ), //i
    .io_cpu_fetch_mmuBus_end                      (IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_end                       ), //o
    .io_cpu_fetch_mmuBus_busy                     (IBusCachedPlugin_mmuBus_busy                                         ), //i
    .io_cpu_fetch_physicalAddress                 (IBusCachedPlugin_cache_io_cpu_fetch_physicalAddress[31:0]            ), //o
    .io_cpu_fetch_haltIt                          (IBusCachedPlugin_cache_io_cpu_fetch_haltIt                           ), //o
    .io_cpu_decode_isValid                        (_zz_180                                                              ), //i
    .io_cpu_decode_isStuck                        (_zz_181                                                              ), //i
    .io_cpu_decode_pc                             (IBusCachedPlugin_iBusRsp_stages_2_input_payload[31:0]                ), //i
    .io_cpu_decode_physicalAddress                (IBusCachedPlugin_cache_io_cpu_decode_physicalAddress[31:0]           ), //o
    .io_cpu_decode_data                           (IBusCachedPlugin_cache_io_cpu_decode_data[31:0]                      ), //o
    .io_cpu_decode_cacheMiss                      (IBusCachedPlugin_cache_io_cpu_decode_cacheMiss                       ), //o
    .io_cpu_decode_error                          (IBusCachedPlugin_cache_io_cpu_decode_error                           ), //o
    .io_cpu_decode_mmuRefilling                   (IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling                    ), //o
    .io_cpu_decode_mmuException                   (IBusCachedPlugin_cache_io_cpu_decode_mmuException                    ), //o
    .io_cpu_decode_isUser                         (_zz_182                                                              ), //i
    .io_cpu_fill_valid                            (_zz_183                                                              ), //i
    .io_cpu_fill_payload                          (IBusCachedPlugin_cache_io_cpu_decode_physicalAddress[31:0]           ), //i
    .io_mem_cmd_valid                             (IBusCachedPlugin_cache_io_mem_cmd_valid                              ), //o
    .io_mem_cmd_ready                             (iBus_cmd_ready                                                       ), //i
    .io_mem_cmd_payload_address                   (IBusCachedPlugin_cache_io_mem_cmd_payload_address[31:0]              ), //o
    .io_mem_cmd_payload_size                      (IBusCachedPlugin_cache_io_mem_cmd_payload_size[2:0]                  ), //o
    .io_mem_rsp_valid                             (iBus_rsp_valid                                                       ), //i
    .io_mem_rsp_payload_data                      (iBus_rsp_payload_data[31:0]                                          ), //i
    .io_mem_rsp_payload_error                     (iBus_rsp_payload_error                                               ), //i
    .clk                                          (clk                                                                  ), //i
    .reset                                        (reset                                                                )  //i
  );
  DataCache dataCache_1 (
    .io_cpu_execute_isValid                        (_zz_184                                                    ), //i
    .io_cpu_execute_address                        (_zz_185[31:0]                                              ), //i
    .io_cpu_execute_args_wr                        (execute_MEMORY_WR                                          ), //i
    .io_cpu_execute_args_data                      (_zz_104[31:0]                                              ), //i
    .io_cpu_execute_args_size                      (execute_DBusCachedPlugin_size[1:0]                         ), //i
    .io_cpu_memory_isValid                         (_zz_186                                                    ), //i
    .io_cpu_memory_isStuck                         (memory_arbitration_isStuck                                 ), //i
    .io_cpu_memory_isRemoved                       (memory_arbitration_removeIt                                ), //i
    .io_cpu_memory_isWrite                         (dataCache_1_io_cpu_memory_isWrite                          ), //o
    .io_cpu_memory_address                         (_zz_187[31:0]                                              ), //i
    .io_cpu_memory_mmuBus_cmd_isValid              (dataCache_1_io_cpu_memory_mmuBus_cmd_isValid               ), //o
    .io_cpu_memory_mmuBus_cmd_virtualAddress       (dataCache_1_io_cpu_memory_mmuBus_cmd_virtualAddress[31:0]  ), //o
    .io_cpu_memory_mmuBus_cmd_bypassTranslation    (dataCache_1_io_cpu_memory_mmuBus_cmd_bypassTranslation     ), //o
    .io_cpu_memory_mmuBus_rsp_physicalAddress      (DBusCachedPlugin_mmuBus_rsp_physicalAddress[31:0]          ), //i
    .io_cpu_memory_mmuBus_rsp_isIoAccess           (_zz_188                                                    ), //i
    .io_cpu_memory_mmuBus_rsp_allowRead            (DBusCachedPlugin_mmuBus_rsp_allowRead                      ), //i
    .io_cpu_memory_mmuBus_rsp_allowWrite           (DBusCachedPlugin_mmuBus_rsp_allowWrite                     ), //i
    .io_cpu_memory_mmuBus_rsp_allowExecute         (DBusCachedPlugin_mmuBus_rsp_allowExecute                   ), //i
    .io_cpu_memory_mmuBus_rsp_exception            (DBusCachedPlugin_mmuBus_rsp_exception                      ), //i
    .io_cpu_memory_mmuBus_rsp_refilling            (DBusCachedPlugin_mmuBus_rsp_refilling                      ), //i
    .io_cpu_memory_mmuBus_end                      (dataCache_1_io_cpu_memory_mmuBus_end                       ), //o
    .io_cpu_memory_mmuBus_busy                     (DBusCachedPlugin_mmuBus_busy                               ), //i
    .io_cpu_writeBack_isValid                      (_zz_189                                                    ), //i
    .io_cpu_writeBack_isStuck                      (writeBack_arbitration_isStuck                              ), //i
    .io_cpu_writeBack_isUser                       (_zz_190                                                    ), //i
    .io_cpu_writeBack_haltIt                       (dataCache_1_io_cpu_writeBack_haltIt                        ), //o
    .io_cpu_writeBack_isWrite                      (dataCache_1_io_cpu_writeBack_isWrite                       ), //o
    .io_cpu_writeBack_data                         (dataCache_1_io_cpu_writeBack_data[31:0]                    ), //o
    .io_cpu_writeBack_address                      (_zz_191[31:0]                                              ), //i
    .io_cpu_writeBack_mmuException                 (dataCache_1_io_cpu_writeBack_mmuException                  ), //o
    .io_cpu_writeBack_unalignedAccess              (dataCache_1_io_cpu_writeBack_unalignedAccess               ), //o
    .io_cpu_writeBack_accessError                  (dataCache_1_io_cpu_writeBack_accessError                   ), //o
    .io_cpu_redo                                   (dataCache_1_io_cpu_redo                                    ), //o
    .io_cpu_flush_valid                            (_zz_192                                                    ), //i
    .io_cpu_flush_ready                            (dataCache_1_io_cpu_flush_ready                             ), //o
    .io_mem_cmd_valid                              (dataCache_1_io_mem_cmd_valid                               ), //o
    .io_mem_cmd_ready                              (dBus_cmd_ready                                             ), //i
    .io_mem_cmd_payload_wr                         (dataCache_1_io_mem_cmd_payload_wr                          ), //o
    .io_mem_cmd_payload_address                    (dataCache_1_io_mem_cmd_payload_address[31:0]               ), //o
    .io_mem_cmd_payload_data                       (dataCache_1_io_mem_cmd_payload_data[31:0]                  ), //o
    .io_mem_cmd_payload_mask                       (dataCache_1_io_mem_cmd_payload_mask[3:0]                   ), //o
    .io_mem_cmd_payload_length                     (dataCache_1_io_mem_cmd_payload_length[2:0]                 ), //o
    .io_mem_cmd_payload_last                       (dataCache_1_io_mem_cmd_payload_last                        ), //o
    .io_mem_rsp_valid                              (dBus_rsp_valid                                             ), //i
    .io_mem_rsp_payload_data                       (dBus_rsp_payload_data[31:0]                                ), //i
    .io_mem_rsp_payload_error                      (dBus_rsp_payload_error                                     ), //i
    .clk                                           (clk                                                        ), //i
    .reset                                         (reset                                                      )  //i
  );
  StreamFork streamFork_1 (
    .io_input_valid                  (_zz_193                                          ), //i
    .io_input_ready                  (streamFork_1_io_input_ready                      ), //o
    .io_input_payload_wr             (dBus_cmd_payload_wr                              ), //i
    .io_input_payload_address        (dBus_cmd_payload_address[31:0]                   ), //i
    .io_input_payload_data           (dBus_cmd_payload_data[31:0]                      ), //i
    .io_input_payload_mask           (dBus_cmd_payload_mask[3:0]                       ), //i
    .io_input_payload_length         (dBus_cmd_payload_length[2:0]                     ), //i
    .io_input_payload_last           (dBus_cmd_payload_last                            ), //i
    .io_outputs_0_valid              (streamFork_1_io_outputs_0_valid                  ), //o
    .io_outputs_0_ready              (_zz_194                                          ), //i
    .io_outputs_0_payload_wr         (streamFork_1_io_outputs_0_payload_wr             ), //o
    .io_outputs_0_payload_address    (streamFork_1_io_outputs_0_payload_address[31:0]  ), //o
    .io_outputs_0_payload_data       (streamFork_1_io_outputs_0_payload_data[31:0]     ), //o
    .io_outputs_0_payload_mask       (streamFork_1_io_outputs_0_payload_mask[3:0]      ), //o
    .io_outputs_0_payload_length     (streamFork_1_io_outputs_0_payload_length[2:0]    ), //o
    .io_outputs_0_payload_last       (streamFork_1_io_outputs_0_payload_last           ), //o
    .io_outputs_1_valid              (streamFork_1_io_outputs_1_valid                  ), //o
    .io_outputs_1_ready              (_zz_195                                          ), //i
    .io_outputs_1_payload_wr         (streamFork_1_io_outputs_1_payload_wr             ), //o
    .io_outputs_1_payload_address    (streamFork_1_io_outputs_1_payload_address[31:0]  ), //o
    .io_outputs_1_payload_data       (streamFork_1_io_outputs_1_payload_data[31:0]     ), //o
    .io_outputs_1_payload_mask       (streamFork_1_io_outputs_1_payload_mask[3:0]      ), //o
    .io_outputs_1_payload_length     (streamFork_1_io_outputs_1_payload_length[2:0]    ), //o
    .io_outputs_1_payload_last       (streamFork_1_io_outputs_1_payload_last           ), //o
    .clk                             (clk                                              ), //i
    .reset                           (reset                                            )  //i
  );
  always @(*) begin
    case(_zz_316)
      2'b00 : begin
        _zz_198 = DBusCachedPlugin_redoBranch_payload;
      end
      2'b01 : begin
        _zz_198 = CsrPlugin_jumpInterface_payload;
      end
      2'b10 : begin
        _zz_198 = BranchPlugin_jumpInterface_payload;
      end
      default : begin
        _zz_198 = IBusCachedPlugin_predictionJumpInterface_payload;
      end
    endcase
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
    case(decode_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_3)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_3_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_3_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_3_string = "AND_1";
      default : _zz_3_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_4)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_4_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_4_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_4_string = "AND_1";
      default : _zz_4_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_5)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_5_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_5_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_5_string = "AND_1";
      default : _zz_5_string = "?????";
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
    case(_zz_6)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_6_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_6_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_6_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_6_string = "URS1        ";
      default : _zz_6_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_7)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_7_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_7_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_7_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_7_string = "URS1        ";
      default : _zz_7_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_8)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_8_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_8_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_8_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_8_string = "URS1        ";
      default : _zz_8_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_9)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_9_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_9_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_9_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_9_string = "SRA_1    ";
      default : _zz_9_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_10)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_10_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_10_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_10_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_10_string = "SRA_1    ";
      default : _zz_10_string = "?????????";
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
    case(_zz_11)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_11_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_11_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_11_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_11_string = "SRA_1    ";
      default : _zz_11_string = "?????????";
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
    case(decode_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : decode_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : decode_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : decode_ALU_CTRL_string = "BITWISE ";
      default : decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_14)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_14_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_14_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_14_string = "BITWISE ";
      default : _zz_14_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_15)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_15_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_15_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_15_string = "BITWISE ";
      default : _zz_15_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_16)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_16_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_16_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_16_string = "BITWISE ";
      default : _zz_16_string = "????????";
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
    case(_zz_17)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_17_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_17_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_17_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_17_string = "PC ";
      default : _zz_17_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_18)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_18_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_18_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_18_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_18_string = "PC ";
      default : _zz_18_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_19)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_19_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_19_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_19_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_19_string = "PC ";
      default : _zz_19_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_20)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_20_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_20_string = "XRET";
      default : _zz_20_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_21)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_21_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_21_string = "XRET";
      default : _zz_21_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_22)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_22_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_22_string = "XRET";
      default : _zz_22_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_23)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_23_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_23_string = "XRET";
      default : _zz_23_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : decode_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : decode_ENV_CTRL_string = "XRET";
      default : decode_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_24)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_24_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_24_string = "XRET";
      default : _zz_24_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_25)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_25_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_25_string = "XRET";
      default : _zz_25_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_26)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_26_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_26_string = "XRET";
      default : _zz_26_string = "????";
    endcase
  end
  always @(*) begin
    case(memory_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : memory_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : memory_ENV_CTRL_string = "XRET";
      default : memory_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_27)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_27_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_27_string = "XRET";
      default : _zz_27_string = "????";
    endcase
  end
  always @(*) begin
    case(execute_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : execute_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : execute_ENV_CTRL_string = "XRET";
      default : execute_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_28)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_28_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_28_string = "XRET";
      default : _zz_28_string = "????";
    endcase
  end
  always @(*) begin
    case(writeBack_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : writeBack_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : writeBack_ENV_CTRL_string = "XRET";
      default : writeBack_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_29)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_29_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_29_string = "XRET";
      default : _zz_29_string = "????";
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
    case(_zz_30)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_30_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_30_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_30_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_30_string = "JALR";
      default : _zz_30_string = "????";
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
    case(_zz_33)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_33_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_33_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_33_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_33_string = "SRA_1    ";
      default : _zz_33_string = "?????????";
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
    case(_zz_34)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_34_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_34_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_34_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_34_string = "SRA_1    ";
      default : _zz_34_string = "?????????";
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
    case(_zz_36)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_36_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_36_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_36_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_36_string = "PC ";
      default : _zz_36_string = "???";
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
    case(_zz_37)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_37_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_37_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_37_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_37_string = "URS1        ";
      default : _zz_37_string = "????????????";
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
    case(_zz_38)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_38_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_38_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_38_string = "BITWISE ";
      default : _zz_38_string = "????????";
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
    case(_zz_39)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_39_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_39_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_39_string = "AND_1";
      default : _zz_39_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_43)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_43_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_43_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_43_string = "BITWISE ";
      default : _zz_43_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_44)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_44_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_44_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_44_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_44_string = "JALR";
      default : _zz_44_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_45)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_45_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_45_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_45_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_45_string = "URS1        ";
      default : _zz_45_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_46)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_46_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_46_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_46_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_46_string = "SRA_1    ";
      default : _zz_46_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_47)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_47_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_47_string = "XRET";
      default : _zz_47_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_48)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_48_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_48_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_48_string = "AND_1";
      default : _zz_48_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_49)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_49_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_49_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_49_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_49_string = "PC ";
      default : _zz_49_string = "???";
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
    case(_zz_52)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_52_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_52_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_52_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_52_string = "JALR";
      default : _zz_52_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_114)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_114_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_114_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_114_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_114_string = "PC ";
      default : _zz_114_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_115)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_115_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_115_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_115_string = "AND_1";
      default : _zz_115_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_116)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_116_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_116_string = "XRET";
      default : _zz_116_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_117)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_117_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_117_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_117_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_117_string = "SRA_1    ";
      default : _zz_117_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_118)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_118_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_118_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_118_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_118_string = "URS1        ";
      default : _zz_118_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_119)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_119_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_119_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_119_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_119_string = "JALR";
      default : _zz_119_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_120)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_120_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_120_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_120_string = "BITWISE ";
      default : _zz_120_string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : decode_to_execute_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : decode_to_execute_ENV_CTRL_string = "XRET";
      default : decode_to_execute_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : execute_to_memory_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : execute_to_memory_ENV_CTRL_string = "XRET";
      default : execute_to_memory_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(memory_to_writeBack_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : memory_to_writeBack_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_defaultEncoding_XRET : memory_to_writeBack_ENV_CTRL_string = "XRET";
      default : memory_to_writeBack_ENV_CTRL_string = "????";
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
    case(decode_to_execute_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : decode_to_execute_SRC1_CTRL_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : decode_to_execute_SRC1_CTRL_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : decode_to_execute_SRC1_CTRL_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : decode_to_execute_SRC1_CTRL_string = "URS1        ";
      default : decode_to_execute_SRC1_CTRL_string = "????????????";
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
    case(decode_to_execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : decode_to_execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : decode_to_execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : decode_to_execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  `endif

  assign decode_CSR_WRITE_OPCODE = (! (((decode_INSTRUCTION[14 : 13] == 2'b01) && (decode_INSTRUCTION[19 : 15] == 5'h0)) || ((decode_INSTRUCTION[14 : 13] == 2'b11) && (decode_INSTRUCTION[19 : 15] == 5'h0))));
  assign decode_MEMORY_MANAGMENT = _zz_232[0];
  assign execute_REGFILE_WRITE_DATA = _zz_121;
  assign writeBack_FORMAL_PC_NEXT = memory_to_writeBack_FORMAL_PC_NEXT;
  assign memory_FORMAL_PC_NEXT = execute_to_memory_FORMAL_PC_NEXT;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = (decode_PC + _zz_234);
  assign decode_IS_CSR = _zz_235[0];
  assign _zz_1 = _zz_2;
  assign decode_IS_DIV = _zz_236[0];
  assign decode_ALU_BITWISE_CTRL = _zz_3;
  assign _zz_4 = _zz_5;
  assign execute_MUL_HL = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bSLow));
  assign decode_SRC_LESS_UNSIGNED = _zz_237[0];
  assign execute_BYPASSABLE_MEMORY_STAGE = decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  assign decode_BYPASSABLE_MEMORY_STAGE = _zz_238[0];
  assign memory_MEMORY_ADDRESS_LOW = execute_to_memory_MEMORY_ADDRESS_LOW;
  assign execute_MEMORY_ADDRESS_LOW = _zz_185[1 : 0];
  assign decode_SRC1_CTRL = _zz_6;
  assign _zz_7 = _zz_8;
  assign execute_MUL_LH = ($signed(execute_MulPlugin_aSLow) * $signed(execute_MulPlugin_bHigh));
  assign decode_SRC2_FORCE_ZERO = (decode_SRC_ADD_ZERO && (! decode_SRC_USE_SUB_LESS));
  assign execute_MUL_LL = (execute_MulPlugin_aULow * execute_MulPlugin_bULow);
  assign decode_BYPASSABLE_EXECUTE_STAGE = _zz_239[0];
  assign execute_BRANCH_DO = ((execute_PREDICTION_HAD_BRANCHED2 != execute_BRANCH_COND_RESULT) || execute_BranchPlugin_missAlignedTarget);
  assign memory_MUL_LOW = ($signed(_zz_240) + $signed(_zz_248));
  assign execute_SHIFT_RIGHT = _zz_250;
  assign memory_MUL_HH = execute_to_memory_MUL_HH;
  assign execute_MUL_HH = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bHigh));
  assign decode_IS_RS2_SIGNED = _zz_252[0];
  assign execute_BRANCH_CALC = {execute_BranchPlugin_branchAdder[31 : 1],1'b0};
  assign _zz_9 = _zz_10;
  assign decode_SHIFT_CTRL = _zz_11;
  assign _zz_12 = _zz_13;
  assign decode_CSR_READ_OPCODE = (decode_INSTRUCTION[13 : 7] != 7'h20);
  assign decode_ALU_CTRL = _zz_14;
  assign _zz_15 = _zz_16;
  assign decode_MEMORY_WR = _zz_253[0];
  assign decode_SRC2_CTRL = _zz_17;
  assign _zz_18 = _zz_19;
  assign _zz_20 = _zz_21;
  assign _zz_22 = _zz_23;
  assign decode_ENV_CTRL = _zz_24;
  assign _zz_25 = _zz_26;
  assign decode_PREDICTION_HAD_BRANCHED2 = IBusCachedPlugin_decodePrediction_cmd_hadBranch;
  assign memory_PC = execute_to_memory_PC;
  assign decode_IS_RS1_SIGNED = _zz_254[0];
  assign memory_IS_MUL = execute_to_memory_IS_MUL;
  assign execute_IS_MUL = decode_to_execute_IS_MUL;
  assign decode_IS_MUL = _zz_255[0];
  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign memory_ENV_CTRL = _zz_27;
  assign execute_ENV_CTRL = _zz_28;
  assign writeBack_ENV_CTRL = _zz_29;
  assign memory_BRANCH_CALC = execute_to_memory_BRANCH_CALC;
  assign memory_BRANCH_DO = execute_to_memory_BRANCH_DO;
  assign execute_PC = decode_to_execute_PC;
  assign execute_BRANCH_COND_RESULT = _zz_150;
  assign execute_PREDICTION_HAD_BRANCHED2 = decode_to_execute_PREDICTION_HAD_BRANCHED2;
  assign execute_BRANCH_CTRL = _zz_30;
  assign decode_RS2_USE = _zz_256[0];
  assign decode_RS1_USE = _zz_257[0];
  always @ (*) begin
    _zz_31 = execute_REGFILE_WRITE_DATA;
    if(_zz_199)begin
      _zz_31 = execute_CsrPlugin_readData;
    end
  end

  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign execute_BYPASSABLE_EXECUTE_STAGE = decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  assign memory_REGFILE_WRITE_VALID = execute_to_memory_REGFILE_WRITE_VALID;
  assign memory_BYPASSABLE_MEMORY_STAGE = execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  assign writeBack_REGFILE_WRITE_VALID = memory_to_writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    decode_RS2 = decode_RegFilePlugin_rs2Data;
    if(_zz_139)begin
      if((_zz_140 == decode_INSTRUCTION[24 : 20]))begin
        decode_RS2 = _zz_141;
      end
    end
    if(_zz_200)begin
      if(_zz_201)begin
        if(_zz_143)begin
          decode_RS2 = _zz_50;
        end
      end
    end
    if(_zz_202)begin
      if(memory_BYPASSABLE_MEMORY_STAGE)begin
        if(_zz_145)begin
          decode_RS2 = _zz_32;
        end
      end
    end
    if(_zz_203)begin
      if(execute_BYPASSABLE_EXECUTE_STAGE)begin
        if(_zz_147)begin
          decode_RS2 = _zz_31;
        end
      end
    end
  end

  always @ (*) begin
    decode_RS1 = decode_RegFilePlugin_rs1Data;
    if(_zz_139)begin
      if((_zz_140 == decode_INSTRUCTION[19 : 15]))begin
        decode_RS1 = _zz_141;
      end
    end
    if(_zz_200)begin
      if(_zz_201)begin
        if(_zz_142)begin
          decode_RS1 = _zz_50;
        end
      end
    end
    if(_zz_202)begin
      if(memory_BYPASSABLE_MEMORY_STAGE)begin
        if(_zz_144)begin
          decode_RS1 = _zz_32;
        end
      end
    end
    if(_zz_203)begin
      if(execute_BYPASSABLE_EXECUTE_STAGE)begin
        if(_zz_146)begin
          decode_RS1 = _zz_31;
        end
      end
    end
  end

  assign execute_IS_RS1_SIGNED = decode_to_execute_IS_RS1_SIGNED;
  assign execute_IS_DIV = decode_to_execute_IS_DIV;
  assign execute_IS_RS2_SIGNED = decode_to_execute_IS_RS2_SIGNED;
  assign memory_INSTRUCTION = execute_to_memory_INSTRUCTION;
  assign memory_IS_DIV = execute_to_memory_IS_DIV;
  assign writeBack_IS_MUL = memory_to_writeBack_IS_MUL;
  assign writeBack_MUL_HH = memory_to_writeBack_MUL_HH;
  assign writeBack_MUL_LOW = memory_to_writeBack_MUL_LOW;
  assign memory_MUL_HL = execute_to_memory_MUL_HL;
  assign memory_MUL_LH = execute_to_memory_MUL_LH;
  assign memory_MUL_LL = execute_to_memory_MUL_LL;
  assign execute_RS1 = decode_to_execute_RS1;
  assign memory_SHIFT_RIGHT = execute_to_memory_SHIFT_RIGHT;
  always @ (*) begin
    _zz_32 = memory_REGFILE_WRITE_DATA;
    if(memory_arbitration_isValid)begin
      case(memory_SHIFT_CTRL)
        `ShiftCtrlEnum_defaultEncoding_SLL_1 : begin
          _zz_32 = _zz_129;
        end
        `ShiftCtrlEnum_defaultEncoding_SRL_1, `ShiftCtrlEnum_defaultEncoding_SRA_1 : begin
          _zz_32 = memory_SHIFT_RIGHT;
        end
        default : begin
        end
      endcase
    end
    if(_zz_204)begin
      _zz_32 = memory_DivPlugin_div_result;
    end
  end

  assign memory_SHIFT_CTRL = _zz_33;
  assign execute_SHIFT_CTRL = _zz_34;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC2_FORCE_ZERO = decode_to_execute_SRC2_FORCE_ZERO;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign _zz_35 = execute_PC;
  assign execute_SRC2_CTRL = _zz_36;
  assign execute_IS_RVC = decode_to_execute_IS_RVC;
  assign execute_SRC1_CTRL = _zz_37;
  assign decode_SRC_USE_SUB_LESS = _zz_258[0];
  assign decode_SRC_ADD_ZERO = _zz_259[0];
  assign execute_SRC_ADD_SUB = execute_SrcPlugin_addSub;
  assign execute_SRC_LESS = execute_SrcPlugin_less;
  assign execute_ALU_CTRL = _zz_38;
  assign execute_SRC2 = _zz_127;
  assign execute_SRC1 = _zz_122;
  assign execute_ALU_BITWISE_CTRL = _zz_39;
  assign _zz_40 = writeBack_INSTRUCTION;
  assign _zz_41 = writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    _zz_42 = 1'b0;
    if(lastStageRegFileWrite_valid)begin
      _zz_42 = 1'b1;
    end
  end

  always @ (*) begin
    decode_REGFILE_WRITE_VALID = _zz_260[0];
    if((decode_INSTRUCTION[11 : 7] == 5'h0))begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  always @ (*) begin
    _zz_50 = writeBack_REGFILE_WRITE_DATA;
    if((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE))begin
      _zz_50 = writeBack_DBusCachedPlugin_rspFormated;
    end
    if((writeBack_arbitration_isValid && writeBack_IS_MUL))begin
      case(_zz_230)
        2'b00 : begin
          _zz_50 = _zz_289;
        end
        default : begin
          _zz_50 = _zz_290;
        end
      endcase
    end
  end

  assign writeBack_MEMORY_ADDRESS_LOW = memory_to_writeBack_MEMORY_ADDRESS_LOW;
  assign writeBack_REGFILE_WRITE_DATA = memory_to_writeBack_REGFILE_WRITE_DATA;
  assign writeBack_MEMORY_ENABLE = memory_to_writeBack_MEMORY_ENABLE;
  assign memory_REGFILE_WRITE_DATA = execute_to_memory_REGFILE_WRITE_DATA;
  assign memory_MEMORY_ENABLE = execute_to_memory_MEMORY_ENABLE;
  assign execute_MEMORY_MANAGMENT = decode_to_execute_MEMORY_MANAGMENT;
  assign execute_RS2 = decode_to_execute_RS2;
  assign execute_MEMORY_WR = decode_to_execute_MEMORY_WR;
  assign execute_SRC_ADD = execute_SrcPlugin_addSub;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign decode_MEMORY_ENABLE = _zz_261[0];
  assign decode_FLUSH_ALL = _zz_262[0];
  always @ (*) begin
    _zz_51 = _zz_51_0;
    if(_zz_205)begin
      _zz_51 = 1'b1;
    end
  end

  always @ (*) begin
    _zz_51_0 = IBusCachedPlugin_rsp_issueDetected;
    if(_zz_206)begin
      _zz_51_0 = 1'b1;
    end
  end

  assign decode_BRANCH_CTRL = _zz_52;
  assign decode_INSTRUCTION = IBusCachedPlugin_decompressor_output_payload_rsp_inst;
  always @ (*) begin
    _zz_53 = memory_FORMAL_PC_NEXT;
    if(BranchPlugin_jumpInterface_valid)begin
      _zz_53 = BranchPlugin_jumpInterface_payload;
    end
  end

  always @ (*) begin
    _zz_54 = decode_FORMAL_PC_NEXT;
    if(IBusCachedPlugin_predictionJumpInterface_valid)begin
      _zz_54 = IBusCachedPlugin_predictionJumpInterface_payload;
    end
  end

  assign decode_PC = IBusCachedPlugin_decodePc_pcReg;
  assign decode_IS_RVC = IBusCachedPlugin_decompressor_output_payload_isRvc;
  assign writeBack_PC = memory_to_writeBack_PC;
  assign writeBack_INSTRUCTION = memory_to_writeBack_INSTRUCTION;
  always @ (*) begin
    decode_arbitration_haltItself = 1'b0;
    if(((DBusCachedPlugin_mmuBus_busy && decode_arbitration_isValid) && decode_MEMORY_ENABLE))begin
      decode_arbitration_haltItself = 1'b1;
    end
  end

  always @ (*) begin
    decode_arbitration_haltByOther = 1'b0;
    if((decode_arbitration_isValid && (_zz_137 || _zz_138)))begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(CsrPlugin_pipelineLiberator_active)begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(({(writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)),{(memory_arbitration_isValid && (memory_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)),(execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET))}} != 3'b000))begin
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
    if(IBusCachedPlugin_predictionJumpInterface_valid)begin
      decode_arbitration_flushNext = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_haltItself = 1'b0;
    if((_zz_192 && (! dataCache_1_io_cpu_flush_ready)))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if(((dataCache_1_io_cpu_redo && execute_arbitration_isValid) && execute_MEMORY_ENABLE))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if(_zz_199)begin
      if(execute_CsrPlugin_blockedBySideEffects)begin
        execute_arbitration_haltItself = 1'b1;
      end
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
    if(_zz_204)begin
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

  always @ (*) begin
    writeBack_arbitration_haltItself = 1'b0;
    if(dataCache_1_io_cpu_writeBack_haltIt)begin
      writeBack_arbitration_haltItself = 1'b1;
    end
  end

  assign writeBack_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    writeBack_arbitration_removeIt = 1'b0;
    if(writeBack_arbitration_isFlushed)begin
      writeBack_arbitration_removeIt = 1'b1;
    end
  end

  always @ (*) begin
    writeBack_arbitration_flushIt = 1'b0;
    if(DBusCachedPlugin_redoBranch_valid)begin
      writeBack_arbitration_flushIt = 1'b1;
    end
  end

  always @ (*) begin
    writeBack_arbitration_flushNext = 1'b0;
    if(DBusCachedPlugin_redoBranch_valid)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(_zz_207)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(_zz_208)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
  end

  assign lastStageInstruction = writeBack_INSTRUCTION;
  assign lastStagePc = writeBack_PC;
  assign lastStageIsValid = writeBack_arbitration_isValid;
  assign lastStageIsFiring = writeBack_arbitration_isFiring;
  always @ (*) begin
    IBusCachedPlugin_fetcherHalt = 1'b0;
    if(_zz_207)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(_zz_208)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_incomingInstruction = 1'b0;
    if((IBusCachedPlugin_iBusRsp_stages_1_input_valid || IBusCachedPlugin_iBusRsp_stages_2_input_valid))begin
      IBusCachedPlugin_incomingInstruction = 1'b1;
    end
  end

  assign CsrPlugin_inWfi = 1'b0;
  assign CsrPlugin_thirdPartyWake = 1'b0;
  always @ (*) begin
    CsrPlugin_jumpInterface_valid = 1'b0;
    if(_zz_207)begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
    if(_zz_208)begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_jumpInterface_payload = 32'h0;
    if(_zz_207)begin
      CsrPlugin_jumpInterface_payload = {CsrPlugin_xtvec_base,2'b00};
    end
    if(_zz_208)begin
      case(_zz_209)
        2'b11 : begin
          CsrPlugin_jumpInterface_payload = CsrPlugin_mepc;
        end
        default : begin
        end
      endcase
    end
  end

  assign CsrPlugin_forceMachineWire = 1'b0;
  assign CsrPlugin_allowInterrupts = 1'b1;
  assign CsrPlugin_allowException = 1'b1;
  assign IBusCachedPlugin_fetcherflushIt = ({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,{execute_arbitration_flushNext,decode_arbitration_flushNext}}} != 4'b0000);
  assign IBusCachedPlugin_jump_pcLoad_valid = ({CsrPlugin_jumpInterface_valid,{BranchPlugin_jumpInterface_valid,{DBusCachedPlugin_redoBranch_valid,IBusCachedPlugin_predictionJumpInterface_valid}}} != 4'b0000);
  assign _zz_55 = {IBusCachedPlugin_predictionJumpInterface_valid,{BranchPlugin_jumpInterface_valid,{CsrPlugin_jumpInterface_valid,DBusCachedPlugin_redoBranch_valid}}};
  assign _zz_56 = (_zz_55 & (~ _zz_263));
  assign _zz_57 = _zz_56[3];
  assign _zz_58 = (_zz_56[1] || _zz_57);
  assign _zz_59 = (_zz_56[2] || _zz_57);
  assign IBusCachedPlugin_jump_pcLoad_payload = _zz_198;
  always @ (*) begin
    IBusCachedPlugin_fetchPc_correction = 1'b0;
    if(IBusCachedPlugin_fetchPc_redo_valid)begin
      IBusCachedPlugin_fetchPc_correction = 1'b1;
    end
    if(IBusCachedPlugin_jump_pcLoad_valid)begin
      IBusCachedPlugin_fetchPc_correction = 1'b1;
    end
  end

  assign IBusCachedPlugin_fetchPc_corrected = (IBusCachedPlugin_fetchPc_correction || IBusCachedPlugin_fetchPc_correctionReg);
  always @ (*) begin
    IBusCachedPlugin_fetchPc_pcRegPropagate = 1'b0;
    if(IBusCachedPlugin_iBusRsp_stages_1_input_ready)begin
      IBusCachedPlugin_fetchPc_pcRegPropagate = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_fetchPc_pc = (IBusCachedPlugin_fetchPc_pcReg + _zz_265);
    if(IBusCachedPlugin_fetchPc_inc)begin
      IBusCachedPlugin_fetchPc_pc[1] = 1'b0;
    end
    if(IBusCachedPlugin_fetchPc_redo_valid)begin
      IBusCachedPlugin_fetchPc_pc = IBusCachedPlugin_fetchPc_redo_payload;
    end
    if(IBusCachedPlugin_jump_pcLoad_valid)begin
      IBusCachedPlugin_fetchPc_pc = IBusCachedPlugin_jump_pcLoad_payload;
    end
    IBusCachedPlugin_fetchPc_pc[0] = 1'b0;
  end

  always @ (*) begin
    IBusCachedPlugin_fetchPc_flushed = 1'b0;
    if(IBusCachedPlugin_fetchPc_redo_valid)begin
      IBusCachedPlugin_fetchPc_flushed = 1'b1;
    end
    if(IBusCachedPlugin_jump_pcLoad_valid)begin
      IBusCachedPlugin_fetchPc_flushed = 1'b1;
    end
  end

  assign IBusCachedPlugin_fetchPc_output_valid = ((! IBusCachedPlugin_fetcherHalt) && IBusCachedPlugin_fetchPc_booted);
  assign IBusCachedPlugin_fetchPc_output_payload = IBusCachedPlugin_fetchPc_pc;
  always @ (*) begin
    IBusCachedPlugin_decodePc_flushed = 1'b0;
    if(_zz_210)begin
      IBusCachedPlugin_decodePc_flushed = 1'b1;
    end
  end

  assign IBusCachedPlugin_decodePc_pcPlus = (IBusCachedPlugin_decodePc_pcReg + _zz_267);
  assign IBusCachedPlugin_decodePc_injectedDecode = 1'b0;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_redoFetch = 1'b0;
    if(IBusCachedPlugin_rsp_redoFetch)begin
      IBusCachedPlugin_iBusRsp_redoFetch = 1'b1;
    end
  end

  assign IBusCachedPlugin_iBusRsp_stages_0_input_valid = IBusCachedPlugin_fetchPc_output_valid;
  assign IBusCachedPlugin_fetchPc_output_ready = IBusCachedPlugin_iBusRsp_stages_0_input_ready;
  assign IBusCachedPlugin_iBusRsp_stages_0_input_payload = IBusCachedPlugin_fetchPc_output_payload;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_stages_0_halt = 1'b0;
    if(IBusCachedPlugin_cache_io_cpu_prefetch_haltIt)begin
      IBusCachedPlugin_iBusRsp_stages_0_halt = 1'b1;
    end
  end

  assign _zz_60 = (! IBusCachedPlugin_iBusRsp_stages_0_halt);
  assign IBusCachedPlugin_iBusRsp_stages_0_input_ready = (IBusCachedPlugin_iBusRsp_stages_0_output_ready && _zz_60);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_valid = (IBusCachedPlugin_iBusRsp_stages_0_input_valid && _zz_60);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_payload = IBusCachedPlugin_iBusRsp_stages_0_input_payload;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b0;
    if(IBusCachedPlugin_cache_io_cpu_fetch_haltIt)begin
      IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b1;
    end
  end

  assign _zz_61 = (! IBusCachedPlugin_iBusRsp_stages_1_halt);
  assign IBusCachedPlugin_iBusRsp_stages_1_input_ready = (IBusCachedPlugin_iBusRsp_stages_1_output_ready && _zz_61);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_valid = (IBusCachedPlugin_iBusRsp_stages_1_input_valid && _zz_61);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_payload = IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_stages_2_halt = 1'b0;
    if((_zz_51 || IBusCachedPlugin_rsp_iBusRspOutputHalt))begin
      IBusCachedPlugin_iBusRsp_stages_2_halt = 1'b1;
    end
  end

  assign _zz_62 = (! IBusCachedPlugin_iBusRsp_stages_2_halt);
  assign IBusCachedPlugin_iBusRsp_stages_2_input_ready = (IBusCachedPlugin_iBusRsp_stages_2_output_ready && _zz_62);
  assign IBusCachedPlugin_iBusRsp_stages_2_output_valid = (IBusCachedPlugin_iBusRsp_stages_2_input_valid && _zz_62);
  assign IBusCachedPlugin_iBusRsp_stages_2_output_payload = IBusCachedPlugin_iBusRsp_stages_2_input_payload;
  assign IBusCachedPlugin_fetchPc_redo_valid = IBusCachedPlugin_iBusRsp_redoFetch;
  always @ (*) begin
    IBusCachedPlugin_fetchPc_redo_payload = IBusCachedPlugin_iBusRsp_stages_2_input_payload;
    if(IBusCachedPlugin_decompressor_throw2BytesReg)begin
      IBusCachedPlugin_fetchPc_redo_payload[1] = 1'b1;
    end
  end

  assign IBusCachedPlugin_iBusRsp_stages_0_flush = 1'b0;
  assign IBusCachedPlugin_iBusRsp_stages_1_flush = (IBusCachedPlugin_fetcherflushIt || IBusCachedPlugin_iBusRsp_redoFetch);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_ready = _zz_63;
  assign _zz_63 = ((1'b0 && (! _zz_64)) || IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign _zz_64 = _zz_65;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_valid = _zz_64;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_payload = IBusCachedPlugin_fetchPc_pcReg;
  assign IBusCachedPlugin_iBusRsp_stages_2_flush = (decode_arbitration_removeIt || IBusCachedPlugin_iBusRsp_redoFetch);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_ready = ((1'b0 && (! _zz_66)) || IBusCachedPlugin_iBusRsp_stages_2_input_ready);
  assign _zz_66 = _zz_67;
  assign IBusCachedPlugin_iBusRsp_stages_2_input_valid = _zz_66;
  assign IBusCachedPlugin_iBusRsp_stages_2_input_payload = _zz_68;
  assign IBusCachedPlugin_iBusRsp_readyForError = 1'b1;
  assign IBusCachedPlugin_decompressor_input_valid = (IBusCachedPlugin_iBusRsp_output_valid && (! IBusCachedPlugin_iBusRsp_redoFetch));
  assign IBusCachedPlugin_decompressor_input_payload_pc = IBusCachedPlugin_iBusRsp_output_payload_pc;
  assign IBusCachedPlugin_decompressor_input_payload_rsp_error = IBusCachedPlugin_iBusRsp_output_payload_rsp_error;
  assign IBusCachedPlugin_decompressor_input_payload_rsp_inst = IBusCachedPlugin_iBusRsp_output_payload_rsp_inst;
  assign IBusCachedPlugin_decompressor_input_payload_isRvc = IBusCachedPlugin_iBusRsp_output_payload_isRvc;
  assign IBusCachedPlugin_iBusRsp_output_ready = IBusCachedPlugin_decompressor_input_ready;
  assign IBusCachedPlugin_decompressor_consumeCurrent = (decode_arbitration_flushNext && IBusCachedPlugin_decompressor_output_ready);
  assign IBusCachedPlugin_decompressor_isInputLowRvc = (IBusCachedPlugin_decompressor_input_payload_rsp_inst[1 : 0] != 2'b11);
  assign IBusCachedPlugin_decompressor_isInputHighRvc = (IBusCachedPlugin_decompressor_input_payload_rsp_inst[17 : 16] != 2'b11);
  assign IBusCachedPlugin_decompressor_throw2Bytes = (IBusCachedPlugin_decompressor_throw2BytesReg || IBusCachedPlugin_decompressor_input_payload_pc[1]);
  assign IBusCachedPlugin_decompressor_unaligned = (IBusCachedPlugin_decompressor_throw2Bytes || IBusCachedPlugin_decompressor_bufferValid);
  assign IBusCachedPlugin_decompressor_raw = (IBusCachedPlugin_decompressor_bufferValid ? {IBusCachedPlugin_decompressor_input_payload_rsp_inst[15 : 0],IBusCachedPlugin_decompressor_bufferData} : {IBusCachedPlugin_decompressor_input_payload_rsp_inst[31 : 16],(IBusCachedPlugin_decompressor_throw2Bytes ? IBusCachedPlugin_decompressor_input_payload_rsp_inst[31 : 16] : IBusCachedPlugin_decompressor_input_payload_rsp_inst[15 : 0])});
  assign IBusCachedPlugin_decompressor_isRvc = (IBusCachedPlugin_decompressor_raw[1 : 0] != 2'b11);
  assign _zz_69 = IBusCachedPlugin_decompressor_raw[15 : 0];
  always @ (*) begin
    IBusCachedPlugin_decompressor_decompressed = 32'h0;
    case(_zz_226)
      5'h0 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{{{{{{2'b00,_zz_69[10 : 7]},_zz_69[12 : 11]},_zz_69[5]},_zz_69[6]},2'b00},5'h02},3'b000},_zz_71},7'h13};
      end
      5'h02 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{_zz_72,_zz_70},3'b010},_zz_71},7'h03};
      end
      5'h06 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{{_zz_72[11 : 5],_zz_71},_zz_70},3'b010},_zz_72[4 : 0]},7'h23};
      end
      5'h08 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{_zz_74,_zz_69[11 : 7]},3'b000},_zz_69[11 : 7]},7'h13};
      end
      5'h09 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{{_zz_77[20],_zz_77[10 : 1]},_zz_77[11]},_zz_77[19 : 12]},_zz_89},7'h6f};
      end
      5'h0a : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{_zz_74,5'h0},3'b000},_zz_69[11 : 7]},7'h13};
      end
      5'h0b : begin
        IBusCachedPlugin_decompressor_decompressed = ((_zz_69[11 : 7] == 5'h02) ? {{{{{{{{{_zz_81,_zz_69[4 : 3]},_zz_69[5]},_zz_69[2]},_zz_69[6]},4'b0000},_zz_69[11 : 7]},3'b000},_zz_69[11 : 7]},7'h13} : {{_zz_268[31 : 12],_zz_69[11 : 7]},7'h37});
      end
      5'h0c : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{{((_zz_69[11 : 10] == 2'b10) ? _zz_95 : {{1'b0,(_zz_317 || _zz_318)},5'h0}),(((! _zz_69[11]) || _zz_91) ? _zz_69[6 : 2] : _zz_71)},_zz_70},_zz_93},_zz_70},(_zz_91 ? 7'h13 : 7'h33)};
      end
      5'h0d : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{{_zz_84[20],_zz_84[10 : 1]},_zz_84[11]},_zz_84[19 : 12]},_zz_88},7'h6f};
      end
      5'h0e : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{{{{_zz_87[12],_zz_87[10 : 5]},_zz_88},_zz_70},3'b000},_zz_87[4 : 1]},_zz_87[11]},7'h63};
      end
      5'h0f : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{{{{_zz_87[12],_zz_87[10 : 5]},_zz_88},_zz_70},3'b001},_zz_87[4 : 1]},_zz_87[11]},7'h63};
      end
      5'h10 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{{7'h0,_zz_69[6 : 2]},_zz_69[11 : 7]},3'b001},_zz_69[11 : 7]},7'h13};
      end
      5'h12 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{{{{{4'b0000,_zz_69[3 : 2]},_zz_69[12]},_zz_69[6 : 4]},2'b00},_zz_90},3'b010},_zz_69[11 : 7]},7'h03};
      end
      5'h14 : begin
        IBusCachedPlugin_decompressor_decompressed = ((_zz_69[12 : 2] == 11'h400) ? 32'h00100073 : ((_zz_69[6 : 2] == 5'h0) ? {{{{12'h0,_zz_69[11 : 7]},3'b000},(_zz_69[12] ? _zz_89 : _zz_88)},7'h67} : {{{{{_zz_319,_zz_320},(_zz_321 ? _zz_322 : _zz_88)},3'b000},_zz_69[11 : 7]},7'h33}));
      end
      5'h16 : begin
        IBusCachedPlugin_decompressor_decompressed = {{{{{_zz_269[11 : 5],_zz_69[6 : 2]},_zz_90},3'b010},_zz_270[4 : 0]},7'h23};
      end
      default : begin
      end
    endcase
  end

  assign _zz_70 = {2'b01,_zz_69[9 : 7]};
  assign _zz_71 = {2'b01,_zz_69[4 : 2]};
  assign _zz_72 = {{{{5'h0,_zz_69[5]},_zz_69[12 : 10]},_zz_69[6]},2'b00};
  assign _zz_73 = _zz_69[12];
  always @ (*) begin
    _zz_74[11] = _zz_73;
    _zz_74[10] = _zz_73;
    _zz_74[9] = _zz_73;
    _zz_74[8] = _zz_73;
    _zz_74[7] = _zz_73;
    _zz_74[6] = _zz_73;
    _zz_74[5] = _zz_73;
    _zz_74[4 : 0] = _zz_69[6 : 2];
  end

  assign _zz_75 = _zz_69[12];
  always @ (*) begin
    _zz_76[9] = _zz_75;
    _zz_76[8] = _zz_75;
    _zz_76[7] = _zz_75;
    _zz_76[6] = _zz_75;
    _zz_76[5] = _zz_75;
    _zz_76[4] = _zz_75;
    _zz_76[3] = _zz_75;
    _zz_76[2] = _zz_75;
    _zz_76[1] = _zz_75;
    _zz_76[0] = _zz_75;
  end

  assign _zz_77 = {{{{{{{{_zz_76,_zz_69[8]},_zz_69[10 : 9]},_zz_69[6]},_zz_69[7]},_zz_69[2]},_zz_69[11]},_zz_69[5 : 3]},1'b0};
  assign _zz_78 = _zz_69[12];
  always @ (*) begin
    _zz_79[14] = _zz_78;
    _zz_79[13] = _zz_78;
    _zz_79[12] = _zz_78;
    _zz_79[11] = _zz_78;
    _zz_79[10] = _zz_78;
    _zz_79[9] = _zz_78;
    _zz_79[8] = _zz_78;
    _zz_79[7] = _zz_78;
    _zz_79[6] = _zz_78;
    _zz_79[5] = _zz_78;
    _zz_79[4] = _zz_78;
    _zz_79[3] = _zz_78;
    _zz_79[2] = _zz_78;
    _zz_79[1] = _zz_78;
    _zz_79[0] = _zz_78;
  end

  assign _zz_80 = _zz_69[12];
  always @ (*) begin
    _zz_81[2] = _zz_80;
    _zz_81[1] = _zz_80;
    _zz_81[0] = _zz_80;
  end

  assign _zz_82 = _zz_69[12];
  always @ (*) begin
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

  assign _zz_84 = {{{{{{{{_zz_83,_zz_69[8]},_zz_69[10 : 9]},_zz_69[6]},_zz_69[7]},_zz_69[2]},_zz_69[11]},_zz_69[5 : 3]},1'b0};
  assign _zz_85 = _zz_69[12];
  always @ (*) begin
    _zz_86[4] = _zz_85;
    _zz_86[3] = _zz_85;
    _zz_86[2] = _zz_85;
    _zz_86[1] = _zz_85;
    _zz_86[0] = _zz_85;
  end

  assign _zz_87 = {{{{{_zz_86,_zz_69[6 : 5]},_zz_69[2]},_zz_69[11 : 10]},_zz_69[4 : 3]},1'b0};
  assign _zz_88 = 5'h0;
  assign _zz_89 = 5'h01;
  assign _zz_90 = 5'h02;
  assign _zz_91 = (_zz_69[11 : 10] != 2'b11);
  always @ (*) begin
    case(_zz_227)
      2'b00 : begin
        _zz_92 = 3'b000;
      end
      2'b01 : begin
        _zz_92 = 3'b100;
      end
      2'b10 : begin
        _zz_92 = 3'b110;
      end
      default : begin
        _zz_92 = 3'b111;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_228)
      2'b00 : begin
        _zz_93 = 3'b101;
      end
      2'b01 : begin
        _zz_93 = 3'b101;
      end
      2'b10 : begin
        _zz_93 = 3'b111;
      end
      default : begin
        _zz_93 = _zz_92;
      end
    endcase
  end

  assign _zz_94 = _zz_69[12];
  always @ (*) begin
    _zz_95[6] = _zz_94;
    _zz_95[5] = _zz_94;
    _zz_95[4] = _zz_94;
    _zz_95[3] = _zz_94;
    _zz_95[2] = _zz_94;
    _zz_95[1] = _zz_94;
    _zz_95[0] = _zz_94;
  end

  assign IBusCachedPlugin_decompressor_output_valid = (IBusCachedPlugin_decompressor_input_valid && (! ((IBusCachedPlugin_decompressor_throw2Bytes && (! IBusCachedPlugin_decompressor_bufferValid)) && (! IBusCachedPlugin_decompressor_isInputHighRvc))));
  assign IBusCachedPlugin_decompressor_output_payload_pc = IBusCachedPlugin_decompressor_input_payload_pc;
  assign IBusCachedPlugin_decompressor_output_payload_isRvc = IBusCachedPlugin_decompressor_isRvc;
  assign IBusCachedPlugin_decompressor_output_payload_rsp_inst = (IBusCachedPlugin_decompressor_isRvc ? IBusCachedPlugin_decompressor_decompressed : IBusCachedPlugin_decompressor_raw);
  assign IBusCachedPlugin_decompressor_input_ready = (IBusCachedPlugin_decompressor_output_ready && (((! IBusCachedPlugin_iBusRsp_stages_2_input_valid) || decode_arbitration_flushNext) || ((! (IBusCachedPlugin_decompressor_bufferValid && IBusCachedPlugin_decompressor_isInputHighRvc)) && (! (((! IBusCachedPlugin_decompressor_unaligned) && IBusCachedPlugin_decompressor_isInputLowRvc) && IBusCachedPlugin_decompressor_isInputHighRvc)))));
  assign IBusCachedPlugin_decompressor_bufferFill = (((((! IBusCachedPlugin_decompressor_unaligned) && IBusCachedPlugin_decompressor_isInputLowRvc) && (! IBusCachedPlugin_decompressor_isInputHighRvc)) || (IBusCachedPlugin_decompressor_bufferValid && (! IBusCachedPlugin_decompressor_isInputHighRvc))) || ((IBusCachedPlugin_decompressor_throw2Bytes && (! IBusCachedPlugin_decompressor_isRvc)) && (! IBusCachedPlugin_decompressor_isInputHighRvc)));
  assign IBusCachedPlugin_pcValids_0 = IBusCachedPlugin_injector_nextPcCalc_valids_0;
  assign IBusCachedPlugin_pcValids_1 = IBusCachedPlugin_injector_nextPcCalc_valids_1;
  assign IBusCachedPlugin_pcValids_2 = IBusCachedPlugin_injector_nextPcCalc_valids_2;
  assign IBusCachedPlugin_pcValids_3 = IBusCachedPlugin_injector_nextPcCalc_valids_3;
  assign IBusCachedPlugin_decompressor_output_ready = (! decode_arbitration_isStuck);
  assign decode_arbitration_isValid = IBusCachedPlugin_decompressor_output_valid;
  assign _zz_96 = _zz_271[11];
  always @ (*) begin
    _zz_97[18] = _zz_96;
    _zz_97[17] = _zz_96;
    _zz_97[16] = _zz_96;
    _zz_97[15] = _zz_96;
    _zz_97[14] = _zz_96;
    _zz_97[13] = _zz_96;
    _zz_97[12] = _zz_96;
    _zz_97[11] = _zz_96;
    _zz_97[10] = _zz_96;
    _zz_97[9] = _zz_96;
    _zz_97[8] = _zz_96;
    _zz_97[7] = _zz_96;
    _zz_97[6] = _zz_96;
    _zz_97[5] = _zz_96;
    _zz_97[4] = _zz_96;
    _zz_97[3] = _zz_96;
    _zz_97[2] = _zz_96;
    _zz_97[1] = _zz_96;
    _zz_97[0] = _zz_96;
  end

  assign IBusCachedPlugin_decodePrediction_cmd_hadBranch = ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) || ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_B) && _zz_272[31]));
  assign IBusCachedPlugin_predictionJumpInterface_valid = (decode_arbitration_isValid && IBusCachedPlugin_decodePrediction_cmd_hadBranch);
  assign _zz_98 = _zz_273[19];
  always @ (*) begin
    _zz_99[10] = _zz_98;
    _zz_99[9] = _zz_98;
    _zz_99[8] = _zz_98;
    _zz_99[7] = _zz_98;
    _zz_99[6] = _zz_98;
    _zz_99[5] = _zz_98;
    _zz_99[4] = _zz_98;
    _zz_99[3] = _zz_98;
    _zz_99[2] = _zz_98;
    _zz_99[1] = _zz_98;
    _zz_99[0] = _zz_98;
  end

  assign _zz_100 = _zz_274[11];
  always @ (*) begin
    _zz_101[18] = _zz_100;
    _zz_101[17] = _zz_100;
    _zz_101[16] = _zz_100;
    _zz_101[15] = _zz_100;
    _zz_101[14] = _zz_100;
    _zz_101[13] = _zz_100;
    _zz_101[12] = _zz_100;
    _zz_101[11] = _zz_100;
    _zz_101[10] = _zz_100;
    _zz_101[9] = _zz_100;
    _zz_101[8] = _zz_100;
    _zz_101[7] = _zz_100;
    _zz_101[6] = _zz_100;
    _zz_101[5] = _zz_100;
    _zz_101[4] = _zz_100;
    _zz_101[3] = _zz_100;
    _zz_101[2] = _zz_100;
    _zz_101[1] = _zz_100;
    _zz_101[0] = _zz_100;
  end

  assign IBusCachedPlugin_predictionJumpInterface_payload = (decode_PC + ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) ? {{_zz_99,{{{_zz_323,_zz_324},_zz_325},decode_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_101,{{{_zz_326,_zz_327},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0}));
  assign iBus_cmd_valid = IBusCachedPlugin_cache_io_mem_cmd_valid;
  always @ (*) begin
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
  end

  assign iBus_cmd_payload_size = IBusCachedPlugin_cache_io_mem_cmd_payload_size;
  assign IBusCachedPlugin_s0_tightlyCoupledHit = 1'b0;
  assign _zz_177 = (IBusCachedPlugin_iBusRsp_stages_0_input_valid && (! IBusCachedPlugin_s0_tightlyCoupledHit));
  assign _zz_178 = (IBusCachedPlugin_iBusRsp_stages_1_input_valid && (! IBusCachedPlugin_s1_tightlyCoupledHit));
  assign _zz_179 = (! IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign _zz_180 = (IBusCachedPlugin_iBusRsp_stages_2_input_valid && (! IBusCachedPlugin_s2_tightlyCoupledHit));
  assign _zz_181 = (! IBusCachedPlugin_iBusRsp_stages_2_input_ready);
  assign _zz_182 = (CsrPlugin_privilege == 2'b00);
  assign IBusCachedPlugin_rsp_iBusRspOutputHalt = 1'b0;
  assign IBusCachedPlugin_rsp_issueDetected = 1'b0;
  always @ (*) begin
    IBusCachedPlugin_rsp_redoFetch = 1'b0;
    if(_zz_206)begin
      IBusCachedPlugin_rsp_redoFetch = 1'b1;
    end
    if(_zz_205)begin
      IBusCachedPlugin_rsp_redoFetch = 1'b1;
    end
  end

  always @ (*) begin
    _zz_183 = (IBusCachedPlugin_rsp_redoFetch && (! IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling));
    if(_zz_205)begin
      _zz_183 = 1'b1;
    end
  end

  assign IBusCachedPlugin_iBusRsp_output_valid = IBusCachedPlugin_iBusRsp_stages_2_output_valid;
  assign IBusCachedPlugin_iBusRsp_stages_2_output_ready = IBusCachedPlugin_iBusRsp_output_ready;
  assign IBusCachedPlugin_iBusRsp_output_payload_rsp_inst = IBusCachedPlugin_cache_io_cpu_decode_data;
  assign IBusCachedPlugin_iBusRsp_output_payload_pc = IBusCachedPlugin_iBusRsp_stages_2_output_payload;
  assign IBusCachedPlugin_mmuBus_cmd_isValid = IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_isValid;
  assign IBusCachedPlugin_mmuBus_cmd_virtualAddress = IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_virtualAddress;
  assign IBusCachedPlugin_mmuBus_cmd_bypassTranslation = IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_bypassTranslation;
  assign IBusCachedPlugin_mmuBus_end = IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_end;
  assign _zz_176 = (decode_arbitration_isValid && decode_FLUSH_ALL);
  assign dBus_cmd_valid = dataCache_1_io_mem_cmd_valid;
  assign dBus_cmd_payload_wr = dataCache_1_io_mem_cmd_payload_wr;
  assign dBus_cmd_payload_address = dataCache_1_io_mem_cmd_payload_address;
  assign dBus_cmd_payload_data = dataCache_1_io_mem_cmd_payload_data;
  assign dBus_cmd_payload_mask = dataCache_1_io_mem_cmd_payload_mask;
  assign dBus_cmd_payload_length = dataCache_1_io_mem_cmd_payload_length;
  assign dBus_cmd_payload_last = dataCache_1_io_mem_cmd_payload_last;
  assign execute_DBusCachedPlugin_size = execute_INSTRUCTION[13 : 12];
  assign _zz_184 = (execute_arbitration_isValid && execute_MEMORY_ENABLE);
  assign _zz_185 = execute_SRC_ADD;
  always @ (*) begin
    case(execute_DBusCachedPlugin_size)
      2'b00 : begin
        _zz_104 = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_104 = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_104 = execute_RS2[31 : 0];
      end
    endcase
  end

  assign _zz_192 = (execute_arbitration_isValid && execute_MEMORY_MANAGMENT);
  assign _zz_186 = (memory_arbitration_isValid && memory_MEMORY_ENABLE);
  assign _zz_187 = memory_REGFILE_WRITE_DATA;
  assign DBusCachedPlugin_mmuBus_cmd_isValid = dataCache_1_io_cpu_memory_mmuBus_cmd_isValid;
  assign DBusCachedPlugin_mmuBus_cmd_virtualAddress = dataCache_1_io_cpu_memory_mmuBus_cmd_virtualAddress;
  assign DBusCachedPlugin_mmuBus_cmd_bypassTranslation = dataCache_1_io_cpu_memory_mmuBus_cmd_bypassTranslation;
  always @ (*) begin
    _zz_188 = DBusCachedPlugin_mmuBus_rsp_isIoAccess;
    if((1'b0 && (! dataCache_1_io_cpu_memory_isWrite)))begin
      _zz_188 = 1'b1;
    end
  end

  assign DBusCachedPlugin_mmuBus_end = dataCache_1_io_cpu_memory_mmuBus_end;
  assign _zz_189 = (writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE);
  assign _zz_190 = (CsrPlugin_privilege == 2'b00);
  assign _zz_191 = writeBack_REGFILE_WRITE_DATA;
  always @ (*) begin
    DBusCachedPlugin_redoBranch_valid = 1'b0;
    if((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE))begin
      if(dataCache_1_io_cpu_redo)begin
        DBusCachedPlugin_redoBranch_valid = 1'b1;
      end
    end
  end

  assign DBusCachedPlugin_redoBranch_payload = writeBack_PC;
  always @ (*) begin
    writeBack_DBusCachedPlugin_rspShifted = dataCache_1_io_cpu_writeBack_data;
    case(writeBack_MEMORY_ADDRESS_LOW)
      2'b01 : begin
        writeBack_DBusCachedPlugin_rspShifted[7 : 0] = dataCache_1_io_cpu_writeBack_data[15 : 8];
      end
      2'b10 : begin
        writeBack_DBusCachedPlugin_rspShifted[15 : 0] = dataCache_1_io_cpu_writeBack_data[31 : 16];
      end
      2'b11 : begin
        writeBack_DBusCachedPlugin_rspShifted[7 : 0] = dataCache_1_io_cpu_writeBack_data[31 : 24];
      end
      default : begin
      end
    endcase
  end

  assign _zz_105 = (writeBack_DBusCachedPlugin_rspShifted[7] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_106[31] = _zz_105;
    _zz_106[30] = _zz_105;
    _zz_106[29] = _zz_105;
    _zz_106[28] = _zz_105;
    _zz_106[27] = _zz_105;
    _zz_106[26] = _zz_105;
    _zz_106[25] = _zz_105;
    _zz_106[24] = _zz_105;
    _zz_106[23] = _zz_105;
    _zz_106[22] = _zz_105;
    _zz_106[21] = _zz_105;
    _zz_106[20] = _zz_105;
    _zz_106[19] = _zz_105;
    _zz_106[18] = _zz_105;
    _zz_106[17] = _zz_105;
    _zz_106[16] = _zz_105;
    _zz_106[15] = _zz_105;
    _zz_106[14] = _zz_105;
    _zz_106[13] = _zz_105;
    _zz_106[12] = _zz_105;
    _zz_106[11] = _zz_105;
    _zz_106[10] = _zz_105;
    _zz_106[9] = _zz_105;
    _zz_106[8] = _zz_105;
    _zz_106[7 : 0] = writeBack_DBusCachedPlugin_rspShifted[7 : 0];
  end

  assign _zz_107 = (writeBack_DBusCachedPlugin_rspShifted[15] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_108[31] = _zz_107;
    _zz_108[30] = _zz_107;
    _zz_108[29] = _zz_107;
    _zz_108[28] = _zz_107;
    _zz_108[27] = _zz_107;
    _zz_108[26] = _zz_107;
    _zz_108[25] = _zz_107;
    _zz_108[24] = _zz_107;
    _zz_108[23] = _zz_107;
    _zz_108[22] = _zz_107;
    _zz_108[21] = _zz_107;
    _zz_108[20] = _zz_107;
    _zz_108[19] = _zz_107;
    _zz_108[18] = _zz_107;
    _zz_108[17] = _zz_107;
    _zz_108[16] = _zz_107;
    _zz_108[15 : 0] = writeBack_DBusCachedPlugin_rspShifted[15 : 0];
  end

  always @ (*) begin
    case(_zz_229)
      2'b00 : begin
        writeBack_DBusCachedPlugin_rspFormated = _zz_106;
      end
      2'b01 : begin
        writeBack_DBusCachedPlugin_rspFormated = _zz_108;
      end
      default : begin
        writeBack_DBusCachedPlugin_rspFormated = writeBack_DBusCachedPlugin_rspShifted;
      end
    endcase
  end

  assign IBusCachedPlugin_mmuBus_rsp_physicalAddress = IBusCachedPlugin_mmuBus_cmd_virtualAddress;
  assign IBusCachedPlugin_mmuBus_rsp_allowRead = 1'b1;
  assign IBusCachedPlugin_mmuBus_rsp_allowWrite = 1'b1;
  assign IBusCachedPlugin_mmuBus_rsp_allowExecute = 1'b1;
  assign IBusCachedPlugin_mmuBus_rsp_isIoAccess = (IBusCachedPlugin_mmuBus_rsp_physicalAddress[31 : 28] == 4'b1111);
  assign IBusCachedPlugin_mmuBus_rsp_exception = 1'b0;
  assign IBusCachedPlugin_mmuBus_rsp_refilling = 1'b0;
  assign IBusCachedPlugin_mmuBus_busy = 1'b0;
  assign DBusCachedPlugin_mmuBus_rsp_physicalAddress = DBusCachedPlugin_mmuBus_cmd_virtualAddress;
  assign DBusCachedPlugin_mmuBus_rsp_allowRead = 1'b1;
  assign DBusCachedPlugin_mmuBus_rsp_allowWrite = 1'b1;
  assign DBusCachedPlugin_mmuBus_rsp_allowExecute = 1'b1;
  assign DBusCachedPlugin_mmuBus_rsp_isIoAccess = (DBusCachedPlugin_mmuBus_rsp_physicalAddress[31 : 28] == 4'b1111);
  assign DBusCachedPlugin_mmuBus_rsp_exception = 1'b0;
  assign DBusCachedPlugin_mmuBus_rsp_refilling = 1'b0;
  assign DBusCachedPlugin_mmuBus_busy = 1'b0;
  assign _zz_110 = ((decode_INSTRUCTION & 32'h00000004) == 32'h00000004);
  assign _zz_111 = ((decode_INSTRUCTION & 32'h00000048) == 32'h00000048);
  assign _zz_112 = ((decode_INSTRUCTION & 32'h00001000) == 32'h0);
  assign _zz_113 = ((decode_INSTRUCTION & 32'h00004050) == 32'h00004050);
  assign _zz_109 = {(((decode_INSTRUCTION & _zz_328) == 32'h00004010) != 1'b0),{((_zz_329 == _zz_330) != 1'b0),{({_zz_331,_zz_332} != 4'b0000),{(_zz_333 != _zz_334),{_zz_335,{_zz_336,_zz_337}}}}}};
  assign _zz_114 = _zz_109[1 : 0];
  assign _zz_49 = _zz_114;
  assign _zz_115 = _zz_109[9 : 8];
  assign _zz_48 = _zz_115;
  assign _zz_116 = _zz_109[10 : 10];
  assign _zz_47 = _zz_116;
  assign _zz_117 = _zz_109[12 : 11];
  assign _zz_46 = _zz_117;
  assign _zz_118 = _zz_109[18 : 17];
  assign _zz_45 = _zz_118;
  assign _zz_119 = _zz_109[25 : 24];
  assign _zz_44 = _zz_119;
  assign _zz_120 = _zz_109[30 : 29];
  assign _zz_43 = _zz_120;
  assign decode_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION[19 : 15];
  assign decode_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION[24 : 20];
  assign decode_RegFilePlugin_rs1Data = _zz_196;
  assign decode_RegFilePlugin_rs2Data = _zz_197;
  assign lastStageRegFileWrite_valid = (_zz_41 && writeBack_arbitration_isFiring);
  assign lastStageRegFileWrite_payload_address = _zz_40[11 : 7];
  assign lastStageRegFileWrite_payload_data = _zz_50;
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
        _zz_121 = execute_IntAluPlugin_bitwise;
      end
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : begin
        _zz_121 = {31'd0, _zz_275};
      end
      default : begin
        _zz_121 = execute_SRC_ADD_SUB;
      end
    endcase
  end

  always @ (*) begin
    case(execute_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : begin
        _zz_122 = execute_RS1;
      end
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : begin
        _zz_122 = {29'd0, _zz_276};
      end
      `Src1CtrlEnum_defaultEncoding_IMU : begin
        _zz_122 = {execute_INSTRUCTION[31 : 12],12'h0};
      end
      default : begin
        _zz_122 = {27'd0, _zz_277};
      end
    endcase
  end

  assign _zz_123 = _zz_278[11];
  always @ (*) begin
    _zz_124[19] = _zz_123;
    _zz_124[18] = _zz_123;
    _zz_124[17] = _zz_123;
    _zz_124[16] = _zz_123;
    _zz_124[15] = _zz_123;
    _zz_124[14] = _zz_123;
    _zz_124[13] = _zz_123;
    _zz_124[12] = _zz_123;
    _zz_124[11] = _zz_123;
    _zz_124[10] = _zz_123;
    _zz_124[9] = _zz_123;
    _zz_124[8] = _zz_123;
    _zz_124[7] = _zz_123;
    _zz_124[6] = _zz_123;
    _zz_124[5] = _zz_123;
    _zz_124[4] = _zz_123;
    _zz_124[3] = _zz_123;
    _zz_124[2] = _zz_123;
    _zz_124[1] = _zz_123;
    _zz_124[0] = _zz_123;
  end

  assign _zz_125 = _zz_279[11];
  always @ (*) begin
    _zz_126[19] = _zz_125;
    _zz_126[18] = _zz_125;
    _zz_126[17] = _zz_125;
    _zz_126[16] = _zz_125;
    _zz_126[15] = _zz_125;
    _zz_126[14] = _zz_125;
    _zz_126[13] = _zz_125;
    _zz_126[12] = _zz_125;
    _zz_126[11] = _zz_125;
    _zz_126[10] = _zz_125;
    _zz_126[9] = _zz_125;
    _zz_126[8] = _zz_125;
    _zz_126[7] = _zz_125;
    _zz_126[6] = _zz_125;
    _zz_126[5] = _zz_125;
    _zz_126[4] = _zz_125;
    _zz_126[3] = _zz_125;
    _zz_126[2] = _zz_125;
    _zz_126[1] = _zz_125;
    _zz_126[0] = _zz_125;
  end

  always @ (*) begin
    case(execute_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : begin
        _zz_127 = execute_RS2;
      end
      `Src2CtrlEnum_defaultEncoding_IMI : begin
        _zz_127 = {_zz_124,execute_INSTRUCTION[31 : 20]};
      end
      `Src2CtrlEnum_defaultEncoding_IMS : begin
        _zz_127 = {_zz_126,{execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_127 = _zz_35;
      end
    endcase
  end

  always @ (*) begin
    execute_SrcPlugin_addSub = _zz_280;
    if(execute_SRC2_FORCE_ZERO)begin
      execute_SrcPlugin_addSub = execute_SRC1;
    end
  end

  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign execute_FullBarrelShifterPlugin_amplitude = execute_SRC2[4 : 0];
  always @ (*) begin
    _zz_128[0] = execute_SRC1[31];
    _zz_128[1] = execute_SRC1[30];
    _zz_128[2] = execute_SRC1[29];
    _zz_128[3] = execute_SRC1[28];
    _zz_128[4] = execute_SRC1[27];
    _zz_128[5] = execute_SRC1[26];
    _zz_128[6] = execute_SRC1[25];
    _zz_128[7] = execute_SRC1[24];
    _zz_128[8] = execute_SRC1[23];
    _zz_128[9] = execute_SRC1[22];
    _zz_128[10] = execute_SRC1[21];
    _zz_128[11] = execute_SRC1[20];
    _zz_128[12] = execute_SRC1[19];
    _zz_128[13] = execute_SRC1[18];
    _zz_128[14] = execute_SRC1[17];
    _zz_128[15] = execute_SRC1[16];
    _zz_128[16] = execute_SRC1[15];
    _zz_128[17] = execute_SRC1[14];
    _zz_128[18] = execute_SRC1[13];
    _zz_128[19] = execute_SRC1[12];
    _zz_128[20] = execute_SRC1[11];
    _zz_128[21] = execute_SRC1[10];
    _zz_128[22] = execute_SRC1[9];
    _zz_128[23] = execute_SRC1[8];
    _zz_128[24] = execute_SRC1[7];
    _zz_128[25] = execute_SRC1[6];
    _zz_128[26] = execute_SRC1[5];
    _zz_128[27] = execute_SRC1[4];
    _zz_128[28] = execute_SRC1[3];
    _zz_128[29] = execute_SRC1[2];
    _zz_128[30] = execute_SRC1[1];
    _zz_128[31] = execute_SRC1[0];
  end

  assign execute_FullBarrelShifterPlugin_reversed = ((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SLL_1) ? _zz_128 : execute_SRC1);
  always @ (*) begin
    _zz_129[0] = memory_SHIFT_RIGHT[31];
    _zz_129[1] = memory_SHIFT_RIGHT[30];
    _zz_129[2] = memory_SHIFT_RIGHT[29];
    _zz_129[3] = memory_SHIFT_RIGHT[28];
    _zz_129[4] = memory_SHIFT_RIGHT[27];
    _zz_129[5] = memory_SHIFT_RIGHT[26];
    _zz_129[6] = memory_SHIFT_RIGHT[25];
    _zz_129[7] = memory_SHIFT_RIGHT[24];
    _zz_129[8] = memory_SHIFT_RIGHT[23];
    _zz_129[9] = memory_SHIFT_RIGHT[22];
    _zz_129[10] = memory_SHIFT_RIGHT[21];
    _zz_129[11] = memory_SHIFT_RIGHT[20];
    _zz_129[12] = memory_SHIFT_RIGHT[19];
    _zz_129[13] = memory_SHIFT_RIGHT[18];
    _zz_129[14] = memory_SHIFT_RIGHT[17];
    _zz_129[15] = memory_SHIFT_RIGHT[16];
    _zz_129[16] = memory_SHIFT_RIGHT[15];
    _zz_129[17] = memory_SHIFT_RIGHT[14];
    _zz_129[18] = memory_SHIFT_RIGHT[13];
    _zz_129[19] = memory_SHIFT_RIGHT[12];
    _zz_129[20] = memory_SHIFT_RIGHT[11];
    _zz_129[21] = memory_SHIFT_RIGHT[10];
    _zz_129[22] = memory_SHIFT_RIGHT[9];
    _zz_129[23] = memory_SHIFT_RIGHT[8];
    _zz_129[24] = memory_SHIFT_RIGHT[7];
    _zz_129[25] = memory_SHIFT_RIGHT[6];
    _zz_129[26] = memory_SHIFT_RIGHT[5];
    _zz_129[27] = memory_SHIFT_RIGHT[4];
    _zz_129[28] = memory_SHIFT_RIGHT[3];
    _zz_129[29] = memory_SHIFT_RIGHT[2];
    _zz_129[30] = memory_SHIFT_RIGHT[1];
    _zz_129[31] = memory_SHIFT_RIGHT[0];
  end

  assign execute_MulPlugin_a = execute_RS1;
  assign execute_MulPlugin_b = execute_RS2;
  always @ (*) begin
    case(_zz_211)
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
    case(_zz_211)
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
  assign writeBack_MulPlugin_result = ($signed(_zz_287) + $signed(_zz_288));
  assign memory_DivPlugin_frontendOk = 1'b1;
  always @ (*) begin
    memory_DivPlugin_div_counter_willIncrement = 1'b0;
    if(_zz_204)begin
      if(_zz_212)begin
        memory_DivPlugin_div_counter_willIncrement = 1'b1;
      end
    end
  end

  always @ (*) begin
    memory_DivPlugin_div_counter_willClear = 1'b0;
    if(_zz_213)begin
      memory_DivPlugin_div_counter_willClear = 1'b1;
    end
  end

  assign memory_DivPlugin_div_counter_willOverflowIfInc = (memory_DivPlugin_div_counter_value == 6'h21);
  assign memory_DivPlugin_div_counter_willOverflow = (memory_DivPlugin_div_counter_willOverflowIfInc && memory_DivPlugin_div_counter_willIncrement);
  always @ (*) begin
    if(memory_DivPlugin_div_counter_willOverflow)begin
      memory_DivPlugin_div_counter_valueNext = 6'h0;
    end else begin
      memory_DivPlugin_div_counter_valueNext = (memory_DivPlugin_div_counter_value + _zz_292);
    end
    if(memory_DivPlugin_div_counter_willClear)begin
      memory_DivPlugin_div_counter_valueNext = 6'h0;
    end
  end

  assign _zz_130 = memory_DivPlugin_rs1[31 : 0];
  assign _zz_131 = {memory_DivPlugin_accumulator[31 : 0],_zz_130[31]};
  assign _zz_132 = (_zz_131 - _zz_293);
  assign _zz_133 = (memory_INSTRUCTION[13] ? memory_DivPlugin_accumulator[31 : 0] : memory_DivPlugin_rs1[31 : 0]);
  assign _zz_134 = (execute_RS2[31] && execute_IS_RS2_SIGNED);
  assign _zz_135 = (1'b0 || ((execute_IS_DIV && execute_RS1[31]) && execute_IS_RS1_SIGNED));
  always @ (*) begin
    _zz_136[32] = (execute_IS_RS1_SIGNED && execute_RS1[31]);
    _zz_136[31 : 0] = execute_RS1;
  end

  always @ (*) begin
    _zz_137 = 1'b0;
    if(_zz_214)begin
      if(_zz_215)begin
        if(_zz_142)begin
          _zz_137 = 1'b1;
        end
      end
    end
    if(_zz_216)begin
      if(_zz_217)begin
        if(_zz_144)begin
          _zz_137 = 1'b1;
        end
      end
    end
    if(_zz_218)begin
      if(_zz_219)begin
        if(_zz_146)begin
          _zz_137 = 1'b1;
        end
      end
    end
    if((! decode_RS1_USE))begin
      _zz_137 = 1'b0;
    end
  end

  always @ (*) begin
    _zz_138 = 1'b0;
    if(_zz_214)begin
      if(_zz_215)begin
        if(_zz_143)begin
          _zz_138 = 1'b1;
        end
      end
    end
    if(_zz_216)begin
      if(_zz_217)begin
        if(_zz_145)begin
          _zz_138 = 1'b1;
        end
      end
    end
    if(_zz_218)begin
      if(_zz_219)begin
        if(_zz_147)begin
          _zz_138 = 1'b1;
        end
      end
    end
    if((! decode_RS2_USE))begin
      _zz_138 = 1'b0;
    end
  end

  assign _zz_142 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_143 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign _zz_144 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_145 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign _zz_146 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_147 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign _zz_148 = execute_INSTRUCTION[14 : 12];
  always @ (*) begin
    if((_zz_148 == 3'b000)) begin
        _zz_149 = execute_BranchPlugin_eq;
    end else if((_zz_148 == 3'b001)) begin
        _zz_149 = (! execute_BranchPlugin_eq);
    end else if((((_zz_148 & 3'b101) == 3'b101))) begin
        _zz_149 = (! execute_SRC_LESS);
    end else begin
        _zz_149 = execute_SRC_LESS;
    end
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : begin
        _zz_150 = 1'b0;
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_150 = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_150 = 1'b1;
      end
      default : begin
        _zz_150 = _zz_149;
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

  assign _zz_151 = _zz_306[11];
  always @ (*) begin
    _zz_152[19] = _zz_151;
    _zz_152[18] = _zz_151;
    _zz_152[17] = _zz_151;
    _zz_152[16] = _zz_151;
    _zz_152[15] = _zz_151;
    _zz_152[14] = _zz_151;
    _zz_152[13] = _zz_151;
    _zz_152[12] = _zz_151;
    _zz_152[11] = _zz_151;
    _zz_152[10] = _zz_151;
    _zz_152[9] = _zz_151;
    _zz_152[8] = _zz_151;
    _zz_152[7] = _zz_151;
    _zz_152[6] = _zz_151;
    _zz_152[5] = _zz_151;
    _zz_152[4] = _zz_151;
    _zz_152[3] = _zz_151;
    _zz_152[2] = _zz_151;
    _zz_152[1] = _zz_151;
    _zz_152[0] = _zz_151;
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        execute_BranchPlugin_branch_src2 = {_zz_152,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        execute_BranchPlugin_branch_src2 = ((execute_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) ? {{_zz_154,{{{_zz_480,execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_156,{{{_zz_481,_zz_482},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0});
        if(execute_PREDICTION_HAD_BRANCHED2)begin
          execute_BranchPlugin_branch_src2 = {29'd0, _zz_309};
        end
      end
    endcase
  end

  assign _zz_153 = _zz_307[19];
  always @ (*) begin
    _zz_154[10] = _zz_153;
    _zz_154[9] = _zz_153;
    _zz_154[8] = _zz_153;
    _zz_154[7] = _zz_153;
    _zz_154[6] = _zz_153;
    _zz_154[5] = _zz_153;
    _zz_154[4] = _zz_153;
    _zz_154[3] = _zz_153;
    _zz_154[2] = _zz_153;
    _zz_154[1] = _zz_153;
    _zz_154[0] = _zz_153;
  end

  assign _zz_155 = _zz_308[11];
  always @ (*) begin
    _zz_156[18] = _zz_155;
    _zz_156[17] = _zz_155;
    _zz_156[16] = _zz_155;
    _zz_156[15] = _zz_155;
    _zz_156[14] = _zz_155;
    _zz_156[13] = _zz_155;
    _zz_156[12] = _zz_155;
    _zz_156[11] = _zz_155;
    _zz_156[10] = _zz_155;
    _zz_156[9] = _zz_155;
    _zz_156[8] = _zz_155;
    _zz_156[7] = _zz_155;
    _zz_156[6] = _zz_155;
    _zz_156[5] = _zz_155;
    _zz_156[4] = _zz_155;
    _zz_156[3] = _zz_155;
    _zz_156[2] = _zz_155;
    _zz_156[1] = _zz_155;
    _zz_156[0] = _zz_155;
  end

  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign BranchPlugin_jumpInterface_valid = ((memory_arbitration_isValid && memory_BRANCH_DO) && (! 1'b0));
  assign BranchPlugin_jumpInterface_payload = memory_BRANCH_CALC;
  assign IBusCachedPlugin_decodePrediction_rsp_wasWrong = BranchPlugin_jumpInterface_valid;
  always @ (*) begin
    CsrPlugin_privilege = 2'b11;
    if(CsrPlugin_forceMachineWire)begin
      CsrPlugin_privilege = 2'b11;
    end
  end

  assign CsrPlugin_misa_base = 2'b01;
  assign CsrPlugin_misa_extensions = 26'h0000042;
  assign CsrPlugin_mtvec_mode = 2'b00;
  assign CsrPlugin_mtvec_base = 30'h00000008;
  assign _zz_157 = (CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE);
  assign _zz_158 = (CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE);
  assign _zz_159 = (CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE);
  assign CsrPlugin_exception = 1'b0;
  assign CsrPlugin_lastStageWasWfi = 1'b0;
  assign CsrPlugin_pipelineLiberator_active = ((CsrPlugin_interrupt_valid && CsrPlugin_allowInterrupts) && decode_arbitration_isValid);
  always @ (*) begin
    CsrPlugin_pipelineLiberator_done = CsrPlugin_pipelineLiberator_pcValids_2;
    if(CsrPlugin_hadException)begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
  end

  assign CsrPlugin_interruptJump = ((CsrPlugin_interrupt_valid && CsrPlugin_pipelineLiberator_done) && CsrPlugin_allowInterrupts);
  assign CsrPlugin_targetPrivilege = CsrPlugin_interrupt_targetPrivilege;
  assign CsrPlugin_trapCause = CsrPlugin_interrupt_code;
  always @ (*) begin
    CsrPlugin_xtvec_mode = 2'bxx;
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_mode = CsrPlugin_mtvec_mode;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    CsrPlugin_xtvec_base = 30'h0;
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_base = CsrPlugin_mtvec_base;
      end
      default : begin
      end
    endcase
  end

  assign contextSwitching = CsrPlugin_jumpInterface_valid;
  assign execute_CsrPlugin_blockedBySideEffects = ({writeBack_arbitration_isValid,memory_arbitration_isValid} != 2'b00);
  always @ (*) begin
    execute_CsrPlugin_illegalAccess = 1'b1;
    case(execute_CsrPlugin_csrAddress)
      12'h300 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
      12'hb00 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
      end
      12'h341 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
      12'hb80 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
      end
      12'h344 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
      12'h343 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
      end
      12'hc00 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
      end
      12'h304 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
      12'hc80 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
      end
      12'h342 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
      end
      default : begin
      end
    endcase
    if((CsrPlugin_privilege < execute_CsrPlugin_csrAddress[9 : 8]))begin
      execute_CsrPlugin_illegalAccess = 1'b1;
    end
    if(((! execute_arbitration_isValid) || (! execute_IS_CSR)))begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
  end

  always @ (*) begin
    execute_CsrPlugin_illegalInstruction = 1'b0;
    if((execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)))begin
      if((CsrPlugin_privilege < execute_INSTRUCTION[29 : 28]))begin
        execute_CsrPlugin_illegalInstruction = 1'b1;
      end
    end
  end

  always @ (*) begin
    execute_CsrPlugin_readData = 32'h0;
    case(execute_CsrPlugin_csrAddress)
      12'h300 : begin
        execute_CsrPlugin_readData[12 : 11] = CsrPlugin_mstatus_MPP;
        execute_CsrPlugin_readData[7 : 7] = CsrPlugin_mstatus_MPIE;
        execute_CsrPlugin_readData[3 : 3] = CsrPlugin_mstatus_MIE;
      end
      12'hb00 : begin
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_mcycle[31 : 0];
      end
      12'h341 : begin
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_mepc;
      end
      12'hb80 : begin
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_mcycle[63 : 32];
      end
      12'h344 : begin
        execute_CsrPlugin_readData[11 : 11] = CsrPlugin_mip_MEIP;
        execute_CsrPlugin_readData[7 : 7] = CsrPlugin_mip_MTIP;
        execute_CsrPlugin_readData[3 : 3] = CsrPlugin_mip_MSIP;
      end
      12'h343 : begin
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_mtval;
      end
      12'hc00 : begin
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_mcycle[31 : 0];
      end
      12'h304 : begin
        execute_CsrPlugin_readData[11 : 11] = CsrPlugin_mie_MEIE;
        execute_CsrPlugin_readData[7 : 7] = CsrPlugin_mie_MTIE;
        execute_CsrPlugin_readData[3 : 3] = CsrPlugin_mie_MSIE;
      end
      12'hc80 : begin
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_mcycle[63 : 32];
      end
      12'h342 : begin
        execute_CsrPlugin_readData[31 : 31] = CsrPlugin_mcause_interrupt;
        execute_CsrPlugin_readData[3 : 0] = CsrPlugin_mcause_exceptionCode;
      end
      default : begin
      end
    endcase
  end

  assign execute_CsrPlugin_writeInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_WRITE_OPCODE);
  assign execute_CsrPlugin_readInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_READ_OPCODE);
  assign execute_CsrPlugin_writeEnable = ((execute_CsrPlugin_writeInstruction && (! execute_CsrPlugin_blockedBySideEffects)) && (! execute_arbitration_isStuckByOthers));
  assign execute_CsrPlugin_readEnable = ((execute_CsrPlugin_readInstruction && (! execute_CsrPlugin_blockedBySideEffects)) && (! execute_arbitration_isStuckByOthers));
  assign execute_CsrPlugin_readToWriteData = execute_CsrPlugin_readData;
  always @ (*) begin
    case(_zz_231)
      1'b0 : begin
        execute_CsrPlugin_writeData = execute_SRC1;
      end
      default : begin
        execute_CsrPlugin_writeData = (execute_INSTRUCTION[12] ? (execute_CsrPlugin_readToWriteData & (~ execute_SRC1)) : (execute_CsrPlugin_readToWriteData | execute_SRC1));
      end
    endcase
  end

  assign execute_CsrPlugin_csrAddress = execute_INSTRUCTION[31 : 20];
  assign _zz_26 = decode_ENV_CTRL;
  assign _zz_23 = execute_ENV_CTRL;
  assign _zz_21 = memory_ENV_CTRL;
  assign _zz_24 = _zz_47;
  assign _zz_28 = decode_to_execute_ENV_CTRL;
  assign _zz_27 = execute_to_memory_ENV_CTRL;
  assign _zz_29 = memory_to_writeBack_ENV_CTRL;
  assign _zz_19 = decode_SRC2_CTRL;
  assign _zz_17 = _zz_49;
  assign _zz_36 = decode_to_execute_SRC2_CTRL;
  assign _zz_16 = decode_ALU_CTRL;
  assign _zz_14 = _zz_43;
  assign _zz_38 = decode_to_execute_ALU_CTRL;
  assign _zz_13 = decode_SHIFT_CTRL;
  assign _zz_10 = execute_SHIFT_CTRL;
  assign _zz_11 = _zz_46;
  assign _zz_34 = decode_to_execute_SHIFT_CTRL;
  assign _zz_33 = execute_to_memory_SHIFT_CTRL;
  assign _zz_8 = decode_SRC1_CTRL;
  assign _zz_6 = _zz_45;
  assign _zz_37 = decode_to_execute_SRC1_CTRL;
  assign _zz_5 = decode_ALU_BITWISE_CTRL;
  assign _zz_3 = _zz_48;
  assign _zz_39 = decode_to_execute_ALU_BITWISE_CTRL;
  assign _zz_2 = decode_BRANCH_CTRL;
  assign _zz_52 = _zz_44;
  assign _zz_30 = decode_to_execute_BRANCH_CTRL;
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
  assign iBus_cmd_ready = iBusAxi_ar_ready;
  assign iBus_rsp_valid = iBusAxi_r_valid;
  assign iBus_rsp_payload_data = iBusAxi_r_payload_data;
  assign iBus_rsp_payload_error = (! (iBusAxi_r_payload_resp == 2'b00));
  assign iBusAxi_ar_valid = iBus_cmd_valid;
  assign iBusAxi_ar_payload_addr = iBus_cmd_payload_address;
  assign _zz_160[0 : 0] = 1'b0;
  assign iBusAxi_ar_payload_id = _zz_160;
  assign _zz_161[3 : 0] = 4'b0000;
  assign iBusAxi_ar_payload_region = _zz_161;
  assign iBusAxi_ar_payload_len = 8'h07;
  assign iBusAxi_ar_payload_size = 3'b010;
  assign iBusAxi_ar_payload_burst = 2'b01;
  assign iBusAxi_ar_payload_lock = 1'b0;
  assign iBusAxi_ar_payload_cache = 4'b1111;
  assign iBusAxi_ar_payload_qos = 4'b0000;
  assign iBusAxi_ar_payload_prot = 3'b110;
  assign iBusAxi_r_ready = 1'b1;
  always @ (*) begin
    _zz_162 = 1'b0;
    if(((dBus_cmd_valid && dBus_cmd_ready) && dBus_cmd_payload_wr))begin
      _zz_162 = 1'b1;
    end
  end

  always @ (*) begin
    _zz_163 = 1'b0;
    if((dBusAxi_b_valid && 1'b1))begin
      _zz_163 = 1'b1;
    end
  end

  always @ (*) begin
    if((_zz_162 && (! _zz_163)))begin
      _zz_165 = 3'b001;
    end else begin
      if(((! _zz_162) && _zz_163))begin
        _zz_165 = 3'b111;
      end else begin
        _zz_165 = 3'b000;
      end
    end
  end

  assign _zz_166 = (! (((_zz_164 != 3'b000) && (! dBus_cmd_payload_wr)) || (_zz_164 == 3'b111)));
  assign dBus_cmd_ready = (streamFork_1_io_input_ready && _zz_166);
  assign _zz_193 = (dBus_cmd_valid && _zz_166);
  always @ (*) begin
    streamFork_1_io_outputs_0_thrown_valid = streamFork_1_io_outputs_0_valid;
    if(_zz_167)begin
      streamFork_1_io_outputs_0_thrown_valid = 1'b0;
    end
  end

  always @ (*) begin
    _zz_194 = streamFork_1_io_outputs_0_thrown_ready;
    if(_zz_167)begin
      _zz_194 = 1'b1;
    end
  end

  assign streamFork_1_io_outputs_0_thrown_payload_wr = streamFork_1_io_outputs_0_payload_wr;
  assign streamFork_1_io_outputs_0_thrown_payload_address = streamFork_1_io_outputs_0_payload_address;
  assign streamFork_1_io_outputs_0_thrown_payload_data = streamFork_1_io_outputs_0_payload_data;
  assign streamFork_1_io_outputs_0_thrown_payload_mask = streamFork_1_io_outputs_0_payload_mask;
  assign streamFork_1_io_outputs_0_thrown_payload_length = streamFork_1_io_outputs_0_payload_length;
  assign streamFork_1_io_outputs_0_thrown_payload_last = streamFork_1_io_outputs_0_payload_last;
  always @ (*) begin
    streamFork_1_io_outputs_1_thrown_valid = streamFork_1_io_outputs_1_valid;
    if(_zz_220)begin
      streamFork_1_io_outputs_1_thrown_valid = 1'b0;
    end
  end

  always @ (*) begin
    _zz_195 = streamFork_1_io_outputs_1_thrown_ready;
    if(_zz_220)begin
      _zz_195 = 1'b1;
    end
  end

  assign streamFork_1_io_outputs_1_thrown_payload_wr = streamFork_1_io_outputs_1_payload_wr;
  assign streamFork_1_io_outputs_1_thrown_payload_address = streamFork_1_io_outputs_1_payload_address;
  assign streamFork_1_io_outputs_1_thrown_payload_data = streamFork_1_io_outputs_1_payload_data;
  assign streamFork_1_io_outputs_1_thrown_payload_mask = streamFork_1_io_outputs_1_payload_mask;
  assign streamFork_1_io_outputs_1_thrown_payload_length = streamFork_1_io_outputs_1_payload_length;
  assign streamFork_1_io_outputs_1_thrown_payload_last = streamFork_1_io_outputs_1_payload_last;
  assign streamFork_1_io_outputs_0_thrown_ready = (_zz_171 ? dBusAxi_aw_ready : dBusAxi_ar_ready);
  assign streamFork_1_io_outputs_1_thrown_ready = dBusAxi_w_ready;
  assign dBus_rsp_valid = dBusAxi_r_valid;
  assign dBus_rsp_payload_error = (! (dBusAxi_r_payload_resp == 2'b00));
  assign dBus_rsp_payload_data = dBusAxi_r_payload_data;
  assign _zz_168 = streamFork_1_io_outputs_0_thrown_valid;
  assign _zz_169 = streamFork_1_io_outputs_0_thrown_payload_address;
  assign _zz_170 = {5'd0, streamFork_1_io_outputs_0_thrown_payload_length};
  assign _zz_171 = streamFork_1_io_outputs_0_thrown_payload_wr;
  assign dBusAxi_ar_valid = (_zz_168 && (! _zz_171));
  assign dBusAxi_ar_payload_addr = _zz_169;
  assign _zz_172[0 : 0] = 1'b0;
  assign dBusAxi_ar_payload_id = _zz_172;
  assign _zz_173[3 : 0] = 4'b0000;
  assign dBusAxi_ar_payload_region = _zz_173;
  assign dBusAxi_ar_payload_len = _zz_170;
  assign dBusAxi_ar_payload_size = 3'b010;
  assign dBusAxi_ar_payload_burst = 2'b01;
  assign dBusAxi_ar_payload_lock = 1'b0;
  assign dBusAxi_ar_payload_cache = 4'b1111;
  assign dBusAxi_ar_payload_qos = 4'b0000;
  assign dBusAxi_ar_payload_prot = 3'b010;
  assign dBusAxi_aw_valid = (_zz_168 && _zz_171);
  assign dBusAxi_aw_payload_addr = _zz_169;
  assign _zz_174[0 : 0] = 1'b0;
  assign dBusAxi_aw_payload_id = _zz_174;
  assign _zz_175[3 : 0] = 4'b0000;
  assign dBusAxi_aw_payload_region = _zz_175;
  assign dBusAxi_aw_payload_len = _zz_170;
  assign dBusAxi_aw_payload_size = 3'b010;
  assign dBusAxi_aw_payload_burst = 2'b01;
  assign dBusAxi_aw_payload_lock = 1'b0;
  assign dBusAxi_aw_payload_cache = 4'b1111;
  assign dBusAxi_aw_payload_qos = 4'b0000;
  assign dBusAxi_aw_payload_prot = 3'b010;
  assign dBusAxi_w_valid = streamFork_1_io_outputs_1_thrown_valid;
  assign dBusAxi_w_payload_data = streamFork_1_io_outputs_1_thrown_payload_data;
  assign dBusAxi_w_payload_strb = streamFork_1_io_outputs_1_thrown_payload_mask;
  assign dBusAxi_w_payload_last = streamFork_1_io_outputs_1_thrown_payload_last;
  assign dBusAxi_r_ready = 1'b1;
  assign dBusAxi_b_ready = 1'b1;
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      IBusCachedPlugin_fetchPc_pcReg <= externalResetVector;
      IBusCachedPlugin_fetchPc_correctionReg <= 1'b0;
      IBusCachedPlugin_fetchPc_booted <= 1'b0;
      IBusCachedPlugin_fetchPc_inc <= 1'b0;
      IBusCachedPlugin_decodePc_pcReg <= externalResetVector;
      _zz_65 <= 1'b0;
      _zz_67 <= 1'b0;
      IBusCachedPlugin_decompressor_bufferValid <= 1'b0;
      IBusCachedPlugin_decompressor_throw2BytesReg <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      IBusCachedPlugin_rspCounter <= _zz_102;
      IBusCachedPlugin_rspCounter <= 32'h0;
      DBusCachedPlugin_rspCounter <= _zz_103;
      DBusCachedPlugin_rspCounter <= 32'h0;
      memory_DivPlugin_div_counter_value <= 6'h0;
      _zz_139 <= 1'b0;
      CsrPlugin_mstatus_MIE <= 1'b0;
      CsrPlugin_mstatus_MPIE <= 1'b0;
      CsrPlugin_mstatus_MPP <= 2'b11;
      CsrPlugin_mie_MEIE <= 1'b0;
      CsrPlugin_mie_MTIE <= 1'b0;
      CsrPlugin_mie_MSIE <= 1'b0;
      CsrPlugin_interrupt_valid <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      CsrPlugin_hadException <= 1'b0;
      execute_CsrPlugin_wfiWake <= 1'b0;
      execute_arbitration_isValid <= 1'b0;
      memory_arbitration_isValid <= 1'b0;
      writeBack_arbitration_isValid <= 1'b0;
      _zz_164 <= 3'b000;
      _zz_167 <= 1'b0;
    end else begin
      if(IBusCachedPlugin_fetchPc_correction)begin
        IBusCachedPlugin_fetchPc_correctionReg <= 1'b1;
      end
      if((IBusCachedPlugin_fetchPc_output_valid && IBusCachedPlugin_fetchPc_output_ready))begin
        IBusCachedPlugin_fetchPc_correctionReg <= 1'b0;
      end
      IBusCachedPlugin_fetchPc_booted <= 1'b1;
      if((IBusCachedPlugin_fetchPc_correction || IBusCachedPlugin_fetchPc_pcRegPropagate))begin
        IBusCachedPlugin_fetchPc_inc <= 1'b0;
      end
      if((IBusCachedPlugin_fetchPc_output_valid && IBusCachedPlugin_fetchPc_output_ready))begin
        IBusCachedPlugin_fetchPc_inc <= 1'b1;
      end
      if(((! IBusCachedPlugin_fetchPc_output_valid) && IBusCachedPlugin_fetchPc_output_ready))begin
        IBusCachedPlugin_fetchPc_inc <= 1'b0;
      end
      if((IBusCachedPlugin_fetchPc_booted && ((IBusCachedPlugin_fetchPc_output_ready || IBusCachedPlugin_fetchPc_correction) || IBusCachedPlugin_fetchPc_pcRegPropagate)))begin
        IBusCachedPlugin_fetchPc_pcReg <= IBusCachedPlugin_fetchPc_pc;
      end
      if((decode_arbitration_isFiring && (! IBusCachedPlugin_decodePc_injectedDecode)))begin
        IBusCachedPlugin_decodePc_pcReg <= IBusCachedPlugin_decodePc_pcPlus;
      end
      if(_zz_210)begin
        IBusCachedPlugin_decodePc_pcReg <= IBusCachedPlugin_jump_pcLoad_payload;
      end
      if(IBusCachedPlugin_iBusRsp_stages_1_flush)begin
        _zz_65 <= 1'b0;
      end
      if(_zz_63)begin
        _zz_65 <= (IBusCachedPlugin_iBusRsp_stages_0_output_valid && (! IBusCachedPlugin_iBusRsp_stages_0_flush));
      end
      if(IBusCachedPlugin_iBusRsp_stages_2_flush)begin
        _zz_67 <= 1'b0;
      end
      if(IBusCachedPlugin_iBusRsp_stages_1_output_ready)begin
        _zz_67 <= (IBusCachedPlugin_iBusRsp_stages_1_output_valid && (! IBusCachedPlugin_iBusRsp_stages_1_flush));
      end
      if((IBusCachedPlugin_decompressor_output_valid && IBusCachedPlugin_decompressor_output_ready))begin
        IBusCachedPlugin_decompressor_throw2BytesReg <= ((((! IBusCachedPlugin_decompressor_unaligned) && IBusCachedPlugin_decompressor_isInputLowRvc) && IBusCachedPlugin_decompressor_isInputHighRvc) || (IBusCachedPlugin_decompressor_bufferValid && IBusCachedPlugin_decompressor_isInputHighRvc));
      end
      if((IBusCachedPlugin_decompressor_output_ready && IBusCachedPlugin_decompressor_input_valid))begin
        IBusCachedPlugin_decompressor_bufferValid <= 1'b0;
      end
      if(_zz_221)begin
        if(IBusCachedPlugin_decompressor_bufferFill)begin
          IBusCachedPlugin_decompressor_bufferValid <= 1'b1;
        end
      end
      if((decode_arbitration_removeIt || IBusCachedPlugin_decompressor_consumeCurrent))begin
        IBusCachedPlugin_decompressor_throw2BytesReg <= 1'b0;
        IBusCachedPlugin_decompressor_bufferValid <= 1'b0;
      end
      if((! 1'b0))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b1;
      end
      if(IBusCachedPlugin_decodePc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      end
      if((! execute_arbitration_isStuck))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= IBusCachedPlugin_injector_nextPcCalc_valids_0;
      end
      if(IBusCachedPlugin_decodePc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if((! memory_arbitration_isStuck))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= IBusCachedPlugin_injector_nextPcCalc_valids_1;
      end
      if(IBusCachedPlugin_decodePc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if((! writeBack_arbitration_isStuck))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= IBusCachedPlugin_injector_nextPcCalc_valids_2;
      end
      if(IBusCachedPlugin_decodePc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if(iBus_rsp_valid)begin
        IBusCachedPlugin_rspCounter <= (IBusCachedPlugin_rspCounter + 32'h00000001);
      end
      if(dBus_rsp_valid)begin
        DBusCachedPlugin_rspCounter <= (DBusCachedPlugin_rspCounter + 32'h00000001);
      end
      memory_DivPlugin_div_counter_value <= memory_DivPlugin_div_counter_valueNext;
      _zz_139 <= (_zz_41 && writeBack_arbitration_isFiring);
      CsrPlugin_interrupt_valid <= 1'b0;
      if(_zz_222)begin
        if(_zz_223)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_224)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_225)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
      end
      if(CsrPlugin_pipelineLiberator_active)begin
        if((! execute_arbitration_isStuck))begin
          CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b1;
        end
        if((! memory_arbitration_isStuck))begin
          CsrPlugin_pipelineLiberator_pcValids_1 <= CsrPlugin_pipelineLiberator_pcValids_0;
        end
        if((! writeBack_arbitration_isStuck))begin
          CsrPlugin_pipelineLiberator_pcValids_2 <= CsrPlugin_pipelineLiberator_pcValids_1;
        end
      end
      if(((! CsrPlugin_pipelineLiberator_active) || decode_arbitration_removeIt))begin
        CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      end
      if(CsrPlugin_interruptJump)begin
        CsrPlugin_interrupt_valid <= 1'b0;
      end
      CsrPlugin_hadException <= CsrPlugin_exception;
      if(_zz_207)begin
        case(CsrPlugin_targetPrivilege)
          2'b11 : begin
            CsrPlugin_mstatus_MIE <= 1'b0;
            CsrPlugin_mstatus_MPIE <= CsrPlugin_mstatus_MIE;
            CsrPlugin_mstatus_MPP <= CsrPlugin_privilege;
          end
          default : begin
          end
        endcase
      end
      if(_zz_208)begin
        case(_zz_209)
          2'b11 : begin
            CsrPlugin_mstatus_MPP <= 2'b00;
            CsrPlugin_mstatus_MIE <= CsrPlugin_mstatus_MPIE;
            CsrPlugin_mstatus_MPIE <= 1'b1;
          end
          default : begin
          end
        endcase
      end
      execute_CsrPlugin_wfiWake <= (({_zz_159,{_zz_158,_zz_157}} != 3'b000) || CsrPlugin_thirdPartyWake);
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
      case(execute_CsrPlugin_csrAddress)
        12'h300 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_mstatus_MPP <= execute_CsrPlugin_writeData[12 : 11];
            CsrPlugin_mstatus_MPIE <= _zz_310[0];
            CsrPlugin_mstatus_MIE <= _zz_311[0];
          end
        end
        12'hb00 : begin
        end
        12'h341 : begin
        end
        12'hb80 : begin
        end
        12'h344 : begin
        end
        12'h343 : begin
        end
        12'hc00 : begin
        end
        12'h304 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_mie_MEIE <= _zz_313[0];
            CsrPlugin_mie_MTIE <= _zz_314[0];
            CsrPlugin_mie_MSIE <= _zz_315[0];
          end
        end
        12'hc80 : begin
        end
        12'h342 : begin
        end
        default : begin
        end
      endcase
      _zz_164 <= (_zz_164 + _zz_165);
      if((streamFork_1_io_outputs_0_valid && _zz_194))begin
        _zz_167 <= (! streamFork_1_io_outputs_0_payload_last);
      end
    end
  end

  always @ (posedge clk) begin
    if(IBusCachedPlugin_iBusRsp_stages_1_output_ready)begin
      _zz_68 <= IBusCachedPlugin_iBusRsp_stages_1_output_payload;
    end
    if(_zz_221)begin
      IBusCachedPlugin_decompressor_bufferData <= IBusCachedPlugin_decompressor_input_payload_rsp_inst[31 : 16];
    end
    if(IBusCachedPlugin_iBusRsp_stages_1_input_ready)begin
      IBusCachedPlugin_s1_tightlyCoupledHit <= IBusCachedPlugin_s0_tightlyCoupledHit;
    end
    if(IBusCachedPlugin_iBusRsp_stages_2_input_ready)begin
      IBusCachedPlugin_s2_tightlyCoupledHit <= IBusCachedPlugin_s1_tightlyCoupledHit;
    end
    if((memory_DivPlugin_div_counter_value == 6'h20))begin
      memory_DivPlugin_div_done <= 1'b1;
    end
    if((! memory_arbitration_isStuck))begin
      memory_DivPlugin_div_done <= 1'b0;
    end
    if(_zz_204)begin
      if(_zz_212)begin
        memory_DivPlugin_rs1[31 : 0] <= _zz_294[31:0];
        memory_DivPlugin_accumulator[31 : 0] <= ((! _zz_132[32]) ? _zz_295 : _zz_296);
        if((memory_DivPlugin_div_counter_value == 6'h20))begin
          memory_DivPlugin_div_result <= _zz_297[31:0];
        end
      end
    end
    if(_zz_213)begin
      memory_DivPlugin_accumulator <= 65'h0;
      memory_DivPlugin_rs1 <= ((_zz_135 ? (~ _zz_136) : _zz_136) + _zz_303);
      memory_DivPlugin_rs2 <= ((_zz_134 ? (~ execute_RS2) : execute_RS2) + _zz_305);
      memory_DivPlugin_div_needRevert <= ((_zz_135 ^ (_zz_134 && (! execute_INSTRUCTION[13]))) && (! (((execute_RS2 == 32'h0) && execute_IS_RS2_SIGNED) && (! execute_INSTRUCTION[13]))));
    end
    _zz_140 <= _zz_40[11 : 7];
    _zz_141 <= _zz_50;
    CsrPlugin_mip_MEIP <= externalInterrupt;
    CsrPlugin_mip_MTIP <= timerInterrupt;
    CsrPlugin_mip_MSIP <= softwareInterrupt;
    CsrPlugin_mcycle <= (CsrPlugin_mcycle + 64'h0000000000000001);
    if(writeBack_arbitration_isFiring)begin
      CsrPlugin_minstret <= (CsrPlugin_minstret + 64'h0000000000000001);
    end
    if(_zz_222)begin
      if(_zz_223)begin
        CsrPlugin_interrupt_code <= 4'b0111;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(_zz_224)begin
        CsrPlugin_interrupt_code <= 4'b0011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(_zz_225)begin
        CsrPlugin_interrupt_code <= 4'b1011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
    end
    if(_zz_207)begin
      case(CsrPlugin_targetPrivilege)
        2'b11 : begin
          CsrPlugin_mcause_interrupt <= (! CsrPlugin_hadException);
          CsrPlugin_mcause_exceptionCode <= CsrPlugin_trapCause;
          CsrPlugin_mepc <= decode_PC;
        end
        default : begin
        end
      endcase
    end
    CsrPlugin_mtval <= 32'h0;
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
      decode_to_execute_IS_RS1_SIGNED <= decode_IS_RS1_SIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS2 <= decode_RS2;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PC <= decode_PC;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_PC <= _zz_35;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_PC <= memory_PC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PREDICTION_HAD_BRANCHED2 <= decode_PREDICTION_HAD_BRANCHED2;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ENV_CTRL <= _zz_25;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_ENV_CTRL <= _zz_22;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_ENV_CTRL <= _zz_20;
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
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_CTRL <= _zz_18;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_WR <= decode_MEMORY_WR;
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
      decode_to_execute_ALU_CTRL <= _zz_15;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SHIFT_CTRL <= _zz_12;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_SHIFT_CTRL <= _zz_9;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_CALC <= execute_BRANCH_CALC;
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
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_SHIFT_RIGHT <= execute_SHIFT_RIGHT;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MUL_LOW <= memory_MUL_LOW;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_DO <= execute_BRANCH_DO;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BYPASSABLE_EXECUTE_STAGE <= decode_BYPASSABLE_EXECUTE_STAGE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_LL <= execute_MUL_LL;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS1 <= decode_RS1;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_FORCE_ZERO <= decode_SRC2_FORCE_ZERO;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_LH <= execute_MUL_LH;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC1_CTRL <= _zz_7;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ADDRESS_LOW <= execute_MEMORY_ADDRESS_LOW;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_ADDRESS_LOW <= memory_MEMORY_ADDRESS_LOW;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BYPASSABLE_MEMORY_STAGE <= decode_BYPASSABLE_MEMORY_STAGE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BYPASSABLE_MEMORY_STAGE <= execute_BYPASSABLE_MEMORY_STAGE;
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
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_HL <= execute_MUL_HL;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_4;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_DIV <= decode_IS_DIV;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_IS_DIV <= execute_IS_DIV;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RVC <= decode_IS_RVC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BRANCH_CTRL <= _zz_1;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_FORMAL_PC_NEXT <= _zz_54;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_FORMAL_PC_NEXT <= execute_FORMAL_PC_NEXT;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_FORMAL_PC_NEXT <= _zz_53;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_REGFILE_WRITE_DATA <= _zz_31;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_REGFILE_WRITE_DATA <= _zz_32;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_MANAGMENT <= decode_MEMORY_MANAGMENT;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    case(execute_CsrPlugin_csrAddress)
      12'h300 : begin
      end
      12'hb00 : begin
      end
      12'h341 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mepc <= execute_CsrPlugin_writeData[31 : 0];
        end
      end
      12'hb80 : begin
      end
      12'h344 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mip_MSIP <= _zz_312[0];
        end
      end
      12'h343 : begin
      end
      12'hc00 : begin
      end
      12'h304 : begin
      end
      12'hc80 : begin
      end
      12'h342 : begin
      end
      default : begin
      end
    endcase
  end


endmodule

module StreamFork (
  input               io_input_valid,
  output reg          io_input_ready,
  input               io_input_payload_wr,
  input      [31:0]   io_input_payload_address,
  input      [31:0]   io_input_payload_data,
  input      [3:0]    io_input_payload_mask,
  input      [2:0]    io_input_payload_length,
  input               io_input_payload_last,
  output              io_outputs_0_valid,
  input               io_outputs_0_ready,
  output              io_outputs_0_payload_wr,
  output     [31:0]   io_outputs_0_payload_address,
  output     [31:0]   io_outputs_0_payload_data,
  output     [3:0]    io_outputs_0_payload_mask,
  output     [2:0]    io_outputs_0_payload_length,
  output              io_outputs_0_payload_last,
  output              io_outputs_1_valid,
  input               io_outputs_1_ready,
  output              io_outputs_1_payload_wr,
  output     [31:0]   io_outputs_1_payload_address,
  output     [31:0]   io_outputs_1_payload_data,
  output     [3:0]    io_outputs_1_payload_mask,
  output     [2:0]    io_outputs_1_payload_length,
  output              io_outputs_1_payload_last,
  input               clk,
  input               reset
);
  reg                 _zz_1;
  reg                 _zz_2;

  always @ (*) begin
    io_input_ready = 1'b1;
    if(((! io_outputs_0_ready) && _zz_1))begin
      io_input_ready = 1'b0;
    end
    if(((! io_outputs_1_ready) && _zz_2))begin
      io_input_ready = 1'b0;
    end
  end

  assign io_outputs_0_valid = (io_input_valid && _zz_1);
  assign io_outputs_0_payload_wr = io_input_payload_wr;
  assign io_outputs_0_payload_address = io_input_payload_address;
  assign io_outputs_0_payload_data = io_input_payload_data;
  assign io_outputs_0_payload_mask = io_input_payload_mask;
  assign io_outputs_0_payload_length = io_input_payload_length;
  assign io_outputs_0_payload_last = io_input_payload_last;
  assign io_outputs_1_valid = (io_input_valid && _zz_2);
  assign io_outputs_1_payload_wr = io_input_payload_wr;
  assign io_outputs_1_payload_address = io_input_payload_address;
  assign io_outputs_1_payload_data = io_input_payload_data;
  assign io_outputs_1_payload_mask = io_input_payload_mask;
  assign io_outputs_1_payload_length = io_input_payload_length;
  assign io_outputs_1_payload_last = io_input_payload_last;
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      _zz_1 <= 1'b1;
      _zz_2 <= 1'b1;
    end else begin
      if((io_outputs_0_valid && io_outputs_0_ready))begin
        _zz_1 <= 1'b0;
      end
      if((io_outputs_1_valid && io_outputs_1_ready))begin
        _zz_2 <= 1'b0;
      end
      if(io_input_ready)begin
        _zz_1 <= 1'b1;
        _zz_2 <= 1'b1;
      end
    end
  end


endmodule

module DataCache (
  input               io_cpu_execute_isValid,
  input      [31:0]   io_cpu_execute_address,
  input               io_cpu_execute_args_wr,
  input      [31:0]   io_cpu_execute_args_data,
  input      [1:0]    io_cpu_execute_args_size,
  input               io_cpu_memory_isValid,
  input               io_cpu_memory_isStuck,
  input               io_cpu_memory_isRemoved,
  output              io_cpu_memory_isWrite,
  input      [31:0]   io_cpu_memory_address,
  output              io_cpu_memory_mmuBus_cmd_isValid,
  output     [31:0]   io_cpu_memory_mmuBus_cmd_virtualAddress,
  output              io_cpu_memory_mmuBus_cmd_bypassTranslation,
  input      [31:0]   io_cpu_memory_mmuBus_rsp_physicalAddress,
  input               io_cpu_memory_mmuBus_rsp_isIoAccess,
  input               io_cpu_memory_mmuBus_rsp_allowRead,
  input               io_cpu_memory_mmuBus_rsp_allowWrite,
  input               io_cpu_memory_mmuBus_rsp_allowExecute,
  input               io_cpu_memory_mmuBus_rsp_exception,
  input               io_cpu_memory_mmuBus_rsp_refilling,
  output              io_cpu_memory_mmuBus_end,
  input               io_cpu_memory_mmuBus_busy,
  input               io_cpu_writeBack_isValid,
  input               io_cpu_writeBack_isStuck,
  input               io_cpu_writeBack_isUser,
  output reg          io_cpu_writeBack_haltIt,
  output              io_cpu_writeBack_isWrite,
  output reg [31:0]   io_cpu_writeBack_data,
  input      [31:0]   io_cpu_writeBack_address,
  output              io_cpu_writeBack_mmuException,
  output              io_cpu_writeBack_unalignedAccess,
  output              io_cpu_writeBack_accessError,
  output reg          io_cpu_redo,
  input               io_cpu_flush_valid,
  output reg          io_cpu_flush_ready,
  output reg          io_mem_cmd_valid,
  input               io_mem_cmd_ready,
  output reg          io_mem_cmd_payload_wr,
  output reg [31:0]   io_mem_cmd_payload_address,
  output     [31:0]   io_mem_cmd_payload_data,
  output     [3:0]    io_mem_cmd_payload_mask,
  output reg [2:0]    io_mem_cmd_payload_length,
  output reg          io_mem_cmd_payload_last,
  input               io_mem_rsp_valid,
  input      [31:0]   io_mem_rsp_payload_data,
  input               io_mem_rsp_payload_error,
  input               clk,
  input               reset
);
  reg        [21:0]   _zz_16;
  reg        [31:0]   _zz_17;
  reg        [21:0]   _zz_18;
  reg        [31:0]   _zz_19;
  wire                _zz_20;
  wire                _zz_21;
  wire                _zz_22;
  wire                _zz_23;
  wire                _zz_24;
  wire                _zz_25;
  wire       [0:0]    _zz_26;
  wire       [0:0]    _zz_27;
  wire       [0:0]    _zz_28;
  wire       [0:0]    _zz_29;
  wire       [0:0]    _zz_30;
  wire       [2:0]    _zz_31;
  wire       [2:0]    _zz_32;
  wire       [21:0]   _zz_33;
  wire       [21:0]   _zz_34;
  reg                 _zz_1;
  reg                 _zz_2;
  reg                 _zz_3;
  reg                 _zz_4;
  wire                haltCpu;
  reg                 tagsReadCmd_valid;
  reg        [6:0]    tagsReadCmd_payload;
  reg                 tagsWriteCmd_valid;
  reg        [1:0]    tagsWriteCmd_payload_way;
  reg        [6:0]    tagsWriteCmd_payload_address;
  reg                 tagsWriteCmd_payload_data_valid;
  reg                 tagsWriteCmd_payload_data_error;
  reg        [19:0]   tagsWriteCmd_payload_data_address;
  reg                 tagsWriteLastCmd_valid;
  reg        [1:0]    tagsWriteLastCmd_payload_way;
  reg        [6:0]    tagsWriteLastCmd_payload_address;
  reg                 tagsWriteLastCmd_payload_data_valid;
  reg                 tagsWriteLastCmd_payload_data_error;
  reg        [19:0]   tagsWriteLastCmd_payload_data_address;
  reg                 dataReadCmd_valid;
  reg        [9:0]    dataReadCmd_payload;
  reg                 dataWriteCmd_valid;
  reg        [1:0]    dataWriteCmd_payload_way;
  reg        [9:0]    dataWriteCmd_payload_address;
  reg        [31:0]   dataWriteCmd_payload_data;
  reg        [3:0]    dataWriteCmd_payload_mask;
  wire                _zz_5;
  wire                ways_0_tagsReadRsp_valid;
  wire                ways_0_tagsReadRsp_error;
  wire       [19:0]   ways_0_tagsReadRsp_address;
  wire       [21:0]   _zz_6;
  wire                _zz_7;
  wire       [31:0]   ways_0_dataReadRsp;
  wire                _zz_8;
  wire                ways_1_tagsReadRsp_valid;
  wire                ways_1_tagsReadRsp_error;
  wire       [19:0]   ways_1_tagsReadRsp_address;
  wire       [21:0]   _zz_9;
  wire                _zz_10;
  wire       [31:0]   ways_1_dataReadRsp;
  reg        [3:0]    _zz_11;
  wire       [3:0]    stage0_mask;
  wire       [9:0]    _zz_12;
  reg        [1:0]    stage0_colisions;
  reg                 stageA_request_wr;
  reg        [31:0]   stageA_request_data;
  reg        [1:0]    stageA_request_size;
  reg        [3:0]    stageA_mask;
  wire                stageA_wayHits_0;
  wire                stageA_wayHits_1;
  reg        [1:0]    stage0_colisions_regNextWhen;
  wire       [9:0]    _zz_13;
  reg        [1:0]    _zz_14;
  wire       [1:0]    stageA_colisions;
  reg                 stageB_request_wr;
  reg        [31:0]   stageB_request_data;
  reg        [1:0]    stageB_request_size;
  reg                 stageB_mmuRspFreeze;
  reg        [31:0]   stageB_mmuRsp_physicalAddress;
  reg                 stageB_mmuRsp_isIoAccess;
  reg                 stageB_mmuRsp_allowRead;
  reg                 stageB_mmuRsp_allowWrite;
  reg                 stageB_mmuRsp_allowExecute;
  reg                 stageB_mmuRsp_exception;
  reg                 stageB_mmuRsp_refilling;
  reg                 stageB_tagsReadRsp_0_valid;
  reg                 stageB_tagsReadRsp_0_error;
  reg        [19:0]   stageB_tagsReadRsp_0_address;
  reg                 stageB_tagsReadRsp_1_valid;
  reg                 stageB_tagsReadRsp_1_error;
  reg        [19:0]   stageB_tagsReadRsp_1_address;
  reg        [31:0]   stageB_dataReadRsp_0;
  reg        [31:0]   stageB_dataReadRsp_1;
  reg        [1:0]    _zz_15;
  reg        [1:0]    stageB_waysHits;
  wire                stageB_waysHit;
  wire       [31:0]   stageB_dataMux;
  reg        [3:0]    stageB_mask;
  reg        [1:0]    stageB_colisions;
  reg                 stageB_loaderValid;
  reg                 stageB_flusher_valid;
  wire       [31:0]   stageB_requestDataBypass;
  wire                stageB_isAmo;
  reg                 stageB_memCmdSent;
  reg                 loader_valid;
  reg                 loader_counter_willIncrement;
  wire                loader_counter_willClear;
  reg        [2:0]    loader_counter_valueNext;
  reg        [2:0]    loader_counter_value;
  wire                loader_counter_willOverflowIfInc;
  wire                loader_counter_willOverflow;
  reg        [1:0]    loader_waysAllocator;
  reg                 loader_error;
  reg [21:0] ways_0_tags [0:127];
  reg [7:0] ways_0_data_symbol0 [0:1023];
  reg [7:0] ways_0_data_symbol1 [0:1023];
  reg [7:0] ways_0_data_symbol2 [0:1023];
  reg [7:0] ways_0_data_symbol3 [0:1023];
  reg [7:0] _zz_35;
  reg [7:0] _zz_36;
  reg [7:0] _zz_37;
  reg [7:0] _zz_38;
  reg [21:0] ways_1_tags [0:127];
  reg [7:0] ways_1_data_symbol0 [0:1023];
  reg [7:0] ways_1_data_symbol1 [0:1023];
  reg [7:0] ways_1_data_symbol2 [0:1023];
  reg [7:0] ways_1_data_symbol3 [0:1023];
  reg [7:0] _zz_39;
  reg [7:0] _zz_40;
  reg [7:0] _zz_41;
  reg [7:0] _zz_42;

  assign _zz_20 = (io_cpu_execute_isValid && (! io_cpu_memory_isStuck));
  assign _zz_21 = (((stageB_mmuRsp_refilling || io_cpu_writeBack_accessError) || io_cpu_writeBack_mmuException) || io_cpu_writeBack_unalignedAccess);
  assign _zz_22 = (stageB_waysHit || (stageB_request_wr && (! stageB_isAmo)));
  assign _zz_23 = (loader_valid && io_mem_rsp_valid);
  assign _zz_24 = ((((io_cpu_flush_valid && (! io_cpu_execute_isValid)) && (! io_cpu_memory_isValid)) && (! io_cpu_writeBack_isValid)) && (! io_cpu_redo));
  assign _zz_25 = ((! io_cpu_writeBack_isStuck) && (! stageB_mmuRspFreeze));
  assign _zz_26 = _zz_6[0 : 0];
  assign _zz_27 = _zz_6[1 : 1];
  assign _zz_28 = _zz_9[0 : 0];
  assign _zz_29 = _zz_9[1 : 1];
  assign _zz_30 = loader_counter_willIncrement;
  assign _zz_31 = {2'd0, _zz_30};
  assign _zz_32 = {loader_waysAllocator,loader_waysAllocator[1]};
  assign _zz_33 = {tagsWriteCmd_payload_data_address,{tagsWriteCmd_payload_data_error,tagsWriteCmd_payload_data_valid}};
  assign _zz_34 = {tagsWriteCmd_payload_data_address,{tagsWriteCmd_payload_data_error,tagsWriteCmd_payload_data_valid}};
  always @ (posedge clk) begin
    if(_zz_5) begin
      _zz_16 <= ways_0_tags[tagsReadCmd_payload];
    end
  end

  always @ (posedge clk) begin
    if(_zz_4) begin
      ways_0_tags[tagsWriteCmd_payload_address] <= _zz_33;
    end
  end

  always @ (*) begin
    _zz_17 = {_zz_38, _zz_37, _zz_36, _zz_35};
  end
  always @ (posedge clk) begin
    if(_zz_7) begin
      _zz_35 <= ways_0_data_symbol0[dataReadCmd_payload];
      _zz_36 <= ways_0_data_symbol1[dataReadCmd_payload];
      _zz_37 <= ways_0_data_symbol2[dataReadCmd_payload];
      _zz_38 <= ways_0_data_symbol3[dataReadCmd_payload];
    end
  end

  always @ (posedge clk) begin
    if(dataWriteCmd_payload_mask[0] && _zz_3) begin
      ways_0_data_symbol0[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[7 : 0];
    end
    if(dataWriteCmd_payload_mask[1] && _zz_3) begin
      ways_0_data_symbol1[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[15 : 8];
    end
    if(dataWriteCmd_payload_mask[2] && _zz_3) begin
      ways_0_data_symbol2[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[23 : 16];
    end
    if(dataWriteCmd_payload_mask[3] && _zz_3) begin
      ways_0_data_symbol3[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[31 : 24];
    end
  end

  always @ (posedge clk) begin
    if(_zz_8) begin
      _zz_18 <= ways_1_tags[tagsReadCmd_payload];
    end
  end

  always @ (posedge clk) begin
    if(_zz_2) begin
      ways_1_tags[tagsWriteCmd_payload_address] <= _zz_34;
    end
  end

  always @ (*) begin
    _zz_19 = {_zz_42, _zz_41, _zz_40, _zz_39};
  end
  always @ (posedge clk) begin
    if(_zz_10) begin
      _zz_39 <= ways_1_data_symbol0[dataReadCmd_payload];
      _zz_40 <= ways_1_data_symbol1[dataReadCmd_payload];
      _zz_41 <= ways_1_data_symbol2[dataReadCmd_payload];
      _zz_42 <= ways_1_data_symbol3[dataReadCmd_payload];
    end
  end

  always @ (posedge clk) begin
    if(dataWriteCmd_payload_mask[0] && _zz_1) begin
      ways_1_data_symbol0[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[7 : 0];
    end
    if(dataWriteCmd_payload_mask[1] && _zz_1) begin
      ways_1_data_symbol1[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[15 : 8];
    end
    if(dataWriteCmd_payload_mask[2] && _zz_1) begin
      ways_1_data_symbol2[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[23 : 16];
    end
    if(dataWriteCmd_payload_mask[3] && _zz_1) begin
      ways_1_data_symbol3[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[31 : 24];
    end
  end

  always @ (*) begin
    _zz_1 = 1'b0;
    if((dataWriteCmd_valid && dataWriteCmd_payload_way[1]))begin
      _zz_1 = 1'b1;
    end
  end

  always @ (*) begin
    _zz_2 = 1'b0;
    if((tagsWriteCmd_valid && tagsWriteCmd_payload_way[1]))begin
      _zz_2 = 1'b1;
    end
  end

  always @ (*) begin
    _zz_3 = 1'b0;
    if((dataWriteCmd_valid && dataWriteCmd_payload_way[0]))begin
      _zz_3 = 1'b1;
    end
  end

  always @ (*) begin
    _zz_4 = 1'b0;
    if((tagsWriteCmd_valid && tagsWriteCmd_payload_way[0]))begin
      _zz_4 = 1'b1;
    end
  end

  assign haltCpu = 1'b0;
  assign _zz_5 = (tagsReadCmd_valid && (! io_cpu_memory_isStuck));
  assign _zz_6 = _zz_16;
  assign ways_0_tagsReadRsp_valid = _zz_26[0];
  assign ways_0_tagsReadRsp_error = _zz_27[0];
  assign ways_0_tagsReadRsp_address = _zz_6[21 : 2];
  assign _zz_7 = (dataReadCmd_valid && (! io_cpu_memory_isStuck));
  assign ways_0_dataReadRsp = _zz_17;
  assign _zz_8 = (tagsReadCmd_valid && (! io_cpu_memory_isStuck));
  assign _zz_9 = _zz_18;
  assign ways_1_tagsReadRsp_valid = _zz_28[0];
  assign ways_1_tagsReadRsp_error = _zz_29[0];
  assign ways_1_tagsReadRsp_address = _zz_9[21 : 2];
  assign _zz_10 = (dataReadCmd_valid && (! io_cpu_memory_isStuck));
  assign ways_1_dataReadRsp = _zz_19;
  always @ (*) begin
    tagsReadCmd_valid = 1'b0;
    if(_zz_20)begin
      tagsReadCmd_valid = 1'b1;
    end
  end

  always @ (*) begin
    tagsReadCmd_payload = 7'h0;
    if(_zz_20)begin
      tagsReadCmd_payload = io_cpu_execute_address[11 : 5];
    end
  end

  always @ (*) begin
    dataReadCmd_valid = 1'b0;
    if(_zz_20)begin
      dataReadCmd_valid = 1'b1;
    end
  end

  always @ (*) begin
    dataReadCmd_payload = 10'h0;
    if(_zz_20)begin
      dataReadCmd_payload = io_cpu_execute_address[11 : 2];
    end
  end

  always @ (*) begin
    tagsWriteCmd_valid = 1'b0;
    if(stageB_flusher_valid)begin
      tagsWriteCmd_valid = stageB_flusher_valid;
    end
    if(_zz_21)begin
      tagsWriteCmd_valid = 1'b0;
    end
    if(loader_counter_willOverflow)begin
      tagsWriteCmd_valid = 1'b1;
    end
  end

  always @ (*) begin
    tagsWriteCmd_payload_way = 2'bxx;
    if(stageB_flusher_valid)begin
      tagsWriteCmd_payload_way = 2'b11;
    end
    if(loader_counter_willOverflow)begin
      tagsWriteCmd_payload_way = loader_waysAllocator;
    end
  end

  always @ (*) begin
    tagsWriteCmd_payload_address = 7'h0;
    if(stageB_flusher_valid)begin
      tagsWriteCmd_payload_address = stageB_mmuRsp_physicalAddress[11 : 5];
    end
    if(loader_counter_willOverflow)begin
      tagsWriteCmd_payload_address = stageB_mmuRsp_physicalAddress[11 : 5];
    end
  end

  always @ (*) begin
    tagsWriteCmd_payload_data_valid = 1'bx;
    if(stageB_flusher_valid)begin
      tagsWriteCmd_payload_data_valid = 1'b0;
    end
    if(loader_counter_willOverflow)begin
      tagsWriteCmd_payload_data_valid = 1'b1;
    end
  end

  always @ (*) begin
    tagsWriteCmd_payload_data_error = 1'bx;
    if(loader_counter_willOverflow)begin
      tagsWriteCmd_payload_data_error = (loader_error || io_mem_rsp_payload_error);
    end
  end

  always @ (*) begin
    tagsWriteCmd_payload_data_address = 20'h0;
    if(loader_counter_willOverflow)begin
      tagsWriteCmd_payload_data_address = stageB_mmuRsp_physicalAddress[31 : 12];
    end
  end

  always @ (*) begin
    dataWriteCmd_valid = 1'b0;
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_mmuRsp_isIoAccess) begin
        if(_zz_22)begin
          if((stageB_request_wr && stageB_waysHit))begin
            dataWriteCmd_valid = 1'b1;
          end
        end
      end
    end
    if(_zz_21)begin
      dataWriteCmd_valid = 1'b0;
    end
    if(_zz_23)begin
      dataWriteCmd_valid = 1'b1;
    end
  end

  always @ (*) begin
    dataWriteCmd_payload_way = 2'bxx;
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_mmuRsp_isIoAccess) begin
        if(_zz_22)begin
          dataWriteCmd_payload_way = stageB_waysHits;
        end
      end
    end
    if(_zz_23)begin
      dataWriteCmd_payload_way = loader_waysAllocator;
    end
  end

  always @ (*) begin
    dataWriteCmd_payload_address = 10'h0;
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_mmuRsp_isIoAccess) begin
        if(_zz_22)begin
          dataWriteCmd_payload_address = stageB_mmuRsp_physicalAddress[11 : 2];
        end
      end
    end
    if(_zz_23)begin
      dataWriteCmd_payload_address = {stageB_mmuRsp_physicalAddress[11 : 5],loader_counter_value};
    end
  end

  always @ (*) begin
    dataWriteCmd_payload_data = 32'h0;
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_mmuRsp_isIoAccess) begin
        if(_zz_22)begin
          dataWriteCmd_payload_data = stageB_requestDataBypass;
        end
      end
    end
    if(_zz_23)begin
      dataWriteCmd_payload_data = io_mem_rsp_payload_data;
    end
  end

  always @ (*) begin
    dataWriteCmd_payload_mask = 4'bxxxx;
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_mmuRsp_isIoAccess) begin
        if(_zz_22)begin
          dataWriteCmd_payload_mask = stageB_mask;
        end
      end
    end
    if(_zz_23)begin
      dataWriteCmd_payload_mask = 4'b1111;
    end
  end

  always @ (*) begin
    case(io_cpu_execute_args_size)
      2'b00 : begin
        _zz_11 = 4'b0001;
      end
      2'b01 : begin
        _zz_11 = 4'b0011;
      end
      default : begin
        _zz_11 = 4'b1111;
      end
    endcase
  end

  assign stage0_mask = (_zz_11 <<< io_cpu_execute_address[1 : 0]);
  assign _zz_12 = io_cpu_execute_address[11 : 2];
  always @ (*) begin
    stage0_colisions[0] = (((dataWriteCmd_valid && dataWriteCmd_payload_way[0]) && (dataWriteCmd_payload_address == _zz_12)) && ((stage0_mask & dataWriteCmd_payload_mask) != 4'b0000));
    stage0_colisions[1] = (((dataWriteCmd_valid && dataWriteCmd_payload_way[1]) && (dataWriteCmd_payload_address == _zz_12)) && ((stage0_mask & dataWriteCmd_payload_mask) != 4'b0000));
  end

  assign io_cpu_memory_mmuBus_cmd_isValid = io_cpu_memory_isValid;
  assign io_cpu_memory_mmuBus_cmd_virtualAddress = io_cpu_memory_address;
  assign io_cpu_memory_mmuBus_cmd_bypassTranslation = 1'b0;
  assign io_cpu_memory_mmuBus_end = ((! io_cpu_memory_isStuck) || io_cpu_memory_isRemoved);
  assign io_cpu_memory_isWrite = stageA_request_wr;
  assign stageA_wayHits_0 = ((io_cpu_memory_mmuBus_rsp_physicalAddress[31 : 12] == ways_0_tagsReadRsp_address) && ways_0_tagsReadRsp_valid);
  assign stageA_wayHits_1 = ((io_cpu_memory_mmuBus_rsp_physicalAddress[31 : 12] == ways_1_tagsReadRsp_address) && ways_1_tagsReadRsp_valid);
  assign _zz_13 = io_cpu_memory_address[11 : 2];
  always @ (*) begin
    _zz_14[0] = (((dataWriteCmd_valid && dataWriteCmd_payload_way[0]) && (dataWriteCmd_payload_address == _zz_13)) && ((stageA_mask & dataWriteCmd_payload_mask) != 4'b0000));
    _zz_14[1] = (((dataWriteCmd_valid && dataWriteCmd_payload_way[1]) && (dataWriteCmd_payload_address == _zz_13)) && ((stageA_mask & dataWriteCmd_payload_mask) != 4'b0000));
  end

  assign stageA_colisions = (stage0_colisions_regNextWhen | _zz_14);
  always @ (*) begin
    stageB_mmuRspFreeze = 1'b0;
    if((stageB_loaderValid || loader_valid))begin
      stageB_mmuRspFreeze = 1'b1;
    end
  end

  always @ (*) begin
    _zz_15[0] = stageA_wayHits_0;
    _zz_15[1] = stageA_wayHits_1;
  end

  assign stageB_waysHit = (stageB_waysHits != 2'b00);
  assign stageB_dataMux = (stageB_waysHits[0] ? stageB_dataReadRsp_0 : stageB_dataReadRsp_1);
  always @ (*) begin
    stageB_loaderValid = 1'b0;
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_mmuRsp_isIoAccess) begin
        if(! _zz_22) begin
          if(io_mem_cmd_ready)begin
            stageB_loaderValid = 1'b1;
          end
        end
      end
    end
    if(_zz_21)begin
      stageB_loaderValid = 1'b0;
    end
  end

  always @ (*) begin
    io_cpu_writeBack_haltIt = io_cpu_writeBack_isValid;
    if(stageB_flusher_valid)begin
      io_cpu_writeBack_haltIt = 1'b1;
    end
    if(io_cpu_writeBack_isValid)begin
      if(stageB_mmuRsp_isIoAccess)begin
        if((stageB_request_wr ? io_mem_cmd_ready : io_mem_rsp_valid))begin
          io_cpu_writeBack_haltIt = 1'b0;
        end
      end else begin
        if(_zz_22)begin
          if(((! stageB_request_wr) || io_mem_cmd_ready))begin
            io_cpu_writeBack_haltIt = 1'b0;
          end
        end
      end
    end
    if(_zz_21)begin
      io_cpu_writeBack_haltIt = 1'b0;
    end
  end

  always @ (*) begin
    io_cpu_flush_ready = 1'b0;
    if(_zz_24)begin
      io_cpu_flush_ready = 1'b1;
    end
  end

  assign stageB_requestDataBypass = stageB_request_data;
  assign stageB_isAmo = 1'b0;
  always @ (*) begin
    io_cpu_redo = 1'b0;
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_mmuRsp_isIoAccess) begin
        if(_zz_22)begin
          if((((! stageB_request_wr) || stageB_isAmo) && ((stageB_colisions & stageB_waysHits) != 2'b00)))begin
            io_cpu_redo = 1'b1;
          end
        end
      end
    end
    if((io_cpu_writeBack_isValid && stageB_mmuRsp_refilling))begin
      io_cpu_redo = 1'b1;
    end
    if(loader_valid)begin
      io_cpu_redo = 1'b1;
    end
  end

  assign io_cpu_writeBack_accessError = 1'b0;
  assign io_cpu_writeBack_mmuException = (io_cpu_writeBack_isValid && 1'b0);
  assign io_cpu_writeBack_unalignedAccess = (io_cpu_writeBack_isValid && 1'b0);
  assign io_cpu_writeBack_isWrite = stageB_request_wr;
  always @ (*) begin
    io_mem_cmd_valid = 1'b0;
    if(io_cpu_writeBack_isValid)begin
      if(stageB_mmuRsp_isIoAccess)begin
        io_mem_cmd_valid = (! stageB_memCmdSent);
      end else begin
        if(_zz_22)begin
          if(stageB_request_wr)begin
            io_mem_cmd_valid = 1'b1;
          end
        end else begin
          if((! stageB_memCmdSent))begin
            io_mem_cmd_valid = 1'b1;
          end
        end
      end
    end
    if(_zz_21)begin
      io_mem_cmd_valid = 1'b0;
    end
  end

  always @ (*) begin
    io_mem_cmd_payload_address = 32'h0;
    if(io_cpu_writeBack_isValid)begin
      if(stageB_mmuRsp_isIoAccess)begin
        io_mem_cmd_payload_address = {stageB_mmuRsp_physicalAddress[31 : 2],2'b00};
      end else begin
        if(_zz_22)begin
          io_mem_cmd_payload_address = {stageB_mmuRsp_physicalAddress[31 : 2],2'b00};
        end else begin
          io_mem_cmd_payload_address = {stageB_mmuRsp_physicalAddress[31 : 5],5'h0};
        end
      end
    end
  end

  always @ (*) begin
    io_mem_cmd_payload_length = 3'bxxx;
    if(io_cpu_writeBack_isValid)begin
      if(stageB_mmuRsp_isIoAccess)begin
        io_mem_cmd_payload_length = 3'b000;
      end else begin
        if(_zz_22)begin
          io_mem_cmd_payload_length = 3'b000;
        end else begin
          io_mem_cmd_payload_length = 3'b111;
        end
      end
    end
  end

  always @ (*) begin
    io_mem_cmd_payload_last = 1'bx;
    if(io_cpu_writeBack_isValid)begin
      if(stageB_mmuRsp_isIoAccess)begin
        io_mem_cmd_payload_last = 1'b1;
      end else begin
        if(_zz_22)begin
          io_mem_cmd_payload_last = 1'b1;
        end else begin
          io_mem_cmd_payload_last = 1'b1;
        end
      end
    end
  end

  always @ (*) begin
    io_mem_cmd_payload_wr = stageB_request_wr;
    if(io_cpu_writeBack_isValid)begin
      if(! stageB_mmuRsp_isIoAccess) begin
        if(! _zz_22) begin
          io_mem_cmd_payload_wr = 1'b0;
        end
      end
    end
  end

  assign io_mem_cmd_payload_mask = stageB_mask;
  assign io_mem_cmd_payload_data = stageB_requestDataBypass;
  always @ (*) begin
    if(stageB_mmuRsp_isIoAccess)begin
      io_cpu_writeBack_data = io_mem_rsp_payload_data;
    end else begin
      io_cpu_writeBack_data = stageB_dataMux;
    end
  end

  always @ (*) begin
    loader_counter_willIncrement = 1'b0;
    if(_zz_23)begin
      loader_counter_willIncrement = 1'b1;
    end
  end

  assign loader_counter_willClear = 1'b0;
  assign loader_counter_willOverflowIfInc = (loader_counter_value == 3'b111);
  assign loader_counter_willOverflow = (loader_counter_willOverflowIfInc && loader_counter_willIncrement);
  always @ (*) begin
    loader_counter_valueNext = (loader_counter_value + _zz_31);
    if(loader_counter_willClear)begin
      loader_counter_valueNext = 3'b000;
    end
  end

  always @ (posedge clk) begin
    tagsWriteLastCmd_valid <= tagsWriteCmd_valid;
    tagsWriteLastCmd_payload_way <= tagsWriteCmd_payload_way;
    tagsWriteLastCmd_payload_address <= tagsWriteCmd_payload_address;
    tagsWriteLastCmd_payload_data_valid <= tagsWriteCmd_payload_data_valid;
    tagsWriteLastCmd_payload_data_error <= tagsWriteCmd_payload_data_error;
    tagsWriteLastCmd_payload_data_address <= tagsWriteCmd_payload_data_address;
    if((! io_cpu_memory_isStuck))begin
      stageA_request_wr <= io_cpu_execute_args_wr;
      stageA_request_data <= io_cpu_execute_args_data;
      stageA_request_size <= io_cpu_execute_args_size;
    end
    if((! io_cpu_memory_isStuck))begin
      stageA_mask <= stage0_mask;
    end
    if((! io_cpu_memory_isStuck))begin
      stage0_colisions_regNextWhen <= stage0_colisions;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_request_wr <= stageA_request_wr;
      stageB_request_data <= stageA_request_data;
      stageB_request_size <= stageA_request_size;
    end
    if(_zz_25)begin
      stageB_mmuRsp_isIoAccess <= io_cpu_memory_mmuBus_rsp_isIoAccess;
      stageB_mmuRsp_allowRead <= io_cpu_memory_mmuBus_rsp_allowRead;
      stageB_mmuRsp_allowWrite <= io_cpu_memory_mmuBus_rsp_allowWrite;
      stageB_mmuRsp_allowExecute <= io_cpu_memory_mmuBus_rsp_allowExecute;
      stageB_mmuRsp_exception <= io_cpu_memory_mmuBus_rsp_exception;
      stageB_mmuRsp_refilling <= io_cpu_memory_mmuBus_rsp_refilling;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_tagsReadRsp_0_valid <= ways_0_tagsReadRsp_valid;
      stageB_tagsReadRsp_0_error <= ways_0_tagsReadRsp_error;
      stageB_tagsReadRsp_0_address <= ways_0_tagsReadRsp_address;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_tagsReadRsp_1_valid <= ways_1_tagsReadRsp_valid;
      stageB_tagsReadRsp_1_error <= ways_1_tagsReadRsp_error;
      stageB_tagsReadRsp_1_address <= ways_1_tagsReadRsp_address;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_dataReadRsp_0 <= ways_0_dataReadRsp;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_dataReadRsp_1 <= ways_1_dataReadRsp;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_waysHits <= _zz_15;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_mask <= stageA_mask;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_colisions <= stageA_colisions;
    end
    `ifndef SYNTHESIS
      `ifdef FORMAL
        assert((! ((io_cpu_writeBack_isValid && (! io_cpu_writeBack_haltIt)) && io_cpu_writeBack_isStuck)))
      `else
        if(!(! ((io_cpu_writeBack_isValid && (! io_cpu_writeBack_haltIt)) && io_cpu_writeBack_isStuck))) begin
          $display("FAILURE writeBack stuck by another plugin is not allowed");
          $finish;
        end
      `endif
    `endif
  end

  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      stageB_flusher_valid <= 1'b1;
      stageB_mmuRsp_physicalAddress <= 32'h0;
      stageB_memCmdSent <= 1'b0;
      loader_valid <= 1'b0;
      loader_counter_value <= 3'b000;
      loader_waysAllocator <= 2'b01;
      loader_error <= 1'b0;
    end else begin
      if(_zz_25)begin
        stageB_mmuRsp_physicalAddress <= io_cpu_memory_mmuBus_rsp_physicalAddress;
      end
      if(stageB_flusher_valid)begin
        if((stageB_mmuRsp_physicalAddress[11 : 5] != 7'h7f))begin
          stageB_mmuRsp_physicalAddress[11 : 5] <= (stageB_mmuRsp_physicalAddress[11 : 5] + 7'h01);
        end else begin
          stageB_flusher_valid <= 1'b0;
        end
      end
      if(_zz_24)begin
        stageB_mmuRsp_physicalAddress[11 : 5] <= 7'h0;
        stageB_flusher_valid <= 1'b1;
      end
      if(io_mem_cmd_ready)begin
        stageB_memCmdSent <= 1'b1;
      end
      if((! io_cpu_writeBack_isStuck))begin
        stageB_memCmdSent <= 1'b0;
      end
      if(stageB_loaderValid)begin
        loader_valid <= 1'b1;
      end
      loader_counter_value <= loader_counter_valueNext;
      if(_zz_23)begin
        loader_error <= (loader_error || io_mem_rsp_payload_error);
      end
      if(loader_counter_willOverflow)begin
        loader_valid <= 1'b0;
        loader_error <= 1'b0;
      end
      if((! loader_valid))begin
        loader_waysAllocator <= _zz_32[1:0];
      end
    end
  end


endmodule

module InstructionCache (
  input               io_flush,
  input               io_cpu_prefetch_isValid,
  output reg          io_cpu_prefetch_haltIt,
  input      [31:0]   io_cpu_prefetch_pc,
  input               io_cpu_fetch_isValid,
  input               io_cpu_fetch_isStuck,
  input               io_cpu_fetch_isRemoved,
  input      [31:0]   io_cpu_fetch_pc,
  output     [31:0]   io_cpu_fetch_data,
  output              io_cpu_fetch_mmuBus_cmd_isValid,
  output     [31:0]   io_cpu_fetch_mmuBus_cmd_virtualAddress,
  output              io_cpu_fetch_mmuBus_cmd_bypassTranslation,
  input      [31:0]   io_cpu_fetch_mmuBus_rsp_physicalAddress,
  input               io_cpu_fetch_mmuBus_rsp_isIoAccess,
  input               io_cpu_fetch_mmuBus_rsp_allowRead,
  input               io_cpu_fetch_mmuBus_rsp_allowWrite,
  input               io_cpu_fetch_mmuBus_rsp_allowExecute,
  input               io_cpu_fetch_mmuBus_rsp_exception,
  input               io_cpu_fetch_mmuBus_rsp_refilling,
  output              io_cpu_fetch_mmuBus_end,
  input               io_cpu_fetch_mmuBus_busy,
  output     [31:0]   io_cpu_fetch_physicalAddress,
  output              io_cpu_fetch_haltIt,
  input               io_cpu_decode_isValid,
  input               io_cpu_decode_isStuck,
  input      [31:0]   io_cpu_decode_pc,
  output     [31:0]   io_cpu_decode_physicalAddress,
  output     [31:0]   io_cpu_decode_data,
  output              io_cpu_decode_cacheMiss,
  output              io_cpu_decode_error,
  output              io_cpu_decode_mmuRefilling,
  output              io_cpu_decode_mmuException,
  input               io_cpu_decode_isUser,
  input               io_cpu_fill_valid,
  input      [31:0]   io_cpu_fill_payload,
  output              io_mem_cmd_valid,
  input               io_mem_cmd_ready,
  output     [31:0]   io_mem_cmd_payload_address,
  output     [2:0]    io_mem_cmd_payload_size,
  input               io_mem_rsp_valid,
  input      [31:0]   io_mem_rsp_payload_data,
  input               io_mem_rsp_payload_error,
  input               clk,
  input               reset
);
  reg        [21:0]   _zz_18;
  reg        [31:0]   _zz_19;
  reg        [21:0]   _zz_20;
  reg        [31:0]   _zz_21;
  reg                 _zz_22;
  reg        [31:0]   _zz_23;
  wire                _zz_24;
  wire                _zz_25;
  wire       [0:0]    _zz_26;
  wire       [0:0]    _zz_27;
  wire       [0:0]    _zz_28;
  wire       [0:0]    _zz_29;
  wire       [21:0]   _zz_30;
  wire       [21:0]   _zz_31;
  reg                 _zz_1;
  reg                 _zz_2;
  reg                 _zz_3;
  reg                 _zz_4;
  reg                 lineLoader_fire;
  reg                 lineLoader_valid;
  (* keep , syn_keep *) reg        [31:0]   lineLoader_address;
  reg                 lineLoader_hadError;
  reg                 lineLoader_flushPending;
  reg        [7:0]    lineLoader_flushCounter;
  reg                 _zz_5;
  reg                 lineLoader_cmdSent;
  reg                 lineLoader_wayToAllocate_willIncrement;
  wire                lineLoader_wayToAllocate_willClear;
  reg        [0:0]    lineLoader_wayToAllocate_valueNext;
  reg        [0:0]    lineLoader_wayToAllocate_value;
  wire                lineLoader_wayToAllocate_willOverflowIfInc;
  wire                lineLoader_wayToAllocate_willOverflow;
  (* keep , syn_keep *) reg        [2:0]    lineLoader_wordIndex;
  wire                lineLoader_write_tag_0_valid;
  wire       [6:0]    lineLoader_write_tag_0_payload_address;
  wire                lineLoader_write_tag_0_payload_data_valid;
  wire                lineLoader_write_tag_0_payload_data_error;
  wire       [19:0]   lineLoader_write_tag_0_payload_data_address;
  wire                lineLoader_write_tag_1_valid;
  wire       [6:0]    lineLoader_write_tag_1_payload_address;
  wire                lineLoader_write_tag_1_payload_data_valid;
  wire                lineLoader_write_tag_1_payload_data_error;
  wire       [19:0]   lineLoader_write_tag_1_payload_data_address;
  wire                lineLoader_write_data_0_valid;
  wire       [9:0]    lineLoader_write_data_0_payload_address;
  wire       [31:0]   lineLoader_write_data_0_payload_data;
  wire                lineLoader_write_data_1_valid;
  wire       [9:0]    lineLoader_write_data_1_payload_address;
  wire       [31:0]   lineLoader_write_data_1_payload_data;
  wire                _zz_6;
  wire                _zz_7;
  wire       [6:0]    _zz_8;
  wire                _zz_9;
  wire                fetchStage_read_waysValues_0_tag_valid;
  wire                fetchStage_read_waysValues_0_tag_error;
  wire       [19:0]   fetchStage_read_waysValues_0_tag_address;
  wire       [21:0]   _zz_10;
  wire       [9:0]    _zz_11;
  wire                _zz_12;
  wire       [31:0]   fetchStage_read_waysValues_0_data;
  wire       [6:0]    _zz_13;
  wire                _zz_14;
  wire                fetchStage_read_waysValues_1_tag_valid;
  wire                fetchStage_read_waysValues_1_tag_error;
  wire       [19:0]   fetchStage_read_waysValues_1_tag_address;
  wire       [21:0]   _zz_15;
  wire       [9:0]    _zz_16;
  wire                _zz_17;
  wire       [31:0]   fetchStage_read_waysValues_1_data;
  wire                fetchStage_hit_hits_0;
  wire                fetchStage_hit_hits_1;
  wire                fetchStage_hit_valid;
  wire       [0:0]    fetchStage_hit_id;
  wire                fetchStage_hit_error;
  wire       [31:0]   fetchStage_hit_data;
  wire       [31:0]   fetchStage_hit_word;
  reg        [31:0]   io_cpu_fetch_data_regNextWhen;
  reg        [31:0]   decodeStage_mmuRsp_physicalAddress;
  reg                 decodeStage_mmuRsp_isIoAccess;
  reg                 decodeStage_mmuRsp_allowRead;
  reg                 decodeStage_mmuRsp_allowWrite;
  reg                 decodeStage_mmuRsp_allowExecute;
  reg                 decodeStage_mmuRsp_exception;
  reg                 decodeStage_mmuRsp_refilling;
  reg                 decodeStage_hit_valid;
  reg                 decodeStage_hit_error;
  reg [21:0] ways_0_tags [0:127];
  reg [31:0] ways_0_datas [0:1023];
  reg [21:0] ways_1_tags [0:127];
  reg [31:0] ways_1_datas [0:1023];

  assign _zz_24 = (! lineLoader_flushCounter[7]);
  assign _zz_25 = (lineLoader_flushPending && (! (lineLoader_valid || io_cpu_fetch_isValid)));
  assign _zz_26 = _zz_10[0 : 0];
  assign _zz_27 = _zz_10[1 : 1];
  assign _zz_28 = _zz_15[0 : 0];
  assign _zz_29 = _zz_15[1 : 1];
  assign _zz_30 = {lineLoader_write_tag_0_payload_data_address,{lineLoader_write_tag_0_payload_data_error,lineLoader_write_tag_0_payload_data_valid}};
  assign _zz_31 = {lineLoader_write_tag_1_payload_data_address,{lineLoader_write_tag_1_payload_data_error,lineLoader_write_tag_1_payload_data_valid}};
  always @ (posedge clk) begin
    if(_zz_4) begin
      ways_0_tags[lineLoader_write_tag_0_payload_address] <= _zz_30;
    end
  end

  always @ (posedge clk) begin
    if(_zz_9) begin
      _zz_18 <= ways_0_tags[_zz_8];
    end
  end

  always @ (posedge clk) begin
    if(_zz_2) begin
      ways_0_datas[lineLoader_write_data_0_payload_address] <= lineLoader_write_data_0_payload_data;
    end
  end

  always @ (posedge clk) begin
    if(_zz_12) begin
      _zz_19 <= ways_0_datas[_zz_11];
    end
  end

  always @ (posedge clk) begin
    if(_zz_3) begin
      ways_1_tags[lineLoader_write_tag_1_payload_address] <= _zz_31;
    end
  end

  always @ (posedge clk) begin
    if(_zz_14) begin
      _zz_20 <= ways_1_tags[_zz_13];
    end
  end

  always @ (posedge clk) begin
    if(_zz_1) begin
      ways_1_datas[lineLoader_write_data_1_payload_address] <= lineLoader_write_data_1_payload_data;
    end
  end

  always @ (posedge clk) begin
    if(_zz_17) begin
      _zz_21 <= ways_1_datas[_zz_16];
    end
  end

  always @(*) begin
    case(fetchStage_hit_id)
      1'b0 : begin
        _zz_22 = fetchStage_read_waysValues_0_tag_error;
        _zz_23 = fetchStage_read_waysValues_0_data;
      end
      default : begin
        _zz_22 = fetchStage_read_waysValues_1_tag_error;
        _zz_23 = fetchStage_read_waysValues_1_data;
      end
    endcase
  end

  always @ (*) begin
    _zz_1 = 1'b0;
    if(lineLoader_write_data_1_valid)begin
      _zz_1 = 1'b1;
    end
  end

  always @ (*) begin
    _zz_2 = 1'b0;
    if(lineLoader_write_data_0_valid)begin
      _zz_2 = 1'b1;
    end
  end

  always @ (*) begin
    _zz_3 = 1'b0;
    if(lineLoader_write_tag_1_valid)begin
      _zz_3 = 1'b1;
    end
  end

  always @ (*) begin
    _zz_4 = 1'b0;
    if(lineLoader_write_tag_0_valid)begin
      _zz_4 = 1'b1;
    end
  end

  assign io_cpu_fetch_haltIt = io_cpu_fetch_mmuBus_busy;
  always @ (*) begin
    lineLoader_fire = 1'b0;
    if(io_mem_rsp_valid)begin
      if((lineLoader_wordIndex == 3'b111))begin
        lineLoader_fire = 1'b1;
      end
    end
  end

  always @ (*) begin
    io_cpu_prefetch_haltIt = (lineLoader_valid || lineLoader_flushPending);
    if(_zz_24)begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
    if((! _zz_5))begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
    if(io_flush)begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
  end

  assign io_mem_cmd_valid = (lineLoader_valid && (! lineLoader_cmdSent));
  assign io_mem_cmd_payload_address = {lineLoader_address[31 : 5],5'h0};
  assign io_mem_cmd_payload_size = 3'b101;
  always @ (*) begin
    lineLoader_wayToAllocate_willIncrement = 1'b0;
    if((! lineLoader_valid))begin
      lineLoader_wayToAllocate_willIncrement = 1'b1;
    end
  end

  assign lineLoader_wayToAllocate_willClear = 1'b0;
  assign lineLoader_wayToAllocate_willOverflowIfInc = (lineLoader_wayToAllocate_value == 1'b1);
  assign lineLoader_wayToAllocate_willOverflow = (lineLoader_wayToAllocate_willOverflowIfInc && lineLoader_wayToAllocate_willIncrement);
  always @ (*) begin
    lineLoader_wayToAllocate_valueNext = (lineLoader_wayToAllocate_value + lineLoader_wayToAllocate_willIncrement);
    if(lineLoader_wayToAllocate_willClear)begin
      lineLoader_wayToAllocate_valueNext = 1'b0;
    end
  end

  assign _zz_6 = (lineLoader_wayToAllocate_value == 1'b0);
  assign lineLoader_write_tag_0_valid = ((_zz_6 && lineLoader_fire) || (! lineLoader_flushCounter[7]));
  assign lineLoader_write_tag_0_payload_address = (lineLoader_flushCounter[7] ? lineLoader_address[11 : 5] : lineLoader_flushCounter[6 : 0]);
  assign lineLoader_write_tag_0_payload_data_valid = lineLoader_flushCounter[7];
  assign lineLoader_write_tag_0_payload_data_error = (lineLoader_hadError || io_mem_rsp_payload_error);
  assign lineLoader_write_tag_0_payload_data_address = lineLoader_address[31 : 12];
  assign lineLoader_write_data_0_valid = (io_mem_rsp_valid && _zz_6);
  assign lineLoader_write_data_0_payload_address = {lineLoader_address[11 : 5],lineLoader_wordIndex};
  assign lineLoader_write_data_0_payload_data = io_mem_rsp_payload_data;
  assign _zz_7 = (lineLoader_wayToAllocate_value == 1'b1);
  assign lineLoader_write_tag_1_valid = ((_zz_7 && lineLoader_fire) || (! lineLoader_flushCounter[7]));
  assign lineLoader_write_tag_1_payload_address = (lineLoader_flushCounter[7] ? lineLoader_address[11 : 5] : lineLoader_flushCounter[6 : 0]);
  assign lineLoader_write_tag_1_payload_data_valid = lineLoader_flushCounter[7];
  assign lineLoader_write_tag_1_payload_data_error = (lineLoader_hadError || io_mem_rsp_payload_error);
  assign lineLoader_write_tag_1_payload_data_address = lineLoader_address[31 : 12];
  assign lineLoader_write_data_1_valid = (io_mem_rsp_valid && _zz_7);
  assign lineLoader_write_data_1_payload_address = {lineLoader_address[11 : 5],lineLoader_wordIndex};
  assign lineLoader_write_data_1_payload_data = io_mem_rsp_payload_data;
  assign _zz_8 = io_cpu_prefetch_pc[11 : 5];
  assign _zz_9 = (! io_cpu_fetch_isStuck);
  assign _zz_10 = _zz_18;
  assign fetchStage_read_waysValues_0_tag_valid = _zz_26[0];
  assign fetchStage_read_waysValues_0_tag_error = _zz_27[0];
  assign fetchStage_read_waysValues_0_tag_address = _zz_10[21 : 2];
  assign _zz_11 = io_cpu_prefetch_pc[11 : 2];
  assign _zz_12 = (! io_cpu_fetch_isStuck);
  assign fetchStage_read_waysValues_0_data = _zz_19;
  assign _zz_13 = io_cpu_prefetch_pc[11 : 5];
  assign _zz_14 = (! io_cpu_fetch_isStuck);
  assign _zz_15 = _zz_20;
  assign fetchStage_read_waysValues_1_tag_valid = _zz_28[0];
  assign fetchStage_read_waysValues_1_tag_error = _zz_29[0];
  assign fetchStage_read_waysValues_1_tag_address = _zz_15[21 : 2];
  assign _zz_16 = io_cpu_prefetch_pc[11 : 2];
  assign _zz_17 = (! io_cpu_fetch_isStuck);
  assign fetchStage_read_waysValues_1_data = _zz_21;
  assign fetchStage_hit_hits_0 = (fetchStage_read_waysValues_0_tag_valid && (fetchStage_read_waysValues_0_tag_address == io_cpu_fetch_mmuBus_rsp_physicalAddress[31 : 12]));
  assign fetchStage_hit_hits_1 = (fetchStage_read_waysValues_1_tag_valid && (fetchStage_read_waysValues_1_tag_address == io_cpu_fetch_mmuBus_rsp_physicalAddress[31 : 12]));
  assign fetchStage_hit_valid = ({fetchStage_hit_hits_1,fetchStage_hit_hits_0} != 2'b00);
  assign fetchStage_hit_id = fetchStage_hit_hits_1;
  assign fetchStage_hit_error = _zz_22;
  assign fetchStage_hit_data = _zz_23;
  assign fetchStage_hit_word = fetchStage_hit_data;
  assign io_cpu_fetch_data = fetchStage_hit_word;
  assign io_cpu_decode_data = io_cpu_fetch_data_regNextWhen;
  assign io_cpu_fetch_mmuBus_cmd_isValid = io_cpu_fetch_isValid;
  assign io_cpu_fetch_mmuBus_cmd_virtualAddress = io_cpu_fetch_pc;
  assign io_cpu_fetch_mmuBus_cmd_bypassTranslation = 1'b0;
  assign io_cpu_fetch_mmuBus_end = ((! io_cpu_fetch_isStuck) || io_cpu_fetch_isRemoved);
  assign io_cpu_fetch_physicalAddress = io_cpu_fetch_mmuBus_rsp_physicalAddress;
  assign io_cpu_decode_cacheMiss = (! decodeStage_hit_valid);
  assign io_cpu_decode_error = decodeStage_hit_error;
  assign io_cpu_decode_mmuRefilling = decodeStage_mmuRsp_refilling;
  assign io_cpu_decode_mmuException = ((! decodeStage_mmuRsp_refilling) && (decodeStage_mmuRsp_exception || (! decodeStage_mmuRsp_allowExecute)));
  assign io_cpu_decode_physicalAddress = decodeStage_mmuRsp_physicalAddress;
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      lineLoader_valid <= 1'b0;
      lineLoader_hadError <= 1'b0;
      lineLoader_flushPending <= 1'b1;
      lineLoader_cmdSent <= 1'b0;
      lineLoader_wayToAllocate_value <= 1'b0;
      lineLoader_wordIndex <= 3'b000;
    end else begin
      if(lineLoader_fire)begin
        lineLoader_valid <= 1'b0;
      end
      if(lineLoader_fire)begin
        lineLoader_hadError <= 1'b0;
      end
      if(io_cpu_fill_valid)begin
        lineLoader_valid <= 1'b1;
      end
      if(io_flush)begin
        lineLoader_flushPending <= 1'b1;
      end
      if(_zz_25)begin
        lineLoader_flushPending <= 1'b0;
      end
      if((io_mem_cmd_valid && io_mem_cmd_ready))begin
        lineLoader_cmdSent <= 1'b1;
      end
      if(lineLoader_fire)begin
        lineLoader_cmdSent <= 1'b0;
      end
      lineLoader_wayToAllocate_value <= lineLoader_wayToAllocate_valueNext;
      if(io_mem_rsp_valid)begin
        lineLoader_wordIndex <= (lineLoader_wordIndex + 3'b001);
        if(io_mem_rsp_payload_error)begin
          lineLoader_hadError <= 1'b1;
        end
      end
    end
  end

  always @ (posedge clk) begin
    if(io_cpu_fill_valid)begin
      lineLoader_address <= io_cpu_fill_payload;
    end
    if(_zz_24)begin
      lineLoader_flushCounter <= (lineLoader_flushCounter + 8'h01);
    end
    _zz_5 <= lineLoader_flushCounter[7];
    if(_zz_25)begin
      lineLoader_flushCounter <= 8'h0;
    end
    if((! io_cpu_decode_isStuck))begin
      io_cpu_fetch_data_regNextWhen <= io_cpu_fetch_data;
    end
    if((! io_cpu_decode_isStuck))begin
      decodeStage_mmuRsp_physicalAddress <= io_cpu_fetch_mmuBus_rsp_physicalAddress;
      decodeStage_mmuRsp_isIoAccess <= io_cpu_fetch_mmuBus_rsp_isIoAccess;
      decodeStage_mmuRsp_allowRead <= io_cpu_fetch_mmuBus_rsp_allowRead;
      decodeStage_mmuRsp_allowWrite <= io_cpu_fetch_mmuBus_rsp_allowWrite;
      decodeStage_mmuRsp_allowExecute <= io_cpu_fetch_mmuBus_rsp_allowExecute;
      decodeStage_mmuRsp_exception <= io_cpu_fetch_mmuBus_rsp_exception;
      decodeStage_mmuRsp_refilling <= io_cpu_fetch_mmuBus_rsp_refilling;
    end
    if((! io_cpu_decode_isStuck))begin
      decodeStage_hit_valid <= fetchStage_hit_valid;
    end
    if((! io_cpu_decode_isStuck))begin
      decodeStage_hit_error <= fetchStage_hit_error;
    end
  end


endmodule
