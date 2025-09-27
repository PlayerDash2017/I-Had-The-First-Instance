/// @description Push instance

with(objBlockDynamic) { solid = false; }

if (inst != noone)
{
    if (place_meeting(x, y, inst))
    {
        var moveX = 0, moveY = 0;
                                      
        //Push horizontally
        if (inst.bbox_bottom - (inst.y - inst.yold) >= old_top && inst.bbox_top - (inst.y - inst.yold) <= old_bottom)
        {
            if (inst.bbox_left - (inst.x - inst.xold) >= old_right)
            {
                moveX = bbox_right - inst.bbox_left + 1;
                moveX += ((inst.x + moveX) % 2 == 1.5);
            }
            else if (inst.bbox_right - (inst.x - inst.xold) <= old_left)
            {
                moveX = bbox_left - inst.bbox_right - 1;
                moveX -= ((inst.x + moveX) % 2 == 0.5);
            }   
            if (moveX != 0)
            {
                with(inst)
                {
                    if (place_free(x + moveX, y))
                    {
                        x += moveX;
                    }
                }
            }
        }
        
        //Push vertically
        if (inst.bbox_right - (inst.x - inst.xold) >= old_left && inst.bbox_left - (inst.x - inst.xold) <= old_right)
        {
            if (inst.bbox_top - (inst.y - inst.yold) >= old_bottom)
            {
                moveY = bbox_bottom - inst.bbox_top + 1;
                moveY += ((inst.y + moveY) % 2 == 1.5);
            }
            else if (inst.bbox_bottom - (inst.y - inst.yold) <= old_top)
            {
                moveY = bbox_top - inst.bbox_bottom - 1;
                moveY -= ((inst.y + moveY) % 2 == 0.5);
            }
            if (moveY != 0)
            {
                with(inst)
                {
                    if (place_free(x, y + moveY))
                    {
                        y += moveY;
                    }
                }
            }
        }
    }
}

with(objBlockDynamic) { solid = true; }   

