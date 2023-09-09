
block Customer

parameter Real T = 2;    // clock

InputInteger Machine2Customer;

OutputInteger Customer2Machine;
/*
0: nop
1: insert coin
2: select drink
3: cancel transaction
*/

Integer state;


algorithm

when initial() then

state := 0;
Customer2Machine := 0;

elsewhen sample(0, T) then

if (pre(state) == 0) and (myrandom() <= 1.0)
      then // insert coin
           state := 1;
           Customer2Machine := 1;  // insert coins

elseif (pre(state) == 1) and (Machine2Customer == 1)  // enough coins inserted
       then   // select drink or cancel transaction
	    if (myrandom() <= 0.5)
	    then state := 2; Customer2Machine := 2;  // select drink
	    else state := 3; Customer2Machine := 3;  // cancel transaction
	    end if;
	    
elseif (pre(state) == 2) and (Machine2Customer == 2)  // drink dispensed
       then // drink and then idle
            state := 0;  
            Customer2Machine := 0;

elseif (pre(state) == 3) and (Machine2Customer == 3)  // refund/change returned
       then // go to idle
            state := 0;  
            Customer2Machine := 0;
	    
else   state := pre(state);
       Customer2Machine := pre(Customer2Machine) ;
       
end if;



end when;


end Customer;