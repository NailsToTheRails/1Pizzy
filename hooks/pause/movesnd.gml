
if (global.PZ_opts.SSENmenu == 0) or (global.PZ_opts.SSENmenu == 2 && MOD_GLOBAL.pl_char != "PZ") exit;

if (global.PZ_opts.pausemenustyle == 2)
{
	return "event:/sfx/pep/step"
	exit;
}

_note = global.MenuNoteArray[global.MenuNoteArraySelect];
fmod_event_instance_set_parameter(global.PZ_menu_note_inst, "note", _note, true);
fmod_event_instance_play(global.PZ_menu_note_inst);
global.MenuNoteArraySelect++;
global.MenuNoteArraySelect = wrap(global.MenuNoteArraySelect, 0, array_length(global.MenuNoteArray) - 1);

var UoD = key_down2 - key_up2
if UoD != 0 shake = UoD*10

return false;