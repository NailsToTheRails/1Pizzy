if !instance_exists(obj_player1) exit;
if global.snickchallenge exit;
if global.panic exit;
if room == entrance_1 && obj_player1.character == "PZ" && obj_music.music.event_name != "event:/sugary/music/entrance"
{
    with(obj_music)
    {
        fmod_event_instance_stop(music.event, true);
        fmod_event_instance_release(music.event, true);
        music.event_name = "event:/sugary/music/entrance";
        music.event = fmod_event_create_instance(music.event_name);
        fmod_event_instance_play(music.event);
    }
}