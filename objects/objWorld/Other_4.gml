/// @description Set music, framerate, and window caption

if (!instance_exists(objPlayMusic))
{
    scrGetMusic();
}

room_speed = 50;
global.count = 0;
global.hit = 0;
scrSetRoomCaption();

