frozen = false; //Sets if the player can move or not

jumpSpeed = 8.5 * global.grav; //Set how fast the player jumps
djumpSpeed = 7 * global.grav; //Sets how fast the player double jumps
gravity = 0.4 * global.grav; //Player gravity

djump = 1; //Allow the player to double jump as soon as they spawn
runSpeed = 3;   //Max horizontal speed
maxVspeed = 9;  //Max vertical speed
image_speed = 0.2;
onPlatform = false;
iframes = 0;

xScale = 1;

scrSetPlayerMask();

if (global.difficulty == 0 && global.gameStarted)
    { instance_create(x,y,objBow); }
    
if (global.autosave) //Save the game if currently set to autosave
{
    scrSaveGame(true);
    global.autosave = false;
}

if (room == rWaiting) runSpeed = 5;

xsafe = x;
ysafe = y;

scrDynamicCollision(true);

