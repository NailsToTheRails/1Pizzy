function wrap(arg0, arg1, arg2)
{
    var _min, _max, range;
    
    _min = min(arg1, arg2);
    _max = max(arg1, arg2);
    range = (_max - _min) + 1;
    return ((((arg0 - _min) % range) + range) % range) + _min;
}

if (global.PZ_opts.SSENmenu == 0) or (global.PZ_opts.SSENmenu == 2 && global.playercharacter != "PZ") exit;

_note = global.MenuNoteArray[global.MenuNoteArraySelect];
fmod_event_instance_set_parameter(global.PZ_menu_note_inst, "note", _note, true);
fmod_event_instance_play(global.PZ_menu_note_inst);
global.MenuNoteArraySelect++;
global.MenuNoteArraySelect = wrap(global.MenuNoteArraySelect, 0, array_length(global.MenuNoteArray) - 1);
return false;