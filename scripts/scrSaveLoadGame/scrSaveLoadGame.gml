/// @function scrSaveGame(savePosition)
/// @description Saves the game
/// @param savePosition sets whether the game should save the player's current location or just save the deaths/time
function scrSaveGame(savePosition) {

	// Save the player's current location variables if the script is currently set to (we don't want to save the player's location if we're just updating death/time)
	if (savePosition) {
	    global.saveRoom = room_get_name(room);
	    global.savePlayerX = objPlayer.x;    
	    global.savePlayerY = objPlayer.y;
	    global.saveGrav = global.grav;
    
	    // Check if the player is saving inside of a wall or in the ceiling when the player's position is floored to prevent save locking
	    with (objPlayer) {
	        if (!place_free(floor(global.savePlayerX),global.savePlayerY)) {
	            global.savePlayerX += 1;
	        }
        
	        if (!place_free(global.savePlayerX,floor(global.savePlayerY))) {
	            global.savePlayerY += 1;
	        }
        
	        if (!place_free(floor(global.savePlayerX),floor(global.savePlayerY))) {
	            global.savePlayerX += 1;
	            global.savePlayerY += 1;
	        }
	    }
    
	    // Floor the player's position to match standard engine behavior
	    global.savePlayerX = floor(global.savePlayerX);
	    global.savePlayerY = floor(global.savePlayerY);
    
	    global.saveGameClear = global.gameClear;
	}

	// Create a map for save data
	var saveMap = ds_map_create();

	ds_map_add(saveMap,"deaths",global.death);
	ds_map_add(saveMap,"time",global.time);
	ds_map_add(saveMap,"timeMicro",global.timeMicro);

	ds_map_add(saveMap,"difficulty",global.difficulty);
	ds_map_add(saveMap,"saveRoom",global.saveRoom);
	ds_map_add(saveMap,"savePlayerX",global.savePlayerX);
	ds_map_add(saveMap,"savePlayerY",global.savePlayerY);
	ds_map_add(saveMap,"saveGrav",global.saveGrav);

	ds_map_add(saveMap,"gameClear",global.saveGameClear);
	
	ds_map_add(saveMap,"timePB",global.timerPB);
	ds_map_add(saveMap,"hitPB",global.hitPB);
	ds_map_add(saveMap,"practiceMode",global.practiceMode);
	ds_map_add(saveMap,"startTimer",global.startTimer);
	
    for (var i = 0; i < global.secretItemTotal; i++)
    {
        ds_map_add(saveMap,"secretItem" + string(i), global.secretItem[i]);
    }
	
    for (var i = 0; i < global.bossItemTotal; i++)
    {
        ds_map_add(saveMap,"bossItem" + string(i), global.bossItem[i]);
    }

	// Add MD5 hash to verify saves and make them harder to hack
	ds_map_add(saveMap,"mapMd5",md5_string_unicode(ds_map_write(saveMap)+global.md5StrAdd));

	// Save the map to a file

	var f = file_text_open_write("Data\\save"+string(global.savenum));
    
	file_text_write_string(f,base64_encode(ds_map_write(saveMap))); // Write map to the save file with base64 encoding
    
	file_text_close(f);

	// Destroy the map
	ds_map_destroy(saveMap);
}

/// @function scrLoadGame(loadFile)
/// @description Loads the game
/// @param loadFile sets whether or not to read the save file when loading the game
function scrLoadGame(loadFile) {

	// Only load save data from the save file if the script is currently set to (we should only need to read the save file on first load because the game stores them afterwards)
	if (loadFile) {
	    // Load the save map
    
	    var f = file_text_open_read("Data\\save"+string(global.savenum));
	
	    var saveMap = ds_map_create();
	    ds_map_read(saveMap,base64_decode(file_text_read_string(f)));
	
	    file_text_close(f);
    
	    var saveValid = true; // Keeps track of whether or not the save being loaded is valid
    
	    if (saveMap != -1) { // Check if the save map loaded properly
	        global.death = ds_map_find_value(saveMap,"deaths");
	        global.time = ds_map_find_value(saveMap,"time");
	        global.timeMicro = ds_map_find_value(saveMap,"timeMicro");
        
	        global.difficulty = ds_map_find_value(saveMap,"difficulty");
	        global.saveRoom = ds_map_find_value(saveMap,"saveRoom");
	        global.savePlayerX = ds_map_find_value(saveMap,"savePlayerX");
	        global.savePlayerY = ds_map_find_value(saveMap,"savePlayerY");
	        global.saveGrav = ds_map_find_value(saveMap,"saveGrav");
        
	        if (is_string(global.saveRoom)) { // Check if the saved room string loaded properly
	            if (!room_exists(asset_get_index(global.saveRoom))) { // Check if the room index in the save is valid
	                saveValid = false;
				}
	        } else {
	            saveValid = false;
	        }
        
			global.saveSecretItem = ds_map_find_value(saveMap,"saveSecretItem");
			global.saveBossItem = ds_map_find_value(saveMap,"saveBossItem");
        
	        global.saveGameClear = ds_map_find_value(saveMap,"gameClear");
			
			global.timerPB = ds_map_find_value(saveMap,"timePB");
			global.hitPB = ds_map_find_value(saveMap,"hitPB");
			global.practiceMode = ds_map_find_value(saveMap,"practiceMode");
			global.startTimer = ds_map_find_value(saveMap,"startTimer");
        
			for (var i = 0; i < global.secretItemTotal; i++)
			{
			    global.secretItem[i] = ds_map_find_value(saveMap,"secretItem" + string(i));
			}

			for (var i = 0; i < global.bossItemTotal; i++)
			{
			    global.bossItem[i] = ds_map_find_value(saveMap,"bossItem" + string(i));
			}

	        // Load MD5 string from the save map
	        var mapMd5 = ds_map_find_value(saveMap,"mapMd5");
        
	        // Check if MD5 is not a string in case the save was messed with or got corrupted
	        if (!is_string(mapMd5)) {
	            saveValid = false; // MD5 is not a string, save is invalid
			} else {
		        // Generate MD5 string to compare with
		        ds_map_delete(saveMap,"mapMd5");
		        var genMd5 = md5_string_unicode(ds_map_write(saveMap)+global.md5StrAdd);
        
				// Check if MD5 hash is invalid
		        if (mapMd5 != genMd5) {
		            saveValid = false;
				}
			}
        
	        // Destroy the map
	        ds_map_destroy(saveMap);
	    } else {
	        // Save map didn't load correctly, set the save to invalid
	        saveValid = false;
	    }
    
	    if (!saveValid) { // Check if the save is invalid
	        // Save is invalid, restart the game
	        show_message("Save invalid!");
			game_restart();
	        exit;
	    }
	}

	// Set game variables and the player's position

	with (objPlayer) { // Destroy the player if it exists
	    instance_destroy();
	}

	global.gameStarted = true; // Sets game in progress (enables saving, restarting, etc.)
	global.noPause = false; // Disable no pause mode
	global.autosave = false; // Disable autosaving since we're loading the game

	global.grav = global.saveGrav;

	global.gameClear = global.saveGameClear;

	// Check if the player's layer exists, if it doesn't then create a temporary layer
	instance_create(global.savePlayerX,global.savePlayerY,objPlayer);

	room_goto(asset_get_index(global.saveRoom));
}

