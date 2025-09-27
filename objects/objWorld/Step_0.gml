#region Game checks - Pause, restart

global.count ++;
scrCheckAndSwitchController();

if (global.gameStarted)
{
    scrCheckAndPause();
    
    if (!global.gamePaused)
    {
        if (scrButtonCheckPressed(KEY.RESTART))
        {
            //Stop death sound/music
            audio_stop_sound(global.deathSound);
            audio_stop_sound(global.gameOverMusic);
            
            //Resume room music
            audio_resume_sound(global.currentMusic);
            
            //Return to old gain if music is being faded out
            if (global.musicFading)
            {
                global.musicFading = false;
                audio_sound_gain(global.currentMusic, global.currentGain,0);
                alarm[0] = -1;   //Reset alarm that pauses music
            }
            
            scrSaveGame(false);    //Save death/time
            scrLoadGame(false);    //Load the game
        }
        
        if ( (global.timeWhenDead || instance_exists(objPlayer)) && !(!global.timeWhenCleared && global.gameClear) )    //Increment timer
        {
            global.timeMicro += delta_time;
            global.time += global.timeMicro div 1000000;
            global.timeMicro = global.timeMicro mod 1000000;
        }
    }
    else    //Volume control
    {
        var inPauseOptions = instance_exists(objOptionsMenu) || instance_exists(objKeyboardControlsMenu) || instance_exists(objControllerMenu);

        if (!inPauseOptions)
        {        
            var vPressed = (scrButtonCheckPressed(KEY.UP) - scrButtonCheckPressed(KEY.DOWN));                
            var v = (scrButtonCheck(KEY.UP) - scrButtonCheck(KEY.DOWN));
            
            if (vPressed != 0)
            {
                global.volumeLevel += vPressed;
                volumeTimer = volumeDelay;
            }
            if (v != 0)
            {
                if (volumeTimer <= 0)
                {
                    global.volumeLevel += v;
                }
                volumeTimer--;
            }
            
            global.volumeLevel = clamp(global.volumeLevel, 0, 100);
            audio_master_gain(global.volumeLevel / 100);
            
            if (scrButtonCheckPressed(KEY.MENU_OPTIONS))
            {
                instance_create(0, 0, objOptionsMenu);
            }
        }
    }
    
    scrSetRoomCaption();
}
else if (room == rDifficultySelect)    //Special case for restarting in difficulty select
{
    if (scrButtonCheckPressed(KEY.RESTART))
    {
        //Stop death sound/music
        audio_stop_sound(global.deathSound);
        audio_stop_sound(global.gameOverMusic);
        
        //Resume room music
        audio_resume_sound(global.currentMusic);
        
        //Return to old gain if music is being faded out
        if (global.musicFading)
        {
            global.musicFading = false;
            audio_sound_gain(global.currentMusic, global.currentGain,0);
            alarm[0] = -1;   //Reset alarm that pauses music
        }
    
        instance_destroy(objPlayer);
        room_restart();
    }
}

#endregion

#region Debug + update keys

if (global.debugMode && global.gameStarted && !global.gamePaused)
{
    if (keyboard_check(vk_tab))    //Teleport to mouse
    {
        with (objPlayer)
        {
            if (place_free(mouse_x, mouse_y))
            {
                x = mouse_x;
                y = mouse_y - vspeed;
            }
        }
    }
    
    if (keyboard_check(vk_control) && keyboard_check_pressed(vk_backspace))    //Toggle debug overlay
    {
        global.debugOverlay = !global.debugOverlay;
    }
    
    if (keyboard_check_pressed(vk_insert))    //Save game
    {
        with (objPlayer)
        {
            scrSaveGame(true);
            var snd = audio_play_sound(sndItem, 0, false);
            audio_sound_gain(snd, 0.5, 0);
        }
    }
    
    if (keyboard_check_pressed(vk_delete))    //Toggle showing the hitbox
    {
        global.debugShowHitbox = !global.debugShowHitbox;
    }
    
    if (keyboard_check_pressed(vk_home))    //Toggle god mode
    {
        global.debugNoDeath = !global.debugNoDeath;
    }
    
    if (keyboard_check_pressed(vk_end))    //Toggle infinite jump
    {
        global.debugInfJump = !global.debugInfJump;
    }
    
    if (keyboard_check_pressed(vk_pageup) && room != room_last)    //Go to next room
    {        
        global.noPause = false;
        instance_destroy(objPlayer);
        room_goto_next();
    }
    
    if (keyboard_check_pressed(vk_pagedown) && room != room_first)    //Go to previous room
    {
        global.noPause = false;
        instance_destroy(objPlayer);
        room_goto_previous();
    }
}

if (global.debugVisuals)
{
    with (objPlayer)    //Player debug visuals
    {
        if (global.debugNoDeath)    //God mode -> transparent player
            { image_alpha = 0.7; }
        else
            { image_alpha = 1; }
        
        if (global.debugInfJump)    //Inf jump -> blue player
            { image_blend = c_blue; }
        else
            { image_blend = c_white; }
    }
}

if (!global.isUpToDate && !global.gameStarted)
{
    if (keyboard_check_pressed(vk_tab))
    {
        url_open(global.newestVersionLink);
    }
}

#endregion

#region Function keys

if (keyboard_check_pressed(vk_escape))
{
    game_end();
}

if (keyboard_check_pressed(vk_f2))
{
    scrRestartGame();
    exit;
}

if (keyboard_check_pressed(vk_f4) && !global.gamePaused) //Toggle fullscreen mode
{
    global.fullscreenMode = !global.fullscreenMode;
    window_set_fullscreen(global.fullscreenMode);
    scrSaveConfig();
}

if (keyboard_check_pressed(vk_f5) && !global.gamePaused) //Reset window size
{
    scrResetWindowSize();
}

if (keyboard_check(vk_control) && keyboard_check_pressed(ord("M")) && !global.gamePaused) //Toggle mute music setting
{
    scrToggleMusic();
    scrSaveConfig();
}

#endregion