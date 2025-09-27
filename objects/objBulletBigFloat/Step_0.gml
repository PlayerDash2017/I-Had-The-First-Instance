x = 400 + lengthdir_x(300,global.count*12 + Offset);
y = 100 + lengthdir_y(50,global.count*12 + Offset);

image_angle = point_direction(x,y,400,100) - 90;
image_yscale = 0.8 + lengthdir_x(0.2,global.count*10 + Ani);

if (global.count mod 2 == 0){
    a = instance_create(x,y,objBulletTail);
    a.Type = "Scale";
    a.sprite_index = sprite_index;
    a.image_angle = image_angle;
    a.image_index = image_index;
}

switch (objMainAvoidance.Timer)
{
    case 1142: case 1162: case 1185:
    case 1207: case 1227: case 1254:
    case 1280: case 1305: case 1328:
    case 1350:
        var Ran = irandom(360);
        repeat(4){
            a = instance_create(400,100,objBulletMiniBurst);
            a.speed = random_range(11,14);
            a.direction = -irandom(180);
            a.Scale = random_range(0.5,0.7)
        }
        /*for (var i = 0; i < 360; i += 360/8)
        {
            a = instance_create(x,y,objBullet01);
            a.speed = random_range(11,12);
            a.direction = i + Ran
            a.image_xscale = random_range(0.4,0.6);
            a.image_yscale = a.image_xscale;
            a.sprite_index = sprBulletRazzor;
            a.image_index = 32;
        };*/
    break;
}

/* */
/*  */
