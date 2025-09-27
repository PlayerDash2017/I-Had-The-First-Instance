a = instance_create(x,y,objBullet01);
a.speed = random_range(7,8);
a.direction = point_direction(x,y,400,304) + 90 * Dir;
a.image_xscale = random_range(0.5,0.6);
a.image_yscale = a.image_xscale;
a.sprite_index = sprBulletRazzor;
a.image_index = 32;

alarm[0] = 5;

