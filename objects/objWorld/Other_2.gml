/// @description Initialize everything

scrInitializeGlobals();
scrLoadConfig();

if (global.checkForUpdates)
{
    global.httpUpdateCheck = http_get(global.versionDataUrl);
    updateString = "";
}

volumeTimer = 0;
volumeDelay = 10;

room_goto_next();

