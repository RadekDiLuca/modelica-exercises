class System


MarkovChain mc(x_0=2);

CompletionTime  CmpTime;

equation


connect(mc.x, CmpTime.x);


end System;
