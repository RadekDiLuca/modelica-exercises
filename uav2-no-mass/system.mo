class System

UAV drone;

Setpoint p;

MonitorReq1 m1;


equation

connect(p.setx, drone.setx);
connect(p.sety, drone.sety);
connect(p.setz, drone.setz);

connect(drone.x, m1.x);
connect(drone.y, m1.y);
connect(drone.z, m1.z);

connect(p.setx, m1.setx);
connect(p.sety, m1.sety);
connect(p.setz, m1.setz);


end System;
