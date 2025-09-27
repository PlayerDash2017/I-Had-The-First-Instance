/// @description Carry instance

with(objBlockDynamic) { solid = false; }

if (inst != noone)
{
    if (collision_rectangle(old_left, old_top - global.grav, old_right, old_bottom - global.grav, inst, true, true))
    {
        var carryX = mean(bbox_left, bbox_right) - mean(old_left, old_right);
        var carryY = bbox_top - inst.bbox_bottom - 1;
        with(inst)
        {                                     
            if (carryX != 0)
            {                                             
                if (place_free(x + carryX, y))
                {
                    x += carryX;
                }
                else
                {                           
                    move_contact_solid(180 * (carryX < 0), abs(carryX));
                }
            }
            if (carryY > 0)
            {              
                if (place_free(x, y + carryY))
                {
                    y += carryY;
                }             
                else
                {
                    move_contact_solid(270, carryY);
                }
            }
        }
    }
}

with(objBlockDynamic) { solid = true; }   

