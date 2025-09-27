//Set in creation code
trg = 0;
spd = 0; //used for most movement options
triggerOnce = true;
delay = 0;

//Internal
global.makingTrigger = false;
doTriggers = ds_list_create();
for (var i = 0; i < ds_list_size(global.triggers); i++)
{
    var script = global.triggers[| i];
    script_execute(script, "define");
}

delaystart = 0;
_hspeed = 0;
_vspeed = 0;
_gravity = 0;
_gravity_direction = 0;
_speed = 0;
_direction = 0;

hasExclusive = false;
init = false;
inst = -1;
triggered = false;
doTriggersSize = 0;
abort = false;

