var supertaunts = [
	obj_player1.spr_supertaunt1, obj_player1.spr_supertaunt2,
	obj_player1.spr_supertaunt3, obj_player1.spr_supertaunt4
];
// ds_list_add(global.KeyFollowerList, self);
if (array_contains(supertaunts, obj_player1.sprite_index))
{
	if (sprite_index != MOD_GLOBAL.KEYSUPERTAUNT)
	{
		sprite_index = MOD_GLOBAL.KEYSUPERTAUNT;
		image_index = 0;
	}
	var _total_frame = 8;
	var _player_pct = obj_player1.image_index / _total_frame;
	image_index = floor(_player_pct * (image_number - 1));
	image_speed = 0;
	exit;
}
if (obj_player1.sprite_index == obj_player1.spr_keyget)
{
	x = get_primaryPlayer().x;
	y = get_primaryPlayer().y;
	visible = 0;
	exit;
}
else
	visible = get_primaryPlayer().visible;

var target_object = (ds_list_find_index(global.KeyFollowerList, id) <= 0) ? get_nearestPlayer(x, y) : ds_list_find_value(global.KeyFollowerList, ds_list_find_index(global.KeyFollowerList, id) - 1);
var tgtX = target_object.x + (sign(target_object.image_xscale) * -((ds_list_find_index(global.KeyFollowerList, id) <= 0) ? 30 : 10));
var tgtY = (ds_list_find_index(global.KeyFollowerList, id) <= 0) ? (target_object.y - 40) : (target_object.y - 3);
var tgtMVSP = distance_to_point(tgtX, tgtY) / 200;
if (get_primaryPlayer().state == states.keyget)
{
	tgtMVSP = 0.8;
	tgtX = get_primaryPlayer().x + (25 * get_primaryPlayer().xscale);
}

var _d = point_direction(x, y, tgtX, tgtY);
var hsp = lengthdir_x((18 * tgtMVSP) + 0.5, _d);
var vsp = lengthdir_y((18 * tgtMVSP) + 0.5, _d);
x = Approach(x, tgtX, hsp);
y = Approach(y, tgtY, vsp);
x = round(x);
y = round(y);
if (x != target_object.x)
	image_xscale = abs(image_xscale) * getFacingDirection(x, target_object.x);

image_speed = 0.35;
if (x == xprevious)
	sprite_index = MOD_GLOBAL.KEYIDLE;
else
	sprite_index = MOD_GLOBAL.KEYFOLLOW;

if (obj_player1.state == states.victory && !instance_exists(obj_geromefollow)) {
	ds_list_delete(global.KeyFollowerList, 0);
	instance_destroy();
} 

if (!global.key_inv) 
instance_destroy();

if (blurEffectTimer-- <= 0)
{
	blurEffectTimer = 2;
	create_blur_afterimage(x, y, sprite_index, image_index, image_xscale) //pls work
}