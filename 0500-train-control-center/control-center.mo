block ControlCenter

parameter Real T = 10;

parameter Real p = 0.80;  //  switching probability

OutputTrafficLightSignal x;

algorithm

when initial() then

x := TrafficLightSignal.red;

elsewhen sample(0, T) then

if (myrandom() <= p)
then
    x := if (pre(x) == TrafficLightSignal.red) then TrafficLightSignal.green else TrafficLightSignal.red ;
end if;

end when;



end ControlCenter;
