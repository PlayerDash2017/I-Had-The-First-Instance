alarm[0] = 2;

a = instance_create(x,y,objBullet01);
a.speed = Spd;
a.direction = point_direction(400,100,x,y);

/*var Spd = 10;
repeat(2){
    a = instance_create(x,y,objBullet01);
    a.speed = Spd;
    a.direction = point_direction(400,100,x,y);
    Spd = 25;
}

/* */
/*  */
