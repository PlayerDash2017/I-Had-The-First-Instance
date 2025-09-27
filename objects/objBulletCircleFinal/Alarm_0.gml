alarm[0] = 3;

a = instance_create(x,y,objBullet01);
a.speed = random_range(15,20);
a.direction = point_direction(xstart,ystart,x,y);
a.gravity = random_range(0.8,1);

