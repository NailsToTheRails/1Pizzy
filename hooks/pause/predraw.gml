if (global.PZ_opts.SSENmenu == 0) or (global.PZ_opts.SSENmenu == 2 && MOD_GLOBAL.pl_char != "PZ") exit;

function floor_ext(arg0, arg1)
{
    return floor(arg0 * arg1) / arg1;
}

function ceil_ext(arg0, arg1)
{
    return ceil(arg0 * arg1) / arg1;
}

function round_ext(arg0, arg1)
{
    return round(arg0 * arg1) / arg1;
}

function draw_sprite_ext_flash(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
{
    gpu_set_fog(true, arg7, 0, 1);
    draw_sprite_ext(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
    gpu_set_fog(false, c_black, 0, 0);
}

if (!variable_instance_exists(self, "pauseslidein"))
pauseslidein = 500;

if (!variable_instance_exists(self, "borderscale"))
borderscale = 4;

if (!pause)
{
	pauseslidein = ceil(lerp(pauseslidein, 500, 0.1));
	borderscale = ceil_ext(lerp(borderscale, 4, 0.2), 100);
}


if fade > 0
{
	if pause or fade >= 1
	{
		draw_set_alpha(1);
		scr_draw_pause_image();
	}
	
	var spr_newpause_icons = MOD_GLOBAL.spr_newpause_icons
	var is_not_level, bar_x_offsets, bar_y_offsets, bar_text, bar_sprite, i, y_pad, x_pos, y_pos, current_bar_chosen, current_bar_x, _txt, entry, mapentry, playerPauseSprite;
	var _length = array_length(pause_menu);
	var oldportrait = false;
        /*
	someone fix my shittty attempt at adding custom pause portrait so others can add their own for their character
	anybody EXCEPT nails because i refuse to pull from his branch till he readds my changes that i talked with ruby about previously
	instance_activate_object(obj_player);
	if (custom != -4 && !is_undefined(struct_get_from_hash(custom.sprites.misc, variable_get_hash("spr_pauseportrait"))))
	_spr = obj_player.spr_pauseportrait
	else */
	switch (MOD_GLOBAL.pl_char)
	{
	    case "PZ":
	    playerPauseSprite = MOD_GLOBAL.spr_pizzelle_pause
	    break;

	    case "P":
	    playerPauseSprite = MOD_GLOBAL.spr_peppino_pause
	    oldportrait = true;
	    break

	    case "N":
	    playerPauseSprite = MOD_GLOBAL.spr_noise_pause
	    break

	    case "V":
	    playerPauseSprite = MOD_GLOBAL.spr_vigi_pause
	    oldportrait = true;
	    break
		
	}

	var pausedSprite = undefined;
	var pauseBorder = MOD_GLOBAL.spr_newpause_border
	var secretIconScale = [1, 1, 1];
	var secretIconVisible = [max(global.secretfound > 0, (secretcount > 0) * 0.5), max(global.secretfound > 1, (secretcount > 1) * 0.5), max(global.secretfound > 2, (secretcount > 2) * 0.5)];
	var bar_sprite = asset_get_index("MOD_GLOBAL.spr_newpause_bars" + string(selected + 1));
	shake = Approach(shake, 0, 1);
	var whitealpha = floor_ext(lerp(whitealpha, 0, 0.3), 100);
	var b = pause_menu[i];
	
	 if (instance_exists(obj_option) || instance_exists(obj_achievement_pause))
	        exit;
	
	if (!is_undefined(pausedSprite))
	    draw_sprite_stretched(pausedSprite, 0, 0, 0, 960, 540);
	
	var is_not_level = global.leveltosave == -4
	var bordercolor = #0D001B
	draw_set_alpha(fade - 0.5);
	draw_rectangle_color(0, 0, obj_screensizer.actual_width, obj_screensizer.actual_height, bordercolor, bordercolor, bordercolor, bordercolor, false);
	draw_set_alpha(1)
	draw_sprite_ext(pauseBorder, is_not_level ? 1 : 0, 480, 270, borderscale, borderscale, 0, c_white, 1);
	
	if (!is_not_level)
	{
	    draw_sprite_ext(MOD_GLOBAL.spr_newpause_secreticon, 0, 804 + pauseslidein, 64 - pauseslidein, secretIconScale[0], secretIconScale[0], 0, c_white, secretIconVisible[0]);
	    draw_sprite_ext(MOD_GLOBAL.spr_newpause_secreticon, 1, 855 + pauseslidein, 54 - pauseslidein, secretIconScale[1], secretIconScale[1], 0, c_white, secretIconVisible[1]);
	    draw_sprite_ext(MOD_GLOBAL.spr_newpause_secreticon, 2, 906 + pauseslidein, 70 - pauseslidein, secretIconScale[2], secretIconScale[2], 0, c_white, secretIconVisible[2]);
	}
	
	draw_set_font(global.fontSS);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	bar_x_offsets = [507, 495, 478, 460, 443];
	bar_y_offsets = [103, 177, 249, 324, 396];
	bar_text = pause_menu;
	switch (selected)
	{
		default:
		bar_sprite = MOD_GLOBAL.spr_newpause_bars1;
		break;
	
		case 0:
		bar_sprite = MOD_GLOBAL.spr_newpause_bars1;
		break;
	
		case 1:
		bar_sprite = MOD_GLOBAL.spr_newpause_bars2;
		break;
	
		case 2:
		bar_sprite = MOD_GLOBAL.spr_newpause_bars3;
		break;
	
		case 3:
		bar_sprite = MOD_GLOBAL.spr_newpause_bars4;
		break;
	
		case 4:
		bar_sprite = MOD_GLOBAL.spr_newpause_bars5;
		break;
	}
	
	
	for (i = 0; i < _length; i++)
	{
	    y_pad = 73;
	    x_pos = lerp(507, 443, i / (_length - 1));
	    y_pos = ((camera_get_view_height(view_camera[0]) / 2) - round((y_pad * (_length - 1)) / 2)) + (y_pad * i);
	    current_bar_chosen = selected == i;
	    current_bar_x = x_pos - (pauseslidein * (2 + (i / 2)));
	    _txt = lang_get_value(pause_menu[i]);
	    draw_sprite(bar_sprite, current_bar_chosen, current_bar_x, y_pos + (shake * current_bar_chosen));
	    entry = pause_menu[i];
	    mapentry = array_get(ds_map_find_value(pause_menu_map, b), 0);
	    var menu_icon = 0;
	    if struct_exists(PZ_icon_struct, pause_menu[selected]) menu_icon = struct_get(PZ_icon_struct, pause_menu[selected])

	    if (!is_undefined(mapentry))
	        draw_sprite_ext(spr_newpause_icons, menu_icon, current_bar_x + random_range(-1, 1) + 117, y_pos + random_range(-1, 1), 1, 1, 0, c_white, current_bar_chosen);

	    switch _txt
	    {    
	        case "RESTART LEVEL":
                    _txt = "RETRY"
		break;
                case "EXIT LEVEL":
                    _txt = "EXIT"
		break;
                case "CHEF TASKS":
                    _txt = "TASKS"
		break;
	    }
	    
	    draw_text_ext_color(current_bar_x - 20, y_pos + (shake * current_bar_chosen), _txt, -5, 100000, c_gray, c_gray, c_gray, c_gray, 1);
	    draw_text_ext_colour(current_bar_x - 20, y_pos + (shake * current_bar_chosen), _txt, -5, 100000, c_white, c_white, c_white, c_white, current_bar_chosen);
	}
	
	if (!is_not_level) draw_sprite_ext(MOD_GLOBAL.spr_newpause_treasure, treasurefound, 835 + pauseslidein, 400, 1, 1, 0, c_white, (treasurealpha == 0 && treasurefound == 0) ? 0.5 : max(treasurealpha, global.treasure));
	
	pattern_anim_bluat++
	
	draw_sprite_ext_flash(playerPauseSprite, oldportrait ? global.panic : playerPauseIndex, 100 - pauseslidein, 422 + pauseslidein, 1, 1, 0, 5183024, 1);
	shader_set(global.Pal_Shader);
	
	if global.palettetexture != -4 pattern_set(global.Base_Pattern_Color, playerPauseSprite, random_range(0, 2), 1, 1, global.palettetexture, false, (pattern_anim_bluat * sprite_get_speed(global.palettetexture)) % sprite_get_number(global.palettetexture));
	else pattern_set(global.Base_Pattern_Color, playerPauseSprite, random_range(0, 2), 1, 1, global.palettetexture);

	pal_swap_set(spr_palette, paletteselect, false);
	draw_sprite_ext(playerPauseSprite, oldportrait ? global.panic : playerPauseIndex, 107 - pauseslidein, 411 + pauseslidein, 1, 1, 0, c_white, 1);
	pal_swap_reset();
	
	if (transfotext != -4 && !instance_exists(obj_achievement_pause))
	{
	    draw_set_alpha(fade);
	    draw_set_font(lang_get_font("creditsfont"));
	    draw_set_halign(fa_left);
	    draw_set_valign(fa_top);
	    draw_set_color(c_white);
	    var xx = obj_screensizer.actual_width / 2;
	    var yy = obj_screensizer.actual_height - 50;
	    var s = transfotext_size;
	    xx -= (s[0] / 2);
	    yy -= s[1];
	    
	    if (global.jukebox != -4)
	        yy -= 40;
	    
	    xx = floor(xx);
	    yy = floor(yy);
	    global.tdp_text_try_outline = true;
	    scr_draw_text_arr(xx, yy, transfotext, c_white, fade);
	    global.tdp_text_try_outline = false;
	    tdp_text_commit();
	    draw_set_alpha(1);
	}
}
return false;