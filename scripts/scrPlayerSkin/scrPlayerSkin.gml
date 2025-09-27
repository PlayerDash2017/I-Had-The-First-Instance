/// @description scrPlayerSkin
function scrPlayerSkin(argument0,argument1){
	var nameSprite = "spr"+argument0+argument1;
	return asset_get_index(nameSprite);
}