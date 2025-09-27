repeat(2){
    a = instance_create(x,y,objBullet01);
    a.speed = random_range(10,12);
    a.direction = irandom(360);
    a.image_xscale = random_range(0.5,0.8);
    a.image_yscale = a.image_xscale;
    a.sprite_index = sprBulletRazzor;
    a.image_index = 32;
}

alarm[0] = 3;

