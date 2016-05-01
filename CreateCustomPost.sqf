//_n = ["R",(screenToWorld [0.5,0.5]),random 360] execvm "CreateCustomPost.sqf";
//_n = [] execVM "ObjectsFromGP.sqf";
//copyToClipboard str (cursortarget getvariable "StaticO");
///copytoclipboard ([getposATL player, 20, true] call BIS_fnc_ObjectsGrabber);
private ["_data","_type","_posC","_dir"];
_alla = ["WALL1","FUR1","CAMP1","CAMP2","CAMP3","CJUNK1","CAMP4"];
_type = if (_this select 0 != "R") then {_this select 0} else {_alla call RETURNRANDOM}; 
_posC = if (count _this > 1) then {_this select 1} else {getposATL player};
_dir = if (count _this > 2) then {_this select 2} else {random 360};
_data = [];
switch _type do {

//POST
case "POST1" : {
_data = [
	["Land_CampingChair_V2_F",[-1.64697,0.998291,2.09808e-005],294.883,1,0,[0.00232362,-0.00288282],"","",true,false], 
	["Land_PaperBox_closed_F",[-1.4375,3.33032,0],0,1,0,[0,0],"","",true,false], 
	["Land_PaperBox_open_empty_F",[-1.11865,-4.73877,0],0,1,0,[0,0],"","",true,false], 
	["Land_FirePlace_F",[4.8855,1.16309,-9.53674e-007],0,1,0,[0,0],"","",true,false], 
	["Land_Cargo_House_V3_F",[-5.69971,1.4585,0.728848],337.142,1,0,[0,0],"","",true,false], 
	["Land_PaperBox_closed_F",[0.812256,-7.04565,0],0,1,0,[0,0],"","",true,false], 
	["Land_BagFence_Long_F",[7.09448,-2.89551,-0.000999928],358.046,1,0,[0,-0],"","",true,false], 
	["Land_Camping_Light_F",[-7.03857,-4.24463,-0.00113392],359.854,1,0,[-0.106665,0.0661444],"","",true,false], 
	["Land_HBarrier_Big_F",[-4.64014,-7.21118,0],0,1,0,[0,0],"","",true,false], 
	["Land_Mil_WiredFenceD_F",[3.75,-7.71802,-9.53674e-006],0,1,0,[0,0],"","",true,false], 
	["Land_BagFence_Long_F",[8.64673,-1.40063,-0.000999928],90.529,1,0,[0,-0],"","",true,false], 
	["Land_BagFence_Long_F",[8.81567,1.70215,-0.000999928],90.529,1,0,[0,0],"","",true,false], 
	["Land_ChairPlastic_F",[3.15112,9.30664,1.7643e-005],104.593,1,0,[0.00277176,-0.00269679],"","",true,false], 
	["Land_BagFence_Short_F",[8.60376,5.60669,-0.000999928],273.11,1,0,[0,-0],"","",true,false], 
	["Land_BagBunker_Small_F",[7.35229,8.6106,0],228.817,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_3_F",[2.47925,10.9146,0],0,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[-13.8096,1.17993,0],266.603,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[-9.45215,10.769,0],0,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall_corner_F",[-11.8623,-6.02539,0],207.878,1,0,[0,0],"","",true,false], 
	["Land_Mil_WiredFence_F",[11.5901,-7.94409,-9.53674e-006],0,1,0,[0,0],"","",true,false], 
	["Land_BagBunker_Tower_F",[-1.00952,15.0813,0],94.3953,1,0,[0,-0],"","",true,false]
];
};



case "POST2" : {
_data = [
	["Land_PaperBox_closed_F",[-0.572266,5.19531,0],0,1,0,[0,0],"","",true,false], 
	["Land_CampingChair_V2_F",[-5.03564,3.59082,2.09808e-005],294.898,1,0,[0.00233835,-0.00291034],"","",true,false], 
	["Land_PaperBox_closed_F",[-6.46362,4.62085,0],0,1,0,[0,0],"","",true,false], 
	["Land_Camping_Light_F",[-4.59766,7.22437,-0.00113297],1.66539,1,0,[-0.107748,0.0663563],"","",true,false], 
	["Land_ChairPlastic_F",[-0.0739746,8.64429,1.7643e-005],104.608,1,0,[0.00278293,-0.00267236],"","",true,false], 
	["Land_PaperBox_open_empty_F",[-2.90747,8.21338,0],79.3657,1,0,[0,0],"","",true,false], 
	["Land_BagFence_Short_F",[8.59912,1.88086,-0.000999928],273.11,1,0,[0,0],"","",true,false], 
	["Land_BagBunker_Tower_F",[5.48145,7.92603,0],94.3953,1,0,[0,-0],"","",true,false], 
	["Land_PowerGenerator_F",[-6.49487,7.31592,0],0,1,0,[0,0],"","",true,false], 
	["Land_BagFence_Long_F",[9.95361,1.20801,-0.000999928],358.046,1,0,[0,-0],"","",true,false], 
	["Land_Mil_WiredFenceD_F",[-0.721436,-10.0381,-9.53674e-006],0,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_3_F",[-2.04736,10.2878,0],0,1,0,[0,0],"","",true,false], 
	["Land_Loudspeakers_F",[-8.65845,-7.52563,0],0,1,0,[0,0],"","",true,false], 
	["Land_BagFence_Long_F",[11.4927,-0.37207,-0.000999928],90.529,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[-7.56299,10.3508,0],0,1,0,[0,0],"","",true,false], 
	["Land_BagFence_Long_F",[11.3237,-3.47485,-0.000999928],90.529,1,0,[0,0],"","",true,false], 
	["Land_Mil_WiredFence_F",[-3.1228,11.9465,-9.53674e-006],0,1,0,[0,0],"","",true,false], 
	["Land_Cargo_House_V3_F",[-10.9595,7.4978,0],337.142,1,0,[0,0],"","",true,false], 
	["Land_Mil_WiredFence_F",[7.11865,-10.2642,-9.53674e-006],0,1,0,[0,0],"","",true,false], 
	["Land_BagBunker_Small_F",[10.999,-7.14038,0],267.093,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_Big_F",[-9.11157,-9.53125,0],0,1,0,[0,0],"","",true,false], 
	["Land_Wall_Tin_4",[-13.2698,-0.341309,0],99.9296,1,0,[0,0],"","",true,false], 
	["Land_HBarrierTower_F",[-14.8481,-5.88623,0],86.4829,1,0,[0,0],"","",true,false], 
	["Land_Wall_Tin_4",[-15.3704,4.78125,0],0,1,0,[0,0],"","",true,false], 
	["Land_spp_Mirror_Broken_F",[-12.4556,11.5994,0],342.122,1,0,[0,0],"","",true,false]
];
};

//CAMP JUNK SMALL
case "CJUNK1" : {
_data =
[
	["Land_Garbage_square5_F",[-0.240967,0.72998,0],0,1,0,[0,0],"","",true,false], 
	["Land_GasTank_01_yellow_F",[0.487061,-0.537598,2.71797e-005],358.527,1,0,[-0.0103651,-0.0167953],"","",true,false], 
	["Land_MetalCase_01_small_F",[0.92041,0.115967,-4.76837e-007],0.0135494,1,0,[0.000467901,0.000453291],"","",true,false], 
	["Land_MetalBarrel_empty_F",[0.907715,0.73877,0],0,1,0,[0,0],"","",true,false], 
	["Land_MetalBarrel_F",[0.439209,1.15112,5.48363e-005],359.79,1,0.176849,[-0.00018621,-0.0157481],"","",true,false], 
	["Land_CampingChair_V1_F",[-0.864746,0.890381,0.00312471],354.846,1,0,[-0.00661888,0.0037197],"","",true,false], 
	["Land_CampingChair_V1_folded_F",[-1.59473,0.455811,0],105.243,1,0,[0,-0],"","",true,false], 
	["Land_BarrelSand_grey_F",[-0.125,1.66699,5.81741e-005],359.665,1,0,[-0.0128514,-0.0137943],"","",true,false], 
	["Land_PlasticCase_01_medium_F",[1.70215,0.185791,-4.76837e-007],0.00224519,1,0,[0.000221288,-8.61861e-005],"","",true,false], 
	["Land_MetalBarrel_empty_F",[0.975342,1.62085,0],0,1,0,[0,0],"","",true,false], 
	["Land_GarbageBarrel_01_F",[1.81909,-1.10913,-0.00600624],0.0539188,1,0,[0.304275,0.954074],"","",true,false], 
	["Land_Ground_sheet_folded_blue_F",[-1.30688,1.92407,-0.00404167],4.06935,1,0,[-0.00888987,0.000751579],"","",true,false], 
	["Land_WaterTank_F",[0.399902,2.88184,-5.72205e-006],359.991,1,0,[0.000492475,0.000195172],"","",true,false], 
	["Land_Sleeping_bag_brown_folded_F",[-1.53076,2.48364,-0.00103283],120.871,1,0,[7.96484,0.00536112],"","",true,false], 
	["Land_Ground_sheet_yellow_F",[-2.13965,2.23926,0],0,1,0,[0,0],"","",true,false], 
	["Land_Ground_sheet_folded_F",[-2.21533,2.43359,-0.00339413],337.791,1,0,[-0.253015,-179.998],"","",true,false]
];
};
//FORTRESS AND BAGFs as line
case "WALL1" : {
_data = [
	["Land_MetalCase_01_small_F",[-2.76709,1.05444,-4.76837e-007],0.0115366,1,0,[0.000485546,0.000454886],"","",true,false], 
	["Land_BagFence_Long_F",[-1.07104,3.35962,-0.000999928],0,1,0,[0,0],"","",true,false], 
	["Land_PaperBox_closed_F",[-3.87231,0.638916,0],0,1,0,[0,0],"","",true,false], 
	["Land_BagBunker_Small_F",[2.54175,3.89917,0],187.439,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[-7.29858,2.37817,0],0,1,0,[0,0],"","",true,false], 
	["Land_ChairWood_F",[5.72559,1.97119,7.62939e-006],344.879,1,0,[0.0040022,0.00265406],"","",true,false], 
	["Land_WaterTank_F",[-6.07446,-0.300537,-4.29153e-006],359.993,1,0,[4.46684e-005,0.00017937],"","",true,false], 
	["Land_RattanTable_01_F",[6.26538,0.77417,9.53674e-006],359.924,1,0,[-0.00461736,0.00180677],"","",true,false], 
	["Land_ChairWood_F",[6.68286,1.67822,7.62939e-006],359.538,1,0,[0.00398206,0.00268644],"","",true,false], 
	["Land_Wall_Tin_4",[6.67358,2.60645,0],0,1,0,[0,0],"","",true,false], 
	["Land_Net_Fence_8m_F",[-2.57227,3.54688,0],0,1,0,[0,0],"","",true,false], 
	["FlexibleTank_01_forest_F",[-7.81226,-1.36182,7.82013e-005],0.0356698,1,0.215118,[-0.0309819,-0.0202719],"","",true,false], 
	["Land_PortableLight_double_F",[-6.83008,4.06592,0],126.61,1,0,[0,-0],"","",true,false], 
	["Land_BagFence_Short_F",[5.4834,6.12744,-0.000999928],316.078,1,0,[0,0],"","",true,false], 
	["Land_Portable_generator_F",[8.07007,1.87036,-0.000790119],359.965,1,0,[-0.00110334,0.217641],"","",true,false], 
	["Land_BagFence_Long_F",[7.6394,6.64697,-0.000999928],358.038,1,0,[0,-0],"","",true,false], 
	["Land_Wall_Tin_Pole",[10.302,2.51978,0],0,1,0,[0,0],"","",true,false], 
	["Land_Cargo_House_V2_F",[-11.4976,-0.266846,0],1.16699,1,0,[0,0],"","",true,false], 
	["Land_BagFence_Long_F",[10.7542,6.79663,-0.000999928],358.038,1,0,[0,-0],"","",true,false], 
	["Land_Mil_WiredFence_F",[-12.4932,3.55615,-9.53674e-006],0,1,0,[0,0],"","",true,false], 
	["Land_JunkPile_F",[13.2263,1.16309,0],0,1,0,[0,0],"","",true,false], 
	["Land_Wall_Tin_4_2",[13.1868,2.50879,0],0,1,0,[0,0],"","",true,false], 
	["Land_FieldToilet_F",[-13.2339,-3.11865,4.43459e-005],304.042,1,0,[-0.00203419,0.00071107],"","",true,false]
];
};
//CAMPF SMALL
case "FUR1" : {
_data = 
[
	["FirePlace_burning_F",[-0.34668,0.240234,0.0313034],107.951,1,0,[8.18186,2.82713],"","",true,false], 
	["Land_CampingChair_V1_F",[0.53418,-1.5127,0.0114861],165.098,1,0,[3.24911,6.34222],"","",true,false], 
	["Land_ChairPlastic_F",[0.828125,1.61621,0.0107346],93.4236,1,0,[8.68539,-0.110029],"","",true,false], 
	["Land_CampingChair_V1_F",[-1.33789,-1.54004,0.00901413],208.002,1,0,[-1.44026,6.07667],"","",true,false], 
	["Land_WoodenTable_small_F",[2.11816,1.08398,0.00947952],104.588,1,0,[8.52514,1.60385],"","",true,false], 
	["Land_Camping_Light_F",[2.2832,0.938477,-0.054657],98.74,1,0,[8.74184,0.743842],"","",true,false]
];
};



//SMALL CAMP CSAT
case "CAMP1" : {
_data = [
	["Land_Campfire_F",[-0.976807,-0.81958,0],0,1,0,[0,0],"","",true,false], 
	["Land_CampingChair_V1_F",[-0.43042,1.38843,0.00312376],59.725,1,0,[-0.00630408,0.00374085],"","",true,false], 
	["Land_TentA_F",[1.69312,-1.05396,0],0,1,0,[0,0],"","",true,false], 
	["Land_Can_Dented_F",[-1.64209,1.35083,0.832409],275.938,1,0,[-0.11618,-0.257869],"","",true,false], 
	["Land_TablePlastic_01_F",[-2.20044,1.44043,-9.53674e-007],0.00727315,1,0,[0.000203275,4.82512e-005],"","",true,false], 
	["Land_Bucket_F",[0.74585,-3.15601,5.72205e-005],0.0103369,1,0,[-0.02284,0.0406939],"","",true,false], 
	["Land_TentA_F",[1.82837,2.81592,0.0143833],136.083,1,0,[0,-0],"","",true,false], 
	["Land_FMradio_F",[-1.79541,-3.16113,1.43051e-006],0.00102905,1,0,[-0.00217783,-5.67919e-005],"","",true,false], 
	["Land_Ground_sheet_blue_F",[-3.6272,0.897705,0],0,1,0,[0,0],"","",true,false], 
	["Land_CampingChair_V1_F",[-3.23975,2.66406,0.00312328],325.544,1,0,[-0.00630664,0.0035937],"","",true,false], 
	["Land_BagFence_Round_F",[-3.00977,-3.48633,-0.00130129],31.7259,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_3_F",[-0.709717,-4.32056,0],0,1,0,[0,0],"","",true,false], 
	["Land_BagFence_Long_F",[0.900879,4.50317,-0.000999928],0,1,0,[0,0],"","",true,false], 
	["Land_BagFence_Long_F",[4.5603,-1.37427,-0.000999928],270.045,1,0,[0,0],"","",true,false], 
	["Land_BagFence_Long_F",[-2.1333,4.39209,-0.000999928],0,1,0,[0,0],"","",true,false], 
	["Land_PaperBox_closed_F",[4.99634,1.5752,0],214.634,1,0,[0,0],"","",true,false], 
	["Land_BagFence_Corner_F",[4.52905,-4.09814,-0.000999928],88.3081,1,0,[0,0],"","",true,false], 
	["Land_BagFence_Long_F",[3.99146,4.60889,-0.000999928],0,1,0,[0,0],"","",true,false], 
	["Land_PaperBox_open_full_F",[6.63257,-0.140625,0],0,1,0,[0,0],"","",true,false], 
	["Land_BagBunker_Small_F",[-7.0127,-2.07349,0],50.9324,1,0,[0,0],"","",true,false], 
	["Land_BagFence_Long_F",[-6.8645,2.95361,-0.000999928],89.077,1,0,[0,0],"","",true,false]
];
};
//SMALL CAMP CSAT
case "CAMP2" : {
_data = [
	["Land_Sleeping_bag_brown_F",[-1.1582,-0.467285,0],0,1,0,[0,0],"","",true,false], 
	["Land_Sleeping_bag_brown_F",[2.27612,0.475586,0],113.538,1,0,[0,0],"","",true,false], 
	["Land_PlasticCase_01_small_F",[-2.15869,-0.87207,-0.0250001],359.544,1,0,[0.000452395,0.000452642],"","",true,false], 
	["Land_CampingChair_V2_F",[-0.256104,-2.43262,2.09808e-005],0.097794,1,0,[0.00239016,-0.00285203],"","",true,false], 
	["Land_RattanTable_01_F",[0.371338,2.45435,0],360,1,0,[1.21107e-005,6.91037e-006],"","",true,false], 
	["Land_ChairPlastic_F",[-0.602783,2.42822,1.71661e-005],0.0385986,1,0,[0.00270926,-0.00257149],"","",true,false], 
	["Land_RattanChair_01_F",[1.43311,2.71094,-0.0250001],359.992,1,0,[-0.000115134,0.000208507],"","",true,false], 
	["Land_BagFence_Short_F",[0.322021,3.24585,-0.000999928],0,1,0,[0,0],"","",true,false], 
	["Land_BagFence_Short_F",[3.11719,-1.03687,-0.000999928],245.235,1,0,[0,0],"","",true,false], 
	["Land_CampingTable_F",[-0.80957,-3.31592,-1.43051e-006],0.376816,1,0,[-0.000730724,0.000435188],"","",true,false], 
	["Land_BagFence_Long_F",[-2.1311,-2.68286,-0.000999928],91.1846,1,0,[0,0],"","",true,false], 
	["Land_BagFence_Short_F",[-1.39795,3.25195,-0.000999928],0,1,0,[0,0],"","",true,false], 
	["Land_FirePlace_F",[1.89771,-2.98926,-9.53674e-007],0,1,0,[0,0],"","",true,false], 
	["Land_TentA_F",[-3.77661,-0.110352,0],0,1,0,[0,0],"","",true,false], 
	["Land_BagFence_Round_F",[2.76855,3.04639,-0.00130129],213.079,1,0,[0,0],"","",true,false], 
	["Land_Bench_F",[-2.91968,-2.65747,4.76837e-007],0.00312875,1,0,[5.57665e-005,-4.8664e-006],"","",true,false], 
	["Land_GasTank_01_yellow_F",[3.17407,-2.3501,2.52724e-005],142.967,1,0,[-0.0115771,-0.0163483],"","",true,false], 
	["Land_BagFence_Short_F",[-1.05103,-4.04907,-0.000999928],0,1,0,[0,0],"","",true,false], 
	["Land_BagFence_Round_F",[3.73779,-3.32349,-0.00130129],291.76,1,0,[0,0],"","",true,false], 
	["Land_BagFence_Round_F",[1.21899,-4.97681,-0.00130129],0.761144,1,0,[0,0],"","",true,false]
];
};


case "CAMP3" : {
_data =[
	["Land_Bench_F",[0.98999,-0.990234,0],0.00846453,1,0,[-1.09814e-005,0.000110497],"","",true,false], 
	["Land_Sleeping_bag_brown_F",[1.45679,1.552,0],113.538,1,0,[0,0],"","",true,false], 
	["Land_CampingChair_V2_F",[-2.25269,-0.159668,2.09808e-005],0.152022,1,0,[0.00240204,-0.0028786],"","",true,false], 
	["Land_CampingChair_V2_F",[-1.5647,-1.80615,2.14577e-005],111.842,1,0,[0.00233036,-0.00290046],"","",true,false], 
	["Land_CampingTable_F",[-2.27148,-0.970459,9.53674e-007],0.380133,1,0,[0.000862195,6.01996e-005],"","",true,false], 
	["Land_TentA_F",[-2.03784,2.42065,0],244.147,1,0,[0,0],"","",true,false], 
	["Land_FirePlace_F",[3.07251,-1.15259,-9.53674e-007],0,1,0,[0,0],"","",true,false], 
	["Land_TentA_F",[3.16821,3.51147,0],244.147,1,0,[0,0],"","",true,false], 
	["Land_TentA_F",[0.266602,4.80811,0],244.147,1,0,[0,0],"","",true,false], 
	["Land_Bench_F",[5.10034,-0.931396,1.90735e-006],0.015749,1,0,[2.66501e-005,0.00101401],"","",true,false], 
	["Land_BagFence_Short_F",[-3.82764,-3.99976,-0.000999928],0,1,0,[0,0],"","",true,false], 
	["Land_BagFence_Long_F",[-5.58447,-0.730225,-0.000999928],91.1846,1,0,[0,0],"","",true,false], 
	["Land_BagFence_Round_F",[4.81323,-3.73877,-0.00130129],0.761144,1,0,[0,0],"","",true,false], 
	["Land_BagFence_Long_F",[-5.53296,2.24048,-0.000999928],91.1846,1,0,[0,-0],"","",true,false], 
	["Land_GasTank_01_yellow_F",[-2.78491,5.29614,2.52724e-005],142.504,1,0,[-0.0115356,-0.0163861],"","",true,false], 
	["Land_BagFence_Short_F",[-2.9519,5.96118,-0.000999928],319.545,1,0,[0,-0],"","",true,false], 
	["Land_BagFence_Short_F",[6.71069,0.201172,-0.000999928],245.235,1,0,[0,0],"","",true,false], 
	["Land_Sleeping_bag_brown_F",[3.19263,6.84424,0],0,1,0,[0,0],"","",true,false], 
	["Land_BagFence_Round_F",[7.33179,-2.08545,-0.00130129],291.76,1,0,[0,0],"","",true,false], 
	["Land_BagFence_Short_F",[-1.46216,7.24121,-0.000999928],319.545,1,0,[0,-0],"","",true,false], 
	["Land_PlasticCase_01_small_F",[0.532959,7.73828,-4.76837e-007],359.559,1,0,[0.000465295,0.000448466],"","",true,false], 
	["Land_BagFence_Round_F",[0.584229,8.64014,-0.00130129],172.624,1,0,[0,-0],"","",true,false]
];
};

case "CAMP4" : {
_data =[
	["Land_FirePlace_F",[-2.81323,-0.201416,-9.53674e-007],0,1,0,[0,0],"","",true,false], 
	["Land_BagFence_Round_F",[1.88452,-2.40918,-0.00130129],0.761144,1,0,[0,0],"","",true,false], 
	["Land_Bench_F",[-2.8811,1.71851,0],265.6,1,0,[2.18812e-005,0.000259423],"","",true,false], 
	["Land_TentA_F",[-1.66211,-3.28271,0.00716209],244.147,1,0,[0,0],"","",true,false], 
	["Land_BagFence_Short_F",[3.78198,1.53076,-0.000999928],245.235,1,0,[0,0],"","",true,false], 
	["Land_BagFence_Round_F",[4.40308,-0.755859,-0.00130129],291.76,1,0,[0,0],"","",true,false], 
	["Land_CampingChair_V2_F",[1.92749,3.89404,2.14577e-005],111.887,1,0,[0.00233922,-0.00290209],"","",true,false], 
	["Land_CampingTable_F",[1.22095,4.72974,-3.8147e-006],0.379156,1,0,[0.00379894,1.83592e-005],"","",true,false], 
	["Land_Sleeping_bag_brown_F",[-2.75684,3.62451,0],113.538,1,0,[0,0],"","",true,false], 
	["Land_Bench_F",[-5.09155,-0.429199,4.76837e-007],0.00873183,1,0,[6.61205e-005,4.31788e-006],"","",true,false], 
	["Land_PlasticCase_01_small_F",[-5.09741,-2.10815,0],359.573,1,0,[0.000470489,0.000484403],"","",true,false], 
	["Land_Sleeping_bag_brown_F",[-1.42847,5.91357,0],0,1,0,[0,0],"","",true,false], 
	["Land_CampingChair_V2_F",[1.23999,5.54053,2.09808e-005],0.189874,1,0,[0.00235174,-0.00281264],"","",true,false], 
	["Land_BagFence_Long_F",[-5.78662,-0.643066,-0.000999928],91.1846,1,0,[0,0],"","",true,false], 
	["Land_BagFence_Short_F",[-5.15527,-2.84277,-0.000999928],0,1,0,[0,0],"","",true,false], 
	["Land_BagFence_Long_F",[-5.73511,2.32764,-0.000999928],91.1846,1,0,[0,-0],"","",true,false], 
	["Land_GasTank_01_yellow_F",[-5.33838,-3.6062,2.81334e-005],142.104,1,0,[-0.0110942,-0.0168823],"","",true,false], 
	["Land_BagFence_Short_F",[-4.8728,5.2085,-0.000999928],319.545,1,0,[0,0],"","",true,false], 
	["Land_BagFence_Short_F",[-3.44897,6.42651,-0.000999928],319.545,1,0,[0,0],"","",true,false], 
	["Land_BagFence_Round_F",[-1.43335,7.80762,-0.00130129],172.624,1,0,[0,0],"","",true,false], 
	["Land_TentA_F",[5.89038,5.3877,0.00908184],244.147,1,0,[0,0],"","",true,false], 
	["Land_TentA_F",[3.42163,7.74097,0],262.602,1,0,[0,0],"","",true,false]
];
};


};
_n = [_posC, _dir, _data] CALL BIS_fnc_ObjectsMapper;
{
_pos = getPosWorld _x;
_pos set [2,(boundingCenter _x) select 2];
_x setPosWorld (atltoasl _pos);
_x setvectorup (surfaceNormal (getPosWorld _x));
} foreach _n;
_n