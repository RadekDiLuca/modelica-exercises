block TrafficLight

parameter Real T = 5;

parameter Real p = 0.1;

OutputTrafficLightSignal x;

initial equation

x = TrafficLightSignal.green;

algorithm

when sample(0, T)  then

    x := next(pre(x));  // x(t) = next(x(t - 1))  

end when;



end TrafficLight;
