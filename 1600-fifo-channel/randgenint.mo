
function myrandomint
input Integer range;
output Integer result;

external "C" result = myrandomint(range);

  annotation(Include = "#include \"myextlib.c\"");


end myrandomint;