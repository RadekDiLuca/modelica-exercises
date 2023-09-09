
block RMSE

InputReal u;           // input stream of system values
InputReal ref;         // input stream of reference

OutputReal rmse;      //  output stream of Root Mean Squared Error
OutputReal mse;       //  output stream of average
OutputReal var;      //  output stream of  variance
OutputReal stddev;      //  output stream of  standard deviations
OutputReal m2;      //  output stream of  second order moment


Integer counter;   

Real error;

equation

var = m2 - mse^2;

stddev = sqrt(var);

error =  (u - ref)^2;

rmse = sqrt(mse);


algorithm


when initial() then

	counter := 0;
	mse:= 0;
	m2 := 0;
	
elsewhen sample(0, Prm.T) then

	    mse := pre(mse)*(counter/(counter + 1)) + (pre(error)/(counter + 1));
	    m2 := pre(m2)*(counter/(counter + 1)) + ((pre(error)^2)/(counter + 1));

            counter := counter + 1;

end when;


end RMSE;


