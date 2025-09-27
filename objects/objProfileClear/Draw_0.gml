draw_self();

draw_set_colour(c_white);
draw_set_halign(fa_center);
draw_set_font(fClear);

if (image_index < 2){
	draw_set_valign(fa_bottom);
	draw_text(x,y-(sprite_height/2+10),textUp);

	draw_set_valign(fa_top);
	draw_text(x,y+(sprite_height/2+10),textDown);
} else {
	draw_set_font(fClear02);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_left);
	draw_text(x+(sprite_width/2+10),y,textDown);
}

draw_set_halign(fa_center);
draw_set_valign(fa_bottom);

if (image_index == 0){
	draw_set_font(fClear);
    draw_text(800+400,y-110,"TestPlayers:");
}

