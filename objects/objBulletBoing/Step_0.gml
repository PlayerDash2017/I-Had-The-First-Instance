if (y > 400 && vspeed >= 0 && !Boing){
    Boing = true;
    mask_index = sprite_index;
    vspeed = -vspeed*0.9;
}

image_alpha += 1/80;//50

