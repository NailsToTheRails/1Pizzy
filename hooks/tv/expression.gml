switch expressionsprite
{
    case MOD_GLOBAL.spr_tv_exprmach2:
        with obj_player1
        {
            if state != "PZ_wallkick"
            {
                other.state = states.tv_whitenoise;
                other.expressionsprite = noone;
            }
        }
        return false;

    /*case MOD_GLOBAL.spr_tv_exprConfect1:
    expressionbuffer = 150;
    break;
    */
}
