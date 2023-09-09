class System

Plant p;
Movie m;
Controller ctr;
User ref;
RMSE rmsestream;
Terminator term;

equation


connect(p.x, ctr.x);  
connect(p.u, ctr.u); 
connect(p.a, m.a);  
connect(ctr.xref, ref.xref);  
connect(ref.xref, rmsestream.ref);  
connect(p.x, rmsestream.u);  
connect(rmsestream.u, term.rmse);  


end System;
