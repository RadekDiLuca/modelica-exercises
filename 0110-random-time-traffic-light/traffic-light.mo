block TrafficLight

parameter Real T = 1;

parameter Real p = 0.1;

OutputTrafficLightSignal x;

initial equation

x = TrafficLightSignal.green;

algorithm

when sample(0, T) then

if (myrandom() <= p)
then
    x := next(pre(x));  // x(t) = next(x(t - 1))  
end if;

end when;



end TrafficLight;
