x = 400 + lengthdir_x(400,Time);

Time += Spd;

if (global.count mod 2 == 0 && abs(Spd) > 2){
    a = instance_create(x,y,objBulletTail);
    a.Type = "Scale";
    a.Spd = 1/random_range(2,5);
    a.sprite_index = sprite_index;
    a.image_index = image_index;
    a.speed = random(1.5);
    a.image_xscale = image_xscale;
    a.image_yscale = image_yscale;
    a.image_alpha = 0.8;
    a.direction = direction - 180 + irandom_range(-10,10);
}

