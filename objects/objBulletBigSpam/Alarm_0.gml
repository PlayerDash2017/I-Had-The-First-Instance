if (speed == 0){
    hspeed = sign(x-400)*1.5;
    vspeed = 0.2;
}

repeat(2){
    a = instance_create(x,y,objBullet01);
    a.direction = -irandom(180);
    a.speed = random_range(10,15);
}

for (var i = 0; i < 360; i += 360/10)
{
    a = instance_create(x,y,objBullet01);
    a.direction = i + point_direction(x,y,scrPX(),scrPY()) + (360/10)/2;
    a.speed = irandom_range(21,25);
}


alarm[0] = 2;

