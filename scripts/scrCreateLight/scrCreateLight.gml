/// @description scrCreateLight(speed,[color],[alphaStart])
/// @param speed
/// @param [color]
/// @param [alphaStart]
function scrCreateLight() {

	var Spd = argument[0], Color = c_white, alpStart = (Spd<0);

	if (argument_count >= 2) Color = argument[1];
	if (argument_count >= 3) alpStart = argument[2];

	var Light = instance_create(0,0,objLightEffect);
	Light.spd = Spd;
	Light.image_alpha = alpStart;
	Light.image_blend = Color;

	return Light;



}
