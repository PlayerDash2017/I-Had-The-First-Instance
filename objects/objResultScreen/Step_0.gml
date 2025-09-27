if (End){
    if (global.hitCount || global.practiceMode){
        textAlpha += 1/75;
    } else {
        fadeAlpha += 1/200;
        
        if (fadeAlpha > 1.1){
            instance_destroy(objPlayer);
            room_goto(rClear);
        }
    }
}

