image_alpha -= 1/50;

if (global.practiceMode && keyboard_check_pressed(vk_backspace)){
    global.practiceMode = false;
    instance_destroy(objPlayer);
    global.autosave = true;
    audio_stop_sound(global.deathSound);
    audio_stop_sound(global.gameOverMusic);
    room_goto(rWaiting);
}

