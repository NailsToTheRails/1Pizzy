//taken from bronzeclad cuz im LAZY!?!? asking for permission
if room == Mainmenu 
{
    instance_activate_object(obj_music);
    instance_activate_object(obj_mainmenu);
}
instance_activate_object(obj_option);
instance_activate_object(obj_modlist);
instance_activate_object(obj_pause);
instance_activate_object(obj_transfotip);

ini_open(MOD_PATH + "/saveData.ini");
var i = 0;
repeat(array_length(options))
{
    var j = 0;
    repeat array_length(options[i].variables)
    {
        ini_write_real("modded", options[i].variables[j].variable, struct_get(opt_struct, options[i].variables[j].variable));
        j++;
    }
    i++;
}
global.pizzyost = [global.escapetheme, global.lap2theme, global.lap3theme];

fmod_event_instance_release(global.yaebal)
switch (global.tauntstyle) 
{
	case 0: global.yaebal = fmod_event_create_instance("event:/sugary/taunt"); break;
	case 1: global.yaebal = fmod_event_create_instance("event:/sugary/tauntOLD"); break;
	case 2: global.yaebal = fmod_event_create_instance("event:/sfx/pep/taunt"); break;
}

ini_close();