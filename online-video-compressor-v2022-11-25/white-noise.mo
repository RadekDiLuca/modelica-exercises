
function UniformWhiteNoise
input Real width;
output Real result;

algorithm

result := width*(1 - 2*myrandom());


end UniformWhiteNoise;

/*

p(x) = if x is in [-w, w] then 1/(2*w) else 0;

Avg = 0

Var = w^2/3

StdDev = w/sqrt(3)

*/
