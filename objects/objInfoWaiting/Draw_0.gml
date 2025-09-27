draw_set_colour(c_white);
draw_set_halign(fa_center);
draw_set_font(fDefault24);
draw_text(400,100,string_hash_to_newline("Press S to save"));
draw_text(400,140,string_hash_to_newline("Best PB: "+pb_str+"/2:32"));
draw_text(400,180,string_hash_to_newline("Hit Count: "+scrTernary(global.hitCount,"On","Off")+" (Press H to toggle)"));

if (global.hitCount){
    draw_text(400,220,string_hash_to_newline("Best Hit Count: "+string(h)));
}