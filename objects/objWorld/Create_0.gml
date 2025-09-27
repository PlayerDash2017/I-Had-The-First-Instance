/// @description Make sure only 1 objWorld exists
//All other code you'd want to put here should go in the Game Start event for consistency.

if (instance_number(object_index) > 1)
{
    instance_destroy();
}

