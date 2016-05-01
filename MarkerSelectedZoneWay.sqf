//NOT USED

private ["_marS","_cc","_mar5","_mP"];

NUMM=NUMM+1;
_marS = format ["SELZWmar%1",NUMM];
_cc = _this;
_mP = (getmarkerpos _cc);
_mar5 = [_marS,(getmarkerpos _cc),"Select",[0.8,0.8],"ColorWhite",""] CALL FUNKTIO_CREATEMARKER;

while {_cc == missionnamespace getvariable "CurTeam" && {_mP distance [0,0,0] > 100}} do {_mar5 setmarkerpos (getmarkerpos _cc);sleep 0.1;_mP = (getmarkerpos _cc);};
deletemarker _mar5;