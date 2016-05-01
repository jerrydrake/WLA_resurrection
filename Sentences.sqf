//speech[] = {"\a3\dubbing_f_epa\a_in\137_WTF\a_in_137_wtf_ICO_0.ogg"};configName 
//configfile >> "CfgSentences" >> "A_in" >> "137_WTF" >> "Sentences" >> "a_in_137_wtf_ICO_0" >> "speech"

SAOKSENTENCE = {
private ["_ok","_count","_n"];
_ok = createDialog "SentenceDialog"; 
_count = (count (configFile / "CfgSentences")) - 1; 
while {_count > 0} do {
_n = ((configFile / "CfgSentences") select _count);
lbAdd [1500, (configName _n)];
_count = _count - 1;
};
};

SAOKSEF1  = {
private ["_zone","_count","_n"];
_zone = (lbText [1500, lbCurSel 1500]);
lbClear 1501;
lbClear 1502;
_count = (count (configFile / "CfgSentences" / _zone)) - 1; 
while {_count > 0} do {
_n = ((configFile / "CfgSentences" / _zone) select _count);
lbAdd [1501, (configName _n)];
_count = _count - 1;
};
};
SAOKSEF2  = {
private ["_zone","_zone2","_count","_n"];
_zone = (lbText [1500, lbCurSel 1500]);
_zone2 = (lbText [1501, lbCurSel 1501]);
lbClear 1502;
_count = (count (configFile / "CfgSentences" / _zone / _zone2 / "Sentences")) - 1; 
while {_count > 0} do {
_n = ((configFile / "CfgSentences" / _zone / _zone2 / "Sentences") select _count);
lbAdd [1502, (configName _n)];
_count = _count - 1;
};

};
SAOKSEF3  = {
private ["_zone","_zone2","_zone3","_count","_n"];
_zone = (lbText [1500, lbCurSel 1500]);
_zone2 = (lbText [1501, lbCurSel 1501]);
_zone3 = (lbText [1502, lbCurSel 1502]);
_n = configName (configFile / "CfgSentences" / _zone / _zone2 / "Sentences" / _zone3);
//player say3d _zone3;
[player,_zone2, gettext (configfile >> "CfgSentences" >> _zone >> _zone2 >> "file"), ""] CALL SAOKKBTOPIC;
[player,player, _zone2, _n ]SPAWN SAOKKBTELL;
};
SAOKSEF4  = {
private ["_zone","_zone2","_zone3","_count","_n"];
_zone = (lbText [1500, lbCurSel 1500]);
_zone2 = (lbText [1501, lbCurSel 1501]);
_zone3 = (lbText [1502, lbCurSel 1502]);
//_n = getarray (configFile / "CfgSentences" / _zone / _zone2 / "Sentences" / _zone3 / "speech");
copyToClipboard _zone3;
};
