/// @description Autosave

if (global.autosave) //Save the game if currently set to autosave
{
    scrSaveGame(true);
    global.autosave = false;
}

if (room == rWaiting) runSpeed = 5;

