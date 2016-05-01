private ["_array"];
_array = ["I_G_Offroad_01_F"];
switch (_this select 0) do {
case "VEH": {_array = ARMEDVEHICLES select (_this select 1);};
case "TANK": {_array = ARMEDTANKS select (_this select 1);};
case "AA": {_array = ARMEDAA select (_this select 1);};
case "C": {_array = ARMEDCARRIER select (_this select 1);};
case "ST": {_array = ARMEDSTATIC select (_this select 1);};
case "AIRF": {_array = AIRFIGTHER select (_this select 1);};
case "AIRARMC": {_array = AIRARMCHOP select (_this select 1);};
case "AIRC": {_array = AIRCARRIERCHOP select (_this select 1);};
case "CIV": {_array = CIVVEH;};
case "SUP": {_array = ARMEDSUPPORT select (_this select 1);};
};
_array