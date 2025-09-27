/// @description scrRestartGame()
///restarts the game
function scrRestartGame() {

	if (surface_exists(global.pauseSurf))
	{
	    surface_free(global.pauseSurf);
	}

	game_restart();



}
