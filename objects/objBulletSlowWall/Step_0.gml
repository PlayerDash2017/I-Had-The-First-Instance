if (global.count mod 3 == 0){
    a = instance_create(x,y,objBulletTail);
    a.Type = "Scale";
    a.Spd = 1/12;
    a.sprite_index = sprite_index;
    a.image_angle = image_angle;
    a.image_index = image_index;
    a.image_xscale = image_xscale;
    a.image_yscale = image_yscale;
    a.direction = direction + 180 + random_range(-10,10);
    a.speed = random_range(5,10);
}

