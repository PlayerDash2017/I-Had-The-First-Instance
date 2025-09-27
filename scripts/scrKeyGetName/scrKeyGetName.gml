/// @description scrKeyGetName(input id):string
/// @param input id
function scrKeyGetName(argument0) {

	if (!global.controllerMode)//Keyboard
	{
	    switch (argument0){
	        case KEY.JUMP:      return scrGetKeybind(global.controls[KEY.JUMP,0],"Jump Key"); break;
	        case KEY.SHOOT:     return scrGetKeybind(global.controls[KEY.SHOOT,0],"Shoot Key"); break;
	        case KEY.RESTART:   return scrGetKeybind(global.controls[KEY.RESTART,0],"Restart Key"); break;
	        case KEY.SUICIDE:   return scrGetKeybind(global.controls[KEY.SUICIDE,0],"Suicide Key"); break;
	        case KEY.PAUSE:     return scrGetKeybind(global.controls[KEY.PAUSE,0],"Pause Key"); break;
	        case KEY.SKIP:      return scrGetKeybind(global.controls[KEY.SKIP,0],"Skip Key"); break;
	        case KEY.RIGHT:     return scrGetKeybind(global.controls[KEY.RIGHT,0],"Right Key"); break;
	        case KEY.LEFT:      return scrGetKeybind(global.controls[KEY.LEFT,0],"Left Key"); break;
	        case KEY.UP:        return scrGetKeybind(global.controls[KEY.UP,0],"Up Key"); break;
	        case KEY.DOWN:      return scrGetKeybind(global.controls[KEY.DOWN,0],"Down Key"); break;
    
	        case KEY.MENU_RIGHT:    return scrGetKeybind(global.controls[KEY.MENU_RIGHT,0],"Right Key"); break;
	        case KEY.MENU_LEFT:     return scrGetKeybind(global.controls[KEY.MENU_LEFT,0],"Left Key"); break;
	        case KEY.MENU_UP:       return scrGetKeybind(global.controls[KEY.MENU_UP,0],"Up Key"); break;
	        case KEY.MENU_DOWN:     return scrGetKeybind(global.controls[KEY.MENU_DOWN,0],"Down Key"); break;
	        case KEY.MENU_ACCEPT:   return scrGetKeybind(global.controls[KEY.MENU_ACCEPT,0],"Accept Key"); break;
	        case KEY.MENU_BACK:     return scrGetKeybind(global.controls[KEY.MENU_BACK,0],"Back Key"); break;
	        case KEY.MENU_OPTIONS:  return scrGetKeybind(global.controls[KEY.MENU_OPTIONS,0],"Options Key"); break;
        
	        case KEY.ALIGN_RIGHT: return scrGetKeybind(global.controls[KEY.ALIGN_RIGHT,0],"Align Right Key"); break;
	        case KEY.ALIGN_LEFT:  return scrGetKeybind(global.controls[KEY.ALIGN_LEFT,0],"Align Left Key"); break;
        
	        default: return "Unknown Key";
	    }
	}
	else//Controller
	{
	    switch (argument0){
	        case KEY.JUMP:      return scrGetControllerBind(global.controls[KEY.JUMP,1],"Jump Button"); break;
	        case KEY.SHOOT:     return scrGetControllerBind(global.controls[KEY.SHOOT,1],"Shoot Button"); break;
	        case KEY.RESTART:   return scrGetControllerBind(global.controls[KEY.RESTART,1],"Restart Button"); break;
	        case KEY.SUICIDE:   return scrGetControllerBind(global.controls[KEY.SUICIDE,1],"Suicide Button"); break;
	        case KEY.PAUSE:     return scrGetControllerBind(global.controls[KEY.PAUSE,1],"Pause Button"); break;
	        case KEY.SKIP:      return scrGetControllerBind(global.controls[KEY.SKIP,1],"Skip Button"); break;
	        case KEY.RIGHT:     return scrGetControllerBind(global.controls[KEY.RIGHT,1],"Right Button"); break;
	        case KEY.LEFT:      return scrGetControllerBind(global.controls[KEY.LEFT,1],"Left Button"); break;
	        case KEY.UP:        return scrGetControllerBind(global.controls[KEY.UP,1],"Up Button"); break;
	        case KEY.DOWN:      return scrGetControllerBind(global.controls[KEY.DOWN,1],"Down Button"); break;
    
	        case KEY.MENU_RIGHT:    return scrGetControllerBind(global.controls[KEY.MENU_RIGHT,1],"Right Button"); break;
	        case KEY.MENU_LEFT:     return scrGetControllerBind(global.controls[KEY.MENU_LEFT,1],"Left Button"); break;
	        case KEY.MENU_UP:       return scrGetControllerBind(global.controls[KEY.MENU_UP,1],"Up Button"); break;
	        case KEY.MENU_DOWN:     return scrGetControllerBind(global.controls[KEY.MENU_DOWN,1],"Down Button"); break;
	        case KEY.MENU_ACCEPT:   return scrGetControllerBind(global.controls[KEY.MENU_ACCEPT,1],"Accept Button"); break;
	        case KEY.MENU_BACK:     return scrGetControllerBind(global.controls[KEY.MENU_BACK,1],"Back Button"); break;
	        case KEY.MENU_OPTIONS:  return scrGetControllerBind(global.controls[KEY.MENU_OPTIONS,1],"Options Button"); break;
        
	        case KEY.ALIGN_RIGHT: return scrGetControllerBind(global.controls[KEY.ALIGN_RIGHT,1],"Align Right Button"); break;
	        case KEY.ALIGN_LEFT:  return scrGetControllerBind(global.controls[KEY.ALIGN_LEFT,1],"Align Left Button"); break;
        
	        default: return "Unknown Button";
	    }
	}



}
