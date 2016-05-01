onMapSingleClick "if (isNil""MAPPOSS"") then {MAPPOSS = [[_pos select 0,_pos select 1,0]];} else {MAPPOSS set [count MAPPOSS, [_pos select 0,_pos select 1,0]];};copyToClipboard format[""%1"",MAPPOSS];hint ""Map Pos copied!"";";


