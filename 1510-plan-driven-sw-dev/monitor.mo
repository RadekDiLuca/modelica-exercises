
block Monitor1


// GlobalParameters p;

InputInteger x ;  // sw dev state
OutputReal y;    // expected time to complete sw development
OutputInteger counter;    // num deliveries

Boolean delivery;

initial equation
counter = 0;
y = 0;

equation

delivery = (x == 8);

algorithm

when edge(delivery)  then

      counter := counter + 1;
      y := time/counter;

end when;


/*
algorithm

when sample(0, p.T) then

  if (x == 8)
  then
       counter := counter + 1;
       y := time/counter;
  end if;
      
end when;
*/


end Monitor1;