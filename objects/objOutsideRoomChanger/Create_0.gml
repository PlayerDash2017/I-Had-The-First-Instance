//this warp only activates when the player leaves the room, it can be used on the edges of rooms for smoother room transitions

event_inherited(); 
                
smooth = false;   //sets whether the player wraps around the screen for a smooth transition to the next room (this requires the room sizes to be the same)
offsetX = 0;
offsetY = 0;

