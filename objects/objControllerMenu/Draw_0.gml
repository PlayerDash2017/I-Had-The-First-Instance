//draw_set_color(scrTernary(!global.gameStarted, c_black, c_white));
draw_set_color(c_white);
draw_set_valign(fa_top);
draw_set_font(fDefault24);

yStart = (608 - numberOfButtons * yStep)/2;
currentSlot = 0;

for(var i = 0; i < numberOfButtons; i += 1)
{
    var bindText = bindName[i];
    if (i == select && settingButton)
    {
        bindText = "Press button to set";
    }
    else if (showResetPrompt && i == numberOfButtons - 1)
    {
        bindText = "Controls reset!";
    }
    scrDrawOption(buttonName[i], bindText);
    
    draw_sprite(sprPlayerIdle, animationTime/5, xMargin - 16, yStart + (yStep * select) + 21);
}

if (global.controllerIndex != -1)
{
    //Display currently connected controller
    draw_set_color(c_maroon);
    draw_set_font(fDefault12);
    draw_set_halign(fa_middle);
    draw_set_valign(fa_middle);
    
    var controllerText = "Current controller: ";
    
    if (gamepad_is_connected(global.controllerIndex))
    { 
        controllerText += gamepad_get_description(global.controllerIndex);
    }
    else
    {
        controllerText += "None";
    }
    
    scrDrawTextOutline(400, 48, controllerText, c_white, c_black);
    
    //draw_set_color(c_black);
    draw_set_color(c_white);
}

scrDrawButtonInfo(false);

