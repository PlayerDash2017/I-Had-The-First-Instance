hspeed = _hspeed;
vspeed = _vspeed;
gravity = _gravity;
gravity_direction = _gravity_direction;


if (!instance_exists(inst))
{
    //Destroy self if triggered instance no longer exists for any reason.
    instance_destroy();
    exit;
}

if (!init)
{
    //Initialize internal variables on the first frame.
    event_user(0);
    init = true;
}

if (!triggered && global.trigger[? trg])
{
    //Just got activated - start delay.
    triggered = true;
    delaystart = delay;
}

if (triggered && delay >= 0)
{
    if (delay == 0)
    {
        //Delay ended - start moving.
        event_user(2);
    }
    delay--;
}

if (triggered && delay == -1)
{
    //Already activated, update movement.
    event_user(3);
}

motion_add(gravity_direction, gravity);
x += hspeed;
y += vspeed;  

_hspeed = hspeed;
_vspeed = vspeed;
_gravity = gravity;
_gravity_direction = gravity_direction;

hspeed = 0;
vspeed = 0;
gravity = 0;
gravity_direction = 0;

event_user(1);

