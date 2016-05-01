while {false} do {
waitUntil {sleep 1; nearestObject [player, "Land_spp_Transformer_F"] distance player < 10 && {vehicle player == player}};
_ACT = [
(player addAction ["Switch ON", {{_x setHit ["light_1_hitpoint", 0];} foreach (nearestObjects [player, ["Lamps_base_F","Land_PowerPoleWooden_L_F"], 1000]); Hint "Streetlight set ON inside 1km radius";}])
,(player addAction ["Switch OFF", {{_x setHit ["light_1_hitpoint", 0.97];} foreach (nearestObjects [player, ["Lamps_base_F","Land_PowerPoleWooden_L_F"], 1000]);Hint "Streetlight set OFF inside 1km radius";}])
];
waitUntil {sleep 1; nearestObject [player, "Land_spp_Transformer_F"] distance player >= 10 || {vehicle player != player}};
{player removeAction _x;} foreach _ACT;
};


