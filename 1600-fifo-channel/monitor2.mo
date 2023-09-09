
block MonitorReq2

/*
Output sequence is equal to input sequence
*/

parameter Integer N = 100;


InputBoolean readsignal;  
InputBoolean writesignal; 
InputInteger writefifodata;  // inputdata
InputInteger readfifodata;   // outputdata
InputBoolean datavailable;  
InputBoolean spaceavailable;  


Integer newestinput;
Integer oldestinput;
Integer InputBuffer[N];  

Boolean error;
Boolean readsigint;  
Boolean writesigint;

equation

readsigint = not(pre(readsignal) == readsignal) ;
writesigint = not(pre(writesignal) == writesignal) ;



algorithm


when initial() then
error := false;
newestinput := 0;  // where to write
oldestinput := 0;  // where to read

for i in 1:N loop InputBuffer[i] := 0; end for;


elsewhen (readsigint and writesigint and pre(spaceavailable) and pre(datavailable)) then
// read an write

    error := pre(error) or not(InputBuffer[pre(oldestinput) + 1] == readfifodata);

    oldestinput := mod(pre(oldestinput) + 1, N);
    newestinput := mod(pre(newestinput) + 1, N);
    InputBuffer[newestinput + 1] := writefifodata;

elsewhen (readsigint and writesigint and
          pre(spaceavailable) and not(pre(datavailable))) then

// just write

    InputBuffer[pre(newestinput) + 1] :=  writefifodata;
    newestinput := mod(pre(newestinput) + 1, N);

elsewhen (readsigint and writesigint and
          not(pre(spaceavailable)) and pre(datavailable))
then
	  
// we can only read,

    error := pre(error) or not(InputBuffer[pre(oldestinput) + 1] == readfifodata);

    oldestinput := mod(pre(oldestinput) + 1, N);
    
elsewhen (readsigint and not(writesigint) and pre(datavailable)) then

// we read

    error := pre(error) or not(InputBuffer[pre(oldestinput) + 1] == readfifodata);

    oldestinput := mod(pre(oldestinput) + 1, N);

elsewhen (not(readsigint) and writesigint and pre(spaceavailable)  ) then

// we write

    InputBuffer[pre(newestinput) + 1] :=  writefifodata;
    newestinput := mod(pre(newestinput) + 1, N);



end when;


end MonitorReq2;