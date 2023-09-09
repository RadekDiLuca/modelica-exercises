block Pump3

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

parameter Real Gsetpoint = 80;

parameter Real MaxDose = 1;
parameter Real MinimumDose = 0;
parameter Real Quantum = 0.01;

InputReal SugarLevel;        //amount of glucose of the patient
OutputReal InsulinDose;   //amount of insulin to give the patient

parameter Real T = 5;
parameter Real Kp = 0.002;
parameter Real Ki = 0.000000001;

Real r0, r1, r2;

Real OldDose, z, error;


equation

error = (r2 - Gsetpoint);

InsulinDose = min(MaxDose, max(MinimumDose, Kp*error + Ki*z));

algorithm

when initial() then
r0 := 0;
r1 := 0;
r2 := 0;
OldDose := 0;
z := 0;

elsewhen sample(0, T) then

r0 := r1;
r1 := r2;
r2 :=  pre(SugarLevel);

z := pre(z) + T*pre(error);

end when;

end Pump3;
