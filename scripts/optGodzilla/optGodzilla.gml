/// @description optGodzilla(type)
/// @param type
function optGodzilla(argument0) {

	switch(argument0)
	{
	    case "include":
	        return true;
    
	    case "inPause":
	        //Whether or not to include this option on the pause screen
	        return true;

	    case "init":
	        //Called when the menu gets created
	        break;
        
	    case "step":
	        //Called every frame the option is selected
	        if (scrButtonCheckPressed(KEY.MENU_ACCEPT))
	        {
	            //Switch option
	            audio_play_sound(global.menuSound, 0, false);
	            global.nesGodzilla = !global.nesGodzilla;
	        }
	        break;
        
	    case "name":
	        return "Godzilla Gameover";
        
	    case "value":
	        return scrTernary(global.nesGodzilla,"On","Off");
    
	    case "end":
	        //Called when the option is deselected
	        break;
	}



}
