#region Draw debug mode text when we're on the title screen

if (global.debugMode)
{
    draw_set_font(fDefault24);
    draw_set_halign(fa_right);
    draw_set_valign(fa_top);
    
    scrDrawTextOutline(766, 34, "Debug mode", c_red, c_black);
}

#endregion

#region Draw title game

draw_set_blend_mode(bm_add);

draw_set_font(fTitleScreen);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var Title = "I HAD#THE FIRST INSTANCE";
var YY = irandom_range(-1,1);

draw_set_colour(c_dkgray);
draw_text(400+3,150+YY+3,string_hash_to_newline(Title));

draw_set_colour(c_white);
draw_text(400,150+YY,string_hash_to_newline(Title));

draw_set_blend_mode(bm_normal);
draw_set_valign(fa_bottom);

draw_set_font(fPressStart);
draw_text(400,590,Text);

#endregion