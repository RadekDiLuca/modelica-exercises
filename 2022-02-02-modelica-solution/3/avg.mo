
function Average
input Prm p;
input Real x[: , :];
input Integer i;
output Real result;

algorithm

result := 0;

/*
result = (x[i, 1] + ...   x[i, p.W])/p.W
result(1) = x[i, 1]/1
result(2) = (x[i, 1] + x[i, 2])/2

result(k) = (x[i, 1] + ...   x[i, k])/k  =
((x[i, 1] + ...   x[i, k - 1])/(k - 1))*(k - 1)/k + (x[i, k]/k) =
result(k-1)*(k - 1)/k + (x[i, k]/k)
*/

for k in 1:p.W loop
    result := result*((k - 1)/k) + (x[i, k]/k);
end for;

    
end Average;

