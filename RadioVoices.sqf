
private ["_ran","_voice","_speaker"];
_speaker = _this select 0;
_ran = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30] call RETURNRANDOM;
_voice = "A3\Sounds_F\sfx\radio\ambient_radio" + format ["%1",_ran] + ".wss";
playSound3D [_voice, _speaker, false, getPosATL _speaker, 1, 1, 100];