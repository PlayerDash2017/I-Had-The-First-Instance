if (!settingButton)
{
    //Not currently rebinding a key, navigate options
    if (scrButtonCheckPressed(KEY.MENU_BACK))
    {
        //Save changes and go back
        scrSaveConfig();
        instance_create(x, y, objOptionsMenu);
        instance_destroy();
    }
    
    if (scrButtonCheckPressed(KEY.MENU_OPTIONS))
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
    
    var vInputPressed = scrButtonCheckPressed(KEY.MENU_DOWN) - scrButtonCheckPressed(KEY.MENU_UP);
    if (vInputPressed != 0)
    {
        //Move to next/previous option
        audio_play_sound(global.menuSound, 0, false);
        select += vInputPressed;
        select = scrWrapInRange(select, 0, numberOfButtons - 1);
    }
    
    if (scrButtonCheckPressed(KEY.MENU_ACCEPT))
    {
        if (select != 0)
        {
            //Select current option
            if (select != numberOfButtons - 1)
            {
                //Start rebinding
                settingButton = true;
            }
            else
            {
                //Reset controls
                scrControls("setControllerDefault");
                
                showResetPrompt = true;
                alarm[0] = 60;
            }
        }
    }
    
    var hInputPressed = scrButtonCheckPressed(KEY.MENU_RIGHT) - scrButtonCheckPressed(KEY.MENU_LEFT);
    if (hInputPressed != 0 && select = 0)
    {   
        //Change controller index
        global.controllerIndex += hInputPressed;
        global.controllerIndex = scrWrapInRange(global.controllerIndex, -1, 11);
    }
}
else
{
    //Wait for new bind
    var newButton = scrAnyControllerButton();
    if (newButton != -1)
    {                                          
        //Bind new key
        global.controls[select, 1] = newButton;
        settingButton = false;
    }
    else if (keyboard_check_pressed(vk_anykey))
    {
        settingButton = false;
    }
}

//Get current controls
event_user(0);

if (bindName[0] == "-1") bindName[0] = "Disabled";

animationTime++;

