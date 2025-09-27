/// @description Move affected instance

if (!instance_exists(inst))
{
    instance_destroy();
    exit;
}

if !(triggered && delay == -1) //Follow assigned instance until the trigger is active
{
    x = inst.x;
    y = inst.y;
    
    if (scrUsesTrigger(trgStretch))
    {
        image_xscale = inst.image_xscale;
        image_yscale = inst.image_yscale;
    }
    
    if (scrUsesTrigger(trgRotate))
    {
        image_angle = inst.image_angle;
    }
}
else //Move assigned instance to own position
{
    if (hasExclusive)
    {
        inst.hspeed = x - inst.x;
        inst.vspeed = y - inst.y;
    }
    
    if (scrUsesTrigger(trgFade))
    {
        inst.image_alpha = image_alpha;
        if (fadeType == "in")
        {
            inst.mask_index = mask_index;
        }
    }
    
    if (scrUsesTrigger(trgStretch))
    {
        if (!is_undefined(xscale))
        {
            inst.image_xscale = image_xscale;
        }
        if (!is_undefined(yscale))
        {
            inst.image_yscale = image_yscale;
        }
    }
    
    if (scrUsesTrigger(trgRotate))
    {
        inst.image_angle = image_angle;
    }
}

