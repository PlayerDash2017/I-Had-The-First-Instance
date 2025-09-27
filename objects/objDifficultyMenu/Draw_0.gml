/// @description Draw all save info text

for(var i = 0; i < 3; i++)
{
    var xx = x + i * xSeparation;

    draw_set_color(c_white);
    draw_set_halign(fa_middle);
    draw_set_valign(fa_top);
    draw_set_font(fDefault30);
    
    draw_text(xx + 64, y, string_hash_to_newline(str[i]));
    
    draw_set_halign(fa_left);
    draw_set_font(fDefault12);
    
    draw_text(xx + 10, y + 70, string_hash_to_newline("Deaths: " + string(death[i])));
    draw_text(xx + 10, y + 90, string_hash_to_newline("Time: " + timeStr[i]));
    draw_text(xx + 10, y + 110, string_hash_to_newline("Hits: " + string(hits[i])))
    draw_text(xx + 10, y + 140, string_hash_to_newline(pb_str[i] + "/2:32"))
    
    draw_set_halign(fa_center);
    
    if (fileSelected && i == savefileSelect)
    {
        if (!warningShow)
        {
            var displayText = "< " + global.difficultyNames[difficultySelect + 1] + " >";
            draw_text(xx + 65, y + 49, string_hash_to_newline(displayText));
        }
        else
        {
            draw_text(xx + 63, y - 100, string_hash_to_newline("Are you sure#you want to#overwrite this save?"));
            if (warningSelectYes)
            {
                draw_text(xx + 65, y + 49, string_hash_to_newline("< Yes >"));
            }
            else
            {
                draw_text(xx + 65, y + 49, string_hash_to_newline("< No >"));
            }
        }
    }
    
    if (exists[i])
    {        
        if ((!fileSelected) || (fileSelected && i != savefileSelect))
        {
            var displayText = global.difficultyNames[difficulty[i] + 1];
            draw_text(xx + 65, y + 49, string_hash_to_newline(displayText));
        }
        
        draw_set_font(fDefault24);
        
        if (clear[i]) draw_text(xx + 63, y + 215, string_hash_to_newline("Clear!!"));
        
        if (boss[0,i]) draw_sprite(sprBossItem, -1, xx + 0,  y + 128);
        if (boss[1,i]) draw_sprite(sprBossItem, -1, xx + 32, y + 128);
        if (boss[2,i]) draw_sprite(sprBossItem, -1, xx + 64, y + 128);
        if (boss[3,i]) draw_sprite(sprBossItem, -1, xx + 96, y + 128);
        if (boss[4,i]) draw_sprite(sprBossItem, -1, xx + 0,  y + 160);
        if (boss[5,i]) draw_sprite(sprBossItem, -1, xx + 32, y + 160);
        if (boss[6,i]) draw_sprite(sprBossItem, -1, xx + 64, y + 160);
        if (boss[7,i]) draw_sprite(sprBossItem, -1, xx + 96, y + 160);
    }
    else
    {
        if ((!fileSelected) || (fileSelected && i != savefileSelect))
        {
            draw_text(xx + 65, y + 49, string_hash_to_newline("No Data"));
        }
    }
    
    if (i == savefileSelect)
    {
        draw_sprite(sprPCircle, 8, xx+5,     y+310);
        draw_sprite(sprPCircle, 8, xx+25,    y+310);
        draw_sprite(sprPCircle, 8, xx+45,    y+310);
        draw_sprite(sprPlayerIdle, animationIndex/5, xx+65, y+310);
        draw_sprite(sprPCircle, 8, xx+85,    y+310);
        draw_sprite(sprPCircle, 8, xx+105,   y+310);
        draw_sprite(sprPCircle, 8, xx+125,   y+310);
        
        /*draw_sprite(sprCherry, animationIndex/15, xx+5,     y+310);
        draw_sprite(sprCherry, animationIndex/15, xx+25,    y+310);
        draw_sprite(sprCherry, animationIndex/15, xx+45,    y+310);
        draw_sprite(sprPlayerIdle, animationIndex/5, xx+65, y+310);
        draw_sprite(sprCherry, animationIndex/15, xx+85,    y+310);
        draw_sprite(sprCherry, animationIndex/15, xx+105,   y+310);
        draw_sprite(sprCherry, animationIndex/15, xx+125,   y+310);*/
    }
}

scrDrawButtonInfo(true);

/* */
/*  */
