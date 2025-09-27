if (GUI){
    texture_set_interpolation(false);
    draw_self();
    texture_set_interpolation(global.smoothingMode);
}

