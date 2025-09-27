if (Active)
{
    if (scrButtonCheckPressed(KEY.SHOOT)){
        Active = false;
        with(objPlayer){
            frozen = false;
            gravity = 0.4;
        }
        exit;
    }
    
    if (scrButtonCheckPressed(KEY.JUMP)){
        setTimer = timeLine[Index];
        autosave = true;
        roomTo = rPractice;
        global.practiceMode = true;
        event_user(0);
        exit;
    }
    
    var v = scrButtonCheckPressed(KEY.DOWN) - scrButtonCheckPressed(KEY.UP);
    if (v != 0){
        Index = scrWrapInRange(Index + v,0,Total-1);
        audio_play_sound(sndSelect,0,0);
    }
}

if (!place_meeting(x,y,objPlayer)){
    Touch = false;
}

