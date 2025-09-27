/// @description scrKillPlayer()
function scrKillPlayer() {
	//kills the player

	if (instance_exists(objPlayer) && (!global.noDeath && !global.debugNoDeath))
	{
	    if (global.hitCount){
	        scrHitPlayer();
	        exit;
	    }
    
	    //Game over Default
	    if (!global.nesGodzilla)
	    {
	        global.deathSound = audio_play_sound(sndDeath, 0, false);
        
	        if (!global.muteMusic)  //play death music
	        {
	            if (global.deathMusicMode == 1) //instantly pause the current music
	            {
	                audio_pause_sound(global.currentMusic);
                
	                global.gameOverMusic = audio_play_sound(musOnDeath, 1, false);
	            }
	            else if (global.deathMusicMode == 2)    //fade out the current music
	            {                
	                with (objWorld)
	                    event_user(0);  //fades out and stops the current music
                
	                //global.gameOverMusic = audio_play_sound(musOnDeath, 1, false);
	            }
	        }
        
	        with (objPlayer)
	        {
	            instance_create(x, y, objBloodEmitter);
	            instance_destroy();
	        }
        
	        instance_create(0, 0, objGameOver);
	    }
	    else    //Nes Godzilla
	    {
	        with (objPlayer)
	        {
	            p = instance_create(x, y, objGodzillaDoll);
	            p.image_xscale = xScale;
	            p.sprite_index = sprite_index;
	            p.image_index = image_index;
            
	            instance_destroy();
	        }
        
	        instance_create(0, 0, objGodzillaGameOver);
        
	        with (objWorld)
	            event_user(0);  //fades out and stops the current music
	    }
    
	    if (global.gameStarted)
	    {
	        global.death += 1;
			global.noPause = false;
	        scrSaveGame(false); //save death/time
	    }
	}



}
