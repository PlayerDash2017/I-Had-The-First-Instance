vspeed = 0.5;
global.gameOverMusic = audio_play_sound(musOnDeathGodzilla, 1, false);

alarm[1] = 1;

Gameover = instance_create(0, 0, objGameOver);
Gameover.alarm[0] = 50*6;

