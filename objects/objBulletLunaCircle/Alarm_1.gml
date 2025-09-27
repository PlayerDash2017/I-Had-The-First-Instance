alarm[1] = 30;

var XX = irandom(800);
repeat(6){
    a = instance_create(XX,0,objBulletMiniBurst);
    a.speed = random_range(9,12);
    a.direction = -irandom(180);
    
    if (Count < 2){
        a.mask_index = sprEmpty;
        a.image_alpha = 0.5;
    }
}
repeat(6){
    a = instance_create(XX,0,objBulletFakeAlp);
    a.speed = random_range(9,12);
    a.direction = -irandom(180);
    
    if (Count < 2) a.image_alpha = 0.5;
}

Count ++;

/*repeat(10){
    a = instance_create(x,y,objBullet01);
    a.speed = random_range(9,12);
    a.direction = irandom(360);
    a.sprite_index = sprBulletRazzor;
    a.image_xscale = random_range(0.3,0.6);
    a.image_yscale = a.image_xscale;
    a.image_index = 32;
    
    if (Count < 2){
        a.mask_index = sprEmpty;
        a.image_alpha = 0.5;
    }
}

Count ++;

/* */
/*  */
