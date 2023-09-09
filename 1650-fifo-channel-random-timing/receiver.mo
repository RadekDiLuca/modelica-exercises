
block Receiver


parameter Real T = 1.0;

InputBoolean datavailable;
InputInteger readfifodata[1];
OutputBoolean readsignal;

Integer x, state;
Real p;

algorithm

when initial() then
	x := 0;
	state := 0;
	readsignal := false;
	
   elsewhen sample(0,T) then

 p := myrandom();
 
 if (p <= 0.5)
      then
      
if (pre(state) == 0) and pre(datavailable)
then  // ask for data
          readsignal := not(pre(readsignal));
	  state := 10;
elseif  (state == 10)
then
           // read data
           x := pre(readfifodata[1]);
	   state := 0;  // loop
end if;

  end if;  // if (p <= 0.5)
  
end when;


end Receiver;