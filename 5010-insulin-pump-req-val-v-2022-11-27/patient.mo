

block Patient


parameter Real Food2Sugar = 5.0;  
parameter Real Insulin2SugarExt = 5.0;   
parameter Real GSetpoint = 75;  // mg/dL, healthy
// parameter Real BodyRegulation = 0.1;  // healthy
parameter Real BodyRegulation = 0.004;  // unhealthy
//parameter Real BodyRegulation = 0.0001;  // deadly
//parameter Real GSetpoint = 150;  // mg/dL, deadly

parameter Real CarboExercise = 0.5;  // Avg sugar consumed per minute of exercise

InputReal Exercise;
InputReal MealDose;
InputReal InsulinDose;
OutputReal SugarLevel;

Real EndogenInsulin;

initial equation

SugarLevel = 80;

equation

EndogenInsulin = BodyRegulation*(SugarLevel - GSetpoint);

der(SugarLevel) =  - EndogenInsulin
                   - CarboExercise*Exercise
                   + Food2Sugar*MealDose
		   - Insulin2SugarExt*InsulinDose ;


end Patient;