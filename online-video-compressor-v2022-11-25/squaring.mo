
block SquareStream

InputReal u;        // input stream of values
OutputReal y;      //  output stream of squared of inptu values


algorithm

when initial() then

	y:= 0;
	
elsewhen sample(0, Prm.T) then

	    y := pre(u)^2;

end when;


end SquareStream;


