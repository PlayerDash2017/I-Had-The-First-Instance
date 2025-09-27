/// @description scrButtonCheck(button)
/// @param button
function scrButtonCheck(argument0) {
	//Checks whether a button is currently being pressed

	var button = argument0;

	if (!global.controllerMode)
	{
	    return (keyboard_check(global.controls[button, 0]));
	}
	else
	{
	    return (gamepad_button_check(global.controllerIndex, global.controls[button, 1]));
	}



}
