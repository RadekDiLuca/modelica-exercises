block Pump2

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

Real r0, r1, r2;

Real OldDose;

algorithm

when initial() then
r0 := 0;
r1 := 0;
r2 := 0;
InsulinDose := 0;
OldDose := 0;

elsewhen sample(0, T) then

r0 := r1;
r1 := r2;
r2 :=  pre(SugarLevel);

if (r2 < r1)
then  //Sugar level falling

   if (r2 <= Gsetpoint)
        //Sugar level below setpoint
   then
       InsulinDose := MinimumDose;
   else  //Sugar level above setpoint
       InsulinDose :=  min(MaxDose, pre(InsulinDose) + Quantum);
   end if;
   
elseif (abs(r2 -r1) < 1E-6)
then
   if (r2 <= Gsetpoint)
        //Sugar level below setpoint
   then
       InsulinDose := MinimumDose;
   else  //Sugar level above setpoint
       InsulinDose :=  min(MaxDose, pre(InsulinDose) + Quantum);
   end if;
   
    
elseif ((r2 - r1) < (r1 - r0)) 
then  // Sugar level increasing and rate of increase decreasing

     if (r2 >= 1.5*Gsetpoint)
     then  // Sugar strongly above setpoint

      InsulinDose := min(MaxDose, pre(InsulinDose) + Quantum);

     else
        InsulinDose := max(MinimumDose, pre(InsulinDose) - Quantum);
     end if;
     
 //     InsulinDose := MinimumDose ;
    
else // ((r2 - r1) >= (r1 - r0))
//SugarSugar level increasing and rate of increase stable or increasing

     if (r2 >= 1.5*Gsetpoint)
     then  // Sugar strongly above setpoint

       InsulinDose := min(MaxDose, pre(InsulinDose) + 2*Quantum);

     else
       InsulinDose := min(MaxDose, pre(InsulinDose) + Quantum);

     end if;
     
end if;

    
end when;

end Pump2;
