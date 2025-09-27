/// @description scrDrawTextOutline(x, y, string, textcolor, outlinecolor)
/// @param x
/// @param  y
/// @param  string
/// @param  textcolor
/// @param  outlinecolor
function scrDrawTextOutline(argument0, argument1, argument2, argument3, argument4) {
	//Draws any text with an outline

	var textX = argument0;
	var textY = argument1;
	var textStr = argument2;
	var textColor = argument3;
	var outlineColor = argument4;

	//Draw the text outline
	draw_set_color(outlineColor);
	for (var xx = -1; xx <= 1; xx++)
	{
	    for (var yy = -1; yy <= 1; yy++)
	    {
	        if (xx != 0 && yy != 0)
	        {
	            draw_text(textX + xx, textY + yy, string_hash_to_newline(textStr));
	        }
	    }
	}

	//Draw the text itself
	draw_set_color(textColor);
	draw_text(textX, textY, string_hash_to_newline(textStr));



}
