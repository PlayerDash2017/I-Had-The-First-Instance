/// @description scrHitPlayer()
function scrHitPlayer() {

	with(objPlayer){
	    if (iframes == 0){
	        iframes = 50;
	        global.hit ++;
	        audio_play_sound(sndDeath,0,0);
	        instance_create(x,y,objPlayerHit);
	    }
	}



}
