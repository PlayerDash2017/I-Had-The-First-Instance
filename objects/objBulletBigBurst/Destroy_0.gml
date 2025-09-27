if (!Effect) exit;

repeat(20){
    a = instance_create(x,y,objBulletTail);
    a.Type = "Scale";
    a.sprite_index = sprite_index;
    a.image_index = image_index;
    a.image_xscale = image_xscale;
    a.image_yscale = image_yscale;
    a.gravity_direction = 90 + random_range(-20,20);
    a.gravity = random(1);
}

