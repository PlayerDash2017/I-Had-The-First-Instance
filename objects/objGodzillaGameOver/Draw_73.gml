with(objGodzillaDoll) visible = false;

if (!surface_exists(Surf)){
    Surf = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));
    surface_copy(Surf, 0, 0, application_surface);
    
    //Fix transparent objects appearing dark when paused
    surface_set_target(Surf);
        draw_set_blend_mode(bm_add);
        draw_set_color(c_black);
        draw_rectangle(0, 0, surface_get_width(Surf), surface_get_height(Surf), false);
        draw_set_blend_mode(bm_normal);
    surface_reset_target();
}

with(objGodzillaDoll) visible = true;

d3d_set_projection_ortho(0,0,800,608,0);
draw_surface(Surf,0,0);
d3d_set_projection_ortho(__view_get( e__VW.XView, view_current ),__view_get( e__VW.YView, view_current ),__view_get( e__VW.WView, view_current ),__view_get( e__VW.HView, view_current ),__view_get( e__VW.Angle, view_current ));

