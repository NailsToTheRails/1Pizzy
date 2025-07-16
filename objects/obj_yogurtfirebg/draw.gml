var SH = SCREEN_HEIGHT;
var SW = SCREEN_WIDTH;

static xoff = 0;
xoff += 1;

var _al = 0.7;
var _fh = 270;
var _fs = 0;
var _cx = CAMX;
var _cy = CAMY;
var _b1s = 0.85;
var _b2s = 0.75;
var _f1x = _cx * _b1s;
//_f1x %= 960;
var _f2x = _cx * _b2s;
//_f2x %= 960;
var _f1y = (_cy / (max(room_height, SH + 1) - SH)) * (SH / 2);
var _f2y = (_cy / (max(room_height, SH + 1) - SH)) * (SH / 2);
_f1y = (_cy + 450) - (_f1y * _b1s);
_f2y = (_cy + 400) - (_f2y * _b2s);

if ((room_height - SH) <= ceil(SH / 2.7))
{
    _f1y = 260 - (_cy / 16);
    _f2y = 290 - (_cy / 20);
}

_f1y = round(_f1y);
_f2y = round(_f2y);

draw_sprite_ext(MOD_GLOBAL.spr_yogurtfirebg2, 0, _cx, _cy + SH, SW / 100, (0.75 + (sin(siner / 150) * 0.35)) * 2.25, 0, -1, 0.85);

xoff %= 480 * 3;

var i = 0;
var currentX = 0;
repeat (2)
{
	var nxoff = xoff * (!i ? 0.8 : 1);
	currentX = ((_cx - (!i ? _f2x : _f1x)) + _fs) - (nxoff);
	while (currentX < _cx + (SW * 2) - nxoff)
	{
		draw_sprite_ext(MOD_GLOBAL.spr_yogurtfirebg, i, currentX, (!i ? _f2y : _f1y) + _fh + 60, 3, 2, 0, c_white, _al);
		currentX += 480 * 3;
	}
	i++;
}
