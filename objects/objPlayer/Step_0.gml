#region Player actions and movement

iframes = max(iframes - 1,0);

//Left-right input
var L = (scrButtonCheck(KEY.LEFT) || (global.directionalTapFix && scrButtonCheckPressed(KEY.LEFT)));
var R = (scrButtonCheck(KEY.RIGHT) || (global.directionalTapFix && scrButtonCheckPressed(KEY.RIGHT)));
var h = 0;
if (!frozen)
    { h = -(L || R) + (2 * R); }

var ice = instance_place(x, y + global.grav, objIceBlock);
var notOnBlock = place_free(x, y + global.grav);
var onVineL = (place_meeting(x - 1, y, objVineL) && notOnBlock);
var onVineR = (place_meeting(x + 1, y, objVineR) && notOnBlock);

//Horizontal movement
if (h != 0)    //Moving
{
    xScale = h;
    if ((h == -1 && !onVineR) || (h == 1 && !onVineL))
    {
        if (ice == noone)    //Normal movement
            { hspeed = runSpeed * h; }
        else    //Ice movement
        {
            hspeed += (ice.slip) * h;
            
            if (abs(hspeed) > runSpeed)
                hspeed = runSpeed * h;
        }
    }
}
else    //Not moving
{
    if (ice == noone)    //Normal movement
        hspeed = 0;
    else    //Ice movement
    {
        if (hspeed > 0)
            { hspeed -= min(ice.slip, abs(hspeed)); }
        else if (hspeed < 0)
            { hspeed += min(ice.slip, abs(hspeed)); }
    }
}

onPlatform = false;
with(objPlatform)
{
    if (place_meeting(x, y-global.grav, other))
    {
        if ((global.grav == 1 && other.bbox_bottom <= bbox_top && other.vspeed >= vspeed) || (global.grav == -1 && other.bbox_top >= bbox_bottom && other.vspeed <= vspeed))
        {
            other.onPlatform = true;
        }
    }
}

var conveyor = instance_place(x,y + (global.grav), objConveyor);
if (conveyor != noone)
{
    hspeed += conveyor.h;
}

if (global.grav * vspeed > maxVspeed)
{
    vspeed = global.grav * maxVspeed;
}

if (!frozen)
{
    if (scrButtonCheckPressed(KEY.SHOOT))
        scrPlayerShoot();
    if (scrButtonCheckPressed(KEY.JUMP))
        scrPlayerJump();
    if (scrButtonCheckReleased(KEY.JUMP))
        scrPlayerReleaseJump();
    if (scrButtonCheckPressed(KEY.SUICIDE))
        scrKillPlayer();
}

if (global.adAlign && !place_free(x, y + (global.grav)) && !frozen)
{
    if (scrButtonCheckPressed(KEY.ALIGN_LEFT)) {hspeed -= 1;}
    if (scrButtonCheckPressed(KEY.ALIGN_RIGHT)) {hspeed += 1;}
}

#endregion

#region Vines                                            

if (onVineL || onVineR)
{
    if (onVineR)
        { xScale = -1; }
    else
        { xScale = 1; }
    
    vspeed = 2 * global.grav;
    
    //Try to leave vine
    if (onVineL && scrButtonCheckPressed(KEY.RIGHT)) || (onVineR && scrButtonCheckPressed(KEY.LEFT))
    {
        if (scrButtonCheck(KEY.JUMP))    //Jumping off
        {
            if (onVineR)
                { hspeed = -15; }
            else
                { hspeed = 15; }
            vspeed = -9 * global.grav;
            audio_play_sound(sndWallJump, 0, false);
        }
        else    //Falling off
        {
            if (onVineR)
                { hspeed = -3; }
            else
                { hspeed = 3; }
        }
    }
}

#endregion

#region Slopes         

if (instance_exists(objSlope) && hspeed != 0)
{
    var moveLimit = abs(hspeed);    //Sets how high/low the player can go to snap onto a slope, this can be increased to make the player able to run over steeper slopes (ie setting it to abs(hspeed)*2 allows the player to run over slopes twice as steep)
    
    var slopeCheck;
    var hTest;
    
    var ySlope;
    
    //falling onto a slope
    if (place_meeting(x+hspeed, y+vspeed+gravity, objSlope) && (vspeed+gravity)*global.grav > 0 && notOnBlock)
    {
        var xLast = x;
        var yLast = y;
        var hLast = hspeed;
        var vLast = vspeed;
        
        vspeed += gravity;
        
        x += hspeed;
        hspeed = 0;
        
        if(!place_free(x, y+vspeed))
        {
            if (global.grav == 1)    //Normal
                move_contact_solid(270, abs(vspeed));
            else    //Flipped
                move_contact_solid(90, abs(vspeed));
            vspeed = 0;
        }
        
        y += vspeed;            
        
        if (!place_free(x, y + global.grav) && place_free(x, y))  //Snapped onto the slope properly
        {
            djump = 1;
            notOnBlock = false;
        }
        else    //Did not snap onto the slope, return to previous position
        {
            x = xLast;
            y = yLast;
            hspeed = hLast;
            vspeed = vLast;
        }
    }
    
    //Moving down a slope
    if (!notOnBlock)
    {                                              
        var onSlope = (place_meeting(x, y + global.grav, objSlope));    //Treat normal blocks the same as slopes if we're standing on a slope
        
        slopeCheck = true;
        hTest = hspeed;
        
        while (slopeCheck)
        {
            ySlope = 0;
            //Check how far we should move down
            while ((!place_meeting(x + hTest, y - ySlope + global.grav, objSlope) || (onSlope && place_free(x + hTest, y - ySlope + global.grav))) && (ySlope*global.grav > -floor(moveLimit * (hTest/hspeed))))
            {
                ySlope -= global.grav;
            }
            
            //Check if we actually need to move down
            if (place_meeting(x + hTest, y - ySlope + global.grav, objSlope) || (onSlope && place_free(x + hTest, y - ySlope + global.grav)))
            {
                if (ySlope != 0 && place_free(x + hTest, y - ySlope))
                {
                    y -= ySlope;
                    
                    x += hTest;
                    hspeed = 0;
                    
                    slopeCheck = false;
                }
                else
                {
                    if (hTest > 0)
                    {
                        hTest -= 1;
                        if (hTest <= 0)
                            slopeCheck = false;
                    }
                    else if (hTest < 0)
                    {
                        hTest += 1;
                        if (hTest >= 0)
                            slopeCheck = false;
                    }
                    else
                    {
                        slopeCheck = false;
                    }
                }
            }
            else
            {
                slopeCheck = false;
            }
        }
    }
    
    //Moving up a slope
    if (place_meeting(x + hspeed, y, objSlope))
    {                                           
        slopeCheck = true;
        hTest = hspeed;
        
        while (slopeCheck)
        {
            ySlope = 0;
            
            //Check how far we have to move up
            while ( place_meeting(x + hTest, y - ySlope, objSlope) && (ySlope*global.grav < floor(moveLimit * (hTest/hspeed))) )
            {
                ySlope += global.grav;
            }                                                 
            
            //Check if we actually need to move up
            if (place_free(x + hTest, y - ySlope))
            {            
                y -= ySlope;
                
                x += hTest;
                hspeed = 0;
                
                slopeCheck = false;
            }
            else
            {
                if (hTest > 0)
                {
                    hTest -= 1;
                    if (hTest <= 0)
                        slopeCheck = false;
                }
                else if (hTest < 0)
                {
                    hTest += 1;
                    if (hTest >= 0)
                        slopeCheck = false;
                }
                else
                {
                    slopeCheck = false;
                }
            }
        }
    }
    
    //Set xprevious/yprevious coordinates for future solid collisions
    xprevious = x;
    yprevious = y;
}                 

#endregion

#region Block collision (Keep this last)

vspeed += gravity;

if (!place_free(x + hspeed, y + vspeed))
{
    if (!place_free(x + hspeed, y) && hspeed != 0)
    {
        var maxDist = abs(hspeed);
        var dir = 180 * (hspeed < 0);
        move_contact_solid(dir, maxDist);
        
        hspeed = 0;
    }
     
    if (!place_free(x, y + vspeed) && vspeed != 0)
    {
        var maxDist = abs(vspeed);
        var dir = 270 - 180 * (vspeed < 0);
        move_contact_solid(dir, maxDist);
        
        if (dir == 180 + global.grav * 90)
            { djump = 1; }
        vspeed = 0;
    }
    
    if (!place_free(x + hspeed, y + vspeed))
    {
        //hspeed = 0;
        //Traditional behavior when resolving corner collision is to stop hspeed. When on a platform, this can cause horizontal stutter, so we stop vspeed instead.
        var p = instance_place(x, y+vspeed, objPlatform);
        if (!p || place_meeting(x, y, p))
        {
            hspeed = 0;
        }
        else
        {
            vspeed = 0;
        }
    }
}

xsafe = x + hspeed;
ysafe = y + vspeed;

vspeed -= gravity;

#endregion