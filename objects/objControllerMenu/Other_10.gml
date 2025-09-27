/// @description Update current binds

bindName[0] = string(global.controllerIndex);
for (var i = 0; i < numberOfButtons - 2; i++)
{
    bindName[i+1] = scrGetControllerBind(global.controls[i, 1]);
}

