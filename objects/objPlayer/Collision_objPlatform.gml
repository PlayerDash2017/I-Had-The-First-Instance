/// @description Land on platforms, get snapped
//Being carried upwards is handled in objPlatform

if (global.grav == 1)    //Normal
{
    var landedOnPlatform = bbox_bottom - vspeed - 1 <= other.bbox_top - min(other.vspeed, 0);
    var jumpedOut = bbox_bottom + vspeed <= other.bbox_top + other.vspeed;
    
    if (landedOnPlatform || (jumpedOut && other.snap))
    {
        var yy = other.y - (bbox_bottom - y);
        if (!global.platformsPhase)
        {
            move_contact_solid(90, round(y - yy) + 5); //Move against solid to not get snapped into a wall
        }
        else
        {
            y = round(yy + 0.5);
            ysafe = y;
        }
        vspeed = max(other.vspeed, 0);
        
        onPlatform = true;
        djump = 1;
    }
}
else    //Flipped
{
    var landedOnPlatform = bbox_top - vspeed + 1 >= other.bbox_bottom - max(other.vspeed, 0);
    var jumpedOut = bbox_top + vspeed >= other.bbox_bottom + other.vspeed;
    
    if (landedOnPlatform || (jumpedOut && other.snap))
    {
        var yy = other.y + other.sprite_height + (y - bbox_top);
        if (!global.platformsPhase)
        {
            move_contact_solid(270, yy - y);
        }
        else
        {
            y = yy;
            ysafe = y;
        }
        vspeed = min(other.vspeed, 0);
        
        onPlatform = true;
        djump = 1;
    }
} 

