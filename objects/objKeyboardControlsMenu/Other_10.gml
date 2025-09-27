/// @description Update current binds

for (var i = 0; i < numberOfKeys - 1; i++)
{
    bindName[i] = scrGetKeybind(global.controls[i, 0]);
}

