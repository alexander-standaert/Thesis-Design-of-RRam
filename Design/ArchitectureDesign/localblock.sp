simulator lang=spectre

include "branch.sp"

subckt localblock (vdd vss NBulkLine PBulkLine WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 SelBL_0 SelBL_1 SelBL_2 SelBL_3 SelBL_4 SelBL_5 SelBL_6 SelBL_7 SelBL_8 SelBL_9 BLout SS_0 SS_1 SS_2 SS_3 SS_4 SS_5 SS_6 SS_7 SS_8 SS_9
+Charge_0 Charge_1 Charge_2 Charge_3 Charge_4 Charge_5 Charge_6 Charge_7 Charge_8 Charge_9 Discharge_0 Discharge_1 Discharge_2 Discharge_3 Discharge_4 Discharge_5 Discharge_6 Discharge_7 Discharge_8 Discharge_9)

xBranch0 (vdd vss BL_0 WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 SS_0 Charge_0 Discharge_0 PBulkLine NBulkLine) branch
xM0 BL_0 SelBL_0 BLout NBulkLine mc_nmos_lvt w=PWmux l=PLmin
xBranch1 (vdd vss BL_1 WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 SS_1 Charge_1 Discharge_1 PBulkLine NBulkLine) branch
xM1 BL_1 SelBL_1 BLout NBulkLine mc_nmos_lvt w=PWmux l=PLmin
xBranch2 (vdd vss BL_2 WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 SS_2 Charge_2 Discharge_2 PBulkLine NBulkLine) branch
xM2 BL_2 SelBL_2 BLout NBulkLine mc_nmos_lvt w=PWmux l=PLmin
xBranch3 (vdd vss BL_3 WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 SS_3 Charge_3 Discharge_3 PBulkLine NBulkLine) branch
xM3 BL_3 SelBL_3 BLout NBulkLine mc_nmos_lvt w=PWmux l=PLmin
xBranch4 (vdd vss BL_4 WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 SS_4 Charge_4 Discharge_4 PBulkLine NBulkLine) branch
xM4 BL_4 SelBL_4 BLout NBulkLine mc_nmos_lvt w=PWmux l=PLmin
xBranch5 (vdd vss BL_5 WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 SS_5 Charge_5 Discharge_5 PBulkLine NBulkLine) branch
xM5 BL_5 SelBL_5 BLout NBulkLine mc_nmos_lvt w=PWmux l=PLmin
xBranch6 (vdd vss BL_6 WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 SS_6 Charge_6 Discharge_6 PBulkLine NBulkLine) branch
xM6 BL_6 SelBL_6 BLout NBulkLine mc_nmos_lvt w=PWmux l=PLmin
xBranch7 (vdd vss BL_7 WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 SS_7 Charge_7 Discharge_7 PBulkLine NBulkLine) branch
xM7 BL_7 SelBL_7 BLout NBulkLine mc_nmos_lvt w=PWmux l=PLmin
xBranch8 (vdd vss BL_8 WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 SS_8 Charge_8 Discharge_8 PBulkLine NBulkLine) branch
xM8 BL_8 SelBL_8 BLout NBulkLine mc_nmos_lvt w=PWmux l=PLmin
xBranch9 (vdd vss BL_9 WL_0 WL_1 WL_2 WL_3 WL_4 WL_5 WL_6 WL_7 SS_9 Charge_9 Discharge_9 PBulkLine NBulkLine) branch
xM9 BL_9 SelBL_9 BLout NBulkLine mc_nmos_lvt w=PWmux l=PLmin

ends localblock