draw_set_blend_mode(bm_add);

draw_self();
draw_sprite_ext(sprite_index,-1,x+800,y,image_xscale,image_yscale,0,c_white,1);
draw_sprite_ext(sprite_index,-1,x-800,y,image_xscale,image_yscale,0,c_white,1);

draw_set_blend_mode(bm_normal);

