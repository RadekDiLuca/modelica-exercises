class System

PhysicalExercise PhyExe;
Patient patient;  
Pump3 pump;   
Meal meal;
MonitorReq1 m1;
MonitorReq2 m2;


equation

connect(patient.Exercise, PhyExe.y);
connect(patient.SugarLevel, pump.SugarLevel);
connect(patient.InsulinDose, pump.InsulinDose);
connect(patient.MealDose, meal.MealDose);
connect(patient.SugarLevel, m1.SugarLevel);
connect(patient.SugarLevel, m2.SugarLevel);



end System;
