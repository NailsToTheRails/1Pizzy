var event = argument0;
if global.laps == 3 exit;
// BETTER DEBUGING (for me but idk if u wanna use it too ig)
// if instance_exists(obj_shell) 
// {
	// array_push(obj_shell.history,event)
	// obj_shell.saveHistory = 1
// }
if obj_player1.character == "PZ"
{
	if event == "event:/modded/cosmicclone" return "event:/sugary/music/cosmicclone";
    if event == "event:/music/pizzatime" || event == "event:/modded/lap3"
	{
		var ass = 0;
		if (global.lapmode != 2) && (!global.PZ_opts.lap3duringinf) ass = 1;
		var current_lap = clamp(global.laps,0,2-ass)
		//show_message(current_lap)
		//if current_lap != global.laps return false;
		return MOD_GLOBAL.pizzyost[global.pizzyost[current_lap],current_lap]
		/*
		if global.laps = 0
		{
			switch (global.PZ_opts.escapetheme) {
			case 0 :
			return MOD_GLOBAL.pizzyost.SugarRushLila
			break;
			case 1 :
			return MOD_GLOBAL.pizzyost.SugarRush
			break;
			case 2 :
			return MOD_GLOBAL.pizzyost.GlucoseGetaway
			break;
			case 3 :
			return MOD_GLOBAL.pizzyost.GlucoseGetawayConstruct
			break;
			case 4 :
			return MOD_GLOBAL.pizzyost.GlucoseGetawayBewitched
			break;
			case 5 :
			return MOD_GLOBAL.pizzyost.MidiGetawayDemo1
			break;
			case 6 :
			return MOD_GLOBAL.pizzyost.MidiGetawayConstruct
			break;
			case 7 :
			return MOD_GLOBAL.pizzyost.PizzyDoingIt
			break;
			case 8 :
			return MOD_GLOBAL.pizzyost.SugaryPizza
			break;
			case 9 :
			return MOD_GLOBAL.pizzyost.SugarRushDemo2
			break;
			}
		}
	}
	if string_pos("(L1)",argument0) != -1
	{
	if global.laps = 1
			{
			switch (global.PZ_opts.lap2theme) {
			case 0 :
			return MOD_GLOBAL.pizzyost.SweetReleaseEN
			break;
			case 1 :
			return MOD_GLOBAL.pizzyost.SweetReleaseDemo1
			break;
			case 2 :
			return MOD_GLOBAL.pizzyost.SweetReleaseESQUIZ
			break;
			case 3 :
			return MOD_GLOBAL.pizzyost.SweetReleaseMIDI
			break;
			case 4 :
			return MOD_GLOBAL.pizzyost.SweetReleaseDemo2
			break;
			case 5 :
			return MOD_GLOBAL.pizzyost.SweetReleaseJAM
			break;
			case 6 :
			return MOD_GLOBAL.pizzyost.ThickOfDeath
			break;
			}
		}
	}
	if string_pos("(L2)",argument0) != -1
	{
	if global.laps = 2
			{
			switch (global.PZ_opts.lap3theme) {
			case 0 :
			return MOD_GLOBAL.pizzyost.ClockinOutLate
			break;
			case 1 :
			return MOD_GLOBAL.pizzyost.HarryBilk
			break;
			case 2 :
			return MOD_GLOBAL.pizzyost.Harry
			break;
			case 3 :
			return MOD_GLOBAL.pizzyost.SugarCube
			break;
			case 4 :
			return MOD_GLOBAL.pizzyost.Unexpection
			break;
			case 5 :
			return MOD_GLOBAL.pizzyost.BlueLicorace
			break;
			case 6 :
			return MOD_GLOBAL.pizzyost.ThickOfIt
			break;
			}
		}
		*/
	}

}
