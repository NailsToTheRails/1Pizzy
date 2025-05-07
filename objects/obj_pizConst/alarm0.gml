if !instance_exists(obj_player1) exit;
if !variable_global_exists("leveltosave") exit;


if (global.extremevisual && check_lap_mode(2) && global.panic && room != rank_room && global.leveltosave != "practice")
{
    var lap = global.extremevisual == 1 ? 3 : 2;
    if (global.laps >= lap)
    {
        instance_create(0, 0, obj_yogurtdebriseffect);
        instance_create(0, 0, obj_yogurtfirebg);
    }
    obj_panicdebris.draw = false;
}

if global.panic exit;
if global.timeattack exit;
if global.snickchallenge exit;
if room == entrance_1 && obj_player1.character == "PZ" && obj_music.music.event_name == "event:/music/w1/entrance" && obj_music.music.event_name != "event:/sugary/music/entrance"
{
    with(obj_music)
    {
	if room == entrance_1 {
        fmod_event_instance_stop(music.event, true);
        fmod_event_instance_release(music.event, true);
        music.event_name = "event:/sugary/music/entrance";
        music.event = fmod_event_create_instance(music.event_name);
        fmod_event_instance_play(music.event);
	}
    }
}