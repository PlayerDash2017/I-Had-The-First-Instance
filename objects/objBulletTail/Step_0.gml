switch (Type)
{
    case "Scale":
        image_xscale -= Spd;
        image_yscale = image_xscale;
        
        if (image_xscale < 0) instance_destroy();
    break;
    case "Alpha":
        image_alpha -= Spd;
        
        if (image_alpha < 0) instance_destroy();
    break;
    case "ScaleAlpha":
        image_xscale += sclSpd;
        image_yscale = image_xscale;
        
        image_alpha -= alpSpd;
        if (image_alpha < 0) instance_destroy();
    break;
    default:
    instance_destroy();
}

