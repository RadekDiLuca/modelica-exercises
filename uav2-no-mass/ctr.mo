block Controller

parameter Real T = 0.001;
parameter Real Kpx = -1.0;
parameter Real Kpy = -1.0;
parameter Real Kpz = -1.0;

InputReal setx;
InputReal sety;
InputReal setz;

InputReal x;
InputReal y;
InputReal z;
InputReal Vx;
InputReal Vy;
InputReal Vz;

OutputReal Trustx;
OutputReal Trusty;
OutputReal Trustz;

Real errorx, errory, errorz, w[3];


equation

    errorx = (x - setx);
    errory = (y - sety);
    errorz = (z - setz);

algorithm

when initial() then

w[1] := 0;
w[2] := 0;
w[3] := 0;
Trustx := 0;
Trusty := 0;
Trustz := 0;


elsewhen sample(0, T) then

    w[1] := pre(w[1]) + T*pre(errorx);
    w[2] := pre(w[2]) + T*pre(errory);
    w[3] := pre(w[3]) + T*pre(errorz);


    Trustx := Kpx*pre(errorx) + K.kx1*pre(w[1]) + K.kx2*pre(Vx);
    Trusty := Kpy*pre(errory) + K.ky1*pre(w[2]) + K.ky2*pre(Vy);
    Trustz := Kpz*pre(errorz) + K.g + K.kz1*pre(w[2]) + K.kz2*pre(Vz);

end when;


end Controller;

