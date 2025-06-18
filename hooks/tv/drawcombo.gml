
if (obj_player1.character != "PZ") exit;
switch (global.combometertype) {
	case 0:
	case 1:
	static barfill_frame = 0
	barfill_frame += 0.35;
	var combofillDisplay = _x - lerp(combofillDisplay, global.combotime / 60, 0.5);
	var _perc = global.combotime / 60;
	var tv_x = obj_screensizer.actual_width - 115
	var tv_y = 80

	var _minX = _cx - 76;
	var _maxX = _cx + 59;
	var _cx = tv_x + combo_posX;
	var _cy = tv_y + 117 + hud_posY + combo_posY;

	var combofill_x = -lerp(combofill_x, _maxX + ((_minX - 31 - _maxX) * _perc), 0.95);
	var doublex = xstart + Wave(-5, 5, 2, 20);
	var _x = round(tv_x + doublex);
	var _y = round(combo_posY + 180);

	draw_sprite_ext(MOD_GLOBAL.spr_tvHUD_comboMeter_back, 0, _x-137, _y-80, 1, 1, 0, c_white, 1);
	var border_sprite = MOD_GLOBAL.spr_tvHUD_comboMeter_cut
	var bar_sprite = !global.combometertype ? MOD_GLOBAL.spr_tvHUD_comboMeter : MOD_GLOBAL.spr_tvHUD_comboMeter_JUNE
	var meter_sprite = !global.combometertype ? MOD_GLOBAL.spr_tvHUD_comboMeter_fill : MOD_GLOBAL.spr_tvHUD_comboMeter_fill_JUNE
	var pal_sprite = !global.combometertype ? MOD_GLOBAL.spr_tvHUD_comboMeter_pal : MOD_GLOBAL.spr_tvHUD_comboMeter_pal_JUNE

	// fuckin.. make draw clip
	draw_reset_clip();
	draw_set_mask(_x - 87, _y-7, border_sprite);
	pal_swap_set(pal_sprite, global.combodropped ? 0 : 1, false);
	draw_sprite(meter_sprite, barfill_frame, _x - 182 + combofill_x, _y - 10);
	draw_reset_clip();

	draw_sprite_ext(bar_sprite, barfill_frame, _x, _y, 1, 1, 0, c_white, 1);
	draw_set_font(global.SScombofont);
	draw_set_halign(fa_right);
	draw_set_valign(fa_top);
	draw_text(_x - 15, _y + 26, string(global.combo));
	pal_swap_reset();
	break;
	
	case 2:
	static propeller_index = 0
	propeller_index += 0.35
    var _cx = tv_x + combo_posX + 650 //- // + 170 - 13; 
    var _cy = tv_y + 16 + 6 + 64 + hud_posY + combo_posY;
    var _hy = hand_y;
    var _perc = global.combotime / 60;
    
    if global.combo <= 0
    {
        hand_x = Approach(hand_x, 100/*80*/, 8);
        hand_y = Approach(hand_y, 32/*-32*/, 8);
        _hy = 50;
    }
    else if _cy > -150
    {
        hand_x = lerp(hand_x, 0, 0.15);
        hand_y = lerp(hand_y, lerp(35, -30, _perc), 0.25);
    }

    var xx = (_cx - 50) + (-3 + 50);
    var yy = (_cy - 91) + (_hy + 100);

    draw_reset_clip();
    draw_set_mask(_cx, _cy, MOD_GLOBAL.spr_Pcombometer_cut);
    draw_sprite(MOD_GLOBAL.spr_Pcombometer_goo, propeller_index, xx, yy);
    draw_reset_clip();
    
    //pal_swap_set(spr_tv_palette, tv_palette);
    draw_sprite(MOD_GLOBAL.spr_Pcombometer, -1, _cx, _cy);
    draw_sprite(MOD_GLOBAL.spr_Pcombometer_hand, -1, _cx + hand_x + 80, max(_cy, /*60 +*/ hud_posY) + min(hand_y, 20) + 24);

    draw_set_font(global.SSPRANKcombofont);
    draw_set_align(fa_center);
    draw_set_color(c_white);
    draw_text(_cx - 10, _cy - 90, string(visualcombo) + "x");
    //pal_swap_reset();

	return false; // too lazy to port :( someone do it for me (P RANK COMBO)
	break;
	
	case 3:
	return true; // WOW!
	break;
}
return false;
