draw_self();

draw_set_font(fHitCount);
draw_set_halign(fa_right);
draw_set_valign(fa_top);
draw_set_colour(c_white);
draw_text(1560,35,"Practice Mode");

var Scale = 0.6;
draw_sprite_ext(sprPracticeScreen,Index,1280,312,Scale,Scale,0,c_white,1);

var xx = 832;
var yy = 32;
for (var i = 0; i < Total; i ++)
{
    draw_set_colour(scrTernary(Index == i && Active,c_white,c_gray));
    draw_rectangle(xx,yy+64*i,xx+32*6,yy+48+64*i,true);
    
    draw_set_halign(fa_right);
    draw_set_valign(fa_middle);
    draw_set_font(fPracticeMenu);
    draw_text(xx+32*6-16,yy+24+64*i,string_hash_to_newline(timeName[i]));
}

//button info
if (Active){
	draw_set_font(fDefault12);
	draw_set_colour(c_white);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	draw_text(800+162, 556, string_hash_to_newline("["+scrKeyGetName(KEY.SHOOT)+"] Back"));
	draw_set_halign(fa_right);
	draw_text(800+766, 556, string_hash_to_newline("["+scrKeyGetName(KEY.JUMP)+"] Accept"));
}