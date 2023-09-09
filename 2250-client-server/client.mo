
block Client

parameter Real T = 2;    // clock


// client input queue (ciq)

// reader
OutputBoolean readsignal;
InputInteger readfifodata[1];  // outputdata
InputBoolean datavailable;  


// server input queue (siq)

// writer
OutputInteger writefifodata[1];   // inputdata
OutputBoolean writesignal;
InputBoolean spaceavailable;


OutputInteger value;


Integer pc;

algorithm

when initial() then

pc := 0;
value := 0;
readsignal := false;
writesignal := false;


elsewhen sample(0,T) then
// receive msg

if (pre(pc) == 2) and pre(datavailable) then

assert(pre(pc) == 2, "pre(pc) == 2", AssertionLevel.warning);

readsignal := not(pre(readsignal)) ;
pc := 20;

//print("client: time = "+String(time)+"; pc="+String(pc)+"; op1-op2 = value="+String(value)+"\n");



// elseif (pre(pc) == 20) and pre(datavailable) then
elseif (pre(pc) == 20)  then

assert(pre(pc) == 20, "pre(pc) == 20", AssertionLevel.warning);

value := pre(readfifodata[1]);
pc := 0;

print("client: time = "+String(time)+"; pc="+String(pc)+"; op1-op2 = value="+String(value)+"\n");





elseif (pre(pc) == 0) and pre(spaceavailable)  then
// send

assert(pre(pc) == 0, "pre(pc) == 0", AssertionLevel.warning);

writefifodata[1] := User();
pc := 30;

// print("client: time = "+String(time)+"; pc="+String(pc)+"; op1: writefifodata[1]="+String(writefifodata[1])+"\n");




// elseif (pre(pc) == 30) and pre(spaceavailable)  then
elseif (pre(pc) == 30)   then
// send

 assert(pre(pc) == 30, "pre(pc) == 30", AssertionLevel.warning);

writesignal := not(pre(writesignal)); 
pc := 1;

print("client: time = "+String(time)+"; pc="+String(pc)+"; op1: writefifodata[1]="+String(writefifodata[1])+"\n");




elseif  (pre(pc) == 1) and pre(spaceavailable) then
// send

assert(pre(pc) == 1, "pre(pc) == 1", AssertionLevel.warning);

writefifodata[1] := User();
pc := 40;

//print("client: time = "+String(time)+"; pc="+String(pc)+"; op2: writefifodata[1]="+String(writefifodata[1])+"\n");




// elseif  (pre(pc) == 40) and pre(spaceavailable) then
elseif  (pre(pc) == 40)  then
// send

assert(pre(pc) == 40, "pre(pc) == 40", AssertionLevel.warning);

writesignal := not(pre(writesignal)); 
pc := 2;

print("client: time = "+String(time)+"; pc="+String(pc)+"; op2: writefifodata[1]="+String(writefifodata[1])+"\n");



else

pc := pre(pc);

end if;

end when;


end Client;