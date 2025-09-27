event_inherited();

image_xscale = max(image_xscale - 1/5,1);
image_yscale = image_xscale;

if (speed > 12){
    speed = 12;
    friction = 0;
}

