block TrafficLight

parameter Real T = 1;

InputTrafficLightSignal u;
OutputTrafficLightSignal y;


algorithm


when initial() then

y := TrafficLightSignal.red;

elsewhen sample(0, T) then

if (pre(u) == TrafficLightSignal.red)
then
   y := TrafficLightSignal.red;
elseif (pre(u) == TrafficLightSignal.green)
then
     y := TrafficLightSignal.green;
end if;

end when;



end TrafficLight;
