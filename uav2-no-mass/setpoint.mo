block Setpoint


OutputReal setx;
OutputReal sety;
OutputReal setz;


equation

// scenario 1

   setx = 1;
   sety = 2;
   setz = 3;


// scenario 2

/*
for i in 1:K.N loop
    setx[i] = 0;
    sety[i] = 2*i + 5*i*sin((2*3.14/2)*time);
    setz[i] = 3*i +  5*i*cos((2*3.14/2)*time);
end for;

*/

end Setpoint;

