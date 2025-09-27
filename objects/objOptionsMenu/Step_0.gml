animationTime++;

if (scrButtonCheckPressed(KEY.MENU_BACK) || scrButtonCheckPressed(KEY.MENU_OPTIONS))
{
    //Save changes and go back
    scrSaveConfig();
    global.menuSelectPrev[1] = 0;
    if (!global.gameStarted)
    {
        room_goto(rMenu);
    }
    else
    {
        instance_destroy();
    }
    exit;
}

if (numberOfOptions == 0)
{
    exit;
}

var vInputPressed = scrButtonCheckPressed(KEY.MENU_DOWN) - scrButtonCheckPressed(KEY.MENU_UP);
if (vInputPressed != 0)
{
    script_execute(options[select], "end");

    //Move to next/previous option
    select += vInputPressed;
    select = scrWrapInRange(select, 0, numberOfOptions - 1);
    audio_play_sound(global.menuSound, 0, false);
    script_execute(options[select], "init");
}

var selected = options[select];
script_execute(selected, "step");

