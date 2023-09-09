
block Movie


parameter Real T = 1.0;
parameter Real b = 0.01;

OutputReal a;   // dissimilarity compression ratio

Real z;

equation
a = (1 + (1 - exp(-b*z))/(1 + exp(-b*z)))/2 ;


algorithm

when initial() then
        z := 0;
//        a := 0;
elsewhen sample(0,T) then
        z := pre(z) + UniformWhiteNoise(2.0);
//        a := myrandom();	     
end when;


end Movie;