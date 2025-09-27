event_inherited();

if (Speed){
    if (global.count mod 2 == 0){
        a = instance_create(x,y,objBulletTail);
        a.Type = "Scale";
        a.sprite_index = sprite_index;
        a.image_angle = image_angle;
        a.image_index = image_index;
        a.image_alpha = image_alpha;
    }
}

