if (global.strictSaveBlockers && place_meeting(x, y, objSaveBlocker))
{
    instance_destroy();
    exit;
}

with(objTriggerButtonR)
{
    if (place_meeting(x, y, other))
    {
        event_user(0);
    }
}

//Get the bullet's direction based off the direction the player is facing
var bulletDir;
if (instance_exists(objPlayer))
    bulletDir = objPlayer.xScale;
else
    bulletDir = 1;

//Set the bullet's speed
hspeed = bulletDir * 16;

alarm[0] = 40;

