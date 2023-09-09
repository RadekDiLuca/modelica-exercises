
block MarkovChain


parameter Integer x_0 = 1;  // initial state MC

output OutputInteger x;


// Transition Matrix MC
parameter Real A[SysPar.N, SysPar.N] =
[
14.0/15.0,1.0/15.0, 0, 0, 0;
0, 29.0/30.0, 1.0/30.0, 0, 0;
0, 0, 59.0/60.0, 1.0/60.0, 0 ;
0, 0, 0, 39.0/40.0, 1.0/40.0 ;
1, 0, 0, 0, 0 
];


algorithm

      when initial() then
	x := x_0;
	
      elsewhen sample(0,SysPar.T) then

          x := pick(myrandom(), pre(x), A);
       
      end when;


end MarkovChain;

