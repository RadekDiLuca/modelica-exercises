model System

parameter Real T = 1;

Real r0, r1, r2, z1, z2, y;


algorithm

when initial() then
     r0 := 0;
     r1 := 0;
     r2 := 0;     
     y := 0;
  
elsewhen sample(0, T) then

  r0 := 1000*myrandom();
  r1 := 1000*myrandom();
  r2 := 1000*myrandom();

  z1 := InsulinPump1(r0, r1, r2);
  z2 := CPump1(r0, r1, r2);
  
  if not(abs(z1 - z2) < 1E-6)
  then
      y := 1;
  end if;

end when;

end System;
