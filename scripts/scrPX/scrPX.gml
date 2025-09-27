/// @description scrPX();
function scrPX() {
	//returns player x, if player is nonexistent, returns a random place

	if(instance_exists(objPlayer)) {
	    global.pX = objPlayer.x;
	    return objPlayer.x;
	} else {
	    return global.pX;
	}



}
