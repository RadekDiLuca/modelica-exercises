block UAV

InputReal setx;
InputReal sety;
InputReal setz;

OutputReal x;
OutputReal y;
OutputReal z;
OutputReal Vx;
OutputReal Vy;
OutputReal Vz;


UAV_HW plant;

Controller ctr;



equation

connect(setx, ctr.setx);
connect(sety, ctr.sety);
connect(setz, ctr.setz);

connect(plant.x, ctr.x);
connect(plant.y, ctr.y);
connect(plant.z, ctr.z);

connect(plant.Vx, ctr.Vx);
connect(plant.Vy, ctr.Vy);
connect(plant.Vz, ctr.Vz);

connect(plant.Trustx, ctr.Trustx);
connect(plant.Trusty, ctr.Trusty);
connect(plant.Trustz, ctr.Trustz);

connect(plant.x, x);
connect(plant.y, y);
connect(plant.z, z);

connect(plant.Vx, Vx);
connect(plant.Vy, Vy);
connect(plant.Vz, Vz);

end UAV;

