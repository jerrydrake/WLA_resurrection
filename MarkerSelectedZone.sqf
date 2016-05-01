private ["_marS","_cc","_mar5","_mP"];
NUMM=NUMM+1;
_marS = format ["SELZmar%1",NUMM];
_cc = _this;
_mP = (locationposition _cc);
_mar5 = [_marS,(locationposition _cc),"Select",[1.2,1.2],"ColorWhite",""] CALL FUNKTIO_CREATEMARKER;
while {_cc == missionnamespace getvariable "CurTeam" && {_mP distance [0,0,0] > 100}} do {_mar5 setmarkerpos (locationposition _cc);sleep 0.1;_mP = (locationposition _cc);};
deletemarker _mar5;