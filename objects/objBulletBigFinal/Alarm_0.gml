alarm[0] = 2;

for (var i = 0; i < 360; i += 360/3){
    a = instance_create(x,y,objBulletOutsideView);
    a.speed = 15;
    a.direction = Angle + i;
}

Angle += AngleSpd * sign(Spd);
AngleSpd += 2;

