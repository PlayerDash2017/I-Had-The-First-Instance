draw_self();

if (showText)
{
    draw_set_color(c_black);
    draw_set_font(fDefault12);
    draw_set_halign(fa_center);
    
    var yOffset = string_height(string_hash_to_newline(text));
    
    scrDrawTextOutline(x + (sprite_width/2), y - yOffset, text, c_white, c_black);
}

