private ["_pos01","_source03","_source02","_fireLight","_sound","_sound2"];

_pos01 = _this select 0;
_source03 = "#particlesource" createVehicleLocal _pos01;
_source03 setParticleClass "ObjectDestructionFire2Smallx";
//_source03 SetParticleFire [0.7,3,4];
_source02 = "#particlesource" createVehicleLocal _pos01;
_source02 setParticleClass "ObjectDestructionSmoke1_2Smallx";

_fireLight = "#lightpoint" createVehicle _pos01; 
_fireLight setPos _pos01; 
_fireLight setLightBrightness 0.35; 
_fireLight setLightAmbient [1.0, 0.57, 0.15]; 
_fireLight setLightColor [1.0, 0.57, 0.15];  



_source01 = "#particlesource" createVehicleLocal _pos01;
_source01 setParticleClass "FireSparks";

_sound = createSoundSource["Sound_SmokeWreck1",_pos01,[],0];
_sound2 = createSoundSource["Sound_Fire",_pos01,[],0];


//_source01 attachto [_object,[0,0,0]];
//"ObjectDestructionSmoke2x" "ObjectDestructionSmokeSmallx"
//"ObjectDestructionFire2Smallx" ObjectDestructionSparks
//VehExpSmoke2 VehExpSmoke
[_source03,_source02,_fireLight,_sound,_sound2,_source01]