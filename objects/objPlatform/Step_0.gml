/// @description Bounce off walls, carry the player horizontally and upwards

if (speed != 0)
{
    if (bounce)
    {
        if (!place_free(x + hspeed, y))
            { hspeed = -hspeed; }
        if (!place_free(x, y + vspeed)) 
            { vspeed = -vspeed; }
    }
    
    with (instance_place(x, y - (2*global.grav), objPlayer))
    {
        if ((bbox_bottom <= other.bbox_top || bbox_top >= other.bbox_bottom) && (global.grav * vspeed) >= (global.grav * other.vspeed))
        {
            if (place_free(x + hspeed + other.hspeed, y))
            {
                x += other.hspeed;
            }
            if (global.grav == -sign(other.vspeed))
            {
                if (!place_free(x, y + other.vspeed))
                {
                    if (!global.platformsPhase)
                    {
                        scrKillPlayer();
                    }
                }
                else
                {
                    y += other.vspeed;            
                }
            }
        }
    }
}

