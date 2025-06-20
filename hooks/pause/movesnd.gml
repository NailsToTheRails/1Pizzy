function wrap(arg0, arg1, arg2)
{
    var _min, _max, range;
    
    _min = min(arg1, arg2);
    _max = max(arg1, arg2);
    range = (_max - _min) + 1;
    return ((((arg0 - _min) % range) + range) % range) + _min;
}

_uid = fmod_event_create_instance("event:/sugary/pausemove");
_note = global.MenuNoteArray[global.MenuNoteArraySelect];
fmod_event_instance_set_parameter(_uid, "note", _note, true);
fmod_event_instance_play(_uid);
global.MenuNoteArraySelect++;
global.MenuNoteArraySelect = wrap(global.MenuNoteArraySelect, 0, array_length(global.MenuNoteArray) - 1);
return false;