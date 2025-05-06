yy = (yy + 2) % 700;
yy2 = (yy * 2) % 700;

var _col = c_red;
var _cx = CAMX;
var _cy = CAMY;
draw_sprite_tiled_ext(MOD_GLOBAL.bg_yogurtDebris, 0, -round(_cx * 0.15), -round(_cy * 0.15) - yy, 1, 1, _col, 0.65);
draw_sprite_tiled_ext(MOD_GLOBAL.bg_yogurtDebris, 1, -round(_cx * 0.3) + 160, (-round(_cy * 0.3) - yy2) + 160, 1, 1, _col, 0.3);
