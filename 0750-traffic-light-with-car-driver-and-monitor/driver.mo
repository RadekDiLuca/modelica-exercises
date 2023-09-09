
block Driver

parameter Real T = 0.0001;  // 3.6 second


InputTrafficLightSignal w;  

OutputReal throttle;  
OutputReal brake;  

initial equation
throttle = 0;
brake = 0;


algorithm

when sample(0, T) then

if (w == TrafficLightSignal.green)
then
    throttle := 0.5;
    brake := 0;
else
    throttle := 0;
    brake := 1.0;
end if;

end when;

end Driver;