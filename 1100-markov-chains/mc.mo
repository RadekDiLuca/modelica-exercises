
block MarkovChain

parameter Integer N = 3;   // size of Markov chain
parameter Integer x_0 = 1;  // initial state MC

parameter Real T = 1;

output Integer x;


// Transition Matrix MC
parameter Real A[N, N] =
[
0.2, 0.4, 0.4;
0.4, 0.2, 0.4;
0.4, 0.4, 0.2
];


algorithm

      when initial() then
	x := x_0;
	
      elsewhen sample(0,T) then

          x := pick(myrandom(), pre(x), A);
       
      end when;


end MarkovChain;

