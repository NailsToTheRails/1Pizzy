persistent = true;
sprite_index = MOD_GLOBAL.KEYFOLLOW;
image_speed = 0.35;
depth = -3;
waveOffset = random_range(0, 1000);
blurEffectTimer = 0;
visible = 0;
getFacingDirection = function(_x, _y)
{
	if (_x != _y)
		return -sign(_x - _y);
	return 1;
}
get_primaryPlayer = function()
{
	return obj_player1
}
get_nearestPlayer = function(_x = x, _y = y)
{
	return instance_nearest(_x, _y,  obj_player1);
}