x = 400 + lengthdir_x(100,Angle);
y = 50 + lengthdir_y(100,Angle);

Angle += Spd;

image_angle = point_direction(400,50,x,y)+90;
image_xscale = max(image_xscale - 1/5,2);
image_yscale = image_xscale;

