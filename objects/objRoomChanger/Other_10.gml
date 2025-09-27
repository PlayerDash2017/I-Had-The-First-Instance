/// @description Teleport player

if (warpX == 0 && warpY == 0)
{
    with(objPlayer)
    {
        instance_destroy();
    }
}
else
{
    objPlayer.x = warpX;
    objPlayer.y = warpY;
}

if (autosave && global.difficulty < 3)  //make sure we're on a difficulty lower than impossible before autosaving
{
    global.autosave = true;
}

global.startTimer = setTimer;
room_goto(roomTo);

