#region Resolve collisions between step and now, collide with dynamic blocks

if (!place_free(x, y))
{
    var dirX = sign(x-xsafe);
    var dirY = sign(y-ysafe);
    var epsilon = 0.001; //Appease the floating point gods
    
    //If something moved the player into a block since Step, move back towards where we were until we're out of a block.
    while(!place_free(x, y))
    {
        if (dirX * (x - xsafe) >= epsilon)
        {
            x -= sign(x-xsafe) * min( abs(x-xsafe), 1 );
        }
        else if (dirY * (y - ysafe) >= epsilon)
        {
            y -= sign(y-ysafe) * min( abs(y-ysafe), 1 );
        }
        else break;
    }
}

if (global.blocksCrush)
{
    scrDynamicCollision(false, scrKillPlayer);
}
else
{
    scrDynamicCollision(false);
}

#endregion

#region Killer collision

var killer = instance_place(x, y, objPlayerKiller)
if (killer != noone)
{
    scrKillPlayer();
}

#endregion

#region Screen border death, player animation

if ((bbox_right < 0 || bbox_left > room_width || bbox_bottom < 0 || bbox_top > room_height) && global.edgeDeath)
{
    scrKillPlayer();
}


var notOnBlock = (place_free(x, y + global.grav));
var onVineR = (place_meeting(x + 1, y, objVineR) && notOnBlock);
var onVineL = (place_meeting(x - 1, y, objVineL) && notOnBlock);

if (keyboard_check_pressed(ord("1"))){
	global.godzillaSkin = !global.godzillaSkin;
	scrSaveConfig();
	audio_play_sound(sndSelect,0,0);
}

var skinName = "Player";
if (global.godzillaSkin) skinName = "Godzilla";

if (!onVineR && !onVineL)   //Not touching any vines
{
    if (onPlatform || !notOnBlock)  //Standing on something
    {
        //Check if moving left/right
        var L = (scrButtonCheck(KEY.LEFT) || (global.directionalTapFix && scrButtonCheckPressed(KEY.LEFT)));
        var R = (scrButtonCheck(KEY.RIGHT) || (global.directionalTapFix && scrButtonCheckPressed(KEY.RIGHT)));
        
        if ((L || R) && !frozen)
        {
            sprite_index = scrPlayerSkin(skinName,"Run") //sprPlayerRun;
            image_speed = 1/2;
        }
        else
        {
            sprite_index = scrPlayerSkin(skinName,"Idle") //sprPlayerIdle;
            image_speed = 1/5;
        }
    }
    else    //In the air
    { 
        if ((vspeed * global.grav) < 0)
        {
            sprite_index = scrPlayerSkin(skinName,"Jump") //sprPlayerJump;
            image_speed = 1/2;
        }
        else
        {
            sprite_index = scrPlayerSkin(skinName,"Fall") //sprPlayerFall;
            image_speed = 1/2;
        }
    }
}
else    //Touching a vine
{
    sprite_index = sprPlayerSlide;
    image_speed = 1/2;
}

#endregion