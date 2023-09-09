block Monitor

// Safety: if control center sends red within 5 seconds traffic light is red


InputTrafficLightSignal ctr_sig;

InputTrafficLightSignal trl_sig;

OutputBoolean y, error;

parameter Real T = 1;

Real accumulated_error_time;

initial equation
y = false;

equation

error = (accumulated_error_time > 5);

when edge(error) then
  y = true;
end when;


algorithm

when initial() then

accumulated_error_time := 0;

elsewhen sample(0, T) then

if ((pre(ctr_sig) == TrafficLightSignal.red) and not(pre(trl_sig) == TrafficLightSignal.red) )
then
    accumulated_error_time := accumulated_error_time + T;
else  // reset
    accumulated_error_time := 0;  
end if;

end when;

end Monitor;
