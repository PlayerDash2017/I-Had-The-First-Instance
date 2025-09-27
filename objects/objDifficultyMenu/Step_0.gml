/// @description Navigate menu

animationIndex++;

if (scrButtonCheckPressed(KEY.MENU_OPTIONS))
{
    global.menuSelectPrev[0] = savefileSelect;
    room_goto(rOptions);
    exit;
}

//Select which savefile or return to title
if (!fileSelected)
{
    if (scrButtonCheckPressed(KEY.MENU_LEFT))
    {
        audio_play_sound(global.menuSound, 0, false);
        savefileSelect -= 1;
        if (savefileSelect < 0)
            savefileSelect = 2;
    }
    else if (scrButtonCheckPressed(KEY.MENU_RIGHT))
    {
        audio_play_sound(global.menuSound, 0, false);
        savefileSelect += 1;
        if (savefileSelect > 2)
            savefileSelect = 0;
    }
    else if (scrButtonCheckPressed(KEY.MENU_BACK))
    {
        global.menuSelectPrev[0] = 0;
        room_goto(rTitle);
    }
    else if (scrButtonCheckPressed(KEY.MENU_ACCEPT))
    {
        if (global.menuMode == 0)   //Difficulty select room
        {
            global.savenum = savefileSelect+1;
            room_goto(rDifficultySelect);
        }
        else    //Difficulty select menu
        {
            fileSelected = true;
            if (exists[savefileSelect]) //Default to Load game if file exists
                difficultySelect = -1;
            else
                difficultySelect = 0;
        }
    }
}
//Select option in savefile
else
{
    if (!warningShow)    //Not currently showing yes/no confirmation
    {                                                                                            
        if (scrButtonCheckPressed(KEY.MENU_LEFT))
        {
            audio_play_sound(global.menuSound, 0, false);
            difficultySelect -= 1;
            difficultySelect = scrWrapInRange(difficultySelect, -exists[savefileSelect], global.difficultyCount - 1);
        }
        else if (scrButtonCheckPressed(KEY.MENU_RIGHT))
        {
            audio_play_sound(global.menuSound, 0, false);
            difficultySelect += 1;
            difficultySelect = scrWrapInRange(difficultySelect, -exists[savefileSelect], global.difficultyCount - 1);
        }
        else if (scrButtonCheckPressed(KEY.MENU_BACK))
        {
            fileSelected = false;
        }
        else if (scrButtonCheckPressed(KEY.MENU_ACCEPT))
        {
            global.savenum = savefileSelect+1;
            
            if (difficultySelect == -1)    //Load game
            {
                if (file_exists("Data\\save" + string(global.savenum)))
                    scrLoadGame(true);
            }
            else    //Starts new game
            {
                if (!file_exists("Data\\save" + string(global.savenum)))
                {
                    scrStartNewGame(difficultySelect);
                }
                else
                {
                    warningShow = true;
                    warningSelectYes = true;
                }
            }
        }
    }
    else
    {
        if (scrButtonCheckPressed(KEY.MENU_LEFT))
        {
            audio_play_sound(global.menuSound, 0, false);
            warningSelectYes = !warningSelectYes;
        }
        else if (scrButtonCheckPressed(KEY.MENU_RIGHT))
        {
            audio_play_sound(global.menuSound, 0, false);
            warningSelectYes = !warningSelectYes;
        }
        else if (scrButtonCheckPressed(KEY.MENU_BACK))
        {
            warningShow = false;
        }
        else if (scrButtonCheckPressed(KEY.MENU_ACCEPT))
        {
            if (warningSelectYes)
            {
                scrStartNewGame(difficultySelect);
            }
            else
            {
                warningShow = false;
            }
        }
    }
} 

