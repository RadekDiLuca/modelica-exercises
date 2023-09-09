class System

FIFO ciq;   /// client input queue
FIFO siq;   /// server input queue

Client c;
Server s;

MonitorReq1 m;


equation

// client, read queue
connect(ciq.readsignal, c.readsignal);
connect(ciq.readfifodata, c.readfifodata);
connect(ciq.datavailable, c.datavailable);

// client, write queue
connect(siq.writefifodata, c.writefifodata);
connect(siq.writesignal, c.writesignal);
connect(siq.spaceavailable, c.spaceavailable);


// server, read queue
connect(siq.readsignal, s.readsignal);
connect(siq.readfifodata, s.readfifodata);
connect(siq.datavailable, s.datavailable);

// server, write queue
connect(ciq.writefifodata, s.writefifodata);
connect(ciq.writesignal, s.writesignal);
connect(ciq.spaceavailable, s.spaceavailable);

// monito connections
connect(siq.writefifodata[1], m.inputdata);
connect(siq.writesignal, m.writesignal);
connect(ciq.readsignal, m.readsignal);
connect(ciq.readfifodata[1], m.outputdata);



end System;
