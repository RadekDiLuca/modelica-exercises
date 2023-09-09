class System

Sender s;
FIFO c;
Receiver r;
MonitorReq1 req1;


equation

// connect sender to fifo channel
connect(s.spaceavailable, c.spaceavailable);  
connect(s.writesignal, c.writesignal); 
connect(c.writefifodata, s.writefifodata);  

// connect receiver to fifo channel
connect(r.readsignal, c.readsignal);  
connect(c.readfifodata, r.readfifodata);  
connect(c.datavailable, r.datavailable);  

// connect channel to monitor
connect(r.readsignal, req1.readsignal);  
connect(s.writesignal, req1.writesignal);  
connect(c.readfifodata[1], req1.readfifodata);  
connect(s.writefifodata[1], req1.writefifodata);  
connect(c.datavailable, req1.datavailable);  
connect(c.spaceavailable, req1.spaceavailable);  

end System;
