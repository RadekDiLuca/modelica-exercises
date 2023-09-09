
block MarkovChain


parameter Integer x_0 = 0;  // initial state MC

output OutputInteger x;

Real p;

algorithm

      when initial() then
	x := x_0;
	
      elsewhen sample(0,SysPar.T) then

           p := myrandom();
	   
           if (p <= 1.0/3.0)
	   then
	        x := x - 1;
           elseif (p <= 2.0/3.0)
	       then
	           x := x + 1;
	       end if; 
          
      end when;


end MarkovChain;

