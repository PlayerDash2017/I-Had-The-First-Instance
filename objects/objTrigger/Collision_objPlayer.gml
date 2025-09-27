var locked = (ds_map_exists(global.trigger, key) && !global.trigger[? key]);
if (!locked)
{
    if (sound != -1)
    {
        var snd = audio_play_sound(sound, 0, false);
        audio_sound_gain(snd, volume, 0);
    }
    global.trigger[? trg] = true;
    if (destroy)
    {
        instance_destroy();
    }
}

