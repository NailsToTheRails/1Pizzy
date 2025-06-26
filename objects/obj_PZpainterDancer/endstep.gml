if !variable_global_exists("jukebox") exit;

if global.jukebox == -4
{
    if (sprite_index != spr_idle)
    sprite_index = spr_idle;
}
else
{
    if (sprite_index != spr_dance)
    sprite_index = spr_dance;
}
