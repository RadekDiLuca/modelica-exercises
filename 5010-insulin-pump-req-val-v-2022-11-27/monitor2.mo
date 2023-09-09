
block MonitorReq2

/*
Req1:
Glucose average level is between 70 and 140.

*/

parameter Real T = 1;

InputReal SugarLevel;
OutputBoolean y;
OutputReal Avg;  // avg so far

Boolean error;

Integer samples;

initial equation
y = false;

equation

error = (Avg < 70) or (Avg >= 140);

when edge(error) then

y = true;

end when;


/*
avg(n + 1) = (v(1) + ... v(n+1))/(n + 1) =  (avg(n)*n + v(n+1))/(n+1) =
avg(n)*(n/(n+1)) + (v(n+1)/(n+1))


avg(n) = (v(1) + ... v(n))/n    -->   avg(n)*n = v(1) + ... v(n)

*/


algorithm

when initial() then

Avg := 0;
samples := 0;

elsewhen sample(0, T) then

Avg :=  pre(Avg)*(pre(samples)/(pre(samples) + 1)) + (pre(SugarLevel)/(pre(samples) + 1));

samples := pre(samples) + 1;

end when;

end MonitorReq2;