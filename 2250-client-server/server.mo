
block Server

parameter Real T = 0.5;    // clock

// to send outputs to client
// client input queue (ciq)

// writer
OutputInteger writefifodata[1];         // inputdata
OutputBoolean writesignal;
InputBoolean spaceavailable;

// reader
//InputBoolean ciq_readsignal;
//OutputInteger ciq_outputdata;  
//OutputBoolean ciq_datavailable;  

// to get inputs from client
// server input queue (siq)

// writer
//InputInteger siq_inputdata;
//InputBoolean siq_writesignal;
//OutputBoolean siq_spaceavailable;

// reader
OutputBoolean readsignal;
InputInteger readfifodata[1];       // outputdata
InputBoolean datavailable;  


Integer pc;

Integer op1, op2;

algorithm

when initial() then

pc := 0;
op1 := 0;
op2 := 0;
writesignal := false;
readsignal := false;

elsewhen sample(0,T) then

if (pre(pc) == 0) and pre(datavailable)  then
// read op1

assert(pre(pc) == 0, "server: pre(pc) == 0", AssertionLevel.warning);

readsignal := not(pre(readsignal)) ;
pc := 10;

//print("server: time = "+String(time)+"; pc="+String(pc)+"; op1="+String(op1)+"\n");


elseif (pre(pc) == 10)  then

// read op2

assert(pre(pc) == 10, "server: pre(pc) == 10", AssertionLevel.warning);

op1 := pre(readfifodata[1]);
pc := 1;

print("server: time = "+String(time)+"; pc="+String(pc)+"; op1="+String(op1)+"\n");



elseif (pre(pc) == 1) and  pre(datavailable)  then

// read op2

assert(pre(pc) == 1, "server: pre(pc) == 1", AssertionLevel.warning);

readsignal := not(pre(readsignal)) ;
pc := 20;

//print("server: time = "+String(time)+"; pc="+String(pc)+"; op2="+String(op2)+"\n");


elseif (pre(pc) == 20)   then

// read op2

assert(pre(pc) == 20, "server: pre(pc) == 20", AssertionLevel.warning);

op2 := pre(readfifodata[1]);
pc := 2;

print("server: time = "+String(time)+"; pc="+String(pc)+"; op2="+String(op2)+"\n");

elseif (pre(pc) == 2) and pre(spaceavailable)  then
// send value

//assert(false, "server: pre(pc) == 2", AssertionLevel.warning);

writefifodata[1] := op1 - op2;  
pc := 30;

//print("server: time = "+String(time)+"; pc="+String(pc)+"; writefifodata[1]="+String(writefifodata[1])+"\n");


elseif (pre(pc) == 30)   then
// send value

assert(pre(pc) == 30, "server: pre(pc) == 30", AssertionLevel.warning);

writesignal := not(pre(writesignal)); 
pc := 0;

print("server: time = "+String(time)+"; pc="+String(pc)+"; writefifodata[1]="+String(writefifodata[1])+"\n");


else

pc := pre(pc);

end if;


end when;


end Server;