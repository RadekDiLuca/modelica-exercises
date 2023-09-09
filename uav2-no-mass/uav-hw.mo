block UAV_HW


InputReal Trustx;
InputReal Trusty;
InputReal Trustz;

OutputReal x;
OutputReal y;
OutputReal z;
OutputReal Vx;
OutputReal Vy;
OutputReal Vz;

initial equation
    x = 0;
    y = 0;
    z = 0;

    Vx = 0;
    Vy = 0;
    Vz = 0;


equation


// f = m a --> a = f/m = Trust
// a = der(v)
// der(x) = v
// der(v) = f/m = Trust


der(x) = Vx;
der(Vx) = Trustx;

der(y) = Vy;
der(Vy) = Trusty;

der(z) = Vz;
der(Vz) = Trustz - K.g;

end UAV_HW;

