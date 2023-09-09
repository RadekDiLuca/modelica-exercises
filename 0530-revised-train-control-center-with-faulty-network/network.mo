block Network

parameter Real T = 1;
parameter Real p = 0.9;   // network failure probability


InputTrafficLightSignal u;
OutputTrafficLightSignal y;

algorithm

when initial() then

y := TrafficLightSignal.nop;

elsewhen sample(0, T) then

if (myrandom() < p)
then
    y := TrafficLightSignal.nop;
else
   y := pre(u);
end if;

end when;



end Network;
