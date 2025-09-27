if (global.count mod 3 == 0){
    a = instance_create(x,y,objBulletTail);
    a.Type = "Alpha";
    a.Spd = 1/10;
    a.sprite_index = sprite_index;
    a.image_angle = image_angle;
    a.image_index = image_index;
    a.image_alpha = image_alpha;
}

