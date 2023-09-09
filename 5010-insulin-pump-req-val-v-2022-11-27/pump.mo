block Pump

// blood glucose conversion tabel:
/*
   1 mg/dL = 0.0555 mmol/L
   1 mmol/L = 18,018 mg/dL
   
Examples:
100 mg/dL = 5.56 mmol/L
110 mg/dL = 6.1 mmol/L
120 mg/dL = 6.7 mmol/L
130 mg/dL = 7.2 mmol/L

4 mmol/L = 72 mg/dL

*/

parameter Real MinimumDose = 1;

InputReal SugarLevel;        //amount of glucose of the patient
OutputReal InsulinDose;   //amount of insulin to give the patient

parameter Real T = 5;

Real r0, r1, r2;

algorithm

when initial() then
r0 := 0;
r1 := 0;
r2 := 0;
InsulinDose := 0;

elsewhen sample(0, T) then

r0 := r1;
r1 := r2;
r2 :=  pre(SugarLevel);

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

     InsulinDose := max(MinimumDose, floor((r2 - r1)/72));

end if;

    
end when;

end Pump;
