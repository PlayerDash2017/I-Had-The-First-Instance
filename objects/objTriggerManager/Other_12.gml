/// @description Trigger first frame

with (inst._currentTrigger)
{
    //Reset or destroy the trigger previously controlling the instance
    other.x = x;
    other.y = y;
    if (!triggerOnce)
    {
        triggered = false;
        global.trigger[? trg] = false;
        
        movetoT = 0;
        fadeT = 0;
        scaleT = 0;
        delay = delaystart;
    }
    else
    {
        instance_destroy();
    }
}
inst._currentTrigger = id;

global.makingTrigger = false;
for (var i = 0; i < doTriggersSize; i++)
{    
    var script = doTriggers[| i];
    script_execute(script, "init");
}

triggered = true;

