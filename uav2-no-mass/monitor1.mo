
block MonitorReq1

/*
Req1: UAV reaches setpoint

*/



InputReal x;
InputReal y;
InputReal z;
InputReal setx;
InputReal sety;
InputReal setz;

Real distance;


equation

distance = sqrt((x - setx)^2 + (y - sety)^2 + (z - setz)^2);



end MonitorReq1;