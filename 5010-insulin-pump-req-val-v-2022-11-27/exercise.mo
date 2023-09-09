
block PhysicalExercise

parameter Real T = 1;   // time step in minutes
parameter Real b = 0.1;
parameter Integer Period = 600;
parameter Integer Phase = 0;
parameter Real A1 = 0.5;
parameter Real B1 = 0.5;


OutputReal y;

Real z, v, r;
Integer counter;

equation

y = (1 + (1 - exp(-b*z))/(1 + exp(-b*z)))/2 ;

r = squarewave(Phase, Period, counter);

z = A1*r + B1*v;


algorithm

when initial() then
counter := 0;
v := 0;

elsewhen sample(0, T) then

        v := pre(v) + UniformWhiteNoise(0.1);
        counter := counter + 1;
	
end when;

end PhysicalExercise;