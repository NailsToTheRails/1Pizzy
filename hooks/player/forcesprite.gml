if object_index = obj_player1 {
// Do this so cosmic wouldnt crash
if character != "PZ" exit; 
if paletteselect == 52 return MOD_GLOBAL.EPIC;
//хуета
if state == states.firemouth
{
    if (!grounded && !instance_exists(obj_firemouthflame) && !key_jump2 && vsp >= -8)
    {
        if vsp < 13
        {
            return spr_firemouth
        }
    }
}
switch sprite_index
{
    case spr_pepdance: return MOD_GLOBAL.spr_PZdance; break;
    case spr_player_trashjump: return MOD_GLOBAL.spr_PZtrashjump; break;
    case spr_player_trashjump2: return MOD_GLOBAL.spr_PZtrashjump2; break;
    case spr_player_trashfall: return MOD_GLOBAL.spr_PZtrashfall; break;
    case spr_player_trashstart: return MOD_GLOBAL.spr_PZtrashstart; break;
    case spr_player_trashslide: return MOD_GLOBAL.spr_PZtrashslide; break;
    case spr_playerN_wallbounce: return MOD_GLOBAL.frenzy.wallbounce; break;
    case spr_playerN_divebombland: return MOD_GLOBAL.frenzy.divebombland; break;
    case spr_playerN_divebombfall: return MOD_GLOBAL.frenzy.divebombfall; break;
    case spr_playerN_divebomb: return MOD_GLOBAL.frenzy.divebomb; break;
}
}