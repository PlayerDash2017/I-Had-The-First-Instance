//draw_set_color(scrTernary(!global.gameStarted, c_black, c_white));
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fDefault30);

yStart = (608 - numberOfOptions * yStep)/2;
currentSlot = 0;

for (var i = 0; i < numberOfOptions; i++)
{
    var script = options[i];
    scrDrawOption(script_execute(script, "name"), script_execute(script, "value"));
}

draw_sprite(sprPlayerIdle, animationTime/5, xMargin - 16, yStart + (yStep * select) + 26);

scrDrawButtonInfo(false);

