block TrafficLight

parameter Real T = 1;
parameter Real SwitchProbability = 0.1;

TimerValues p;

OutputTrafficLightSignal x;

Integer counter;

initial equation
x = TrafficLightSignal.green;
counter = p.GreenTimer;

algorithm

// when (sample(0, T) and ((myrandom() <= SwitchProbability))) then

when sample(0, T)  then

if (myrandom() <= SwitchProbability)
then

if (counter <= 0)
then
     x := next(pre(x));
end if;

counter := UpdateTimer(pre(counter), pre(x));

end if;

end when;



end TrafficLight;
