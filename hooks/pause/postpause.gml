enum MusicNote
{
	B3 = 0,
	C4 = 1,
	CS4 = 2,
	D4 = 3,
	DS4 = 4,
	E4 = 5,
	F4 = 6,
	FS4 = 7,
	G4 = 8,
	GS4 = 9,
	A4 = 10,
	AS4 = 11,
	B4 = 12,
	C5 = 13,
	CS5 = 14,
	D5 = 15,
	DS5 = 16,
	E5 = 17,
	F5 = 18,
	FS5 = 19,
	G5 = 20,
	GS5 = 21,
	A5 = 22,
	AS5 = 23,
	B5 = 24,
	C6 = 25,
	CS6 = 26,
	D6 = 27,
	DS6 = 28,
	E6 = 29,
	F6 = 30,
	FS6 = 31,
	G6 = 32,
	GS6 = 33,
	A6 = 34,
	AS6 = 35,
	B6 = 36,
	C7 = 37,
	CS7 = 38,
	D7 = 39,
	DS7 = 40,
	E7 = 41,
	F7 = 42,
	FS7 = 43,
	G7 = 44,
	GS7 = 45,
	A7 = 46,
	AS7 = 47,
	B7 = 48,
	C8 = 49
}

pauseslidein = 500;
playerPauseIndex = irandom_range(0, sprite_get_number(MOD_GLOBAL.spr_pizzelle_pause) - 1);
borderscale = 4;
global.MenuNoteArraySelect = 0;
shake = 0;
switch (global.leveltosave)
{
	default:
    note_array = [MusicNote.CS6, MusicNote.GS6, MusicNote.CS7, MusicNote.CS6, MusicNote.GS6, MusicNote.CS7, MusicNote.CS6, MusicNote.GS6, MusicNote.CS6, MusicNote.GS6, MusicNote.CS7, MusicNote.CS6, MusicNote.GS6, MusicNote.CS7, MusicNote.CS6, MusicNote.GS6, MusicNote.C6, MusicNote.G6, MusicNote.C7, MusicNote.C6, MusicNote.G6, MusicNote.C7, MusicNote.C6, MusicNote.G6, MusicNote.C6, MusicNote.G6, MusicNote.C7, MusicNote.C6, MusicNote.C7, MusicNote.G6, MusicNote.C6, MusicNote.G6];
    break;

// floor 1

	case "tutorial":
    note_array = [MusicNote.DS7, MusicNote.CS7, MusicNote.DS7, MusicNote.CS7, MusicNote.E7, MusicNote.DS7, MusicNote.CS7, MusicNote.E7, MusicNote.DS7, MusicNote.DS7, MusicNote.CS7, MusicNote.DS7, MusicNote.CS7, MusicNote.E7, MusicNote.DS7, MusicNote.CS7, MusicNote.E7, MusicNote.B6, MusicNote.GS6, MusicNote.GS6, MusicNote.GS6, MusicNote.GS6, MusicNote.GS6, MusicNote.GS6, MusicNote.GS6, MusicNote.GS6, MusicNote.GS6, MusicNote.GS6, MusicNote.GS6, MusicNote.E7, MusicNote.FS7, MusicNote.E7, MusicNote.CS7, MusicNote.E7, MusicNote.B6, MusicNote.GS6, MusicNote.GS6, MusicNote.A6, MusicNote.B6, MusicNote.A6, MusicNote.GS6, MusicNote.FS6, MusicNote.E6, MusicNote.E7];
    break;

	case "entrance":
    note_array = [MusicNote.FS5, MusicNote.A5, MusicNote.B5, MusicNote.CS6, MusicNote.B5, MusicNote.A5, MusicNote.FS5, MusicNote.D5, MusicNote.A5, MusicNote.B5, MusicNote.CS6, MusicNote.B5, MusicNote.E6, MusicNote.CS6, MusicNote.FS5, MusicNote.A5, MusicNote.B5, MusicNote.CS6, MusicNote.E6, MusicNote.A6, MusicNote.B6, MusicNote.B6, MusicNote.A6, MusicNote.B6, MusicNote.CS7, MusicNote.D7, MusicNote.CS7, MusicNote.FS6];
    break;

	case "medieval":
    note_array = [MusicNote.C6, MusicNote.G6, MusicNote.FS6, MusicNote.C6, MusicNote.DS6, MusicNote.DS6, MusicNote.DS6, MusicNote.DS6, MusicNote.F6, MusicNote.C6, MusicNote.G6, MusicNote.FS6, MusicNote.C6, MusicNote.DS6, MusicNote.DS6, MusicNote.DS6, MusicNote.DS6, MusicNote.F6, MusicNote.C6, MusicNote.G6, MusicNote.FS6, MusicNote.C6, MusicNote.DS6, MusicNote.DS6, MusicNote.DS6, MusicNote.DS6, MusicNote.F6, MusicNote.C6, MusicNote.G6, MusicNote.FS6, MusicNote.C6, MusicNote.DS6, MusicNote.F6, MusicNote.G6, MusicNote.AS6, MusicNote.C7];
    break;

	case "ruin":
    note_array = [MusicNote.FS5, MusicNote.FS5, MusicNote.A5, MusicNote.B5, MusicNote.A5, MusicNote.B5, MusicNote.C6, MusicNote.FS5, MusicNote.FS5, MusicNote.A5, MusicNote.B5, MusicNote.A5, MusicNote.B5, MusicNote.CS6];
    break;

	case "dungeon":
    note_array = [MusicNote.C6, MusicNote.AS5, MusicNote.DS6, MusicNote.C6, MusicNote.DS6, MusicNote.C6, MusicNote.DS6, MusicNote.E6, MusicNote.F6, MusicNote.G6, MusicNote.G6, MusicNote.AS6, MusicNote.G6, MusicNote.F6, MusicNote.DS6, MusicNote.C6, MusicNote.AS5, MusicNote.B5, MusicNote.G6, MusicNote.DS6, MusicNote.C6, MusicNote.AS6, MusicNote.G6, MusicNote.DS6, MusicNote.C6, MusicNote.AS6, MusicNote.G6, MusicNote.F6, MusicNote.DS6, MusicNote.D6, MusicNote.C6, MusicNote.C7, MusicNote.DS7, MusicNote.C7, MusicNote.G6, MusicNote.DS6, MusicNote.DS7, MusicNote.C7, MusicNote.G6, MusicNote.DS6, MusicNote.DS7, MusicNote.F7, MusicNote.FS7, MusicNote.G7, MusicNote.AS7, MusicNote.C8];
    break;

// floor 2

	case "badland":
     note_array = [MusicNote.G5, MusicNote.D6, MusicNote.D6, MusicNote.G6, MusicNote.F6, MusicNote.F6, MusicNote.D6, MusicNote.C6, MusicNote.AS5, MusicNote.G5, MusicNote.AS5, MusicNote.C6, MusicNote.D6, MusicNote.C6, MusicNote.AS5, MusicNote.G5, MusicNote.AS5, MusicNote.D6, MusicNote.C6, MusicNote.F6, MusicNote.F6, MusicNote.F6, MusicNote.G6, MusicNote.G6, MusicNote.F6, MusicNote.F6, MusicNote.D6, MusicNote.C6, MusicNote.AS5, MusicNote.G5, MusicNote.AS5, MusicNote.C6, MusicNote.D6, MusicNote.C6, MusicNote.AS5, MusicNote.G5, MusicNote.AS5, MusicNote.C6, MusicNote.D6, MusicNote.C6, MusicNote.AS5, MusicNote.G5, MusicNote.F5, MusicNote.D5, MusicNote.F5, MusicNote.G5];
     break;

// floor 3

// floor 4

// floor 5

	case "chateau":
    note_array = [MusicNote.A5, MusicNote.C6, MusicNote.E6, MusicNote.A5, MusicNote.DS6, MusicNote.C6, MusicNote.A5, MusicNote.C6, MusicNote.DS6, MusicNote.A5, MusicNote.E6, MusicNote.A5, MusicNote.DS6, MusicNote.C6, MusicNote.A5, MusicNote.G5, MusicNote.F5, MusicNote.C6, MusicNote.E6, MusicNote.A5, MusicNote.DS6, MusicNote.C6, MusicNote.A5, MusicNote.C6, MusicNote.DS6, MusicNote.A5, MusicNote.E6, MusicNote.A5, MusicNote.DS6, MusicNote.A5, MusicNote.G6, MusicNote.A6];
    break;

	case "war":
    note_array = [MusicNote.F5, MusicNote.F6, MusicNote.C6, MusicNote.F5, MusicNote.F6, MusicNote.C6, MusicNote.F5, MusicNote.F6, MusicNote.C6, MusicNote.F5, MusicNote.F6, MusicNote.C6, MusicNote.F5, MusicNote.F6, MusicNote.C6, MusicNote.F5, MusicNote.CS6, MusicNote.GS5, MusicNote.F5, MusicNote.CS6, MusicNote.GS5, MusicNote.F5, MusicNote.CS6, MusicNote.GS5, MusicNote.F5, MusicNote.CS6, MusicNote.GS5, MusicNote.F5, MusicNote.CS6, MusicNote.GS5, MusicNote.F5, MusicNote.CS6, MusicNote.DS6, MusicNote.AS5, MusicNote.F5, MusicNote.DS6, MusicNote.AS5, MusicNote.F5, MusicNote.DS6, MusicNote.AS5, MusicNote.F5, MusicNote.DS6, MusicNote.AS5, MusicNote.F5, MusicNote.DS6, MusicNote.AS5, MusicNote.F5, MusicNote.DS6, MusicNote.DS6, MusicNote.AS5, MusicNote.G5, MusicNote.DS6, MusicNote.AS5, MusicNote.G5, MusicNote.DS6, MusicNote.AS5, MusicNote.G5, MusicNote.DS6, MusicNote.AS5, MusicNote.G5, MusicNote.DS6, MusicNote.AS5, MusicNote.G5, MusicNote.DS6];
    break;

// bosses

	case "b_pepperman":
    note_array = [MusicNote.D6, MusicNote.D6, MusicNote.F6, MusicNote.G6, MusicNote.GS6, MusicNote.A6, MusicNote.C7, MusicNote.A6, MusicNote.GS6, MusicNote.GS6, MusicNote.G6, MusicNote.F6, MusicNote.D6, MusicNote.D6, MusicNote.F6, MusicNote.G6, MusicNote.D6, MusicNote.D6, MusicNote.F6, MusicNote.G6, MusicNote.GS6, MusicNote.A6, MusicNote.C7, MusicNote.A6, MusicNote.D7, MusicNote.D7, MusicNote.C7, MusicNote.A6, MusicNote.GS6, MusicNote.D6, MusicNote.F6, MusicNote.D6];
    break;

// cyop towers

	case "cyop_golf2":
     note_array = [MusicNote.F5,MusicNote.F5,MusicNote.F5,MusicNote.GS5,MusicNote.C6,MusicNote.GS5,MusicNote.C6,MusicNote.CS5,MusicNote.CS5,MusicNote.F5,MusicNote.GS5,MusicNote.AS5,MusicNote.C6,MusicNote.GS5];
     break;

// modded content

	case "lotw":
     note_array = [MusicNote.G6,MusicNote.A6,MusicNote.AS6,MusicNote.G6,MusicNote.D7,MusicNote.A6,MusicNote.AS6,MusicNote.G6,    MusicNote.G6,MusicNote.A6,MusicNote.AS6,MusicNote.G6,MusicNote.D7,MusicNote.A6,MusicNote.AS6,MusicNote.G6,MusicNote.FS6,MusicNote.A6,MusicNote.AS6,MusicNote.FS6,MusicNote.D7,MusicNote.A6,MusicNote.AS6,MusicNote.FS6,MusicNote.FS6,MusicNote.A6,MusicNote.AS6,MusicNote.D7,MusicNote.C7,MusicNote.AS6,MusicNote.A6,MusicNote.FS6,];
     break;

	case "practice":
     note_array = [MusicNote.GS6,MusicNote.B6,MusicNote.D7,MusicNote.GS6,MusicNote.B6,MusicNote.D7,MusicNote.GS6,MusicNote.B6,MusicNote.DS7,MusicNote.GS6,MusicNote.B6,MusicNote.DS7,MusicNote.GS6,MusicNote.B6,MusicNote.CS7,MusicNote.E7,MusicNote.GS6,MusicNote.B6,MusicNote.D7,MusicNote.GS6,MusicNote.B6,MusicNote.D7,MusicNote.GS6,MusicNote.B6,MusicNote.DS7,MusicNote.GS6,MusicNote.B6,MusicNote.DS7,MusicNote.GS6,MusicNote.B6,MusicNote.CS7,MusicNote.E7,MusicNote.FS6,MusicNote.A6,MusicNote.C7,MusicNote.FS6,MusicNote.A6,MusicNote.C7,MusicNote.FS6,MusicNote.A6,MusicNote.CS7,MusicNote.FS6,MusicNote.A6,MusicNote.CS7,MusicNote.FS6,MusicNote.A6,MusicNote.B6,MusicNote.D7,MusicNote.FS6,MusicNote.A6,MusicNote.C7,MusicNote.FS6,MusicNote.A6,MusicNote.C7,MusicNote.FS6,MusicNote.A6,MusicNote.CS7,MusicNote.FS6,MusicNote.A6,MusicNote.CS7,MusicNote.FS6,MusicNote.A6,MusicNote.B6,MusicNote.D7];
     break;

}
global.MenuNoteArray = note_array;
fmod_event_instance_set_paused(global.PZ_menu_note_inst, false);
pattern_anim_bluat = 0

PZ_icon_struct = {
	"pause_resume" : 0,
	"pause_options" : 1,
	"pause_restart" : 2,
	"pause_jukebox" : 5,
	"pause_achievements" : 3,
	"pause_exit_title" : 4,
	"pause_exit" : 4,
}

