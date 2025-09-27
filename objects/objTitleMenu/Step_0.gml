// Check and move to file menu
if (scrButtonCheckPressed(KEY.MENU_ACCEPT))
{
    room_goto(rMenu);
}

// Presiona easter egg
Text = "Press "+scrKeyGetName(KEY.MENU_ACCEPT)+" to Start";
if (Presiona < 10)
	{ Text = "Presiona"; }