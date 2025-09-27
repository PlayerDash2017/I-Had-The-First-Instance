/// @description Init

global.trigger[? trg] = !!global.trigger[? trg];
global.makingTrigger = false;

for (var i = 0; i < ds_list_size(global.triggers); i++)
{
    var script = global.triggers[| i];
    if (script_execute(script, "exclusive"))
    {
        if (!hasExclusive && script_execute(script, "isUsed"))
        {
            hasExclusive = true;
            ds_list_add(doTriggers, script);
        }
    }
    else if (script_execute(script, "isUsed"))
    {
        ds_list_add(doTriggers, script);
    }
}

doTriggersSize = ds_list_size(doTriggers);

