
block MonitorReq1

/*
Req1:
Glucose level between 50 and 150.

*/

InputReal SugarLevel;
OutputBoolean y;

Boolean error;

equation

error = (SugarLevel < 50) or (SugarLevel >= 150);


algorithm


when initial() then

y := false;

elsewhen edge(error) then

y := true;

end when;


end MonitorReq1;