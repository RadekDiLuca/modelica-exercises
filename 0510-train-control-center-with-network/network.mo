block Network

parameter Real T = 6;  // network too slow, safety violated

// parameter Real T = 2;  // network fast enough

InputTrafficLightSignal u;
OutputTrafficLightSignal y;

algorithm

when initial() then

y := TrafficLightSignal.nop;

elsewhen sample(0, T) then

y := pre(u);

end when;



end Network;
