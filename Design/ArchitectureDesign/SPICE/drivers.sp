
simulator lang=spectre

subckt drivers (vdd vss NBulkLine PBulkLine
+ BLenc_start_0 BLenc_start_1 BLenc_start_2 BLenc_start_3 BLenc_start_4
+ WLenc_start_0 WLenc_start_1 WLenc_start_2 WLenc_start_3 WLenc_start_4 WLenc_start_5 WLenc_start_6
+ BLenc_0_0_0 BLenc_0_0_1 BLenc_0_0_2 BLenc_0_0_3 BLenc_0_0_4 BLenc_0_1_0 BLenc_0_1_1 BLenc_0_1_2 BLenc_0_1_3 BLenc_0_1_4
+ WLenc_0_0_0 WLenc_0_0_1 WLenc_0_0_2 WLenc_0_0_3 WLenc_0_0_4 WLenc_0_0_5 WLenc_0_0_6 WLenc_0_1_0 WLenc_0_1_1 WLenc_0_1_2 WLenc_0_1_3 WLenc_0_1_4 WLenc_0_1_5 WLenc_0_1_6
+ GBenable_0
+ LBenable_0 LBenable_1)

xnandbl_0_0 BLenc_start_0 GBenable_0 BL_0_0bar vdd vss PBulkLine NBulkLine twonand
xinvbl_0_0 BL_0_0bar BL_0_0 vdd vss PBulkLine NBulkLine inverter
xnandbl_0_0_0 BL_0_0 LBenable_0 BLenc_0_0_0bar vdd vss PBulkLine NBulkLine twonand
xinvbl_0_0_0 BLenc_0_0_0bar BLenc_0_0_0 vdd vss PBulkLine NBulkLine inverter
xnandbl_0_1_0 BL_0_0 LBenable_1 BLenc_0_1_0bar vdd vss PBulkLine NBulkLine twonand
xinvbl_0_1_0 BLenc_0_1_0bar BLenc_0_1_0 vdd vss PBulkLine NBulkLine inverter
xnandbl_0_1 BLenc_start_1 GBenable_0 BL_0_1bar vdd vss PBulkLine NBulkLine twonand
xinvbl_0_1 BL_0_1bar BL_0_1 vdd vss PBulkLine NBulkLine inverter
xnandbl_0_0_1 BL_0_1 LBenable_0 BLenc_0_0_1bar vdd vss PBulkLine NBulkLine twonand
xinvbl_0_0_1 BLenc_0_0_1bar BLenc_0_0_1 vdd vss PBulkLine NBulkLine inverter
xnandbl_0_1_1 BL_0_1 LBenable_1 BLenc_0_1_1bar vdd vss PBulkLine NBulkLine twonand
xinvbl_0_1_1 BLenc_0_1_1bar BLenc_0_1_1 vdd vss PBulkLine NBulkLine inverter
xnandbl_0_2 BLenc_start_2 GBenable_0 BL_0_2bar vdd vss PBulkLine NBulkLine twonand
xinvbl_0_2 BL_0_2bar BL_0_2 vdd vss PBulkLine NBulkLine inverter
xnandbl_0_0_2 BL_0_2 LBenable_0 BLenc_0_0_2bar vdd vss PBulkLine NBulkLine twonand
xinvbl_0_0_2 BLenc_0_0_2bar BLenc_0_0_2 vdd vss PBulkLine NBulkLine inverter
xnandbl_0_1_2 BL_0_2 LBenable_1 BLenc_0_1_2bar vdd vss PBulkLine NBulkLine twonand
xinvbl_0_1_2 BLenc_0_1_2bar BLenc_0_1_2 vdd vss PBulkLine NBulkLine inverter
xnandbl_0_3 BLenc_start_3 GBenable_0 BL_0_3bar vdd vss PBulkLine NBulkLine twonand
xinvbl_0_3 BL_0_3bar BL_0_3 vdd vss PBulkLine NBulkLine inverter
xnandbl_0_0_3 BL_0_3 LBenable_0 BLenc_0_0_3bar vdd vss PBulkLine NBulkLine twonand
xinvbl_0_0_3 BLenc_0_0_3bar BLenc_0_0_3 vdd vss PBulkLine NBulkLine inverter
xnandbl_0_1_3 BL_0_3 LBenable_1 BLenc_0_1_3bar vdd vss PBulkLine NBulkLine twonand
xinvbl_0_1_3 BLenc_0_1_3bar BLenc_0_1_3 vdd vss PBulkLine NBulkLine inverter
xnandbl_0_4 BLenc_start_4 GBenable_0 BL_0_4bar vdd vss PBulkLine NBulkLine twonand
xinvbl_0_4 BL_0_4bar BL_0_4 vdd vss PBulkLine NBulkLine inverter
xnandbl_0_0_4 BL_0_4 LBenable_0 BLenc_0_0_4bar vdd vss PBulkLine NBulkLine twonand
xinvbl_0_0_4 BLenc_0_0_4bar BLenc_0_0_4 vdd vss PBulkLine NBulkLine inverter
xnandbl_0_1_4 BL_0_4 LBenable_1 BLenc_0_1_4bar vdd vss PBulkLine NBulkLine twonand
xinvbl_0_1_4 BLenc_0_1_4bar BLenc_0_1_4 vdd vss PBulkLine NBulkLine inverter
xnandwl_0_0 WLenc_start_0 GBenable_0 WL_0_0bar vdd vss PBulkLine NBulkLine twonand
xinvwl_0_0 WL_0_0bar WL_0_0 vdd vss PBulkLine NBulkLine inverter
xnandwl_0_0_0 WL_0_0 LBenable_0 WLenc_0_0_0bar vdd vss PBulkLine NBulkLine twonand
xinvwl_0_0_0 WLenc_0_0_0bar WLenc_0_0_0 vdd vss PBulkLine NBulkLine inverter
xnandwl_0_1_0 WL_0_0 LBenable_1 WLenc_0_1_0bar vdd vss PBulkLine NBulkLine twonand
xinvwl_0_1_0 WLenc_0_1_0bar WLenc_0_1_0 vdd vss PBulkLine NBulkLine inverter
xnandwl_0_1 WLenc_start_1 GBenable_0 WL_0_1bar vdd vss PBulkLine NBulkLine twonand
xinvwl_0_1 WL_0_1bar WL_0_1 vdd vss PBulkLine NBulkLine inverter
xnandwl_0_0_1 WL_0_1 LBenable_0 WLenc_0_0_1bar vdd vss PBulkLine NBulkLine twonand
xinvwl_0_0_1 WLenc_0_0_1bar WLenc_0_0_1 vdd vss PBulkLine NBulkLine inverter
xnandwl_0_1_1 WL_0_1 LBenable_1 WLenc_0_1_1bar vdd vss PBulkLine NBulkLine twonand
xinvwl_0_1_1 WLenc_0_1_1bar WLenc_0_1_1 vdd vss PBulkLine NBulkLine inverter
xnandwl_0_2 WLenc_start_2 GBenable_0 WL_0_2bar vdd vss PBulkLine NBulkLine twonand
xinvwl_0_2 WL_0_2bar WL_0_2 vdd vss PBulkLine NBulkLine inverter
xnandwl_0_0_2 WL_0_2 LBenable_0 WLenc_0_0_2bar vdd vss PBulkLine NBulkLine twonand
xinvwl_0_0_2 WLenc_0_0_2bar WLenc_0_0_2 vdd vss PBulkLine NBulkLine inverter
xnandwl_0_1_2 WL_0_2 LBenable_1 WLenc_0_1_2bar vdd vss PBulkLine NBulkLine twonand
xinvwl_0_1_2 WLenc_0_1_2bar WLenc_0_1_2 vdd vss PBulkLine NBulkLine inverter
xnandwl_0_3 WLenc_start_3 GBenable_0 WL_0_3bar vdd vss PBulkLine NBulkLine twonand
xinvwl_0_3 WL_0_3bar WL_0_3 vdd vss PBulkLine NBulkLine inverter
xnandwl_0_0_3 WL_0_3 LBenable_0 WLenc_0_0_3bar vdd vss PBulkLine NBulkLine twonand
xinvwl_0_0_3 WLenc_0_0_3bar WLenc_0_0_3 vdd vss PBulkLine NBulkLine inverter
xnandwl_0_1_3 WL_0_3 LBenable_1 WLenc_0_1_3bar vdd vss PBulkLine NBulkLine twonand
xinvwl_0_1_3 WLenc_0_1_3bar WLenc_0_1_3 vdd vss PBulkLine NBulkLine inverter
xnandwl_0_4 WLenc_start_4 GBenable_0 WL_0_4bar vdd vss PBulkLine NBulkLine twonand
xinvwl_0_4 WL_0_4bar WL_0_4 vdd vss PBulkLine NBulkLine inverter
xnandwl_0_0_4 WL_0_4 LBenable_0 WLenc_0_0_4bar vdd vss PBulkLine NBulkLine twonand
xinvwl_0_0_4 WLenc_0_0_4bar WLenc_0_0_4 vdd vss PBulkLine NBulkLine inverter
xnandwl_0_1_4 WL_0_4 LBenable_1 WLenc_0_1_4bar vdd vss PBulkLine NBulkLine twonand
xinvwl_0_1_4 WLenc_0_1_4bar WLenc_0_1_4 vdd vss PBulkLine NBulkLine inverter
xnandwl_0_5 WLenc_start_5 GBenable_0 WL_0_5bar vdd vss PBulkLine NBulkLine twonand
xinvwl_0_5 WL_0_5bar WL_0_5 vdd vss PBulkLine NBulkLine inverter
xnandwl_0_0_5 WL_0_5 LBenable_0 WLenc_0_0_5bar vdd vss PBulkLine NBulkLine twonand
xinvwl_0_0_5 WLenc_0_0_5bar WLenc_0_0_5 vdd vss PBulkLine NBulkLine inverter
xnandwl_0_1_5 WL_0_5 LBenable_1 WLenc_0_1_5bar vdd vss PBulkLine NBulkLine twonand
xinvwl_0_1_5 WLenc_0_1_5bar WLenc_0_1_5 vdd vss PBulkLine NBulkLine inverter
xnandwl_0_6 WLenc_start_6 GBenable_0 WL_0_6bar vdd vss PBulkLine NBulkLine twonand
xinvwl_0_6 WL_0_6bar WL_0_6 vdd vss PBulkLine NBulkLine inverter
xnandwl_0_0_6 WL_0_6 LBenable_0 WLenc_0_0_6bar vdd vss PBulkLine NBulkLine twonand
xinvwl_0_0_6 WLenc_0_0_6bar WLenc_0_0_6 vdd vss PBulkLine NBulkLine inverter
xnandwl_0_1_6 WL_0_6 LBenable_1 WLenc_0_1_6bar vdd vss PBulkLine NBulkLine twonand
xinvwl_0_1_6 WLenc_0_1_6bar WLenc_0_1_6 vdd vss PBulkLine NBulkLine inverter

ends drivers