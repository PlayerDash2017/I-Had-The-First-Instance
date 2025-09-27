draw_set_colour(c_black);
draw_rectangle(0,0,800,608,false);

draw_set_font(fResult);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_colour(c_white);

draw_set_blend_mode(bm_add);

if (!global.hitCount && !global.practiceMode){
    draw_text(400,304+irandom_range(-1,1),string_hash_to_newline("The First Instance"));
} else if (global.practiceMode){
    draw_text(400,304+irandom_range(-1,1),string_hash_to_newline("Practice Mode"));
} else {
    draw_text(400,304+irandom_range(-1,1),string_hash_to_newline("Hits: "+string(global.hit)));
}

draw_set_alpha(textAlpha);
draw_set_font(fBack);
draw_text(400,580,string_hash_to_newline("Press "+Key+" to return"));
draw_set_alpha(1);

draw_set_blend_mode(bm_normal);

draw_set_alpha(fadeAlpha);
draw_set_colour(c_black);
draw_rectangle(0,0,800,608,false);
draw_set_alpha(1);

draw_set_valign(fa_bottom);

