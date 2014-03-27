// showcase for mismatch simulation

simulator lang=spectre

include "transistorsPTM.scs"
include "../../ArchitectureDesign/SPICE/decoder2.sp"
include "../../ArchitectureDesign/SPICE/CMOSlogic.scs"
include "parameters.sp"

xdecoder (IN_0 IN_1 IN_2 IN_3 IN_4 IN_5 IN_6 IN_7 IN_8 enable OUT_0 OUT_1 OUT_2 OUT_3 OUT_4 OUT_5 OUT_6 OUT_7 OUT_8 OUT_9 OUT_10 OUT_11 OUT_12 OUT_13 OUT_14 OUT_15 OUT_16 OUT_17 OUT_18 OUT_19 OUT_20 OUT_21 OUT_22 OUT_23 OUT_24 OUT_25 OUT_26 OUT_27 OUT_28 OUT_29 OUT_30 OUT_31 OUT_32 OUT_33 OUT_34 OUT_35 OUT_36 OUT_37 OUT_38 OUT_39 OUT_40 OUT_41 OUT_42 OUT_43 OUT_44 OUT_45 OUT_46 OUT_47 OUT_48 OUT_49 OUT_50 OUT_51 OUT_52 OUT_53 OUT_54 OUT_55 OUT_56 OUT_57 OUT_58 OUT_59 OUT_60 OUT_61 OUT_62 OUT_63 OUT_64 OUT_65 OUT_66 OUT_67 OUT_68 OUT_69 OUT_70 OUT_71 OUT_72 OUT_73 OUT_74 OUT_75 OUT_76 OUT_77 OUT_78 OUT_79 OUT_80 OUT_81 OUT_82 OUT_83 OUT_84 OUT_85 OUT_86 OUT_87 OUT_88 OUT_89 OUT_90 OUT_91 OUT_92 OUT_93 OUT_94 OUT_95 OUT_96 OUT_97 OUT_98 OUT_99 OUT_100 OUT_101 OUT_102 OUT_103 OUT_104 OUT_105 OUT_106 OUT_107 OUT_108 OUT_109 OUT_110 OUT_111 OUT_112 OUT_113 OUT_114 OUT_115 OUT_116 OUT_117 OUT_118 OUT_119 OUT_120 OUT_121 OUT_122 OUT_123 OUT_124 OUT_125 OUT_126 OUT_127 OUT_128 OUT_129 OUT_130 OUT_131 OUT_132 OUT_133 OUT_134 OUT_135 OUT_136 OUT_137 OUT_138 OUT_139 OUT_140 OUT_141 OUT_142 OUT_143 OUT_144 OUT_145 OUT_146 OUT_147 OUT_148 OUT_149 OUT_150 OUT_151 OUT_152 OUT_153 OUT_154 OUT_155 OUT_156 OUT_157 OUT_158 OUT_159 OUT_160 OUT_161 OUT_162 OUT_163 OUT_164 OUT_165 OUT_166 OUT_167 OUT_168 OUT_169 OUT_170 OUT_171 OUT_172 OUT_173 OUT_174 OUT_175 OUT_176 OUT_177 OUT_178 OUT_179 OUT_180 OUT_181 OUT_182 OUT_183 OUT_184 OUT_185 OUT_186 OUT_187 OUT_188 OUT_189 OUT_190 OUT_191 OUT_192 OUT_193 OUT_194 OUT_195 OUT_196 OUT_197 OUT_198 OUT_199 OUT_200 OUT_201 OUT_202 OUT_203 OUT_204 OUT_205 OUT_206 OUT_207 OUT_208 OUT_209 OUT_210 OUT_211 OUT_212 OUT_213 OUT_214 OUT_215 OUT_216 OUT_217 OUT_218 OUT_219 OUT_220 OUT_221 OUT_222 OUT_223 OUT_224 OUT_225 OUT_226 OUT_227 OUT_228 OUT_229 OUT_230 OUT_231 OUT_232 OUT_233 OUT_234 OUT_235 OUT_236 OUT_237 OUT_238 OUT_239 OUT_240 OUT_241 OUT_242 OUT_243 OUT_244 OUT_245 OUT_246 OUT_247 OUT_248 OUT_249 OUT_250 OUT_251 OUT_252 OUT_253 OUT_254 OUT_255 OUT_256 OUT_257 OUT_258 OUT_259 OUT_260 OUT_261 OUT_262 OUT_263 OUT_264 OUT_265 OUT_266 OUT_267 OUT_268 OUT_269 OUT_270 OUT_271 OUT_272 OUT_273 OUT_274 OUT_275 OUT_276 OUT_277 OUT_278 OUT_279 OUT_280 OUT_281 OUT_282 OUT_283 OUT_284 OUT_285 OUT_286 OUT_287 OUT_288 OUT_289 OUT_290 OUT_291 OUT_292 OUT_293 OUT_294 OUT_295 OUT_296 OUT_297 OUT_298 OUT_299 OUT_300 OUT_301 OUT_302 OUT_303 OUT_304 OUT_305 OUT_306 OUT_307 OUT_308 OUT_309 OUT_310 OUT_311 OUT_312 OUT_313 OUT_314 OUT_315 OUT_316 OUT_317 OUT_318 OUT_319 OUT_320 OUT_321 OUT_322 OUT_323 OUT_324 OUT_325 OUT_326 OUT_327 OUT_328 OUT_329 OUT_330 OUT_331 OUT_332 OUT_333 OUT_334 OUT_335 OUT_336 OUT_337 OUT_338 OUT_339 OUT_340 OUT_341 OUT_342 OUT_343 OUT_344 OUT_345 OUT_346 OUT_347 OUT_348 OUT_349 OUT_350 OUT_351 OUT_352 OUT_353 OUT_354 OUT_355 OUT_356 OUT_357 OUT_358 OUT_359 OUT_360 OUT_361 OUT_362 OUT_363 OUT_364 OUT_365 OUT_366 OUT_367 OUT_368 OUT_369 OUT_370 OUT_371 OUT_372 OUT_373 OUT_374 OUT_375 OUT_376 OUT_377 OUT_378 OUT_379 OUT_380 OUT_381 OUT_382 OUT_383 OUT_384 OUT_385 OUT_386 OUT_387 OUT_388 OUT_389 OUT_390 OUT_391 OUT_392 OUT_393 OUT_394 OUT_395 OUT_396 OUT_397 OUT_398 OUT_399 OUT_400 OUT_401 OUT_402 OUT_403 OUT_404 OUT_405 OUT_406 OUT_407 OUT_408 OUT_409 OUT_410 OUT_411 OUT_412 OUT_413 OUT_414 OUT_415 OUT_416 OUT_417 OUT_418 OUT_419 OUT_420 OUT_421 OUT_422 OUT_423 OUT_424 OUT_425 OUT_426 OUT_427 OUT_428 OUT_429 OUT_430 OUT_431 OUT_432 OUT_433 OUT_434 OUT_435 OUT_436 OUT_437 OUT_438 OUT_439 OUT_440 OUT_441 OUT_442 OUT_443 OUT_444 OUT_445 OUT_446 OUT_447 OUT_448 OUT_449 OUT_450 OUT_451 OUT_452 OUT_453 OUT_454 OUT_455 OUT_456 OUT_457 OUT_458 OUT_459 OUT_460 OUT_461 OUT_462 OUT_463 OUT_464 OUT_465 OUT_466 OUT_467 OUT_468 OUT_469 OUT_470 OUT_471 OUT_472 OUT_473 OUT_474 OUT_475 OUT_476 OUT_477 OUT_478 OUT_479 OUT_480 OUT_481 OUT_482 OUT_483 OUT_484 OUT_485 OUT_486 OUT_487 OUT_488 OUT_489 OUT_490 OUT_491 OUT_492 OUT_493 OUT_494 OUT_495 OUT_496 OUT_497 OUT_498 OUT_499 OUT_500 OUT_501 OUT_502 OUT_503 OUT_504 OUT_505 OUT_506 OUT_507 OUT_508 OUT_509 OUT_510 OUT_511 vdd vss NBulkLine PBulkLine) decodernine

Vvdd     ( vdd     0 ) vsource dc=1
VvddBulk ( PBulkLine 0 ) vsource dc=1
Vvss     ( vss     0 ) vsource dc=0
VvssBulk ( NBulkLine 0 ) vsource dc=0


xinv_0 (OUT_0 whatevs_0 vdd vss PBulkLine NBulkLine) inverter
//cCap0 OUT_0 0 capacitor c=0.18e-15
xinv_1 (OUT_1 whatevs_1 vdd vss PBulkLine NBulkLine) inverter
//cCap1 OUT_1 0 capacitor c=0.18e-15
xinv_2 (OUT_2 whatevs_2 vdd vss PBulkLine NBulkLine) inverter
//cCap2 OUT_2 0 capacitor c=0.18e-15
xinv_3 (OUT_3 whatevs_3 vdd vss PBulkLine NBulkLine) inverter
//cCap3 OUT_3 0 capacitor c=0.18e-15
xinv_4 (OUT_4 whatevs_4 vdd vss PBulkLine NBulkLine) inverter
//cCap4 OUT_4 0 capacitor c=0.18e-15
xinv_5 (OUT_5 whatevs_5 vdd vss PBulkLine NBulkLine) inverter
//cCap5 OUT_5 0 capacitor c=0.18e-15
xinv_6 (OUT_6 whatevs_6 vdd vss PBulkLine NBulkLine) inverter
//cCap6 OUT_6 0 capacitor c=0.18e-15
xinv_7 (OUT_7 whatevs_7 vdd vss PBulkLine NBulkLine) inverter
//cCap7 OUT_7 0 capacitor c=0.18e-15
xinv_8 (OUT_8 whatevs_8 vdd vss PBulkLine NBulkLine) inverter
//cCap8 OUT_8 0 capacitor c=0.18e-15
xinv_9 (OUT_9 whatevs_9 vdd vss PBulkLine NBulkLine) inverter
//cCap9 OUT_9 0 capacitor c=0.18e-15
xinv_10 (OUT_10 whatevs_10 vdd vss PBulkLine NBulkLine) inverter
//cCap10 OUT_10 0 capacitor c=0.18e-15
xinv_11 (OUT_11 whatevs_11 vdd vss PBulkLine NBulkLine) inverter
//cCap11 OUT_11 0 capacitor c=0.18e-15
xinv_12 (OUT_12 whatevs_12 vdd vss PBulkLine NBulkLine) inverter
//cCap12 OUT_12 0 capacitor c=0.18e-15
xinv_13 (OUT_13 whatevs_13 vdd vss PBulkLine NBulkLine) inverter
//cCap13 OUT_13 0 capacitor c=0.18e-15
xinv_14 (OUT_14 whatevs_14 vdd vss PBulkLine NBulkLine) inverter
//cCap14 OUT_14 0 capacitor c=0.18e-15
xinv_15 (OUT_15 whatevs_15 vdd vss PBulkLine NBulkLine) inverter
//cCap15 OUT_15 0 capacitor c=0.18e-15
xinv_16 (OUT_16 whatevs_16 vdd vss PBulkLine NBulkLine) inverter
//cCap16 OUT_16 0 capacitor c=0.18e-15
xinv_17 (OUT_17 whatevs_17 vdd vss PBulkLine NBulkLine) inverter
//cCap17 OUT_17 0 capacitor c=0.18e-15
xinv_18 (OUT_18 whatevs_18 vdd vss PBulkLine NBulkLine) inverter
//cCap18 OUT_18 0 capacitor c=0.18e-15
xinv_19 (OUT_19 whatevs_19 vdd vss PBulkLine NBulkLine) inverter
//cCap19 OUT_19 0 capacitor c=0.18e-15
xinv_20 (OUT_20 whatevs_20 vdd vss PBulkLine NBulkLine) inverter
//cCap20 OUT_20 0 capacitor c=0.18e-15
xinv_21 (OUT_21 whatevs_21 vdd vss PBulkLine NBulkLine) inverter
//cCap21 OUT_21 0 capacitor c=0.18e-15
xinv_22 (OUT_22 whatevs_22 vdd vss PBulkLine NBulkLine) inverter
//cCap22 OUT_22 0 capacitor c=0.18e-15
xinv_23 (OUT_23 whatevs_23 vdd vss PBulkLine NBulkLine) inverter
//cCap23 OUT_23 0 capacitor c=0.18e-15
xinv_24 (OUT_24 whatevs_24 vdd vss PBulkLine NBulkLine) inverter
//cCap24 OUT_24 0 capacitor c=0.18e-15
xinv_25 (OUT_25 whatevs_25 vdd vss PBulkLine NBulkLine) inverter
//cCap25 OUT_25 0 capacitor c=0.18e-15
xinv_26 (OUT_26 whatevs_26 vdd vss PBulkLine NBulkLine) inverter
//cCap26 OUT_26 0 capacitor c=0.18e-15
xinv_27 (OUT_27 whatevs_27 vdd vss PBulkLine NBulkLine) inverter
//cCap27 OUT_27 0 capacitor c=0.18e-15
xinv_28 (OUT_28 whatevs_28 vdd vss PBulkLine NBulkLine) inverter
//cCap28 OUT_28 0 capacitor c=0.18e-15
xinv_29 (OUT_29 whatevs_29 vdd vss PBulkLine NBulkLine) inverter
//cCap29 OUT_29 0 capacitor c=0.18e-15
xinv_30 (OUT_30 whatevs_30 vdd vss PBulkLine NBulkLine) inverter
//cCap30 OUT_30 0 capacitor c=0.18e-15
xinv_31 (OUT_31 whatevs_31 vdd vss PBulkLine NBulkLine) inverter
//cCap31 OUT_31 0 capacitor c=0.18e-15
xinv_32 (OUT_32 whatevs_32 vdd vss PBulkLine NBulkLine) inverter
//cCap32 OUT_32 0 capacitor c=0.18e-15
xinv_33 (OUT_33 whatevs_33 vdd vss PBulkLine NBulkLine) inverter
//cCap33 OUT_33 0 capacitor c=0.18e-15
xinv_34 (OUT_34 whatevs_34 vdd vss PBulkLine NBulkLine) inverter
//cCap34 OUT_34 0 capacitor c=0.18e-15
xinv_35 (OUT_35 whatevs_35 vdd vss PBulkLine NBulkLine) inverter
//cCap35 OUT_35 0 capacitor c=0.18e-15
xinv_36 (OUT_36 whatevs_36 vdd vss PBulkLine NBulkLine) inverter
//cCap36 OUT_36 0 capacitor c=0.18e-15
xinv_37 (OUT_37 whatevs_37 vdd vss PBulkLine NBulkLine) inverter
//cCap37 OUT_37 0 capacitor c=0.18e-15
xinv_38 (OUT_38 whatevs_38 vdd vss PBulkLine NBulkLine) inverter
//cCap38 OUT_38 0 capacitor c=0.18e-15
xinv_39 (OUT_39 whatevs_39 vdd vss PBulkLine NBulkLine) inverter
//cCap39 OUT_39 0 capacitor c=0.18e-15
xinv_40 (OUT_40 whatevs_40 vdd vss PBulkLine NBulkLine) inverter
//cCap40 OUT_40 0 capacitor c=0.18e-15
xinv_41 (OUT_41 whatevs_41 vdd vss PBulkLine NBulkLine) inverter
//cCap41 OUT_41 0 capacitor c=0.18e-15
xinv_42 (OUT_42 whatevs_42 vdd vss PBulkLine NBulkLine) inverter
//cCap42 OUT_42 0 capacitor c=0.18e-15
xinv_43 (OUT_43 whatevs_43 vdd vss PBulkLine NBulkLine) inverter
//cCap43 OUT_43 0 capacitor c=0.18e-15
xinv_44 (OUT_44 whatevs_44 vdd vss PBulkLine NBulkLine) inverter
//cCap44 OUT_44 0 capacitor c=0.18e-15
xinv_45 (OUT_45 whatevs_45 vdd vss PBulkLine NBulkLine) inverter
//cCap45 OUT_45 0 capacitor c=0.18e-15
xinv_46 (OUT_46 whatevs_46 vdd vss PBulkLine NBulkLine) inverter
//cCap46 OUT_46 0 capacitor c=0.18e-15
xinv_47 (OUT_47 whatevs_47 vdd vss PBulkLine NBulkLine) inverter
//cCap47 OUT_47 0 capacitor c=0.18e-15
xinv_48 (OUT_48 whatevs_48 vdd vss PBulkLine NBulkLine) inverter
//cCap48 OUT_48 0 capacitor c=0.18e-15
xinv_49 (OUT_49 whatevs_49 vdd vss PBulkLine NBulkLine) inverter
//cCap49 OUT_49 0 capacitor c=0.18e-15
xinv_50 (OUT_50 whatevs_50 vdd vss PBulkLine NBulkLine) inverter
//cCap50 OUT_50 0 capacitor c=0.18e-15
xinv_51 (OUT_51 whatevs_51 vdd vss PBulkLine NBulkLine) inverter
//cCap51 OUT_51 0 capacitor c=0.18e-15
xinv_52 (OUT_52 whatevs_52 vdd vss PBulkLine NBulkLine) inverter
//cCap52 OUT_52 0 capacitor c=0.18e-15
xinv_53 (OUT_53 whatevs_53 vdd vss PBulkLine NBulkLine) inverter
//cCap53 OUT_53 0 capacitor c=0.18e-15
xinv_54 (OUT_54 whatevs_54 vdd vss PBulkLine NBulkLine) inverter
//cCap54 OUT_54 0 capacitor c=0.18e-15
xinv_55 (OUT_55 whatevs_55 vdd vss PBulkLine NBulkLine) inverter
//cCap55 OUT_55 0 capacitor c=0.18e-15
xinv_56 (OUT_56 whatevs_56 vdd vss PBulkLine NBulkLine) inverter
//cCap56 OUT_56 0 capacitor c=0.18e-15
xinv_57 (OUT_57 whatevs_57 vdd vss PBulkLine NBulkLine) inverter
//cCap57 OUT_57 0 capacitor c=0.18e-15
xinv_58 (OUT_58 whatevs_58 vdd vss PBulkLine NBulkLine) inverter
//cCap58 OUT_58 0 capacitor c=0.18e-15
xinv_59 (OUT_59 whatevs_59 vdd vss PBulkLine NBulkLine) inverter
//cCap59 OUT_59 0 capacitor c=0.18e-15
xinv_60 (OUT_60 whatevs_60 vdd vss PBulkLine NBulkLine) inverter
//cCap60 OUT_60 0 capacitor c=0.18e-15
xinv_61 (OUT_61 whatevs_61 vdd vss PBulkLine NBulkLine) inverter
//cCap61 OUT_61 0 capacitor c=0.18e-15
xinv_62 (OUT_62 whatevs_62 vdd vss PBulkLine NBulkLine) inverter
//cCap62 OUT_62 0 capacitor c=0.18e-15
xinv_63 (OUT_63 whatevs_63 vdd vss PBulkLine NBulkLine) inverter
//cCap63 OUT_63 0 capacitor c=0.18e-15
xinv_64 (OUT_64 whatevs_64 vdd vss PBulkLine NBulkLine) inverter
//cCap64 OUT_64 0 capacitor c=0.18e-15
xinv_65 (OUT_65 whatevs_65 vdd vss PBulkLine NBulkLine) inverter
//cCap65 OUT_65 0 capacitor c=0.18e-15
xinv_66 (OUT_66 whatevs_66 vdd vss PBulkLine NBulkLine) inverter
//cCap66 OUT_66 0 capacitor c=0.18e-15
xinv_67 (OUT_67 whatevs_67 vdd vss PBulkLine NBulkLine) inverter
//cCap67 OUT_67 0 capacitor c=0.18e-15
xinv_68 (OUT_68 whatevs_68 vdd vss PBulkLine NBulkLine) inverter
//cCap68 OUT_68 0 capacitor c=0.18e-15
xinv_69 (OUT_69 whatevs_69 vdd vss PBulkLine NBulkLine) inverter
//cCap69 OUT_69 0 capacitor c=0.18e-15
xinv_70 (OUT_70 whatevs_70 vdd vss PBulkLine NBulkLine) inverter
//cCap70 OUT_70 0 capacitor c=0.18e-15
xinv_71 (OUT_71 whatevs_71 vdd vss PBulkLine NBulkLine) inverter
//cCap71 OUT_71 0 capacitor c=0.18e-15
xinv_72 (OUT_72 whatevs_72 vdd vss PBulkLine NBulkLine) inverter
//cCap72 OUT_72 0 capacitor c=0.18e-15
xinv_73 (OUT_73 whatevs_73 vdd vss PBulkLine NBulkLine) inverter
//cCap73 OUT_73 0 capacitor c=0.18e-15
xinv_74 (OUT_74 whatevs_74 vdd vss PBulkLine NBulkLine) inverter
//cCap74 OUT_74 0 capacitor c=0.18e-15
xinv_75 (OUT_75 whatevs_75 vdd vss PBulkLine NBulkLine) inverter
//cCap75 OUT_75 0 capacitor c=0.18e-15
xinv_76 (OUT_76 whatevs_76 vdd vss PBulkLine NBulkLine) inverter
//cCap76 OUT_76 0 capacitor c=0.18e-15
xinv_77 (OUT_77 whatevs_77 vdd vss PBulkLine NBulkLine) inverter
//cCap77 OUT_77 0 capacitor c=0.18e-15
xinv_78 (OUT_78 whatevs_78 vdd vss PBulkLine NBulkLine) inverter
//cCap78 OUT_78 0 capacitor c=0.18e-15
xinv_79 (OUT_79 whatevs_79 vdd vss PBulkLine NBulkLine) inverter
//cCap79 OUT_79 0 capacitor c=0.18e-15
xinv_80 (OUT_80 whatevs_80 vdd vss PBulkLine NBulkLine) inverter
//cCap80 OUT_80 0 capacitor c=0.18e-15
xinv_81 (OUT_81 whatevs_81 vdd vss PBulkLine NBulkLine) inverter
//cCap81 OUT_81 0 capacitor c=0.18e-15
xinv_82 (OUT_82 whatevs_82 vdd vss PBulkLine NBulkLine) inverter
//cCap82 OUT_82 0 capacitor c=0.18e-15
xinv_83 (OUT_83 whatevs_83 vdd vss PBulkLine NBulkLine) inverter
//cCap83 OUT_83 0 capacitor c=0.18e-15
xinv_84 (OUT_84 whatevs_84 vdd vss PBulkLine NBulkLine) inverter
//cCap84 OUT_84 0 capacitor c=0.18e-15
xinv_85 (OUT_85 whatevs_85 vdd vss PBulkLine NBulkLine) inverter
//cCap85 OUT_85 0 capacitor c=0.18e-15
xinv_86 (OUT_86 whatevs_86 vdd vss PBulkLine NBulkLine) inverter
//cCap86 OUT_86 0 capacitor c=0.18e-15
xinv_87 (OUT_87 whatevs_87 vdd vss PBulkLine NBulkLine) inverter
//cCap87 OUT_87 0 capacitor c=0.18e-15
xinv_88 (OUT_88 whatevs_88 vdd vss PBulkLine NBulkLine) inverter
//cCap88 OUT_88 0 capacitor c=0.18e-15
xinv_89 (OUT_89 whatevs_89 vdd vss PBulkLine NBulkLine) inverter
//cCap89 OUT_89 0 capacitor c=0.18e-15
xinv_90 (OUT_90 whatevs_90 vdd vss PBulkLine NBulkLine) inverter
//cCap90 OUT_90 0 capacitor c=0.18e-15
xinv_91 (OUT_91 whatevs_91 vdd vss PBulkLine NBulkLine) inverter
//cCap91 OUT_91 0 capacitor c=0.18e-15
xinv_92 (OUT_92 whatevs_92 vdd vss PBulkLine NBulkLine) inverter
//cCap92 OUT_92 0 capacitor c=0.18e-15
xinv_93 (OUT_93 whatevs_93 vdd vss PBulkLine NBulkLine) inverter
//cCap93 OUT_93 0 capacitor c=0.18e-15
xinv_94 (OUT_94 whatevs_94 vdd vss PBulkLine NBulkLine) inverter
//cCap94 OUT_94 0 capacitor c=0.18e-15
xinv_95 (OUT_95 whatevs_95 vdd vss PBulkLine NBulkLine) inverter
//cCap95 OUT_95 0 capacitor c=0.18e-15
xinv_96 (OUT_96 whatevs_96 vdd vss PBulkLine NBulkLine) inverter
//cCap96 OUT_96 0 capacitor c=0.18e-15
xinv_97 (OUT_97 whatevs_97 vdd vss PBulkLine NBulkLine) inverter
//cCap97 OUT_97 0 capacitor c=0.18e-15
xinv_98 (OUT_98 whatevs_98 vdd vss PBulkLine NBulkLine) inverter
//cCap98 OUT_98 0 capacitor c=0.18e-15
xinv_99 (OUT_99 whatevs_99 vdd vss PBulkLine NBulkLine) inverter
//cCap99 OUT_99 0 capacitor c=0.18e-15
xinv_100 (OUT_100 whatevs_100 vdd vss PBulkLine NBulkLine) inverter
//cCap100 OUT_100 0 capacitor c=0.18e-15
xinv_101 (OUT_101 whatevs_101 vdd vss PBulkLine NBulkLine) inverter
//cCap101 OUT_101 0 capacitor c=0.18e-15
xinv_102 (OUT_102 whatevs_102 vdd vss PBulkLine NBulkLine) inverter
//cCap102 OUT_102 0 capacitor c=0.18e-15
xinv_103 (OUT_103 whatevs_103 vdd vss PBulkLine NBulkLine) inverter
//cCap103 OUT_103 0 capacitor c=0.18e-15
xinv_104 (OUT_104 whatevs_104 vdd vss PBulkLine NBulkLine) inverter
//cCap104 OUT_104 0 capacitor c=0.18e-15
xinv_105 (OUT_105 whatevs_105 vdd vss PBulkLine NBulkLine) inverter
//cCap105 OUT_105 0 capacitor c=0.18e-15
xinv_106 (OUT_106 whatevs_106 vdd vss PBulkLine NBulkLine) inverter
//cCap106 OUT_106 0 capacitor c=0.18e-15
xinv_107 (OUT_107 whatevs_107 vdd vss PBulkLine NBulkLine) inverter
//cCap107 OUT_107 0 capacitor c=0.18e-15
xinv_108 (OUT_108 whatevs_108 vdd vss PBulkLine NBulkLine) inverter
//cCap108 OUT_108 0 capacitor c=0.18e-15
xinv_109 (OUT_109 whatevs_109 vdd vss PBulkLine NBulkLine) inverter
//cCap109 OUT_109 0 capacitor c=0.18e-15
xinv_110 (OUT_110 whatevs_110 vdd vss PBulkLine NBulkLine) inverter
//cCap110 OUT_110 0 capacitor c=0.18e-15
xinv_111 (OUT_111 whatevs_111 vdd vss PBulkLine NBulkLine) inverter
//cCap111 OUT_111 0 capacitor c=0.18e-15
xinv_112 (OUT_112 whatevs_112 vdd vss PBulkLine NBulkLine) inverter
//cCap112 OUT_112 0 capacitor c=0.18e-15
xinv_113 (OUT_113 whatevs_113 vdd vss PBulkLine NBulkLine) inverter
//cCap113 OUT_113 0 capacitor c=0.18e-15
xinv_114 (OUT_114 whatevs_114 vdd vss PBulkLine NBulkLine) inverter
//cCap114 OUT_114 0 capacitor c=0.18e-15
xinv_115 (OUT_115 whatevs_115 vdd vss PBulkLine NBulkLine) inverter
//cCap115 OUT_115 0 capacitor c=0.18e-15
xinv_116 (OUT_116 whatevs_116 vdd vss PBulkLine NBulkLine) inverter
//cCap116 OUT_116 0 capacitor c=0.18e-15
xinv_117 (OUT_117 whatevs_117 vdd vss PBulkLine NBulkLine) inverter
//cCap117 OUT_117 0 capacitor c=0.18e-15
xinv_118 (OUT_118 whatevs_118 vdd vss PBulkLine NBulkLine) inverter
//cCap118 OUT_118 0 capacitor c=0.18e-15
xinv_119 (OUT_119 whatevs_119 vdd vss PBulkLine NBulkLine) inverter
//cCap119 OUT_119 0 capacitor c=0.18e-15
xinv_120 (OUT_120 whatevs_120 vdd vss PBulkLine NBulkLine) inverter
//cCap120 OUT_120 0 capacitor c=0.18e-15
xinv_121 (OUT_121 whatevs_121 vdd vss PBulkLine NBulkLine) inverter
//cCap121 OUT_121 0 capacitor c=0.18e-15
xinv_122 (OUT_122 whatevs_122 vdd vss PBulkLine NBulkLine) inverter
//cCap122 OUT_122 0 capacitor c=0.18e-15
xinv_123 (OUT_123 whatevs_123 vdd vss PBulkLine NBulkLine) inverter
//cCap123 OUT_123 0 capacitor c=0.18e-15
xinv_124 (OUT_124 whatevs_124 vdd vss PBulkLine NBulkLine) inverter
//cCap124 OUT_124 0 capacitor c=0.18e-15
xinv_125 (OUT_125 whatevs_125 vdd vss PBulkLine NBulkLine) inverter
//cCap125 OUT_125 0 capacitor c=0.18e-15
xinv_126 (OUT_126 whatevs_126 vdd vss PBulkLine NBulkLine) inverter
//cCap126 OUT_126 0 capacitor c=0.18e-15
xinv_127 (OUT_127 whatevs_127 vdd vss PBulkLine NBulkLine) inverter
//cCap127 OUT_127 0 capacitor c=0.18e-15
xinv_128 (OUT_128 whatevs_128 vdd vss PBulkLine NBulkLine) inverter
//cCap128 OUT_128 0 capacitor c=0.18e-15
xinv_129 (OUT_129 whatevs_129 vdd vss PBulkLine NBulkLine) inverter
//cCap129 OUT_129 0 capacitor c=0.18e-15
xinv_130 (OUT_130 whatevs_130 vdd vss PBulkLine NBulkLine) inverter
//cCap130 OUT_130 0 capacitor c=0.18e-15
xinv_131 (OUT_131 whatevs_131 vdd vss PBulkLine NBulkLine) inverter
//cCap131 OUT_131 0 capacitor c=0.18e-15
xinv_132 (OUT_132 whatevs_132 vdd vss PBulkLine NBulkLine) inverter
//cCap132 OUT_132 0 capacitor c=0.18e-15
xinv_133 (OUT_133 whatevs_133 vdd vss PBulkLine NBulkLine) inverter
//cCap133 OUT_133 0 capacitor c=0.18e-15
xinv_134 (OUT_134 whatevs_134 vdd vss PBulkLine NBulkLine) inverter
//cCap134 OUT_134 0 capacitor c=0.18e-15
xinv_135 (OUT_135 whatevs_135 vdd vss PBulkLine NBulkLine) inverter
//cCap135 OUT_135 0 capacitor c=0.18e-15
xinv_136 (OUT_136 whatevs_136 vdd vss PBulkLine NBulkLine) inverter
//cCap136 OUT_136 0 capacitor c=0.18e-15
xinv_137 (OUT_137 whatevs_137 vdd vss PBulkLine NBulkLine) inverter
//cCap137 OUT_137 0 capacitor c=0.18e-15
xinv_138 (OUT_138 whatevs_138 vdd vss PBulkLine NBulkLine) inverter
//cCap138 OUT_138 0 capacitor c=0.18e-15
xinv_139 (OUT_139 whatevs_139 vdd vss PBulkLine NBulkLine) inverter
//cCap139 OUT_139 0 capacitor c=0.18e-15
xinv_140 (OUT_140 whatevs_140 vdd vss PBulkLine NBulkLine) inverter
//cCap140 OUT_140 0 capacitor c=0.18e-15
xinv_141 (OUT_141 whatevs_141 vdd vss PBulkLine NBulkLine) inverter
//cCap141 OUT_141 0 capacitor c=0.18e-15
xinv_142 (OUT_142 whatevs_142 vdd vss PBulkLine NBulkLine) inverter
//cCap142 OUT_142 0 capacitor c=0.18e-15
xinv_143 (OUT_143 whatevs_143 vdd vss PBulkLine NBulkLine) inverter
//cCap143 OUT_143 0 capacitor c=0.18e-15
xinv_144 (OUT_144 whatevs_144 vdd vss PBulkLine NBulkLine) inverter
//cCap144 OUT_144 0 capacitor c=0.18e-15
xinv_145 (OUT_145 whatevs_145 vdd vss PBulkLine NBulkLine) inverter
//cCap145 OUT_145 0 capacitor c=0.18e-15
xinv_146 (OUT_146 whatevs_146 vdd vss PBulkLine NBulkLine) inverter
//cCap146 OUT_146 0 capacitor c=0.18e-15
xinv_147 (OUT_147 whatevs_147 vdd vss PBulkLine NBulkLine) inverter
//cCap147 OUT_147 0 capacitor c=0.18e-15
xinv_148 (OUT_148 whatevs_148 vdd vss PBulkLine NBulkLine) inverter
//cCap148 OUT_148 0 capacitor c=0.18e-15
xinv_149 (OUT_149 whatevs_149 vdd vss PBulkLine NBulkLine) inverter
//cCap149 OUT_149 0 capacitor c=0.18e-15
xinv_150 (OUT_150 whatevs_150 vdd vss PBulkLine NBulkLine) inverter
//cCap150 OUT_150 0 capacitor c=0.18e-15
xinv_151 (OUT_151 whatevs_151 vdd vss PBulkLine NBulkLine) inverter
//cCap151 OUT_151 0 capacitor c=0.18e-15
xinv_152 (OUT_152 whatevs_152 vdd vss PBulkLine NBulkLine) inverter
//cCap152 OUT_152 0 capacitor c=0.18e-15
xinv_153 (OUT_153 whatevs_153 vdd vss PBulkLine NBulkLine) inverter
//cCap153 OUT_153 0 capacitor c=0.18e-15
xinv_154 (OUT_154 whatevs_154 vdd vss PBulkLine NBulkLine) inverter
//cCap154 OUT_154 0 capacitor c=0.18e-15
xinv_155 (OUT_155 whatevs_155 vdd vss PBulkLine NBulkLine) inverter
//cCap155 OUT_155 0 capacitor c=0.18e-15
xinv_156 (OUT_156 whatevs_156 vdd vss PBulkLine NBulkLine) inverter
//cCap156 OUT_156 0 capacitor c=0.18e-15
xinv_157 (OUT_157 whatevs_157 vdd vss PBulkLine NBulkLine) inverter
//cCap157 OUT_157 0 capacitor c=0.18e-15
xinv_158 (OUT_158 whatevs_158 vdd vss PBulkLine NBulkLine) inverter
//cCap158 OUT_158 0 capacitor c=0.18e-15
xinv_159 (OUT_159 whatevs_159 vdd vss PBulkLine NBulkLine) inverter
//cCap159 OUT_159 0 capacitor c=0.18e-15
xinv_160 (OUT_160 whatevs_160 vdd vss PBulkLine NBulkLine) inverter
//cCap160 OUT_160 0 capacitor c=0.18e-15
xinv_161 (OUT_161 whatevs_161 vdd vss PBulkLine NBulkLine) inverter
//cCap161 OUT_161 0 capacitor c=0.18e-15
xinv_162 (OUT_162 whatevs_162 vdd vss PBulkLine NBulkLine) inverter
//cCap162 OUT_162 0 capacitor c=0.18e-15
xinv_163 (OUT_163 whatevs_163 vdd vss PBulkLine NBulkLine) inverter
//cCap163 OUT_163 0 capacitor c=0.18e-15
xinv_164 (OUT_164 whatevs_164 vdd vss PBulkLine NBulkLine) inverter
//cCap164 OUT_164 0 capacitor c=0.18e-15
xinv_165 (OUT_165 whatevs_165 vdd vss PBulkLine NBulkLine) inverter
//cCap165 OUT_165 0 capacitor c=0.18e-15
xinv_166 (OUT_166 whatevs_166 vdd vss PBulkLine NBulkLine) inverter
//cCap166 OUT_166 0 capacitor c=0.18e-15
xinv_167 (OUT_167 whatevs_167 vdd vss PBulkLine NBulkLine) inverter
//cCap167 OUT_167 0 capacitor c=0.18e-15
xinv_168 (OUT_168 whatevs_168 vdd vss PBulkLine NBulkLine) inverter
//cCap168 OUT_168 0 capacitor c=0.18e-15
xinv_169 (OUT_169 whatevs_169 vdd vss PBulkLine NBulkLine) inverter
//cCap169 OUT_169 0 capacitor c=0.18e-15
xinv_170 (OUT_170 whatevs_170 vdd vss PBulkLine NBulkLine) inverter
//cCap170 OUT_170 0 capacitor c=0.18e-15
xinv_171 (OUT_171 whatevs_171 vdd vss PBulkLine NBulkLine) inverter
//cCap171 OUT_171 0 capacitor c=0.18e-15
xinv_172 (OUT_172 whatevs_172 vdd vss PBulkLine NBulkLine) inverter
//cCap172 OUT_172 0 capacitor c=0.18e-15
xinv_173 (OUT_173 whatevs_173 vdd vss PBulkLine NBulkLine) inverter
//cCap173 OUT_173 0 capacitor c=0.18e-15
xinv_174 (OUT_174 whatevs_174 vdd vss PBulkLine NBulkLine) inverter
//cCap174 OUT_174 0 capacitor c=0.18e-15
xinv_175 (OUT_175 whatevs_175 vdd vss PBulkLine NBulkLine) inverter
//cCap175 OUT_175 0 capacitor c=0.18e-15
xinv_176 (OUT_176 whatevs_176 vdd vss PBulkLine NBulkLine) inverter
//cCap176 OUT_176 0 capacitor c=0.18e-15
xinv_177 (OUT_177 whatevs_177 vdd vss PBulkLine NBulkLine) inverter
//cCap177 OUT_177 0 capacitor c=0.18e-15
xinv_178 (OUT_178 whatevs_178 vdd vss PBulkLine NBulkLine) inverter
//cCap178 OUT_178 0 capacitor c=0.18e-15
xinv_179 (OUT_179 whatevs_179 vdd vss PBulkLine NBulkLine) inverter
//cCap179 OUT_179 0 capacitor c=0.18e-15
xinv_180 (OUT_180 whatevs_180 vdd vss PBulkLine NBulkLine) inverter
//cCap180 OUT_180 0 capacitor c=0.18e-15
xinv_181 (OUT_181 whatevs_181 vdd vss PBulkLine NBulkLine) inverter
//cCap181 OUT_181 0 capacitor c=0.18e-15
xinv_182 (OUT_182 whatevs_182 vdd vss PBulkLine NBulkLine) inverter
//cCap182 OUT_182 0 capacitor c=0.18e-15
xinv_183 (OUT_183 whatevs_183 vdd vss PBulkLine NBulkLine) inverter
//cCap183 OUT_183 0 capacitor c=0.18e-15
xinv_184 (OUT_184 whatevs_184 vdd vss PBulkLine NBulkLine) inverter
//cCap184 OUT_184 0 capacitor c=0.18e-15
xinv_185 (OUT_185 whatevs_185 vdd vss PBulkLine NBulkLine) inverter
//cCap185 OUT_185 0 capacitor c=0.18e-15
xinv_186 (OUT_186 whatevs_186 vdd vss PBulkLine NBulkLine) inverter
//cCap186 OUT_186 0 capacitor c=0.18e-15
xinv_187 (OUT_187 whatevs_187 vdd vss PBulkLine NBulkLine) inverter
//cCap187 OUT_187 0 capacitor c=0.18e-15
xinv_188 (OUT_188 whatevs_188 vdd vss PBulkLine NBulkLine) inverter
//cCap188 OUT_188 0 capacitor c=0.18e-15
xinv_189 (OUT_189 whatevs_189 vdd vss PBulkLine NBulkLine) inverter
//cCap189 OUT_189 0 capacitor c=0.18e-15
xinv_190 (OUT_190 whatevs_190 vdd vss PBulkLine NBulkLine) inverter
//cCap190 OUT_190 0 capacitor c=0.18e-15
xinv_191 (OUT_191 whatevs_191 vdd vss PBulkLine NBulkLine) inverter
//cCap191 OUT_191 0 capacitor c=0.18e-15
xinv_192 (OUT_192 whatevs_192 vdd vss PBulkLine NBulkLine) inverter
//cCap192 OUT_192 0 capacitor c=0.18e-15
xinv_193 (OUT_193 whatevs_193 vdd vss PBulkLine NBulkLine) inverter
//cCap193 OUT_193 0 capacitor c=0.18e-15
xinv_194 (OUT_194 whatevs_194 vdd vss PBulkLine NBulkLine) inverter
//cCap194 OUT_194 0 capacitor c=0.18e-15
xinv_195 (OUT_195 whatevs_195 vdd vss PBulkLine NBulkLine) inverter
//cCap195 OUT_195 0 capacitor c=0.18e-15
xinv_196 (OUT_196 whatevs_196 vdd vss PBulkLine NBulkLine) inverter
//cCap196 OUT_196 0 capacitor c=0.18e-15
xinv_197 (OUT_197 whatevs_197 vdd vss PBulkLine NBulkLine) inverter
//cCap197 OUT_197 0 capacitor c=0.18e-15
xinv_198 (OUT_198 whatevs_198 vdd vss PBulkLine NBulkLine) inverter
//cCap198 OUT_198 0 capacitor c=0.18e-15
xinv_199 (OUT_199 whatevs_199 vdd vss PBulkLine NBulkLine) inverter
//cCap199 OUT_199 0 capacitor c=0.18e-15
xinv_200 (OUT_200 whatevs_200 vdd vss PBulkLine NBulkLine) inverter
//cCap200 OUT_200 0 capacitor c=0.18e-15
xinv_201 (OUT_201 whatevs_201 vdd vss PBulkLine NBulkLine) inverter
//cCap201 OUT_201 0 capacitor c=0.18e-15
xinv_202 (OUT_202 whatevs_202 vdd vss PBulkLine NBulkLine) inverter
//cCap202 OUT_202 0 capacitor c=0.18e-15
xinv_203 (OUT_203 whatevs_203 vdd vss PBulkLine NBulkLine) inverter
//cCap203 OUT_203 0 capacitor c=0.18e-15
xinv_204 (OUT_204 whatevs_204 vdd vss PBulkLine NBulkLine) inverter
//cCap204 OUT_204 0 capacitor c=0.18e-15
xinv_205 (OUT_205 whatevs_205 vdd vss PBulkLine NBulkLine) inverter
//cCap205 OUT_205 0 capacitor c=0.18e-15
xinv_206 (OUT_206 whatevs_206 vdd vss PBulkLine NBulkLine) inverter
//cCap206 OUT_206 0 capacitor c=0.18e-15
xinv_207 (OUT_207 whatevs_207 vdd vss PBulkLine NBulkLine) inverter
//cCap207 OUT_207 0 capacitor c=0.18e-15
xinv_208 (OUT_208 whatevs_208 vdd vss PBulkLine NBulkLine) inverter
//cCap208 OUT_208 0 capacitor c=0.18e-15
xinv_209 (OUT_209 whatevs_209 vdd vss PBulkLine NBulkLine) inverter
//cCap209 OUT_209 0 capacitor c=0.18e-15
xinv_210 (OUT_210 whatevs_210 vdd vss PBulkLine NBulkLine) inverter
//cCap210 OUT_210 0 capacitor c=0.18e-15
xinv_211 (OUT_211 whatevs_211 vdd vss PBulkLine NBulkLine) inverter
//cCap211 OUT_211 0 capacitor c=0.18e-15
xinv_212 (OUT_212 whatevs_212 vdd vss PBulkLine NBulkLine) inverter
//cCap212 OUT_212 0 capacitor c=0.18e-15
xinv_213 (OUT_213 whatevs_213 vdd vss PBulkLine NBulkLine) inverter
//cCap213 OUT_213 0 capacitor c=0.18e-15
xinv_214 (OUT_214 whatevs_214 vdd vss PBulkLine NBulkLine) inverter
//cCap214 OUT_214 0 capacitor c=0.18e-15
xinv_215 (OUT_215 whatevs_215 vdd vss PBulkLine NBulkLine) inverter
//cCap215 OUT_215 0 capacitor c=0.18e-15
xinv_216 (OUT_216 whatevs_216 vdd vss PBulkLine NBulkLine) inverter
//cCap216 OUT_216 0 capacitor c=0.18e-15
xinv_217 (OUT_217 whatevs_217 vdd vss PBulkLine NBulkLine) inverter
//cCap217 OUT_217 0 capacitor c=0.18e-15
xinv_218 (OUT_218 whatevs_218 vdd vss PBulkLine NBulkLine) inverter
//cCap218 OUT_218 0 capacitor c=0.18e-15
xinv_219 (OUT_219 whatevs_219 vdd vss PBulkLine NBulkLine) inverter
//cCap219 OUT_219 0 capacitor c=0.18e-15
xinv_220 (OUT_220 whatevs_220 vdd vss PBulkLine NBulkLine) inverter
//cCap220 OUT_220 0 capacitor c=0.18e-15
xinv_221 (OUT_221 whatevs_221 vdd vss PBulkLine NBulkLine) inverter
//cCap221 OUT_221 0 capacitor c=0.18e-15
xinv_222 (OUT_222 whatevs_222 vdd vss PBulkLine NBulkLine) inverter
//cCap222 OUT_222 0 capacitor c=0.18e-15
xinv_223 (OUT_223 whatevs_223 vdd vss PBulkLine NBulkLine) inverter
//cCap223 OUT_223 0 capacitor c=0.18e-15
xinv_224 (OUT_224 whatevs_224 vdd vss PBulkLine NBulkLine) inverter
//cCap224 OUT_224 0 capacitor c=0.18e-15
xinv_225 (OUT_225 whatevs_225 vdd vss PBulkLine NBulkLine) inverter
//cCap225 OUT_225 0 capacitor c=0.18e-15
xinv_226 (OUT_226 whatevs_226 vdd vss PBulkLine NBulkLine) inverter
//cCap226 OUT_226 0 capacitor c=0.18e-15
xinv_227 (OUT_227 whatevs_227 vdd vss PBulkLine NBulkLine) inverter
//cCap227 OUT_227 0 capacitor c=0.18e-15
xinv_228 (OUT_228 whatevs_228 vdd vss PBulkLine NBulkLine) inverter
//cCap228 OUT_228 0 capacitor c=0.18e-15
xinv_229 (OUT_229 whatevs_229 vdd vss PBulkLine NBulkLine) inverter
//cCap229 OUT_229 0 capacitor c=0.18e-15
xinv_230 (OUT_230 whatevs_230 vdd vss PBulkLine NBulkLine) inverter
//cCap230 OUT_230 0 capacitor c=0.18e-15
xinv_231 (OUT_231 whatevs_231 vdd vss PBulkLine NBulkLine) inverter
//cCap231 OUT_231 0 capacitor c=0.18e-15
xinv_232 (OUT_232 whatevs_232 vdd vss PBulkLine NBulkLine) inverter
//cCap232 OUT_232 0 capacitor c=0.18e-15
xinv_233 (OUT_233 whatevs_233 vdd vss PBulkLine NBulkLine) inverter
//cCap233 OUT_233 0 capacitor c=0.18e-15
xinv_234 (OUT_234 whatevs_234 vdd vss PBulkLine NBulkLine) inverter
//cCap234 OUT_234 0 capacitor c=0.18e-15
xinv_235 (OUT_235 whatevs_235 vdd vss PBulkLine NBulkLine) inverter
//cCap235 OUT_235 0 capacitor c=0.18e-15
xinv_236 (OUT_236 whatevs_236 vdd vss PBulkLine NBulkLine) inverter
//cCap236 OUT_236 0 capacitor c=0.18e-15
xinv_237 (OUT_237 whatevs_237 vdd vss PBulkLine NBulkLine) inverter
//cCap237 OUT_237 0 capacitor c=0.18e-15
xinv_238 (OUT_238 whatevs_238 vdd vss PBulkLine NBulkLine) inverter
//cCap238 OUT_238 0 capacitor c=0.18e-15
xinv_239 (OUT_239 whatevs_239 vdd vss PBulkLine NBulkLine) inverter
//cCap239 OUT_239 0 capacitor c=0.18e-15
xinv_240 (OUT_240 whatevs_240 vdd vss PBulkLine NBulkLine) inverter
//cCap240 OUT_240 0 capacitor c=0.18e-15
xinv_241 (OUT_241 whatevs_241 vdd vss PBulkLine NBulkLine) inverter
//cCap241 OUT_241 0 capacitor c=0.18e-15
xinv_242 (OUT_242 whatevs_242 vdd vss PBulkLine NBulkLine) inverter
//cCap242 OUT_242 0 capacitor c=0.18e-15
xinv_243 (OUT_243 whatevs_243 vdd vss PBulkLine NBulkLine) inverter
//cCap243 OUT_243 0 capacitor c=0.18e-15
xinv_244 (OUT_244 whatevs_244 vdd vss PBulkLine NBulkLine) inverter
//cCap244 OUT_244 0 capacitor c=0.18e-15
xinv_245 (OUT_245 whatevs_245 vdd vss PBulkLine NBulkLine) inverter
//cCap245 OUT_245 0 capacitor c=0.18e-15
xinv_246 (OUT_246 whatevs_246 vdd vss PBulkLine NBulkLine) inverter
//cCap246 OUT_246 0 capacitor c=0.18e-15
xinv_247 (OUT_247 whatevs_247 vdd vss PBulkLine NBulkLine) inverter
//cCap247 OUT_247 0 capacitor c=0.18e-15
xinv_248 (OUT_248 whatevs_248 vdd vss PBulkLine NBulkLine) inverter
//cCap248 OUT_248 0 capacitor c=0.18e-15
xinv_249 (OUT_249 whatevs_249 vdd vss PBulkLine NBulkLine) inverter
//cCap249 OUT_249 0 capacitor c=0.18e-15
xinv_250 (OUT_250 whatevs_250 vdd vss PBulkLine NBulkLine) inverter
//cCap250 OUT_250 0 capacitor c=0.18e-15
xinv_251 (OUT_251 whatevs_251 vdd vss PBulkLine NBulkLine) inverter
//cCap251 OUT_251 0 capacitor c=0.18e-15
xinv_252 (OUT_252 whatevs_252 vdd vss PBulkLine NBulkLine) inverter
//cCap252 OUT_252 0 capacitor c=0.18e-15
xinv_253 (OUT_253 whatevs_253 vdd vss PBulkLine NBulkLine) inverter
//cCap253 OUT_253 0 capacitor c=0.18e-15
xinv_254 (OUT_254 whatevs_254 vdd vss PBulkLine NBulkLine) inverter
//cCap254 OUT_254 0 capacitor c=0.18e-15
xinv_255 (OUT_255 whatevs_255 vdd vss PBulkLine NBulkLine) inverter
//cCap255 OUT_255 0 capacitor c=0.18e-15
xinv_256 (OUT_256 whatevs_256 vdd vss PBulkLine NBulkLine) inverter
//cCap256 OUT_256 0 capacitor c=0.18e-15
xinv_257 (OUT_257 whatevs_257 vdd vss PBulkLine NBulkLine) inverter
//cCap257 OUT_257 0 capacitor c=0.18e-15
xinv_258 (OUT_258 whatevs_258 vdd vss PBulkLine NBulkLine) inverter
//cCap258 OUT_258 0 capacitor c=0.18e-15
xinv_259 (OUT_259 whatevs_259 vdd vss PBulkLine NBulkLine) inverter
//cCap259 OUT_259 0 capacitor c=0.18e-15
xinv_260 (OUT_260 whatevs_260 vdd vss PBulkLine NBulkLine) inverter
//cCap260 OUT_260 0 capacitor c=0.18e-15
xinv_261 (OUT_261 whatevs_261 vdd vss PBulkLine NBulkLine) inverter
//cCap261 OUT_261 0 capacitor c=0.18e-15
xinv_262 (OUT_262 whatevs_262 vdd vss PBulkLine NBulkLine) inverter
//cCap262 OUT_262 0 capacitor c=0.18e-15
xinv_263 (OUT_263 whatevs_263 vdd vss PBulkLine NBulkLine) inverter
//cCap263 OUT_263 0 capacitor c=0.18e-15
xinv_264 (OUT_264 whatevs_264 vdd vss PBulkLine NBulkLine) inverter
//cCap264 OUT_264 0 capacitor c=0.18e-15
xinv_265 (OUT_265 whatevs_265 vdd vss PBulkLine NBulkLine) inverter
//cCap265 OUT_265 0 capacitor c=0.18e-15
xinv_266 (OUT_266 whatevs_266 vdd vss PBulkLine NBulkLine) inverter
//cCap266 OUT_266 0 capacitor c=0.18e-15
xinv_267 (OUT_267 whatevs_267 vdd vss PBulkLine NBulkLine) inverter
//cCap267 OUT_267 0 capacitor c=0.18e-15
xinv_268 (OUT_268 whatevs_268 vdd vss PBulkLine NBulkLine) inverter
//cCap268 OUT_268 0 capacitor c=0.18e-15
xinv_269 (OUT_269 whatevs_269 vdd vss PBulkLine NBulkLine) inverter
//cCap269 OUT_269 0 capacitor c=0.18e-15
xinv_270 (OUT_270 whatevs_270 vdd vss PBulkLine NBulkLine) inverter
//cCap270 OUT_270 0 capacitor c=0.18e-15
xinv_271 (OUT_271 whatevs_271 vdd vss PBulkLine NBulkLine) inverter
//cCap271 OUT_271 0 capacitor c=0.18e-15
xinv_272 (OUT_272 whatevs_272 vdd vss PBulkLine NBulkLine) inverter
//cCap272 OUT_272 0 capacitor c=0.18e-15
xinv_273 (OUT_273 whatevs_273 vdd vss PBulkLine NBulkLine) inverter
//cCap273 OUT_273 0 capacitor c=0.18e-15
xinv_274 (OUT_274 whatevs_274 vdd vss PBulkLine NBulkLine) inverter
//cCap274 OUT_274 0 capacitor c=0.18e-15
xinv_275 (OUT_275 whatevs_275 vdd vss PBulkLine NBulkLine) inverter
//cCap275 OUT_275 0 capacitor c=0.18e-15
xinv_276 (OUT_276 whatevs_276 vdd vss PBulkLine NBulkLine) inverter
//cCap276 OUT_276 0 capacitor c=0.18e-15
xinv_277 (OUT_277 whatevs_277 vdd vss PBulkLine NBulkLine) inverter
//cCap277 OUT_277 0 capacitor c=0.18e-15
xinv_278 (OUT_278 whatevs_278 vdd vss PBulkLine NBulkLine) inverter
//cCap278 OUT_278 0 capacitor c=0.18e-15
xinv_279 (OUT_279 whatevs_279 vdd vss PBulkLine NBulkLine) inverter
//cCap279 OUT_279 0 capacitor c=0.18e-15
xinv_280 (OUT_280 whatevs_280 vdd vss PBulkLine NBulkLine) inverter
//cCap280 OUT_280 0 capacitor c=0.18e-15
xinv_281 (OUT_281 whatevs_281 vdd vss PBulkLine NBulkLine) inverter
//cCap281 OUT_281 0 capacitor c=0.18e-15
xinv_282 (OUT_282 whatevs_282 vdd vss PBulkLine NBulkLine) inverter
//cCap282 OUT_282 0 capacitor c=0.18e-15
xinv_283 (OUT_283 whatevs_283 vdd vss PBulkLine NBulkLine) inverter
//cCap283 OUT_283 0 capacitor c=0.18e-15
xinv_284 (OUT_284 whatevs_284 vdd vss PBulkLine NBulkLine) inverter
//cCap284 OUT_284 0 capacitor c=0.18e-15
xinv_285 (OUT_285 whatevs_285 vdd vss PBulkLine NBulkLine) inverter
//cCap285 OUT_285 0 capacitor c=0.18e-15
xinv_286 (OUT_286 whatevs_286 vdd vss PBulkLine NBulkLine) inverter
//cCap286 OUT_286 0 capacitor c=0.18e-15
xinv_287 (OUT_287 whatevs_287 vdd vss PBulkLine NBulkLine) inverter
//cCap287 OUT_287 0 capacitor c=0.18e-15
xinv_288 (OUT_288 whatevs_288 vdd vss PBulkLine NBulkLine) inverter
//cCap288 OUT_288 0 capacitor c=0.18e-15
xinv_289 (OUT_289 whatevs_289 vdd vss PBulkLine NBulkLine) inverter
//cCap289 OUT_289 0 capacitor c=0.18e-15
xinv_290 (OUT_290 whatevs_290 vdd vss PBulkLine NBulkLine) inverter
//cCap290 OUT_290 0 capacitor c=0.18e-15
xinv_291 (OUT_291 whatevs_291 vdd vss PBulkLine NBulkLine) inverter
//cCap291 OUT_291 0 capacitor c=0.18e-15
xinv_292 (OUT_292 whatevs_292 vdd vss PBulkLine NBulkLine) inverter
//cCap292 OUT_292 0 capacitor c=0.18e-15
xinv_293 (OUT_293 whatevs_293 vdd vss PBulkLine NBulkLine) inverter
//cCap293 OUT_293 0 capacitor c=0.18e-15
xinv_294 (OUT_294 whatevs_294 vdd vss PBulkLine NBulkLine) inverter
//cCap294 OUT_294 0 capacitor c=0.18e-15
xinv_295 (OUT_295 whatevs_295 vdd vss PBulkLine NBulkLine) inverter
//cCap295 OUT_295 0 capacitor c=0.18e-15
xinv_296 (OUT_296 whatevs_296 vdd vss PBulkLine NBulkLine) inverter
//cCap296 OUT_296 0 capacitor c=0.18e-15
xinv_297 (OUT_297 whatevs_297 vdd vss PBulkLine NBulkLine) inverter
//cCap297 OUT_297 0 capacitor c=0.18e-15
xinv_298 (OUT_298 whatevs_298 vdd vss PBulkLine NBulkLine) inverter
//cCap298 OUT_298 0 capacitor c=0.18e-15
xinv_299 (OUT_299 whatevs_299 vdd vss PBulkLine NBulkLine) inverter
//cCap299 OUT_299 0 capacitor c=0.18e-15
xinv_300 (OUT_300 whatevs_300 vdd vss PBulkLine NBulkLine) inverter
//cCap300 OUT_300 0 capacitor c=0.18e-15
xinv_301 (OUT_301 whatevs_301 vdd vss PBulkLine NBulkLine) inverter
//cCap301 OUT_301 0 capacitor c=0.18e-15
xinv_302 (OUT_302 whatevs_302 vdd vss PBulkLine NBulkLine) inverter
//cCap302 OUT_302 0 capacitor c=0.18e-15
xinv_303 (OUT_303 whatevs_303 vdd vss PBulkLine NBulkLine) inverter
//cCap303 OUT_303 0 capacitor c=0.18e-15
xinv_304 (OUT_304 whatevs_304 vdd vss PBulkLine NBulkLine) inverter
//cCap304 OUT_304 0 capacitor c=0.18e-15
xinv_305 (OUT_305 whatevs_305 vdd vss PBulkLine NBulkLine) inverter
//cCap305 OUT_305 0 capacitor c=0.18e-15
xinv_306 (OUT_306 whatevs_306 vdd vss PBulkLine NBulkLine) inverter
//cCap306 OUT_306 0 capacitor c=0.18e-15
xinv_307 (OUT_307 whatevs_307 vdd vss PBulkLine NBulkLine) inverter
//cCap307 OUT_307 0 capacitor c=0.18e-15
xinv_308 (OUT_308 whatevs_308 vdd vss PBulkLine NBulkLine) inverter
//cCap308 OUT_308 0 capacitor c=0.18e-15
xinv_309 (OUT_309 whatevs_309 vdd vss PBulkLine NBulkLine) inverter
//cCap309 OUT_309 0 capacitor c=0.18e-15
xinv_310 (OUT_310 whatevs_310 vdd vss PBulkLine NBulkLine) inverter
//cCap310 OUT_310 0 capacitor c=0.18e-15
xinv_311 (OUT_311 whatevs_311 vdd vss PBulkLine NBulkLine) inverter
//cCap311 OUT_311 0 capacitor c=0.18e-15
xinv_312 (OUT_312 whatevs_312 vdd vss PBulkLine NBulkLine) inverter
//cCap312 OUT_312 0 capacitor c=0.18e-15
xinv_313 (OUT_313 whatevs_313 vdd vss PBulkLine NBulkLine) inverter
//cCap313 OUT_313 0 capacitor c=0.18e-15
xinv_314 (OUT_314 whatevs_314 vdd vss PBulkLine NBulkLine) inverter
//cCap314 OUT_314 0 capacitor c=0.18e-15
xinv_315 (OUT_315 whatevs_315 vdd vss PBulkLine NBulkLine) inverter
//cCap315 OUT_315 0 capacitor c=0.18e-15
xinv_316 (OUT_316 whatevs_316 vdd vss PBulkLine NBulkLine) inverter
//cCap316 OUT_316 0 capacitor c=0.18e-15
xinv_317 (OUT_317 whatevs_317 vdd vss PBulkLine NBulkLine) inverter
//cCap317 OUT_317 0 capacitor c=0.18e-15
xinv_318 (OUT_318 whatevs_318 vdd vss PBulkLine NBulkLine) inverter
//cCap318 OUT_318 0 capacitor c=0.18e-15
xinv_319 (OUT_319 whatevs_319 vdd vss PBulkLine NBulkLine) inverter
//cCap319 OUT_319 0 capacitor c=0.18e-15
xinv_320 (OUT_320 whatevs_320 vdd vss PBulkLine NBulkLine) inverter
//cCap320 OUT_320 0 capacitor c=0.18e-15
xinv_321 (OUT_321 whatevs_321 vdd vss PBulkLine NBulkLine) inverter
//cCap321 OUT_321 0 capacitor c=0.18e-15
xinv_322 (OUT_322 whatevs_322 vdd vss PBulkLine NBulkLine) inverter
//cCap322 OUT_322 0 capacitor c=0.18e-15
xinv_323 (OUT_323 whatevs_323 vdd vss PBulkLine NBulkLine) inverter
//cCap323 OUT_323 0 capacitor c=0.18e-15
xinv_324 (OUT_324 whatevs_324 vdd vss PBulkLine NBulkLine) inverter
//cCap324 OUT_324 0 capacitor c=0.18e-15
xinv_325 (OUT_325 whatevs_325 vdd vss PBulkLine NBulkLine) inverter
//cCap325 OUT_325 0 capacitor c=0.18e-15
xinv_326 (OUT_326 whatevs_326 vdd vss PBulkLine NBulkLine) inverter
//cCap326 OUT_326 0 capacitor c=0.18e-15
xinv_327 (OUT_327 whatevs_327 vdd vss PBulkLine NBulkLine) inverter
//cCap327 OUT_327 0 capacitor c=0.18e-15
xinv_328 (OUT_328 whatevs_328 vdd vss PBulkLine NBulkLine) inverter
//cCap328 OUT_328 0 capacitor c=0.18e-15
xinv_329 (OUT_329 whatevs_329 vdd vss PBulkLine NBulkLine) inverter
//cCap329 OUT_329 0 capacitor c=0.18e-15
xinv_330 (OUT_330 whatevs_330 vdd vss PBulkLine NBulkLine) inverter
//cCap330 OUT_330 0 capacitor c=0.18e-15
xinv_331 (OUT_331 whatevs_331 vdd vss PBulkLine NBulkLine) inverter
//cCap331 OUT_331 0 capacitor c=0.18e-15
xinv_332 (OUT_332 whatevs_332 vdd vss PBulkLine NBulkLine) inverter
//cCap332 OUT_332 0 capacitor c=0.18e-15
xinv_333 (OUT_333 whatevs_333 vdd vss PBulkLine NBulkLine) inverter
//cCap333 OUT_333 0 capacitor c=0.18e-15
xinv_334 (OUT_334 whatevs_334 vdd vss PBulkLine NBulkLine) inverter
//cCap334 OUT_334 0 capacitor c=0.18e-15
xinv_335 (OUT_335 whatevs_335 vdd vss PBulkLine NBulkLine) inverter
//cCap335 OUT_335 0 capacitor c=0.18e-15
xinv_336 (OUT_336 whatevs_336 vdd vss PBulkLine NBulkLine) inverter
//cCap336 OUT_336 0 capacitor c=0.18e-15
xinv_337 (OUT_337 whatevs_337 vdd vss PBulkLine NBulkLine) inverter
//cCap337 OUT_337 0 capacitor c=0.18e-15
xinv_338 (OUT_338 whatevs_338 vdd vss PBulkLine NBulkLine) inverter
//cCap338 OUT_338 0 capacitor c=0.18e-15
xinv_339 (OUT_339 whatevs_339 vdd vss PBulkLine NBulkLine) inverter
//cCap339 OUT_339 0 capacitor c=0.18e-15
xinv_340 (OUT_340 whatevs_340 vdd vss PBulkLine NBulkLine) inverter
//cCap340 OUT_340 0 capacitor c=0.18e-15
xinv_341 (OUT_341 whatevs_341 vdd vss PBulkLine NBulkLine) inverter
//cCap341 OUT_341 0 capacitor c=0.18e-15
xinv_342 (OUT_342 whatevs_342 vdd vss PBulkLine NBulkLine) inverter
//cCap342 OUT_342 0 capacitor c=0.18e-15
xinv_343 (OUT_343 whatevs_343 vdd vss PBulkLine NBulkLine) inverter
//cCap343 OUT_343 0 capacitor c=0.18e-15
xinv_344 (OUT_344 whatevs_344 vdd vss PBulkLine NBulkLine) inverter
//cCap344 OUT_344 0 capacitor c=0.18e-15
xinv_345 (OUT_345 whatevs_345 vdd vss PBulkLine NBulkLine) inverter
//cCap345 OUT_345 0 capacitor c=0.18e-15
xinv_346 (OUT_346 whatevs_346 vdd vss PBulkLine NBulkLine) inverter
//cCap346 OUT_346 0 capacitor c=0.18e-15
xinv_347 (OUT_347 whatevs_347 vdd vss PBulkLine NBulkLine) inverter
//cCap347 OUT_347 0 capacitor c=0.18e-15
xinv_348 (OUT_348 whatevs_348 vdd vss PBulkLine NBulkLine) inverter
//cCap348 OUT_348 0 capacitor c=0.18e-15
xinv_349 (OUT_349 whatevs_349 vdd vss PBulkLine NBulkLine) inverter
//cCap349 OUT_349 0 capacitor c=0.18e-15
xinv_350 (OUT_350 whatevs_350 vdd vss PBulkLine NBulkLine) inverter
//cCap350 OUT_350 0 capacitor c=0.18e-15
xinv_351 (OUT_351 whatevs_351 vdd vss PBulkLine NBulkLine) inverter
//cCap351 OUT_351 0 capacitor c=0.18e-15
xinv_352 (OUT_352 whatevs_352 vdd vss PBulkLine NBulkLine) inverter
//cCap352 OUT_352 0 capacitor c=0.18e-15
xinv_353 (OUT_353 whatevs_353 vdd vss PBulkLine NBulkLine) inverter
//cCap353 OUT_353 0 capacitor c=0.18e-15
xinv_354 (OUT_354 whatevs_354 vdd vss PBulkLine NBulkLine) inverter
//cCap354 OUT_354 0 capacitor c=0.18e-15
xinv_355 (OUT_355 whatevs_355 vdd vss PBulkLine NBulkLine) inverter
//cCap355 OUT_355 0 capacitor c=0.18e-15
xinv_356 (OUT_356 whatevs_356 vdd vss PBulkLine NBulkLine) inverter
//cCap356 OUT_356 0 capacitor c=0.18e-15
xinv_357 (OUT_357 whatevs_357 vdd vss PBulkLine NBulkLine) inverter
//cCap357 OUT_357 0 capacitor c=0.18e-15
xinv_358 (OUT_358 whatevs_358 vdd vss PBulkLine NBulkLine) inverter
//cCap358 OUT_358 0 capacitor c=0.18e-15
xinv_359 (OUT_359 whatevs_359 vdd vss PBulkLine NBulkLine) inverter
//cCap359 OUT_359 0 capacitor c=0.18e-15
xinv_360 (OUT_360 whatevs_360 vdd vss PBulkLine NBulkLine) inverter
//cCap360 OUT_360 0 capacitor c=0.18e-15
xinv_361 (OUT_361 whatevs_361 vdd vss PBulkLine NBulkLine) inverter
//cCap361 OUT_361 0 capacitor c=0.18e-15
xinv_362 (OUT_362 whatevs_362 vdd vss PBulkLine NBulkLine) inverter
//cCap362 OUT_362 0 capacitor c=0.18e-15
xinv_363 (OUT_363 whatevs_363 vdd vss PBulkLine NBulkLine) inverter
//cCap363 OUT_363 0 capacitor c=0.18e-15
xinv_364 (OUT_364 whatevs_364 vdd vss PBulkLine NBulkLine) inverter
//cCap364 OUT_364 0 capacitor c=0.18e-15
xinv_365 (OUT_365 whatevs_365 vdd vss PBulkLine NBulkLine) inverter
//cCap365 OUT_365 0 capacitor c=0.18e-15
xinv_366 (OUT_366 whatevs_366 vdd vss PBulkLine NBulkLine) inverter
//cCap366 OUT_366 0 capacitor c=0.18e-15
xinv_367 (OUT_367 whatevs_367 vdd vss PBulkLine NBulkLine) inverter
//cCap367 OUT_367 0 capacitor c=0.18e-15
xinv_368 (OUT_368 whatevs_368 vdd vss PBulkLine NBulkLine) inverter
//cCap368 OUT_368 0 capacitor c=0.18e-15
xinv_369 (OUT_369 whatevs_369 vdd vss PBulkLine NBulkLine) inverter
//cCap369 OUT_369 0 capacitor c=0.18e-15
xinv_370 (OUT_370 whatevs_370 vdd vss PBulkLine NBulkLine) inverter
//cCap370 OUT_370 0 capacitor c=0.18e-15
xinv_371 (OUT_371 whatevs_371 vdd vss PBulkLine NBulkLine) inverter
//cCap371 OUT_371 0 capacitor c=0.18e-15
xinv_372 (OUT_372 whatevs_372 vdd vss PBulkLine NBulkLine) inverter
//cCap372 OUT_372 0 capacitor c=0.18e-15
xinv_373 (OUT_373 whatevs_373 vdd vss PBulkLine NBulkLine) inverter
//cCap373 OUT_373 0 capacitor c=0.18e-15
xinv_374 (OUT_374 whatevs_374 vdd vss PBulkLine NBulkLine) inverter
//cCap374 OUT_374 0 capacitor c=0.18e-15
xinv_375 (OUT_375 whatevs_375 vdd vss PBulkLine NBulkLine) inverter
//cCap375 OUT_375 0 capacitor c=0.18e-15
xinv_376 (OUT_376 whatevs_376 vdd vss PBulkLine NBulkLine) inverter
//cCap376 OUT_376 0 capacitor c=0.18e-15
xinv_377 (OUT_377 whatevs_377 vdd vss PBulkLine NBulkLine) inverter
//cCap377 OUT_377 0 capacitor c=0.18e-15
xinv_378 (OUT_378 whatevs_378 vdd vss PBulkLine NBulkLine) inverter
//cCap378 OUT_378 0 capacitor c=0.18e-15
xinv_379 (OUT_379 whatevs_379 vdd vss PBulkLine NBulkLine) inverter
//cCap379 OUT_379 0 capacitor c=0.18e-15
xinv_380 (OUT_380 whatevs_380 vdd vss PBulkLine NBulkLine) inverter
//cCap380 OUT_380 0 capacitor c=0.18e-15
xinv_381 (OUT_381 whatevs_381 vdd vss PBulkLine NBulkLine) inverter
//cCap381 OUT_381 0 capacitor c=0.18e-15
xinv_382 (OUT_382 whatevs_382 vdd vss PBulkLine NBulkLine) inverter
//cCap382 OUT_382 0 capacitor c=0.18e-15
xinv_383 (OUT_383 whatevs_383 vdd vss PBulkLine NBulkLine) inverter
//cCap383 OUT_383 0 capacitor c=0.18e-15
xinv_384 (OUT_384 whatevs_384 vdd vss PBulkLine NBulkLine) inverter
//cCap384 OUT_384 0 capacitor c=0.18e-15
xinv_385 (OUT_385 whatevs_385 vdd vss PBulkLine NBulkLine) inverter
//cCap385 OUT_385 0 capacitor c=0.18e-15
xinv_386 (OUT_386 whatevs_386 vdd vss PBulkLine NBulkLine) inverter
//cCap386 OUT_386 0 capacitor c=0.18e-15
xinv_387 (OUT_387 whatevs_387 vdd vss PBulkLine NBulkLine) inverter
//cCap387 OUT_387 0 capacitor c=0.18e-15
xinv_388 (OUT_388 whatevs_388 vdd vss PBulkLine NBulkLine) inverter
//cCap388 OUT_388 0 capacitor c=0.18e-15
xinv_389 (OUT_389 whatevs_389 vdd vss PBulkLine NBulkLine) inverter
//cCap389 OUT_389 0 capacitor c=0.18e-15
xinv_390 (OUT_390 whatevs_390 vdd vss PBulkLine NBulkLine) inverter
//cCap390 OUT_390 0 capacitor c=0.18e-15
xinv_391 (OUT_391 whatevs_391 vdd vss PBulkLine NBulkLine) inverter
//cCap391 OUT_391 0 capacitor c=0.18e-15
xinv_392 (OUT_392 whatevs_392 vdd vss PBulkLine NBulkLine) inverter
//cCap392 OUT_392 0 capacitor c=0.18e-15
xinv_393 (OUT_393 whatevs_393 vdd vss PBulkLine NBulkLine) inverter
//cCap393 OUT_393 0 capacitor c=0.18e-15
xinv_394 (OUT_394 whatevs_394 vdd vss PBulkLine NBulkLine) inverter
//cCap394 OUT_394 0 capacitor c=0.18e-15
xinv_395 (OUT_395 whatevs_395 vdd vss PBulkLine NBulkLine) inverter
//cCap395 OUT_395 0 capacitor c=0.18e-15
xinv_396 (OUT_396 whatevs_396 vdd vss PBulkLine NBulkLine) inverter
//cCap396 OUT_396 0 capacitor c=0.18e-15
xinv_397 (OUT_397 whatevs_397 vdd vss PBulkLine NBulkLine) inverter
//cCap397 OUT_397 0 capacitor c=0.18e-15
xinv_398 (OUT_398 whatevs_398 vdd vss PBulkLine NBulkLine) inverter
//cCap398 OUT_398 0 capacitor c=0.18e-15
xinv_399 (OUT_399 whatevs_399 vdd vss PBulkLine NBulkLine) inverter
//cCap399 OUT_399 0 capacitor c=0.18e-15
xinv_400 (OUT_400 whatevs_400 vdd vss PBulkLine NBulkLine) inverter
//cCap400 OUT_400 0 capacitor c=0.18e-15
xinv_401 (OUT_401 whatevs_401 vdd vss PBulkLine NBulkLine) inverter
//cCap401 OUT_401 0 capacitor c=0.18e-15
xinv_402 (OUT_402 whatevs_402 vdd vss PBulkLine NBulkLine) inverter
//cCap402 OUT_402 0 capacitor c=0.18e-15
xinv_403 (OUT_403 whatevs_403 vdd vss PBulkLine NBulkLine) inverter
//cCap403 OUT_403 0 capacitor c=0.18e-15
xinv_404 (OUT_404 whatevs_404 vdd vss PBulkLine NBulkLine) inverter
//cCap404 OUT_404 0 capacitor c=0.18e-15
xinv_405 (OUT_405 whatevs_405 vdd vss PBulkLine NBulkLine) inverter
//cCap405 OUT_405 0 capacitor c=0.18e-15
xinv_406 (OUT_406 whatevs_406 vdd vss PBulkLine NBulkLine) inverter
//cCap406 OUT_406 0 capacitor c=0.18e-15
xinv_407 (OUT_407 whatevs_407 vdd vss PBulkLine NBulkLine) inverter
//cCap407 OUT_407 0 capacitor c=0.18e-15
xinv_408 (OUT_408 whatevs_408 vdd vss PBulkLine NBulkLine) inverter
//cCap408 OUT_408 0 capacitor c=0.18e-15
xinv_409 (OUT_409 whatevs_409 vdd vss PBulkLine NBulkLine) inverter
//cCap409 OUT_409 0 capacitor c=0.18e-15
xinv_410 (OUT_410 whatevs_410 vdd vss PBulkLine NBulkLine) inverter
//cCap410 OUT_410 0 capacitor c=0.18e-15
xinv_411 (OUT_411 whatevs_411 vdd vss PBulkLine NBulkLine) inverter
//cCap411 OUT_411 0 capacitor c=0.18e-15
xinv_412 (OUT_412 whatevs_412 vdd vss PBulkLine NBulkLine) inverter
//cCap412 OUT_412 0 capacitor c=0.18e-15
xinv_413 (OUT_413 whatevs_413 vdd vss PBulkLine NBulkLine) inverter
//cCap413 OUT_413 0 capacitor c=0.18e-15
xinv_414 (OUT_414 whatevs_414 vdd vss PBulkLine NBulkLine) inverter
//cCap414 OUT_414 0 capacitor c=0.18e-15
xinv_415 (OUT_415 whatevs_415 vdd vss PBulkLine NBulkLine) inverter
//cCap415 OUT_415 0 capacitor c=0.18e-15
xinv_416 (OUT_416 whatevs_416 vdd vss PBulkLine NBulkLine) inverter
//cCap416 OUT_416 0 capacitor c=0.18e-15
xinv_417 (OUT_417 whatevs_417 vdd vss PBulkLine NBulkLine) inverter
//cCap417 OUT_417 0 capacitor c=0.18e-15
xinv_418 (OUT_418 whatevs_418 vdd vss PBulkLine NBulkLine) inverter
//cCap418 OUT_418 0 capacitor c=0.18e-15
xinv_419 (OUT_419 whatevs_419 vdd vss PBulkLine NBulkLine) inverter
//cCap419 OUT_419 0 capacitor c=0.18e-15
xinv_420 (OUT_420 whatevs_420 vdd vss PBulkLine NBulkLine) inverter
//cCap420 OUT_420 0 capacitor c=0.18e-15
xinv_421 (OUT_421 whatevs_421 vdd vss PBulkLine NBulkLine) inverter
//cCap421 OUT_421 0 capacitor c=0.18e-15
xinv_422 (OUT_422 whatevs_422 vdd vss PBulkLine NBulkLine) inverter
//cCap422 OUT_422 0 capacitor c=0.18e-15
xinv_423 (OUT_423 whatevs_423 vdd vss PBulkLine NBulkLine) inverter
//cCap423 OUT_423 0 capacitor c=0.18e-15
xinv_424 (OUT_424 whatevs_424 vdd vss PBulkLine NBulkLine) inverter
//cCap424 OUT_424 0 capacitor c=0.18e-15
xinv_425 (OUT_425 whatevs_425 vdd vss PBulkLine NBulkLine) inverter
//cCap425 OUT_425 0 capacitor c=0.18e-15
xinv_426 (OUT_426 whatevs_426 vdd vss PBulkLine NBulkLine) inverter
//cCap426 OUT_426 0 capacitor c=0.18e-15
xinv_427 (OUT_427 whatevs_427 vdd vss PBulkLine NBulkLine) inverter
//cCap427 OUT_427 0 capacitor c=0.18e-15
xinv_428 (OUT_428 whatevs_428 vdd vss PBulkLine NBulkLine) inverter
//cCap428 OUT_428 0 capacitor c=0.18e-15
xinv_429 (OUT_429 whatevs_429 vdd vss PBulkLine NBulkLine) inverter
//cCap429 OUT_429 0 capacitor c=0.18e-15
xinv_430 (OUT_430 whatevs_430 vdd vss PBulkLine NBulkLine) inverter
//cCap430 OUT_430 0 capacitor c=0.18e-15
xinv_431 (OUT_431 whatevs_431 vdd vss PBulkLine NBulkLine) inverter
//cCap431 OUT_431 0 capacitor c=0.18e-15
xinv_432 (OUT_432 whatevs_432 vdd vss PBulkLine NBulkLine) inverter
//cCap432 OUT_432 0 capacitor c=0.18e-15
xinv_433 (OUT_433 whatevs_433 vdd vss PBulkLine NBulkLine) inverter
//cCap433 OUT_433 0 capacitor c=0.18e-15
xinv_434 (OUT_434 whatevs_434 vdd vss PBulkLine NBulkLine) inverter
//cCap434 OUT_434 0 capacitor c=0.18e-15
xinv_435 (OUT_435 whatevs_435 vdd vss PBulkLine NBulkLine) inverter
//cCap435 OUT_435 0 capacitor c=0.18e-15
xinv_436 (OUT_436 whatevs_436 vdd vss PBulkLine NBulkLine) inverter
//cCap436 OUT_436 0 capacitor c=0.18e-15
xinv_437 (OUT_437 whatevs_437 vdd vss PBulkLine NBulkLine) inverter
//cCap437 OUT_437 0 capacitor c=0.18e-15
xinv_438 (OUT_438 whatevs_438 vdd vss PBulkLine NBulkLine) inverter
//cCap438 OUT_438 0 capacitor c=0.18e-15
xinv_439 (OUT_439 whatevs_439 vdd vss PBulkLine NBulkLine) inverter
//cCap439 OUT_439 0 capacitor c=0.18e-15
xinv_440 (OUT_440 whatevs_440 vdd vss PBulkLine NBulkLine) inverter
//cCap440 OUT_440 0 capacitor c=0.18e-15
xinv_441 (OUT_441 whatevs_441 vdd vss PBulkLine NBulkLine) inverter
//cCap441 OUT_441 0 capacitor c=0.18e-15
xinv_442 (OUT_442 whatevs_442 vdd vss PBulkLine NBulkLine) inverter
//cCap442 OUT_442 0 capacitor c=0.18e-15
xinv_443 (OUT_443 whatevs_443 vdd vss PBulkLine NBulkLine) inverter
//cCap443 OUT_443 0 capacitor c=0.18e-15
xinv_444 (OUT_444 whatevs_444 vdd vss PBulkLine NBulkLine) inverter
//cCap444 OUT_444 0 capacitor c=0.18e-15
xinv_445 (OUT_445 whatevs_445 vdd vss PBulkLine NBulkLine) inverter
//cCap445 OUT_445 0 capacitor c=0.18e-15
xinv_446 (OUT_446 whatevs_446 vdd vss PBulkLine NBulkLine) inverter
//cCap446 OUT_446 0 capacitor c=0.18e-15
xinv_447 (OUT_447 whatevs_447 vdd vss PBulkLine NBulkLine) inverter
//cCap447 OUT_447 0 capacitor c=0.18e-15
xinv_448 (OUT_448 whatevs_448 vdd vss PBulkLine NBulkLine) inverter
//cCap448 OUT_448 0 capacitor c=0.18e-15
xinv_449 (OUT_449 whatevs_449 vdd vss PBulkLine NBulkLine) inverter
//cCap449 OUT_449 0 capacitor c=0.18e-15
xinv_450 (OUT_450 whatevs_450 vdd vss PBulkLine NBulkLine) inverter
//cCap450 OUT_450 0 capacitor c=0.18e-15
xinv_451 (OUT_451 whatevs_451 vdd vss PBulkLine NBulkLine) inverter
//cCap451 OUT_451 0 capacitor c=0.18e-15
xinv_452 (OUT_452 whatevs_452 vdd vss PBulkLine NBulkLine) inverter
//cCap452 OUT_452 0 capacitor c=0.18e-15
xinv_453 (OUT_453 whatevs_453 vdd vss PBulkLine NBulkLine) inverter
//cCap453 OUT_453 0 capacitor c=0.18e-15
xinv_454 (OUT_454 whatevs_454 vdd vss PBulkLine NBulkLine) inverter
//cCap454 OUT_454 0 capacitor c=0.18e-15
xinv_455 (OUT_455 whatevs_455 vdd vss PBulkLine NBulkLine) inverter
//cCap455 OUT_455 0 capacitor c=0.18e-15
xinv_456 (OUT_456 whatevs_456 vdd vss PBulkLine NBulkLine) inverter
//cCap456 OUT_456 0 capacitor c=0.18e-15
xinv_457 (OUT_457 whatevs_457 vdd vss PBulkLine NBulkLine) inverter
//cCap457 OUT_457 0 capacitor c=0.18e-15
xinv_458 (OUT_458 whatevs_458 vdd vss PBulkLine NBulkLine) inverter
//cCap458 OUT_458 0 capacitor c=0.18e-15
xinv_459 (OUT_459 whatevs_459 vdd vss PBulkLine NBulkLine) inverter
//cCap459 OUT_459 0 capacitor c=0.18e-15
xinv_460 (OUT_460 whatevs_460 vdd vss PBulkLine NBulkLine) inverter
//cCap460 OUT_460 0 capacitor c=0.18e-15
xinv_461 (OUT_461 whatevs_461 vdd vss PBulkLine NBulkLine) inverter
//cCap461 OUT_461 0 capacitor c=0.18e-15
xinv_462 (OUT_462 whatevs_462 vdd vss PBulkLine NBulkLine) inverter
//cCap462 OUT_462 0 capacitor c=0.18e-15
xinv_463 (OUT_463 whatevs_463 vdd vss PBulkLine NBulkLine) inverter
//cCap463 OUT_463 0 capacitor c=0.18e-15
xinv_464 (OUT_464 whatevs_464 vdd vss PBulkLine NBulkLine) inverter
//cCap464 OUT_464 0 capacitor c=0.18e-15
xinv_465 (OUT_465 whatevs_465 vdd vss PBulkLine NBulkLine) inverter
//cCap465 OUT_465 0 capacitor c=0.18e-15
xinv_466 (OUT_466 whatevs_466 vdd vss PBulkLine NBulkLine) inverter
//cCap466 OUT_466 0 capacitor c=0.18e-15
xinv_467 (OUT_467 whatevs_467 vdd vss PBulkLine NBulkLine) inverter
//cCap467 OUT_467 0 capacitor c=0.18e-15
xinv_468 (OUT_468 whatevs_468 vdd vss PBulkLine NBulkLine) inverter
//cCap468 OUT_468 0 capacitor c=0.18e-15
xinv_469 (OUT_469 whatevs_469 vdd vss PBulkLine NBulkLine) inverter
//cCap469 OUT_469 0 capacitor c=0.18e-15
xinv_470 (OUT_470 whatevs_470 vdd vss PBulkLine NBulkLine) inverter
//cCap470 OUT_470 0 capacitor c=0.18e-15
xinv_471 (OUT_471 whatevs_471 vdd vss PBulkLine NBulkLine) inverter
//cCap471 OUT_471 0 capacitor c=0.18e-15
xinv_472 (OUT_472 whatevs_472 vdd vss PBulkLine NBulkLine) inverter
//cCap472 OUT_472 0 capacitor c=0.18e-15
xinv_473 (OUT_473 whatevs_473 vdd vss PBulkLine NBulkLine) inverter
//cCap473 OUT_473 0 capacitor c=0.18e-15
xinv_474 (OUT_474 whatevs_474 vdd vss PBulkLine NBulkLine) inverter
//cCap474 OUT_474 0 capacitor c=0.18e-15
xinv_475 (OUT_475 whatevs_475 vdd vss PBulkLine NBulkLine) inverter
//cCap475 OUT_475 0 capacitor c=0.18e-15
xinv_476 (OUT_476 whatevs_476 vdd vss PBulkLine NBulkLine) inverter
//cCap476 OUT_476 0 capacitor c=0.18e-15
xinv_477 (OUT_477 whatevs_477 vdd vss PBulkLine NBulkLine) inverter
//cCap477 OUT_477 0 capacitor c=0.18e-15
xinv_478 (OUT_478 whatevs_478 vdd vss PBulkLine NBulkLine) inverter
//cCap478 OUT_478 0 capacitor c=0.18e-15
xinv_479 (OUT_479 whatevs_479 vdd vss PBulkLine NBulkLine) inverter
//cCap479 OUT_479 0 capacitor c=0.18e-15
xinv_480 (OUT_480 whatevs_480 vdd vss PBulkLine NBulkLine) inverter
//cCap480 OUT_480 0 capacitor c=0.18e-15
xinv_481 (OUT_481 whatevs_481 vdd vss PBulkLine NBulkLine) inverter
//cCap481 OUT_481 0 capacitor c=0.18e-15
xinv_482 (OUT_482 whatevs_482 vdd vss PBulkLine NBulkLine) inverter
//cCap482 OUT_482 0 capacitor c=0.18e-15
xinv_483 (OUT_483 whatevs_483 vdd vss PBulkLine NBulkLine) inverter
//cCap483 OUT_483 0 capacitor c=0.18e-15
xinv_484 (OUT_484 whatevs_484 vdd vss PBulkLine NBulkLine) inverter
//cCap484 OUT_484 0 capacitor c=0.18e-15
xinv_485 (OUT_485 whatevs_485 vdd vss PBulkLine NBulkLine) inverter
//cCap485 OUT_485 0 capacitor c=0.18e-15
xinv_486 (OUT_486 whatevs_486 vdd vss PBulkLine NBulkLine) inverter
//cCap486 OUT_486 0 capacitor c=0.18e-15
xinv_487 (OUT_487 whatevs_487 vdd vss PBulkLine NBulkLine) inverter
//cCap487 OUT_487 0 capacitor c=0.18e-15
xinv_488 (OUT_488 whatevs_488 vdd vss PBulkLine NBulkLine) inverter
//cCap488 OUT_488 0 capacitor c=0.18e-15
xinv_489 (OUT_489 whatevs_489 vdd vss PBulkLine NBulkLine) inverter
//cCap489 OUT_489 0 capacitor c=0.18e-15
xinv_490 (OUT_490 whatevs_490 vdd vss PBulkLine NBulkLine) inverter
//cCap490 OUT_490 0 capacitor c=0.18e-15
xinv_491 (OUT_491 whatevs_491 vdd vss PBulkLine NBulkLine) inverter
//cCap491 OUT_491 0 capacitor c=0.18e-15
xinv_492 (OUT_492 whatevs_492 vdd vss PBulkLine NBulkLine) inverter
//cCap492 OUT_492 0 capacitor c=0.18e-15
xinv_493 (OUT_493 whatevs_493 vdd vss PBulkLine NBulkLine) inverter
//cCap493 OUT_493 0 capacitor c=0.18e-15
xinv_494 (OUT_494 whatevs_494 vdd vss PBulkLine NBulkLine) inverter
//cCap494 OUT_494 0 capacitor c=0.18e-15
xinv_495 (OUT_495 whatevs_495 vdd vss PBulkLine NBulkLine) inverter
//cCap495 OUT_495 0 capacitor c=0.18e-15
xinv_496 (OUT_496 whatevs_496 vdd vss PBulkLine NBulkLine) inverter
//cCap496 OUT_496 0 capacitor c=0.18e-15
xinv_497 (OUT_497 whatevs_497 vdd vss PBulkLine NBulkLine) inverter
//cCap497 OUT_497 0 capacitor c=0.18e-15
xinv_498 (OUT_498 whatevs_498 vdd vss PBulkLine NBulkLine) inverter
//cCap498 OUT_498 0 capacitor c=0.18e-15
xinv_499 (OUT_499 whatevs_499 vdd vss PBulkLine NBulkLine) inverter
//cCap499 OUT_499 0 capacitor c=0.18e-15
xinv_500 (OUT_500 whatevs_500 vdd vss PBulkLine NBulkLine) inverter
//cCap500 OUT_500 0 capacitor c=0.18e-15
xinv_501 (OUT_501 whatevs_501 vdd vss PBulkLine NBulkLine) inverter
//cCap501 OUT_501 0 capacitor c=0.18e-15
xinv_502 (OUT_502 whatevs_502 vdd vss PBulkLine NBulkLine) inverter
//cCap502 OUT_502 0 capacitor c=0.18e-15
xinv_503 (OUT_503 whatevs_503 vdd vss PBulkLine NBulkLine) inverter
//cCap503 OUT_503 0 capacitor c=0.18e-15
xinv_504 (OUT_504 whatevs_504 vdd vss PBulkLine NBulkLine) inverter
//cCap504 OUT_504 0 capacitor c=0.18e-15
xinv_505 (OUT_505 whatevs_505 vdd vss PBulkLine NBulkLine) inverter
//cCap505 OUT_505 0 capacitor c=0.18e-15
xinv_506 (OUT_506 whatevs_506 vdd vss PBulkLine NBulkLine) inverter
//cCap506 OUT_506 0 capacitor c=0.18e-15
xinv_507 (OUT_507 whatevs_507 vdd vss PBulkLine NBulkLine) inverter
//cCap507 OUT_507 0 capacitor c=0.18e-15
xinv_508 (OUT_508 whatevs_508 vdd vss PBulkLine NBulkLine) inverter
//cCap508 OUT_508 0 capacitor c=0.18e-15
xinv_509 (OUT_509 whatevs_509 vdd vss PBulkLine NBulkLine) inverter
//cCap509 OUT_509 0 capacitor c=0.18e-15
xinv_510 (OUT_510 whatevs_510 vdd vss PBulkLine NBulkLine) inverter
//cCap510 OUT_510 0 capacitor c=0.18e-15
xinv_511 (OUT_511 whatevs_511 vdd vss PBulkLine NBulkLine) inverter
//cCap511 OUT_511 0 capacitor c=0.18e-15

Ven (enable 0) vsource type=pwl wave=waveen
//Ven (enable 0) vsource dc=1

Vin0 (IN_0 0) vsource type=pwl wave=wavein_0
Vin1 (IN_1 0) vsource type=pwl wave=wavein_1
Vin2 (IN_2 0) vsource type=pwl wave=wavein_2
Vin3 (IN_3 0) vsource type=pwl wave=wavein_3
Vin4 (IN_4 0) vsource type=pwl wave=wavein_4
Vin5 (IN_5 0) vsource type=pwl wave=wavein_5
Vin6 (IN_6 0) vsource type=pwl wave=wavein_6
Vin7 (IN_7 0) vsource type=pwl wave=wavein_7
Vin8 (IN_8 0) vsource type=pwl wave=wavein_8

save IN_0 IN_1 IN_2 IN_3 IN_4 IN_5 IN_6 IN_7 IN_8 enable OUT_0 OUT_1 OUT_2 OUT_3 OUT_4 OUT_5 OUT_6 OUT_7 OUT_8 OUT_9 OUT_10 OUT_11 OUT_12 OUT_13 OUT_14 OUT_15 OUT_16 OUT_17 OUT_18 OUT_19 OUT_20 OUT_21 OUT_22 OUT_23 OUT_24 OUT_25 OUT_26 OUT_27 OUT_28 OUT_29 OUT_30 OUT_31 OUT_32 OUT_33 OUT_34 OUT_35 OUT_36 OUT_37 OUT_38 OUT_39 OUT_40 OUT_41 OUT_42 OUT_43 OUT_44 OUT_45 OUT_46 OUT_47 OUT_48 OUT_49 OUT_50 OUT_51 OUT_52 OUT_53 OUT_54 OUT_55 OUT_56 OUT_57 OUT_58 OUT_59 OUT_60 OUT_61 OUT_62 OUT_63 OUT_64 OUT_65 OUT_66 OUT_67 OUT_68 OUT_69 OUT_70 OUT_71 OUT_72 OUT_73 OUT_74 OUT_75 OUT_76 OUT_77 OUT_78 OUT_79 OUT_80 OUT_81 OUT_82 OUT_83 OUT_84 OUT_85 OUT_86 OUT_87 OUT_88 OUT_89 OUT_90 OUT_91 OUT_92 OUT_93 OUT_94 OUT_95 OUT_96 OUT_97 OUT_98 OUT_99 OUT_100 OUT_101 OUT_102 OUT_103 OUT_104 OUT_105 OUT_106 OUT_107 OUT_108 OUT_109 OUT_110 OUT_111 OUT_112 OUT_113 OUT_114 OUT_115 OUT_116 OUT_117 OUT_118 OUT_119 OUT_120 OUT_121 OUT_122 OUT_123 OUT_124 OUT_125 OUT_126 OUT_127 OUT_128 OUT_129 OUT_130 OUT_131 OUT_132 OUT_133 OUT_134 OUT_135 OUT_136 OUT_137 OUT_138 OUT_139 OUT_140 OUT_141 OUT_142 OUT_143 OUT_144 OUT_145 OUT_146 OUT_147 OUT_148 OUT_149 OUT_150 OUT_151 OUT_152 OUT_153 OUT_154 OUT_155 OUT_156 OUT_157 OUT_158 OUT_159 OUT_160 OUT_161 OUT_162 OUT_163 OUT_164 OUT_165 OUT_166 OUT_167 OUT_168 OUT_169 OUT_170 OUT_171 OUT_172 OUT_173 OUT_174 OUT_175 OUT_176 OUT_177 OUT_178 OUT_179 OUT_180 OUT_181 OUT_182 OUT_183 OUT_184 OUT_185 OUT_186 OUT_187 OUT_188 OUT_189 OUT_190 OUT_191 OUT_192 OUT_193 OUT_194 OUT_195 OUT_196 OUT_197 OUT_198 OUT_199 OUT_200 OUT_201 OUT_202 OUT_203 OUT_204 OUT_205 OUT_206 OUT_207 OUT_208 OUT_209 OUT_210 OUT_211 OUT_212 OUT_213 OUT_214 OUT_215 OUT_216 OUT_217 OUT_218 OUT_219 OUT_220 OUT_221 OUT_222 OUT_223 OUT_224 OUT_225 OUT_226 OUT_227 OUT_228 OUT_229 OUT_230 OUT_231 OUT_232 OUT_233 OUT_234 OUT_235 OUT_236 OUT_237 OUT_238 OUT_239 OUT_240 OUT_241 OUT_242 OUT_243 OUT_244 OUT_245 OUT_246 OUT_247 OUT_248 OUT_249 OUT_250 OUT_251 OUT_252 OUT_253 OUT_254 OUT_255 OUT_256 OUT_257 OUT_258 OUT_259 OUT_260 OUT_261 OUT_262 OUT_263 OUT_264 OUT_265 OUT_266 OUT_267 OUT_268 OUT_269 OUT_270 OUT_271 OUT_272 OUT_273 OUT_274 OUT_275 OUT_276 OUT_277 OUT_278 OUT_279 OUT_280 OUT_281 OUT_282 OUT_283 OUT_284 OUT_285 OUT_286 OUT_287 OUT_288 OUT_289 OUT_290 OUT_291 OUT_292 OUT_293 OUT_294 OUT_295 OUT_296 OUT_297 OUT_298 OUT_299 OUT_300 OUT_301 OUT_302 OUT_303 OUT_304 OUT_305 OUT_306 OUT_307 OUT_308 OUT_309 OUT_310 OUT_311 OUT_312 OUT_313 OUT_314 OUT_315 OUT_316 OUT_317 OUT_318 OUT_319 OUT_320 OUT_321 OUT_322 OUT_323 OUT_324 OUT_325 OUT_326 OUT_327 OUT_328 OUT_329 OUT_330 OUT_331 OUT_332 OUT_333 OUT_334 OUT_335 OUT_336 OUT_337 OUT_338 OUT_339 OUT_340 OUT_341 OUT_342 OUT_343 OUT_344 OUT_345 OUT_346 OUT_347 OUT_348 OUT_349 OUT_350 OUT_351 OUT_352 OUT_353 OUT_354 OUT_355 OUT_356 OUT_357 OUT_358 OUT_359 OUT_360 OUT_361 OUT_362 OUT_363 OUT_364 OUT_365 OUT_366 OUT_367 OUT_368 OUT_369 OUT_370 OUT_371 OUT_372 OUT_373 OUT_374 OUT_375 OUT_376 OUT_377 OUT_378 OUT_379 OUT_380 OUT_381 OUT_382 OUT_383 OUT_384 OUT_385 OUT_386 OUT_387 OUT_388 OUT_389 OUT_390 OUT_391 OUT_392 OUT_393 OUT_394 OUT_395 OUT_396 OUT_397 OUT_398 OUT_399 OUT_400 OUT_401 OUT_402 OUT_403 OUT_404 OUT_405 OUT_406 OUT_407 OUT_408 OUT_409 OUT_410 OUT_411 OUT_412 OUT_413 OUT_414 OUT_415 OUT_416 OUT_417 OUT_418 OUT_419 OUT_420 OUT_421 OUT_422 OUT_423 OUT_424 OUT_425 OUT_426 OUT_427 OUT_428 OUT_429 OUT_430 OUT_431 OUT_432 OUT_433 OUT_434 OUT_435 OUT_436 OUT_437 OUT_438 OUT_439 OUT_440 OUT_441 OUT_442 OUT_443 OUT_444 OUT_445 OUT_446 OUT_447 OUT_448 OUT_449 OUT_450 OUT_451 OUT_452 OUT_453 OUT_454 OUT_455 OUT_456 OUT_457 OUT_458 OUT_459 OUT_460 OUT_461 OUT_462 OUT_463 OUT_464 OUT_465 OUT_466 OUT_467 OUT_468 OUT_469 OUT_470 OUT_471 OUT_472 OUT_473 OUT_474 OUT_475 OUT_476 OUT_477 OUT_478 OUT_479 OUT_480 OUT_481 OUT_482 OUT_483 OUT_484 OUT_485 OUT_486 OUT_487 OUT_488 OUT_489 OUT_490 OUT_491 OUT_492 OUT_493 OUT_494 OUT_495 OUT_496 OUT_497 OUT_498 OUT_499 OUT_500 OUT_501 OUT_502 OUT_503 OUT_504 OUT_505 OUT_506 OUT_507 OUT_508 OUT_509 OUT_510 OUT_511 Vvdd:currents

mymc montecarlo
+ donominal=no variations=mismatch
+ seed=1234
+ numruns=numberofruns
+ firstrun=1
+ saveprocessparams=yes
+ savefamilyplots= yes {
mytran tran stop=simlength
}

option1 options rawfmt = psfascii

