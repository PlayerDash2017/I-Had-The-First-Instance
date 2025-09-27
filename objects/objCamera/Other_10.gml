/// @description Move camera

if (zoomFactor == 0) zoomFactor = 1;  //Don't divide by 0

var targetW = 800 / zoomFactor;
var targetH = 608 / zoomFactor;

if(instance_exists(objPlayer))
{

    if (screenLock)
    {
        var leftEdge = screenWidth * floor(objPlayer.x / screenWidth);
        targetX = clamp(objPlayer.x - targetW / 2, leftEdge, leftEdge + screenWidth - targetW);
        var topEdge = screenHeight * floor(objPlayer.y / screenHeight);
        targetY = clamp(objPlayer.y - targetH / 2, topEdge, topEdge + screenHeight - targetH);
    }
    else
    {
        targetX = objPlayer.x - targetW/2;
        targetY = objPlayer.y - targetH/2;
    }
    
    if (!leaveRoom)
    {
        targetX = clamp(targetX, 0, room_width - targetW); 
        targetY = clamp(targetY, 0, room_height - targetH);
    }
    
    if (!init)  //On the first frame snap instantly to the player instead of moving smoothly.
    {
        __view_set( e__VW.XView, 0, targetX );
        __view_set( e__VW.YView, 0, targetY );
        init = true;
    }
}

if (init)
{
    __view_set( e__VW.XView, 0, lerp(__view_get( e__VW.XView, 0 ), targetX, smoothLerp) );
    __view_set( e__VW.YView, 0, lerp(__view_get( e__VW.YView, 0 ), targetY, smoothLerp) );
}

