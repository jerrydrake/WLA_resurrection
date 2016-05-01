sleep 3;

waituntil {sleep 5; !(alive (_this select 0))}; 
["ScoreRemoved",["From lost original team-mate",90]] call SAOKNOTIFI;