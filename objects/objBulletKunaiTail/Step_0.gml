if (global.count mod 2 == 0){
    a = instance_create(x,y,objBulletTail);
    a.Type = "Scale";
    a.Spd = 1/5;
    a.sprite_index = sprite_index;
    a.image_angle = image_angle;
    a.image_index = image_index;
    a.speed = random(2);
    a.direction = direction - 180 + irandom_range(-2,2);
}

