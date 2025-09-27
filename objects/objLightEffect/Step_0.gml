image_alpha += spd * instance_exists(objPlayer);

if (image_alpha < 0 && spd < 0)
    { instance_destroy(); }
else if (image_alpha > 1 && spd > 0)
    { image_alpha = 1; }

