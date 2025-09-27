if (x + hspeed < 0 || x + hspeed > 800) hspeed = -hspeed;
if (y + vspeed < 0 || y + vspeed > 608) vspeed = -vspeed;

if (speed != 0){
    image_alpha = max(image_alpha - 1/15,0.5);
}

if (Destroy){
    image_xscale -= 1/5;
    image_yscale = image_xscale;
    if (image_xscale < 0) instance_destroy();
}

