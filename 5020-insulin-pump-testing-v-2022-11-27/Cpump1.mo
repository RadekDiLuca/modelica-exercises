
function CPump1
input Real r0;
input Real r1;
input Real r2;
output Real InsulinDose;

external "C" InsulinDose = insulin_pump(r0, r1, r2);

  annotation(Include = "#include \"insulin-pump-implementation.c\"");


end CPump1;