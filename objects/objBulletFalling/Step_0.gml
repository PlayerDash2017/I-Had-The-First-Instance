if (YY != -1){
    y = lerp(y,YY,0.3);
    x = scrWrapInRange(x,0,800);
} else {
    if (global.count mod 2 == 0){
        a = instance_create(x,y,objBulletTail);
        a.Type = "Alpha";
        a.Spd = 1/10;
        a.sprite_index = sprite_index;
        a.image_angle = image_angle;
        a.image_index = image_index;
        a.image_xscale = image_xscale;
        a.image_yscale = image_yscale;
        a.direction = 90 + random_range(-5,5);
        a.speed = random(1);
    }
    /*if (global.count mod 2 == 0){
        a = instance_create(x,y,objBulletTail);
        a.Type = "Scale";
        a.sprite_index = sprite_index;
        a.image_angle = image_angle;
        a.image_index = image_index;
        a.image_xscale = image_xscale;
        a.image_yscale = image_yscale;
        a.direction = 90 + random_range(-10,10);
        a.speed = random_range(10,15);
    }*/
}

/* */
/*  */
