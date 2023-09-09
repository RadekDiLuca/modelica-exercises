
block MarkovChain


parameter Integer x_0 = 1;  // initial state MC

output OutputInteger x;


// Transition Matrix MC
parameter Real A[SysPar.N, SysPar.N] =
[
0.933,  0.067, 0, 0, 0;
0.008, 0.967, 0.025, 0, 0;
0, 0.004, 0.983, 0.013, 0 ;
0, 0, 0.006, 0.975, 0.019 ;
1, 0, 0, 0, 0 
];


algorithm

      when initial() then
	x := x_0;
	
      elsewhen sample(0,SysPar.T) then

          x := pick(myrandom(), pre(x), A);
       
      end when;


end MarkovChain;

