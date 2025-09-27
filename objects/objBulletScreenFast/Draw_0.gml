draw_set_blend_mode(bm_add);

draw_self();
draw_sprite(sprite_index,-1,x+800,y);
draw_sprite(sprite_index,-1,x-800,y);
draw_sprite(sprite_index,-1,x,y+608);
draw_sprite(sprite_index,-1,x,y-608);

draw_set_blend_mode(bm_normal);

