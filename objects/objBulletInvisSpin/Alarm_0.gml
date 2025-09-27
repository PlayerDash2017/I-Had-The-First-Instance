alarm[0] = 3;

for (var i = 0; i < 360; i += 360/4)
{
    a = instance_create(x,y,objBullet01);
    a.direction = i + Angle;
    a.speed = 10;
}

Angle += AngleSpd;
AngleSpd += 2 * sign(hspeed);

