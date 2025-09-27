if (friction == 0 && global.count mod 2 == 0){
    a = instance_create(x,y,objBulletTail);
    a.Type = "Alpha";
    a.sprite_index = sprite_index;
    a.image_angle = image_angle;
    a.image_index = image_index;
}

if (y > 800) instance_destroy();

