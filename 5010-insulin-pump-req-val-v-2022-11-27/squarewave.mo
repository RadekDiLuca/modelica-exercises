
function squarewave
input Integer phase;
input Integer period;
input Integer counter;
output Real value;

algorithm

if (mod(counter + phase, period) < div(period, 2))
then
    value := 1;
else
    value := -1;
end if;

end squarewave;