/// @description Draw at rounded coordinates

var drawx = floor(x + 0.5);
var drawy = floor(y + 0.5);

draw_sprite_ext(sprite_index, image_index, drawx, drawy, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

