
block MonitorReq1

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



algorithm


when initial() then
error := false;
newestinput := 0;  // where to write
oldestinput := 0;  // where to read

for i in 1:N loop InputBuffer[i] := 0; end for;


elsewhen (edge(readsignal) and edge(writesignal) and pre(spaceavailable) and pre(datavailable)) then
// read an write

    error := pre(error) or not(InputBuffer[pre(oldestinput) + 1] == readfifodata);

    oldestinput := mod(pre(oldestinput) + 1, N);
    newestinput := mod(pre(newestinput) + 1, N);
    InputBuffer[newestinput + 1] := writefifodata;

elsewhen (edge(readsignal) and edge(writesignal) and
          pre(spaceavailable) and not(pre(datavailable))) then

// just write

    InputBuffer[pre(newestinput) + 1] :=  writefifodata;
    newestinput := mod(pre(newestinput) + 1, N);

elsewhen (edge(readsignal) and edge(writesignal) and
          not(pre(spaceavailable)) and pre(datavailable))
then
	  
// we can only read,

    error := pre(error) or not(InputBuffer[pre(oldestinput) + 1] == readfifodata);

    oldestinput := mod(pre(oldestinput) + 1, N);
    
elsewhen (edge(readsignal) and not(edge(writesignal)) and pre(datavailable)) then

// we read

    error := pre(error) or not(InputBuffer[pre(oldestinput) + 1] == readfifodata);

    oldestinput := mod(pre(oldestinput) + 1, N);

elsewhen (not(edge(readsignal)) and edge(writesignal) and pre(spaceavailable)  ) then

// we write

    InputBuffer[pre(newestinput) + 1] :=  writefifodata;
    newestinput := mod(pre(newestinput) + 1, N);



end when;


end MonitorReq1;