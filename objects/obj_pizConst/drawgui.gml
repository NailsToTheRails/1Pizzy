if (global.walljumptype == 2) {
draw_set_font(global.font_small);
draw_set_align(fa_middle);
var _xspeed = string(round(abs(obj_player1.movespeed)))
if obj_player1.grounded
{
	var _yspeed = "0"
}
else
{
	var _yspeed = string(round(abs(obj_player1.vsp)))
}

draw_healthbar(SCREEN_WIDTH - 30, SCREEN_HEIGHT/2 + 70,SCREEN_WIDTH - 20, SCREEN_HEIGHT/2 - 20, abs(obj_player1.vsp) / 20 * 100, #000c20,#0081af,#04fdff,2,true,false)

draw_text(SCREEN_WIDTH - 26, SCREEN_HEIGHT/2 + 80,_yspeed)

draw_healthbar(SCREEN_WIDTH - 60, SCREEN_HEIGHT/2 + 70,SCREEN_WIDTH - 50, SCREEN_HEIGHT/2 - 20, abs(obj_player1.movespeed) / 20 * 100, #000c20,#0081af,#04fdff,2,true,false)

draw_text(SCREEN_WIDTH - 56, SCREEN_HEIGHT/2 + 80,_xspeed)
}