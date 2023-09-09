
model Terminator

InputReal rmse;


algorithm

// adjust as needed 

when ((time > 1000) and (rmse  > Prm.MaxRMSE)) or (time > Prm.Horizon) then

    Modelica.Utilities.Files.remove("outputs.txt");
    
    Modelica.Utilities.Streams.print(
    "rmse (stop time = " +
    String(time) +
    ")", "outputs.txt");
    
     Modelica.Utilities.Streams.print(
     String(rmse),
     "outputs.txt"
     );
 
    terminate("Terminated since max rmse or max time reached");
end when;


end Terminator;
