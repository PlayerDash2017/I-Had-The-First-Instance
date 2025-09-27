if (instance_exists(objPlayer)){
    if (keyboard_check_pressed(ord("S"))){
        scrSaveGame(true);
        audio_stop_sound(sndItem);
        audio_sound_gain(audio_play_sound(sndItem,0,0),0.5,0);
        instance_create(scrPX()-16,scrPY()-16,objSaveWaiting);
    }
    
    if (keyboard_check_pressed(ord("H"))){
        audio_play_sound(sndSelect,0,0);
        global.hitCount = !global.hitCount;
    }
}

