
block User


parameter Real T = 1.0;

OutputReal xref; // 

algorithm

when initial() then
     	 xref := 0.1;
	
elsewhen sample(0,T) then

	 xref := 0.1;	  

end when;


end User;