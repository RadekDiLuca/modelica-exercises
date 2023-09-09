function InsulinPump1
input Real r0;
input Real r1;
input Real r2;
output Real InsulinDose;

algorithm

if (r2 < r1)
//Sugar level falling
then

     InsulinDose := 0;
    
elseif (abs(r2 -r1) < 1E-6)
// Sugar level stable
then

     InsulinDose := 0;
    
elseif ((r2 - r1) < (r1 - r0)) 
then  // Sugar level increasing and rate of increase decreasing

      InsulinDose := 0;
    
else // ((r2 - r1) >= (r1 - r0)) 
//SugarSugar level increasing and rate of increase stable or increasing

     InsulinDose := max(0, floor((r2 - r1)/72));

end if;

    
end InsulinPump1;