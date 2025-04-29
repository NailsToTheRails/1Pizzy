var panicID = argument0;
var event = argument1;
//whoever changed that 1 to a 20 I hope you burn in hell
if argument1 == "event:/sugary/music/cosmicclone" 
{
	fmod_event_instance_set_parameter(argument0, "state", global.panic*20, 0);
	return false;
}
if array_contains(MOD_GLOBAL.CustomThemesCheck,argument1)
{
    var curState = 0;
    var lap = global.laps;
    var time = global.fill;
    var laphell = check_lap_mode(2);
    if (!lap) // pizza time
    {
        var secs = 50 // idk do a switch case with global.pizzyost
        if (time < secs * 12)
            curState += 0.5;
    }
    else
    curState += clamp(lap + 1, 2, !laphell ? 2 : 3) * 100;
    curState += global.pizzyost[clamp(lap, 0, !laphell ? 1 : 2)]; // Chezcake ur so good at coding i had to fix this twice. Never touch this code again. If it works it works.

    fmod_event_instance_set_parameter(argument0, "state", curState, 0);
	    
	if global.laps = 0
	{
    	return false;
	}
	if string_pos("(L1)",argument1) != 0
	{
		if global.laps = 1
		{
			panicstart = 0
		}
	}
	if string_pos("(L2)",argument1) != 0
	{
		if global.laps == 2 && (global.lapmode != 1 or global.lap3duringinf)
		{
			panicstart = 0
		}
	}
}