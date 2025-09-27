draw_set_alpha(image_alpha);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_colour(c_white)
draw_set_font(fHitCount);
draw_text(400,100,string_hash_to_newline(Text));

draw_set_halign(fa_left);
if (global.practiceMode) draw_text(16,16,string_hash_to_newline("Press Backspace to exit"));

draw_set_alpha(1);
draw_set_valign(fa_bottom);

