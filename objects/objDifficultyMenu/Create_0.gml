/// @description Initiailze menu variables

fileSelected = false; //False if selecting a file, true if selecting difficulty
savefileSelect = global.menuSelectPrev[0]; 
difficultySelect = 0; //-1 is Load Game, 0+ are difficulties
warningShow = false; //Confirmation text for overwriting a savefile
warningSelectYes = true;
 
str[0] = "Save 1";
str[1] = "Save 2";
str[2] = "Save 3";

xSeparation = 240;
animationIndex = 0;

//Load save file values
for (var i = 0; i < 3; i++)
{
    if (file_exists("Data\\save" + string(i+1)))  //Check if current save exists
    {
        //Load save data
        exists[i] = true;
        
        //Load the save map
        var saveMap;
        
        if (global.extraSaveProtection) //Use ds_map_secure function
        {
            saveMap = ds_map_secure_load("Data\\save" + string(i+1));
        }
        else    //Use text file
        {
            var f = file_text_open_read("Data\\save" + string(i+1));
            //saveMap = json_decode(base64_decode(file_text_read_string(f)));
            //file_text_close(f);
			
			var saveMap = ds_map_create();
			ds_map_read(saveMap,base64_decode(file_text_read_string(f)));
	
			file_text_close(f);
        }
        
        if (saveMap != -1)  //Check if the save map loaded correctly
        {
            death[i] = saveMap[? "deaths"];//saveMap[? "death"];
            if (is_undefined(death[i])) //Check for undefined value in case the save was messed with or got corrupted
            {
                death[i] = 0;
            }
            
            time[i] = saveMap[? "time"];
            if (is_undefined(time[i]))
            {
                time[i] = 0;
            }
    
            difficulty[i] = saveMap[? "difficulty"];
            if (is_undefined(difficulty[i]))
            {
                difficulty[i] = 0;
            }
            
            for (var j = 0; j < 8; j++)
            {
                boss[j,i] = saveMap[? "bossItem" + string(j) + ""];
                if (is_undefined(boss[j, i]))
                {
                    boss[j,i] = false;
                }
            }
            
            clear[i] = saveMap[? "gameClear"];
            if (is_undefined(clear[i]))
            {
                clear[i] = false;
            }
            
            t_pb[i] = saveMap[? "timePB"];
            if (is_undefined(t_pb[i]))
            {
                t_pb[i] = false;
            }
            
            hits[i] = saveMap[? "hitPB"];
            if (is_undefined(hits[i]))
            {
                hits[i] = false;
            }
            
            ds_map_destroy(saveMap);
        }
        else
        {
            //Save map didn't load correctly, set the variables to the defaults
            death[i] = 0;
            time[i] = 0;
            difficulty[i] = 0;
            for (var j = 0; j < 8; j++)
            {
                boss[j,i] = false;
            }
            clear[i] = false;
            t_pb[i] = 0;
            hits[i] = 0;
        }
    }
    else
    {
        exists[i] = false;
        death[i] = 0;
        time[i] = 0;
        t_pb[i] = 0;
        hits[i] = 0;
    }
    
    var t = time[i];
    
    timeStr[i] = string(t div 3600) + ":";
    t = t mod 3600;
    timeStr[i] += string(t div 600);
    t = t mod 600;
    timeStr[i] += string(t div 60) + ":";
    t = t mod 60;
    timeStr[i] += string(t div 10);
    t = t mod 10;
    timeStr[i] += string(floor(t));
    
    var t = t_pb[i];
    
    pb_str[i] = (string(floor(t / 3000))) + ":";
    if (((floor(t / 50)) % 60) <= 9) pb_str[i] += "0";
    pb_str[i] += string((floor(t / 50)) % 60);
    
    if (hits[i] == 114514) hits[i] = 0
}

