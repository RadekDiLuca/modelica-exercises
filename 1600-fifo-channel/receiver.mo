
block Receiver


parameter Real T = 1.0;

InputBoolean datavailable;
InputInteger readfifodata[1];
OutputBoolean readsignal;

Integer x, y;
Integer state;

algorithm

when initial() then
	x := 0; y:= 0;
	state := 0;
	readsignal := false;
	
   elsewhen sample(0,T) then


if (pre(state) == 0) and pre(datavailable)
then  // ask for data
          y := pre(readfifodata[1]);
          readsignal := not(pre(readsignal));
	  state := 10;
elseif  (state == 10)
then
           // read data
           x := pre(readfifodata[1]);
	   state := 0;  // loop
end if;


end when;


end Receiver;