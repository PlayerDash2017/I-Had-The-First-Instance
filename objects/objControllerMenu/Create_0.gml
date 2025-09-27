select = 0;

xMargin = 120;
yStep = 40;

settingButton = false;
showResetPrompt = false;

//Add two for the "Controller index" and "Reset controls" lines
numberOfButtons = KEY.NUMBER + 2;
buttonName = scrControls("getControllerNameArray");

event_user(0);
buttonName[numberOfButtons - 1] = "Reset Controls";
bindName[numberOfButtons - 1] = "";

if (bindName[0] == "-1") bindName[0] = "Disabled";

animationTime = 0;

