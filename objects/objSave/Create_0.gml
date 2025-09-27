if (!variable_instance_exists(id, "difficulty"))
{
    difficulty = 1; //Maximum difficulty at which this save still exists
}

if (!variable_instance_exists(id, "grav"))
{
    grav = 1;       //sets which player gravity this save works with
}
image_speed = 0;
canSave = true;

if (global.difficulty > difficulty)  //Destroy the save if on too high difficulty.
{
    instance_destroy();
}

