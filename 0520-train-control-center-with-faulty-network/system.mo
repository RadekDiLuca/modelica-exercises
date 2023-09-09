class System

Network nwk;

ControlCenter ctr;

TrafficLight trl;

Monitor mon;


equation

connect(ctr.x, nwk.u);

connect(nwk.y, trl.u);

connect(ctr.x, mon.ctr_sig);
connect(trl.y, mon.trl_sig);

end System;
