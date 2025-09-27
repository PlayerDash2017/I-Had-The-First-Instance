options[0] = 0;
numberOfOptions = 0;
for(var i = 0; i < ds_list_size(global.options); i++)
{
    var script = global.options[| i];
    if (script_execute(script, "include"))
    {
        options[numberOfOptions] = script;
        numberOfOptions++;
    }
}

select = global.menuSelectPrev[1];

xMargin = 124;
yStep = 48;

animationTime = 0;

