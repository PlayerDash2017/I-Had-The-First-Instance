/*draw_set_colour(c_white);

draw_set_blend_mode(bm_add);
var Len = min(floor(Timer)/(50*152+20),1);
draw_rectangle(0,-2,Len*800,2,false);

var Scale = 6;
draw_sprite_ext(sprBulletDot,0,Len*800,0,Scale,Scale,45,c_white,1);
draw_sprite_ext(sprBulletDot,0,0,0,Scale,Scale,45,c_white,1);
draw_set_blend_mode(bm_normal);

/* */
/*  */
