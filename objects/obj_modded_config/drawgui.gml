draw_set_color(c_white)
draw_sprite_tiled(MOD_GLOBAL.bg_optionsbg, 0, bgscroll, bgscroll);
// draw_text(SCREEN_WIDTH/15,SCREEN_HEIGHT/6,"holy yap we gotta add alot of this")
draw_set_color(c_black);
draw_set_alpha(0.5);
draw_rectangle(180, 0, SCREEN_WIDTH - 180, SCREEN_HEIGHT, false);
draw_set_color(c_white);
draw_set_alpha(1);
var i = 0;
repeat (array_length(options[category].variables)) {
    draw_set_color(i == selection ? c_white : c_grey);
    draw_set_halign(fa_left);
    draw_set_font(lang_get_font("font_small"))
    draw_text(200, SCREEN_HEIGHT/6 + (i * 32), (options[category].variables[i].name))
    draw_set_font(lang_get_font("font_small"))
    draw_set_halign(fa_right);
    draw_text(SCREEN_WIDTH - 200,SCREEN_HEIGHT/6 + (i * 32), options[category].variables[i].options[variable_global_get(options[category].variables[i].variable)])
    i++;
}
draw_set_halign(fa_center);
draw_set_font(lang_get_font("bigfont"));
draw_set_color(c_white);
draw_text(SCREEN_WIDTH/2, 28, string_upper(options[category].name));
var _l = string_width(options[category].name);
draw_set_font(lang_get_font("font_small"));
draw_set_color(selection == -1 ? c_white : c_grey);
draw_set_halign(fa_right);
draw_text(SCREEN_WIDTH/2 - max(_l, 90) + min(0, arrow), 42, "<");
draw_set_halign(fa_left);
draw_text(SCREEN_WIDTH/2 + max(_l, 90) + max(0, arrow), 42, ">");

if selection > -1
{
    draw_set_halign(fa_center);
    draw_set_color(c_black);
    draw_set_alpha(0.5);
    draw_roundrect_ext(60, SCREEN_HEIGHT - 85, SCREEN_WIDTH - 60, SCREEN_HEIGHT - 10, 15, 15, false);
    draw_set_font(lang_get_font("tutorialfont"));
    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_text(SCREEN_WIDTH/2, SCREEN_HEIGHT - 75, options[category].variables[selection].desc);
}