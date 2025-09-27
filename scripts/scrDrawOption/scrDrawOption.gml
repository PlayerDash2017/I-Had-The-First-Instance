/// @description scrDrawOption(name, value)
/// @param name
/// @param  value
function scrDrawOption() {
                        
	if (argument_count >= 1)
	{
	    draw_set_halign(fa_left);
	    draw_text(xMargin, yStart + yStep * currentSlot, string_hash_to_newline(argument[0]));
	}

	if (argument_count >= 2)
	{
	    draw_set_halign(fa_right);
	    draw_text(__view_get( e__VW.WView, 0 ) - xMargin, yStart + yStep * currentSlot, string_hash_to_newline(argument[1]));
	}

	currentSlot += 1;



}
