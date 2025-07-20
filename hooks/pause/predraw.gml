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
switch (global.PZ_opts.pausemenustyle)
{
	case 0:
	
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
		playerPauseSprite = MOD_GLOBAL.spr_peppino_pause
		
		if struct_exists(global.PZ_player_spr_menu, MOD_GLOBAL.pl_char)
		{
			playerPauseSprite = global.PZ_player_spr_menu[$ MOD_GLOBAL.pl_char].spr
			oldportrait = global.PZ_player_spr_menu[$ MOD_GLOBAL.pl_char].old_behavior
		}
		/*
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
		*/
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
		
		var is_not_level = (global.leveltosave == -4 || global.leveltosave == "tutorial" || global.leveltosave == "secretworld" || global.leveltosave == "exit" || global.leveltosave == "grinch")

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
		
		if (!is_not_level) 
			draw_sprite_ext(MOD_GLOBAL.spr_newpause_treasure, treasurefound, 835 + pauseslidein, 400, 1, 1, 0, c_white, (treasurealpha == 0 && treasurefound == 0) ? 0.5 : max(treasurealpha, global.treasure));
		
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
	break;
	case 1:
    if (fade > 0)
    {
        draw_set_color(c_white);
        
        if (pause || fade >= 1)
        {
            draw_set_alpha(1);
            scr_draw_pause_image();
        }
        
        var xscale = obj_screensizer.actual_width / 960;
        var yscale = obj_screensizer.actual_height / 540;
        var xx = floor((obj_screensizer.actual_width / 2) - 480);
        var yy = floor((obj_screensizer.actual_height / 2) - 270);
        draw_set_alpha(pause ? (fade * 2) : fade);
        draw_sprite_tiled_ext(MOD_GLOBAL.spr_pausebg_ss, 0, ((current_time / 60) % 250) * xscale, ((current_time / 60) % 100) * yscale, xscale, yscale, c_white, draw_get_alpha());
        
        var bordercolor = 2752517
		draw_set_alpha(fade - 0.5);
		draw_rectangle_color(0, 0, obj_screensizer.actual_width, obj_screensizer.actual_height, bordercolor, bordercolor, bordercolor, bordercolor, false);
		draw_set_alpha(fade)
        /*toggle_alphafix(false);
        var bordercolor = 2752517;
        draw_reset_clip();
        draw_set_bounds(xx + 1, yy + 1, (xx + 960) - 1, (yy + 540) - 1, false, false, true);
        draw_rectangle_color(0, 0, obj_screensizer.actual_width, obj_screensizer.actual_height, bordercolor, bordercolor, bordercolor, bordercolor, false);
        draw_reset_clip();*/
        draw_sprite(MOD_GLOBAL.spr_pause_ss, 0, xx, yy);
        
        if (global.leveltosave != -4 && global.leveltosave != "tutorial" && global.leveltosave != "secretworld" && global.leveltosave != "exit")
        {
            draw_sprite(MOD_GLOBAL.spr_pauseconfecti1, global.shroomfollow, xx, yy);
            draw_sprite(MOD_GLOBAL.spr_pauseconfecti2, global.cheesefollow, xx, yy);
            draw_sprite(MOD_GLOBAL.spr_pauseconfecti3, global.tomatofollow, xx, yy);
            draw_sprite(MOD_GLOBAL.spr_pauseconfecti4, global.sausagefollow, xx, yy);
            draw_sprite(MOD_GLOBAL.spr_pauseconfecti5, global.pineapplefollow, xx, yy);
        }
        
		var oldportrait = false;

		playerPauseSprite = MOD_GLOBAL.spr_peppino_pause
		
		if struct_exists(global.PZ_player_spr_menu, MOD_GLOBAL.pl_char)
		{
			playerPauseSprite = global.PZ_player_spr_menu[$ MOD_GLOBAL.pl_char].spr
			oldportrait = global.PZ_player_spr_menu[$ MOD_GLOBAL.pl_char].old_behavior
		}
		
		pattern_anim_bluat++

		draw_sprite_ext_flash(playerPauseSprite, oldportrait ? oldportrait_index  : playerPauseIndex, xx + 686, yy + 285, 1, 1, 0, 5183024, fade);
		shader_set(global.Pal_Shader);
		
		if global.palettetexture != -4 pattern_set(global.Base_Pattern_Color, playerPauseSprite, random_range(0, 2), 1, 1, global.palettetexture, false, (pattern_anim_bluat * sprite_get_speed(global.palettetexture)) % sprite_get_number(global.palettetexture));
		else pattern_set(global.Base_Pattern_Color, playerPauseSprite, random_range(0, 2), 1, 1, global.palettetexture);
	
		if (sprite_exists(spr_palette))
			pal_swap_set(spr_palette, paletteselect, false);
		draw_sprite_ext(playerPauseSprite, oldportrait ? oldportrait_index  : playerPauseIndex, xx + 686, yy + 285, 1, 1, 0, c_white, fade);
		pal_swap_reset();
		
		draw_set_font(global.fontSSOLD);
        draw_set_align(1);
        draw_set_color(c_white);
        var _x = xx + 86;
        var _y = yy + 40;
        
        if (global.level_seconds > 10)
            draw_text_new(_x, _y, string(global.level_minutes) + ":" + string(floor(global.level_seconds)));
        
        if (global.level_seconds < 10)
            draw_text_new(_x, _y, string(global.level_minutes) + ":0" + string(floor(global.level_seconds)));
        
        var unselected_color = #9494AF;
        var len = array_length(pause_menu);
        
        for (var i = 0; i < len; i++)
        {
            _x = xx + lerp(191, 68, i / (len - 1));
            _y = yy + lerp(20, 393, i / (len - 1));
            var j = array_length(pause_menu);
			var pausebar = MOD_GLOBAL.spr_pausebutton_ss;
			/* if (j >= 4)
			pausebar = MOD_GLOBAL.spr_pausebutton_ss_short*/
			draw_sprite(pausebar, selected != i, _x, _y);
            draw_set_align(0, 1);
            
			var str = pause_menu[i];
			switch str
			{
				case "pause_resume": str = "RESUME"; break;
				case "pause_options": str = "OPTIONS"; break;
				case "pause_restart": str = "RETRY"; break;
				case "pause_exit": str = "EXIT\n  STAGE"; break;
				case "pause_exit_title": str = "EXIT\n  STAGE"; break;
				case "pause_jukebox": str = "STOP\n  MUSIC"; break;
				case "pause_achievements": str = "CHEF\n TASKS"; break;
				case "pause_exit_menu": str = "EXIT\n  MENU"; break;
				case "pause_checkpoint": str = "CHECKPOINT"; break;
				default: str = string_upper(str); break;
			}
            
            draw_set_colour((selected == i) ? c_white : unselected_color);
            var info = font_get_offset();
            draw_text_ext(floor((_x + 155) - (string_width(str) / 2)) - info.x, (floor(_y) + 70) - info.y, str, 38, 960);
        }

    }
    return false;
	break;
}