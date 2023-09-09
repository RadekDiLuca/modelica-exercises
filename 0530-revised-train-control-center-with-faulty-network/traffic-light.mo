block TrafficLight

parameter Real T = 1;

InputTrafficLightSignal u;
OutputTrafficLightSignal y;


algorithm


when initial() then

y := TrafficLightSignal.red;

elsewhen sample(0, T) then

if (pre(u) == TrafficLightSignal.green)
then
      y := TrafficLightSignal.green;
else
      y := TrafficLightSignal.red;
end if;

end when;



end TrafficLight;
