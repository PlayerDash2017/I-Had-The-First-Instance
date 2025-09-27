/// @description Stay with the player

if (instance_exists(objPlayer))
{
    x = objPlayer.x;
    y = objPlayer.y;
    image_xscale = objPlayer.xScale;
    
    if (global.grav == 1)   //Normal
    {
        image_yscale = 1;
    }
    else    //Flipped
    {
        image_yscale = -1;
        y += 1; //Need to draw the sprite a pixel off when flipped
    }
}
else
{
    instance_destroy();
}

