
block AvgStream

InputReal u;        // input stream of values
OutputReal avg;      //  output stream of  average values
OutputReal var;      //  output stream of  variance
OutputReal stddev;      //  output stream of  standard deviations
OutputReal m2;      //  output stream of  second order moment


Integer counter;   


equation

var = m2 - avg^2;

stddev = sqrt(var);


algorithm


when initial() then

	counter := 0;
	avg:= 0;
	m2 := 0;
	
elsewhen sample(0, Prm.T) then

	    avg := pre(avg)*(counter/(counter + 1)) + (pre(u)/(counter + 1));
	    m2 := pre(m2)*(counter/(counter + 1)) + ((pre(u)^2)/(counter + 1));

            counter := counter + 1;

end when;


end AvgStream;


