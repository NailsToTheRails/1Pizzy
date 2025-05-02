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
    if (sprite_index == spr_pepdance)
    {
        return MOD_GLOBAL.spr_PZdance;
    }
    switch obj_player1.sprite_index
        {
           case spr_player_trashjump:
            return MOD_GLOBAL.spr_PZtrashjump;
            
        break;
        case spr_player_trashjump2:
            return MOD_GLOBAL.spr_PZtrashjump2;
            
        break;
        case spr_player_trashfall:
            return MOD_GLOBAL.spr_PZtrashfall;
            
        break;
        case spr_player_trashstart:
            return MOD_GLOBAL.spr_PZtrashstart;
            
        break;
        case spr_player_trashslide:
            return MOD_GLOBAL.spr_PZtrashslide;
            
        break;
        }
}
}