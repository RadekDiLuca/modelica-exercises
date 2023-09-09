
function UniformWhiteNoise
input Real width;
output Real result;

algorithm

result := width*(1 - 2*myrandom());


end UniformWhiteNoise;