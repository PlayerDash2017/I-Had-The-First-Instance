if (!stick) //check if hit block
{
    for(var i = 0; i < array_length_1d(stickTo); i++)
    {
        inst = max(inst, instance_place(x, y, stickTo[i]));
    }
    
    if (inst != noone)
    {   
        stick = true;
        offDist = point_distance(inst.x, inst.y, x, y);
        offAngle = point_direction(inst.x, inst.y, x, y) - inst.image_angle;
        speed = 0;
        gravity = 0;
    }
}
else //follow the block it's attached to
{
    if (instance_exists(inst))
    {
        x = inst.x + lengthdir_x(offDist, offAngle + inst.image_angle);
        y = inst.y + lengthdir_y(offDist, offAngle + inst.image_angle);
    }
    else
    {
        stick = false;
        inst = noone;
        gravity = (0.1+random(0.2)) * global.grav;
    }
}

