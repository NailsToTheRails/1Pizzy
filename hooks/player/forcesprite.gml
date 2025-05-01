if object_index = obj_player1
{
if paletteselect = 52 && character = "PZ"
return MOD_GLOBAL.EPIC
}
else
{
if obj_player1.paletteselect = 52 && obj_player1.character = "PZ"
return MOD_GLOBAL.EPIC
}

with obj_player1
{
if obj_player1.paletteselect != 52 && obj_player1.character = "PZ"
{   
    if state = states.firemouth
    {
     if (!grounded && !instance_exists(obj_firemouthflame) && !key_jump2 && vsp >= -8)
    {
        if vsp < 13
        {
            return obj_player1.spr_firemouth
        }
    }
    }
}
}