
block Sender


parameter Real T = 1.0;

// Write side of FIFO
InputBoolean spaceavailable;
OutputInteger writefifodata[1];
OutputBoolean writesignal;

Integer state;
Real p;


algorithm

      when initial() then
	writesignal := false;
	state := 0;
	
      elsewhen sample(0,T)  then

      p := myrandom();

      if (p <= 0.5)
      then
      
      if (pre(state) == 0)
      then  // prepare data
	    writefifodata[1] := myrandomint(10);
	    state := 10;

      elseif (pre(state) == 10) and pre(spaceavailable)
      then   // write data to fifo
               writesignal := not(pre(writesignal));
               state := 0;  // loop
      end if;

      end if;  // if (p <= 0.5)

      end when;


end Sender;