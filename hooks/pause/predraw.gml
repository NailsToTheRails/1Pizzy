
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
if fade > 0
{
	if pause or fade >= 1
	{
		draw_set_alpha(1);
		scr_draw_pause_image();
	}

var spr_newpause_icons = MOD_GLOBAL.spr_newpause_icons
var is_not_level, bar_x_offsets, bar_y_offsets, bar_text, bar_sprite, i, y_pad, x_pos, y_pos, current_bar_chosen, current_bar_x, _txt, entry, mapentry;
var _length = array_length(pause_menu);
var playerPauseSprite = MOD_GLOBAL.spr_pizzelle_pause
var playerPauseIndex = 0;

var pausedSprite = undefined;
var pauseBorder = MOD_GLOBAL.spr_newpause_border
var secretIconScale = [2, 2, 2];
var secretIconVisible = [0, 0, 0];
var bar_sprite = asset_get_index("MOD_GLOBAL.spr_newpause_bars" + string(selected + 1));
var shake = Approach(shake, 0, 1);
var whitealpha = floor_ext(lerp(whitealpha, 0, 0.3), 100);
var borderscale = ceil_ext(lerp(borderscale, 4, 0.2), 100);
var pauseslidein = ceil(lerp(pauseslidein, 500, 0.1));
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
    draw_sprite_ext(MOD_GLOBAL.spr_newpause_secreticon, 0, 804, 64, secretIconScale[0], secretIconScale[0], 0, c_white, secretIconVisible[0]);
    draw_sprite_ext(MOD_GLOBAL.spr_newpause_secreticon, 1, 855, 54, secretIconScale[1], secretIconScale[1], 0, c_white, secretIconVisible[1]);
    draw_sprite_ext(MOD_GLOBAL.spr_newpause_secreticon, 2, 906, 70, secretIconScale[2], secretIconScale[2], 0, c_white, secretIconVisible[2]);
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
    draw_sprite(bar_sprite, current_bar_chosen, x_pos, y_pos + (shake * current_bar_chosen));
    entry = pause_menu[i];
    mapentry = array_get(ds_map_find_value(pause_menu_map, b), 0);
    
    if (!is_undefined(mapentry))
        draw_sprite_ext(spr_newpause_icons, mapentry, current_bar_x + random_range(-1, 1) + 117, y_pos + random_range(-1, 1), 1, 1, 0, c_white, current_bar_chosen);
    
    draw_text_ext_color(current_bar_x - 20, y_pos + (shake * current_bar_chosen), _txt, -5, 100000, c_gray, c_gray, c_gray, c_gray, 1);
    draw_text_ext_colour(current_bar_x - 20, y_pos + (shake * current_bar_chosen), _txt, -5, 100000, c_white, c_white, c_white, c_white, current_bar_chosen);
}

if (!is_not_level)
    draw_sprite(spr_newpause_treasure, treasurefound, 835 + pauseslidein, 400);

draw_sprite_ext_flash(playerPauseSprite, playerPauseIndex, 100 - pauseslidein, 422 + pauseslidein, 1, 1, 0, 5183024, 1);
shader_set(global.Pal_Shader);
pattern_set(global.Base_Pattern_Color, playerPauseSprite, random_range(0, 2), 1, 1, global.palettetexture);
pal_swap_set(spr_palette, paletteselect, false);
draw_sprite(playerPauseSprite, playerPauseIndex, 107 - pauseslidein, 411 + pauseslidein, 1, 1, 0, c_white, 1);
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