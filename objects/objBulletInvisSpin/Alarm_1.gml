alarm[1] = 30;

for (var i = 0; i < 360; i += 360/9)
{
    a = instance_create(x,y,objBulletKunaiTail);
    a.direction = i + Angle;
    a.speed = 12;
    a.Cur = 0.2 * sign(hspeed);
}

