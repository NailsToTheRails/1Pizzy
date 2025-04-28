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
        ini_write_real("modded", options[i].variables[j].variable, variable_global_get(options[i].variables[j].variable));
        j++;
    }
    i++;
}
global.pizzyost = [global.escapetheme, global.lap2theme, global.lap3theme];
ini_close();