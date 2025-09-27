draw_set_font(fSuitmationTrial);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_colour(c_white);
draw_set_alpha(Alp - random(0.2));

draw_set_blend_mode(bm_add);
draw_text(400,YY+irandom_range(-1,1),string_hash_to_newline(Text[Index]));
draw_set_blend_mode(bm_normal);
draw_set_alpha(1);

draw_set_valign(fa_bottom);

