/// @description scrPY();
function scrPY() {
	//returns player y, if player is nonexistent, returns a random place 

	if(instance_exists(objPlayer)) {
	    global.pY = objPlayer.y;
	    return objPlayer.y;
	} else {
	    return global.pY;
	}



}
