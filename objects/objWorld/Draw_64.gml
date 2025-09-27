/// @description Draw update + debug overlay

draw_set_color(c_black);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fDefault12);

if (!global.gameStarted)
{
    if (!global.isUpToDate)
    {
        scrDrawTextOutline(34, 34, updateString, c_white, c_black);
    }
}
else if (global.debugOverlay)
{
    var drawX = 0, drawY = 0, drawAlign = 0;
    if (instance_exists(objPlayer))
    {
        drawX = objPlayer.x;
        drawY = objPlayer.y;
        drawAlign = objPlayer.x mod 3;
    }
    
    scrDrawTextOutline(20, 20, "X: "+string(drawX), c_black, c_white);
    scrDrawTextOutline(20, 40, "Y: "+string(drawY), c_black, c_white);
    scrDrawTextOutline(20, 60, "Align: "+string(drawAlign), c_black, c_white);
    scrDrawTextOutline(20, 80, "Room name: "+room_get_name(room), c_black, c_white);
    scrDrawTextOutline(20, 100, "Room number: "+string(room), c_black, c_white);
    scrDrawTextOutline(20, 120, "God mode: "+string(global.debugNoDeath), c_black, c_white);
    scrDrawTextOutline(20, 140, "Infinite jump: "+string(global.debugInfJump), c_black, c_white);
    scrDrawTextOutline(20, 160, "FPS: "+string(fps), c_black, c_white);
    scrDrawTextOutline(20, 180, "Real FPS: "+string(fps_real), c_black, c_white);
    scrDrawTextOutline(20, 200, "Count Instance: "+string(instance_count), c_black, c_white);
}

///Draw pause screen

if (global.gamePaused)
{
    draw_clear(c_black);
    
    if (surface_exists(global.pauseSurf))       //Check if surface exists before drawing it
    {
        draw_surface(global.pauseSurf,0,0);
    }
    
    draw_set_color(c_black);
    draw_set_alpha(0.5);
    
    draw_rectangle(-1, -1, display_get_gui_width(), display_get_gui_height(), 0);    //Darken the paused screen
    
    draw_set_alpha(1);
    
    var inPauseOptions = instance_exists(objOptionsMenu) || instance_exists(objKeyboardControlsMenu) || instance_exists(objControllerMenu);
    
    if (!inPauseOptions)
    {
        draw_set_color(c_white);
        draw_set_halign(fa_center);
        draw_set_valign(fa_top);
        draw_set_font(fDefault30);
        
        draw_text(display_get_gui_width()/2, display_get_gui_height()/2 - 24, string_hash_to_newline("PAUSE"));
        
        draw_set_halign(fa_left);
        draw_set_font(fDefault18);
        
        var t = global.time;
        var timeText = string(t div 3600) + ":";
        t = t mod 3600;
        timeText += string(t div 600);
        t = t mod 600;
        timeText += string(t div 60) + ":";
        t = t mod 60;
        timeText += string(t div 10);
        t = t mod 10;
        timeText += string(floor(t));
        
        draw_text(20, 516, string_hash_to_newline("Volume: " + string(global.volumeLevel) + "%"));
        draw_text(20, 541, string_hash_to_newline("Deaths: " + string(global.death)));
        draw_text(20, 566, string_hash_to_newline("Time: " + timeText));
        
        draw_set_font(fDefault12);
        draw_set_halign(fa_middle);
        if (!global.controllerMode)
        {
            var optionsButton = scrGetKeybind(global.menuOptionsButton[0]);
        }
        else
        {
            var optionsButton = scrGetControllerBind(global.menuOptionsButton[1]);
        }
        draw_text(400, 556, string_hash_to_newline("["+optionsButton+"] Options"));
    }
    else
    {
        with(objOptionsMenu)
        {
            event_perform(ev_draw, 0);
        }
        with(objKeyboardControlsMenu)
        {
            event_perform(ev_draw, 0);
        }
        with(objControllerMenu)
        {
            event_perform(ev_draw, 0);
        }
    }
}

///Draw frame rate

if (fps < 49){
    var xPlayer = 800;
    if (instance_exists(objPlayer)) xPlayer = objPlayer.x;
    
    var cFPS = make_colour_hsv(0,255*(1-(fps/50)),255);
    draw_set_font(fDefault12);
    draw_set_valign(fa_top);
    if (xPlayer < __view_get( e__VW.XView, 0 )+400)
    {
        draw_set_halign(fa_right);
        scrDrawTextOutline(780,578,"Fps: "+string(fps),cFPS,c_black);
    }
    else
    {
        draw_set_halign(fa_left);
        scrDrawTextOutline(20,578,"Fps: "+string(fps),cFPS,c_black);
    }
}

