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

if (!instance_exists(obj_player))
{
	pauseslidein = floor(lerp(pauseslidein, 0, 0.2));
	borderscale = floor_ext(lerp(borderscale, 1, 0.3), 100);
}
else
{
	pauseslidein = ceil(lerp(pauseslidein, 500, 0.1));
	borderscale = ceil_ext(lerp(borderscale, 4, 0.2), 100);
}
