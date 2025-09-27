/// @description Trigger step

global.makingTrigger = false;
for (var i = 0; i < doTriggersSize; i++)
{
    if (!abort)
    {
        var script = doTriggers[| i];
        script_execute(script, "step");
    }
}

