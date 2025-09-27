/// @description scrSaveConfig()
///Saves current config settings
function scrSaveConfig() {

	ini_open("config.ini");

	//Settings
	ini_write_real("Settings", "Mute_music",        global.muteMusic);
	ini_write_real("Settings", "Volume_level",      global.volumeLevel);
	ini_write_real("Settings", "Fullscreen_mode",   global.fullscreenMode);
	ini_write_real("Settings", "Smoothing_mode",    global.smoothingMode);
	ini_write_real("Settings", "Vsync_mode",        global.vsyncMode);

	scrControls("saveKeyboardConfig");

	if (global.controllerEnabled)
	{                        
	    scrControls("saveControllerConfig");
	}

	ini_write_real("InGame", "Godzilla_gameover",   global.nesGodzilla);
	ini_write_real("InGame", "Godzilla_skin",		global.godzillaSkin);

	ini_close();
}
