x = xstart + lengthdir_x(Dis,Angle);
y = ystart + lengthdir_y(Dis,Angle);

Dis += 15;
Angle += Spd;

if (Dis > 2000) instance_destroy();

