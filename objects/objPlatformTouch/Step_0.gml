if (speed == 0 && instance_exists(objPlayer))
{
    if (place_meeting(x, y - objPlayer.vspeed - global.grav, objPlayer))
    {
        hspeed = h;
        vspeed = v;
    }
}
event_inherited();    //platform code

