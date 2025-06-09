randomize()
MOD_GLOBAL._iconlist = []
add_sprite = function(name, frames, xorigin, yorigin)
{
    var s = sprite_add(concat(MOD_PATH, "/sprites/", name, ".png"), frames, false, false, xorigin, yorigin);
    sprite_set_speed(s, 1, spritespeed_framespergameframe);
    return s;
}
var _f = file_find_first(MOD_PATH + "/sprites/icons/*.png",0)
for(var _i = 0; _f != "";_i++)
{
    MOD_GLOBAL._iconlist[_i] = sprite_add(MOD_PATH + "/sprites/icons/" + _f,1,false,false,0,0)
    _f = file_find_next(MOD_PATH + "/sprites/icons*.png",0)
}
_iconrandom = irandom_range(0,array_length(MOD_GLOBAL._iconlist))
ini_open(MOD_PATH + "/saveData.ini");
// SETTING VARIABLES. DONT FUCK WITH THESE OR ELSE SETTINGS WILL CRASH

// COSMETIC
global.combometertype = ini_read_real("modded", "combometertype", 0);
global.spookeytoggle = ini_read_real("modded", "spookeytoggle", 0);
global.toppinstyle = ini_read_real("modded", "toppinstyle", 0);
global.combonames = ini_read_real("modded", "combonames", 0);
global.pizzypronoun = ini_read_real("modded", "pizzypronoun", 1); // 0 he/him 1 she/her 2 they/them
MOD_GLOBAL.pizzypronoun = ["M", "F", "X"]
global.extremevisual = ini_read_real("modded", "extremevisual", 0);
global.tauntstyle = ini_read_real("modded", "tauntstyle", 0);

// MUSIC
global.escapetheme = ini_read_real("modded", "escapetheme", 0);
global.lap2theme = ini_read_real("modded", "lap2theme", 0);
global.lap3theme = ini_read_real("modded", "lap3theme", 0);
global.lap3duringinf = ini_read_real("modded", "lap3duringinf", 0);

// GAMEPLAY
global.walljumptype = ini_read_real("modded", "walljumptype", 0);
global.experimenPZ = ini_read_real("modded","experimenPZ",0);


global.pizzyost = [global.escapetheme, global.lap2theme, global.lap3theme];

ini_close();
MOD_GLOBAL.pizzyost[0,0] = "event:/sugary/music/(L1)Sugar Rush (Lila Mix)"
MOD_GLOBAL.pizzyost[1,0] = "event:/sugary/music/(L1)Sugar Rush (Exhibition Night)"
MOD_GLOBAL.pizzyost[2,0] = "event:/sugary/music/(L1)Glucose Getaway"
MOD_GLOBAL.pizzyost[3,0] = "event:/sugary/music/(L1)Glucose Getaway (Construct)"
MOD_GLOBAL.pizzyost[4,0] = "event:/sugary/music/(L1)Glucose Getaway (Bewitched! Remix)"
MOD_GLOBAL.pizzyost[5,0] = "event:/sugary/music/(L1)Midi Getaway (Demo 1)"
MOD_GLOBAL.pizzyost[6,0] = "event:/sugary/music/(L1)Midi Getaway (Construct)"
MOD_GLOBAL.pizzyost[7,0] = "event:/sugary/music/(L1)THE pizzelle's FAVORITE SONG THAT they listen TO WHEN they do IT"
MOD_GLOBAL.pizzyost[8,0] = "event:/sugary/music/(L1)It's SugaryPizza Time!"
MOD_GLOBAL.pizzyost[9,0] = "event:/sugary/music/(L1)Glucose Getaway (FANMADE DEMO 2)"
MOD_GLOBAL.pizzyost[0,1] = "event:/sugary/music/(L2)Sweet Release of Death (EN)"
MOD_GLOBAL.pizzyost[1,1] = "event:/sugary/music/(L2)Sweet Release of Death (Demo 1)"
MOD_GLOBAL.pizzyost[2,1] = "event:/sugary/music/(L2)Sweet Release of Death (Esquiz Mix)"
MOD_GLOBAL.pizzyost[3,1] = "event:/sugary/music/(L2)Sweet Release of MIDI"
MOD_GLOBAL.pizzyost[4,1] = "event:/sugary/music/(L2)Sweet Release of Death (FANMADE DEMO 2)"
MOD_GLOBAL.pizzyost[5,1] = "event:/sugary/music/(L2)Sweet Release of Jam"
MOD_GLOBAL.pizzyost[6,1] = "event:/sugary/music/(L2)I'm in The Thick of Death"
MOD_GLOBAL.pizzyost[0,2] = "event:/sugary/music/(L3)Clockin' Out Late"
MOD_GLOBAL.pizzyost[1,2] = "event:/sugary/music/(L3)Harry's Despair-y (Bilk Mix)"
MOD_GLOBAL.pizzyost[2,2] = "event:/sugary/music/(L3)Harry's Despair-y"
MOD_GLOBAL.pizzyost[3,2] = "event:/sugary/music/(L3)Sugarcube Hailstorm"
MOD_GLOBAL.pizzyost[4,2] = "event:/sugary/music/(L3)UNEXPECTION"
MOD_GLOBAL.pizzyost[5,2] = "event:/sugary/music/(L3)Blue Licorice"
MOD_GLOBAL.pizzyost[6,2] = "event:/sugary/music/(L3)thickofit"
MOD_GLOBAL.pizzyost[7,2] = "event:/sugary/music/(L3)Gummy Harry's Brain Freezin'"
MOD_GLOBAL.pizzyost[8,2] = "event:/sugary/music/(L3)Gummy Harry's Brain Freezin' V2"
MOD_GLOBAL.pizzyost[9,2] = "event:/sugary/music/(L3)Coneball Lapping Two"

// I don't know what to do this is the best i got :sob: - Ashley
MOD_GLOBAL.pizzyosttimes[0] = 99
MOD_GLOBAL.pizzyosttimes[1] = 100
MOD_GLOBAL.pizzyosttimes[2] = 70
MOD_GLOBAL.pizzyosttimes[3] = 66
MOD_GLOBAL.pizzyosttimes[4] = 60
MOD_GLOBAL.pizzyosttimes[5] = 70
MOD_GLOBAL.pizzyosttimes[6] = 66
MOD_GLOBAL.pizzyosttimes[7] = 63
MOD_GLOBAL.pizzyosttimes[8] = 20
MOD_GLOBAL.pizzyosttimes[9] = 94

var i = 0
while i <array_length(global.mods)
{
    if variable_struct_exists(global.mods[i],"name")
    {
        var name = variable_struct_get(global.mods[i],"name")
        if name = "Pizzelle"
        {	
			MOD_GLOBAL.ogicon = variable_struct_get(global.mods[i],"icon")
            variable_struct_set(global.mods[i],"icon", MOD_GLOBAL._iconlist[_iconrandom])
        }
    }
    i++
}
var i = 0
if instance_exists(obj_modlist)
{
	while i < array_length(obj_modlist.mods)
	{
		if variable_struct_exists(obj_modlist.mods[i],"name")
		{
			var name = variable_struct_get(obj_modlist.mods[i],"name")
			if name = "Pizzelle"
			{	
				variable_struct_set(obj_modlist.mods[i],"icon", MOD_GLOBAL._iconlist[_iconrandom])
			}
		}
		i++
	}
}
MOD_GLOBAL.CustomThemesCheck = ["event:/sugary/music/(L1)Glucose Getaway (FANMADE DEMO 2)","event:/sugary/music/(L1)Glucose Getaway (Bewitched! Remix)","event:/sugary/music/(L1)Glucose Getaway (Construct)","event:/sugary/music/(L1)Glucose Getaway","event:/sugary/music/(L1)It's SugaryPizza Time!","event:/sugary/music/(L1)Midi Getaway (Construct)","event:/sugary/music/(L1)Midi Getaway (Demo 1)","event:/sugary/music/(L1)Sugar Rush (Exhibition Night)","event:/sugary/music/(L1)THE pizzelle's FAVORITE SONG THAT they listen TO WHEN they do IT","event:/sugary/music/(L1)Sugar Rush (Lila Mix)","event:/sugary/music/(L2)Sweet Release of Death (Demo 1)","event:/sugary/music/(L2)Sweet Release of Death (FANMADE DEMO 2)","event:/sugary/music/(L2)Sweet Release of Death (EN)","event:/sugary/music/(L2)Sweet Release of Death (Esquiz Mix)","event:/sugary/music/(L2)Sweet Release of MIDI","event:/sugary/music/(L2)Sweet Release of Jam","event:/sugary/music/(L2)I'm in The Thick of Death","event:/sugary/music/(L3)Blue Licorice","event:/sugary/music/(L3)Clockin' Out Late","event:/sugary/music/(L3)Harry's Despair-y (Bilk Mix)","event:/sugary/music/(L2)(L3)Harry's Despair-y","event/:sugary/music/(L3)UNEXPECTION","event/:sugary/music/(L3)Sugarcube Hailstorm","event:/sugary/music/(L3)thickofit","event:/sugary/music/(L3)Gummy Harry's Brain Freezin'","event:/sugary/music/(L3)Gummy Harry's Brain Freezin' V2","event:/sugary/music/(L3)Coneball Lapping Two",]
MOD_GLOBAL.EPIC = sprite_add(MOD_PATH + "/sprites/Epic.png", 1, false, false, 50, 50);
MOD_GLOBAL.PZ_snd_wallkick = fmod_event_create_instance("event:/sugary/wallkick");
MOD_GLOBAL.spr_tv_keyget = sprite_add(MOD_PATH + "/sprites/spr_tv_keyget.png", 21, false, false, 139, 134);
MOD_GLOBAL.spr_tv_exprConfect1 = sprite_add(MOD_PATH + "/sprites/tv_exprConfecti1.png", 1, false, false, 139, 134);
MOD_GLOBAL.spr_tv_exprmach2 = sprite_add(MOD_PATH + "/sprites/spr_tv_exprmach2.png", 8, false, false, 139, 134);
MOD_GLOBAL.KEY = sprite_add(MOD_PATH + "/sprites/spr_key.png", 8, false, false, 50, 100);
MOD_GLOBAL.KEYIDLE = sprite_add(MOD_PATH + "/sprites/spr_keyidle.png", 8, false, false, 50, 50);
MOD_GLOBAL.KEYFOLLOW = sprite_add(MOD_PATH + "/sprites/spr_keymove.png", 8, false, false, 50, 50);
MOD_GLOBAL.KEYPRACTICE = sprite_add(MOD_PATH + "/sprites/L3DX_PZ/spr_practicespookey.png", 1, false, false, 50, 50);
MOD_GLOBAL.KEYSUPERTAUNT = sprite_add(MOD_PATH + "/sprites/spr_keysupertaunt.png", 11, false, false, 50, 50);
MOD_GLOBAL.bg_optionsbg = sprite_add(MOD_PATH + "/sprites/bg_optionsbg.png", 1, false, false, 0, 0);
global.KeyFollowerList = ds_list_create();
global.pm_shed_PZ =
{
    garage_spr: sprite_add(MOD_PATH + "/sprites/L3DX_PZ/spr_gusgarage.png", 1, false, false, 96, 144),
    garage_door: sprite_add(MOD_PATH + "/sprites/L3DX_PZ/spr_gusgarage_door.png", 1, false, false, 96, 144),
    garage_door_index: 0,
    interior_bg: sprite_add(MOD_PATH + "/sprites/L3DX_PZ/bg_gusgarage.png", 1, false, false, 0, 0),
    interior_tiles: sprite_add(MOD_PATH + "/sprites/L3DX_PZ/tile_gusgarage.png", 1, false, false, 0, 0),
    interior_window_overlay: sprite_add(MOD_PATH + "/sprites/L3DX_PZ/spr_garagewindow.png", 1, false, false, 0, 0),
    interior_door: sprite_add(MOD_PATH + "/sprites/L3DX_PZ/spr_garagedoor.png", 1, false, false, 0, 0),
    interior_door_index: 0,
    guy: sprite_add(MOD_PATH + "/sprites/L3DX_PZ/spr_guy.png", 3, false, false, 100, 95),
    guy_xscale: -1,
    guy_arm: sprite_add(MOD_PATH + "/sprites/L3DX_PZ/spr_arm.png", 1, false, false, 5, 81),
    granny_lines: 21,
    guy_pointer: sprite_add(MOD_PATH + "/sprites/L3DX_PZ/spr_guy_pointer.png", 12, false, false, 55, 50),
    guy_pointer_fall: sprite_add(MOD_PATH + "/sprites/L3DX_PZ/spr_guy_fall.png", 1, false, false, 55, 50),
    guy_gustavo_section: -4,
    guy_gustavo_section_left: -4,
    guy_gustavo_section_fall: -4,
};

MOD_GLOBAL.spr_chargeeffectsjump = sprite_add(MOD_PATH + "/sprites/spr_chargeeffectsjump.png", 11, false, false, 50, 50);
MOD_GLOBAL.bg_SSjukeboxdisc = sprite_add(MOD_PATH + "/sprites/bg_SSjukeboxdisc.png", 1, false, false, 202, 202);
MOD_GLOBAL.spr_taxitransitionPZ = sprite_add(MOD_PATH + "/sprites/spr_taxitransition.png", 1, false, false, 22, 16)
MOD_GLOBAL.spr_taxitransitionPZCOP = sprite_add(MOD_PATH + "/sprites/spr_taxitransition_cop.png", 1, false, false,  22, 16)
MOD_GLOBAL.spr_taxitransitionPZPIZZA = sprite_add(MOD_PATH + "/sprites/spr_taxitransition_pizza.png", 1, false, false,  22, 16)
MOD_GLOBAL.spr_PZdance = sprite_add(MOD_PATH + "/sprites/spr_playerPZ_dance.png", 11, false, false,  50, 50)
MOD_GLOBAL.spr_spacePZ = sprite_add(MOD_PATH + "/sprites/spacePZ.png", 2, false, false, 32, 23)
MOD_GLOBAL.remux = true;

instance_create(0,0,obj_pizConst);
MOD_GLOBAL.pizzloaded = false;
MOD_GLOBAL.PZPatLoaded = false;

//          EXTRA PLAYER SPR / FRENZ-E / CHEESED UP LEGACY ASSETS
MOD_GLOBAL.spr_rocketturnair = sprite_add(MOD_PATH + "/sprites/spr_rocketturnair.png", 15, false, false, 50, 50);
MOD_GLOBAL.spr_PZLapPortalEnd = sprite_add(MOD_PATH + "/sprites/exPlayer/LapPortalEnd.png", 22, false, false, 50, 100);
MOD_GLOBAL.spr_PZKnightGlide = sprite_add(MOD_PATH + "/sprites/exPlayer/KnightGlide.png", 3, false, false, 60, 50);
MOD_GLOBAL.spr_PZtrashstart = sprite_add(MOD_PATH + "/sprites/exPlayer/trashstart.png", 10, false, false, 50, 50);
MOD_GLOBAL.spr_PZtrashjump = sprite_add(MOD_PATH + "/sprites/exPlayer/trashjump.png", 12, false, false, 50, 50);
MOD_GLOBAL.spr_PZtrashjump2 = sprite_add(MOD_PATH + "/sprites/exPlayer/trashjump2.png", 5, false, false, 50, 50);
MOD_GLOBAL.spr_PZtrashfall = sprite_add(MOD_PATH + "/sprites/exPlayer/trashfall.png", 3, false, false, 50, 50);
MOD_GLOBAL.spr_PZtrashslide = sprite_add(MOD_PATH + "/sprites/exPlayer/trashslide.png", 7, false, false, 50, 50);
sprite_set_speed(MOD_GLOBAL.spr_PZtrashjump, 1, spritespeed_framespergameframe);
sprite_set_speed(MOD_GLOBAL.spr_PZtrashjump2, 1, spritespeed_framespergameframe);
sprite_set_speed(MOD_GLOBAL.spr_PZtrashslide, 1, spritespeed_framespergameframe);
MOD_GLOBAL.spr_PZCpat1 = sprite_add(MOD_PATH + "/sprites/pat/cuDouble.png", 1, false, false, 8, 8);
MOD_GLOBAL.spr_PZCpat2 = sprite_add(MOD_PATH + "/sprites/pat/cuSugary.png", 1, false, false, 16, 16);

// COMBO METER EXHIBITION NIGHT
MOD_GLOBAL.spr_tvHUD_comboMeter = sprite_add(MOD_PATH + "/sprites/spr_tvHUD_comboMeter.png", 13, false, false, 137, 80);
MOD_GLOBAL.spr_tvHUD_comboMeter_fill = sprite_add(MOD_PATH + "/sprites/spr_tvHUD_comboMeter_fill.png", 12, false, false, 0, 0);
MOD_GLOBAL.spr_tvHUD_comboMeter_cut = sprite_add(MOD_PATH + "/sprites/spr_tvHUD_comboMeter_cut.png", 1, false, false, 0, 0);
MOD_GLOBAL.spr_tvHUD_comboFont = sprite_add(MOD_PATH + "/sprites/spr_tvHUD_comboFont.png", 10, false, false, 0, 0);
MOD_GLOBAL.spr_tvHUD_comboMeter_back = sprite_add(MOD_PATH + "/sprites/spr_tvHUD_comboMeter_back.png", 1, false, false, 0, 0);
MOD_GLOBAL.spr_tvHUD_comboMeter_pal = sprite_add(MOD_PATH + "/sprites/spr_tvHUD_comboMeter_pal.png", 1, false, false, 0, 0);

// P RANK BUILD
MOD_GLOBAL.spr_Pcombometer = sprite_add(MOD_PATH + "/sprites/PRANK/spr_Pcombometer.png", 1, false, false, 50, 91);
MOD_GLOBAL.spr_Pcombometer_cut = sprite_add(MOD_PATH + "/sprites/PRANK/spr_Pcombometer_cut.png", 1, false, false, 50, 91);
MOD_GLOBAL.spr_Pcombometer_goo = sprite_add(MOD_PATH + "/sprites/PRANK/spr_Pcombometer_goo.png", 12, false, false, 50, 91);
MOD_GLOBAL.spr_Pcombometer_font = sprite_add(MOD_PATH + "/sprites/PRANK/spr_Pcombometer_font.png", 11, false, false, 0, 0);
MOD_GLOBAL.spr_Pcombometer_hand = sprite_add(MOD_PATH + "/sprites/PRANK/spr_Pcombometer_hand.png", 1, false, false, 75, 91);
global.SSPRANKcombofont = font_add_sprite_ext(MOD_GLOBAL.spr_Pcombometer_font, "1234567890x", true, -24);

// JUNE

MOD_GLOBAL.spr_tvHUD_comboMeter_pal_JUNE = sprite_add(MOD_PATH + "/sprites/JUNE/JUNEPal.png", 1, false, false, 0, 0);
MOD_GLOBAL.spr_tvHUD_comboMeter_fill_JUNE = sprite_add(MOD_PATH + "/sprites/JUNE/JUNEfill.png", 12, false, false, 0, 0);
MOD_GLOBAL.spr_tvHUD_comboMeter_JUNE = sprite_add(MOD_PATH + "/sprites/JUNE/JUNEMeter.png", 13, false, false, 137, 80);

global.SScombofont = font_add_sprite_ext(MOD_GLOBAL.spr_tvHUD_comboFont, "0123456789", true, -0.1);

MOD_GLOBAL.spr_VLCpat = sprite_add(MOD_PATH + "/sprites/pat/VLC.png", 1, false, false, 13, 13);

MOD_GLOBAL.spr_mytimepat = sprite_add(MOD_PATH + "/sprites/pat/mytime.png", 1, false, false, 0, 0);
MOD_GLOBAL.spr_sugarysecretpat = sprite_add(MOD_PATH + "/sprites/pat/sugarysecret.png", 1, false, false, 0, 0);

MOD_GLOBAL.spr_SScomboTitles = sprite_add(MOD_PATH + "/sprites/spr_SScomboTitles.png", 50, false, false, 81, 37);

//      EXHIBITION ASSETS
MOD_GLOBAL.spr_PZENpat1 = sprite_add(MOD_PATH + "/sprites/pat/demoBrain.png", 1, false, false, 13, 13);
MOD_GLOBAL.spr_PZENpat2 = sprite_add(MOD_PATH + "/sprites/pat/demoBrainG.png", 1, false, false, 13, 13);
MOD_GLOBAL.spr_PZENpat3 = sprite_add(MOD_PATH + "/sprites/pat/demoHazard.png", 1, false, false, 16, 16);
MOD_GLOBAL.spr_PZENpat4 = sprite_add(MOD_PATH + "/sprites/pat/demoSteamy.png", 1, false, false, 16, 16);
MOD_GLOBAL.spr_PZENpat5 = sprite_add(MOD_PATH + "/sprites/pat/demoWorm.png", 1, false, false, 13, 13);
MOD_GLOBAL.spr_PZENpat6 = sprite_add(MOD_PATH + "/sprites/pat/demoFrog.png", 1, false, false, 16, 16);
MOD_GLOBAL.spr_PZENpat7 = sprite_add(MOD_PATH + "/sprites/pat/demoPaper.png", 1, false, false, 16, 16);
//      MAY BUILD / P RANK BUILD / NEW patterns / assets
MOD_GLOBAL.spr_PZMpat1 = sprite_add(MOD_PATH + "/sprites/pat/mayCream.png", 1, false, false, 13, 13);
MOD_GLOBAL.spr_PZMpat2 = sprite_add(MOD_PATH + "/sprites/pat/mayHero.png", 1, false, false, 13, 13);
MOD_GLOBAL.spr_PZMpat3 = sprite_add(MOD_PATH + "/sprites/pat/mayMuerto.png", 1, false, false, 13, 13);
MOD_GLOBAL.spr_PZMpat4 = sprite_add(MOD_PATH + "/sprites/pat/maySwirl.png", 1, false, false, 8, 8);
MOD_GLOBAL.spr_PZMpat5 = sprite_add(MOD_PATH + "/sprites/pat/mayCaramel.png", 1, false, false, 13, 13);
MOD_GLOBAL.spr_PZMpat6 = sprite_add(MOD_PATH + "/sprites/pat/mayFunkay.png", 1, false, false, 13, 13);
MOD_GLOBAL.spr_PZMpat6 = sprite_add(MOD_PATH + "/sprites/pat/mayFunkay.png", 1, false, false, 13, 13);
MOD_GLOBAL.spr_PZMpat7 = sprite_add(MOD_PATH + "/sprites/pat/mayLeaf.png", 1, false, false, 13, 13);
MOD_GLOBAL.spr_PZMpat8 = sprite_add(MOD_PATH + "/sprites/pat/mayNapol.png", 1, false, false, 13, 13);
MOD_GLOBAL.spr_PZMpat9 = sprite_add(MOD_PATH + "/sprites/pat/mayCookie.png", 1, false, false, 16, 16);
MOD_GLOBAL.spr_PZMpat10 = sprite_add(MOD_PATH + "/sprites/pat/mayMissing.png", 1, false, false, 13, 13);
MOD_GLOBAL.spr_PZMpat11 = sprite_add(MOD_PATH + "/sprites/pat/maySolid.png", 1, false, false, 13, 13);
MOD_GLOBAL.spr_PZMpat12 = sprite_add(MOD_PATH + "/sprites/pat/mayChoco.png", 1, false, false, 13, 13);

MOD_GLOBAL.spr_PZQpat1 = sprite_add(MOD_PATH + "/sprites/pat/prAlright.png", 1, false, false, 16, 16);
MOD_GLOBAL.spr_PZQpat2 = sprite_add(MOD_PATH + "/sprites/pat/prSmooth.png", 1, false, false, 16, 16);
MOD_GLOBAL.spr_PZQpat3 = sprite_add(MOD_PATH + "/sprites/pat/prlookGood.png", 1, false, false, 16, 16);
MOD_GLOBAL.spr_PZQpat4 = sprite_add(MOD_PATH + "/sprites/pat/prFruity.png", 1, false, false, 16, 16);
MOD_GLOBAL.spr_PZQpat5 = sprite_add(MOD_PATH + "/sprites/pat/prMesmer.png", 1, false, false, 16, 16);
MOD_GLOBAL.spr_PZQpat6 = sprite_add(MOD_PATH + "/sprites/pat/prStrike.png", 1, false, false, 16, 16);
MOD_GLOBAL.spr_PZQpat7 = sprite_add(MOD_PATH + "/sprites/pat/prSoulcr.png", 1, false, false, 16, 16);
MOD_GLOBAL.spr_PZQpat8 = sprite_add(MOD_PATH + "/sprites/pat/prAwesome.png", 1, false, false, 16, 16);
MOD_GLOBAL.spr_PZQpat9 = sprite_add(MOD_PATH + "/sprites/pat/prWTF.png", 1, false, false, 16, 16);
MOD_GLOBAL.spr_lammypat = sprite_add(MOD_PATH + "/sprites/pat/lammy.png", 1, false, false, 16, 16);

MOD_GLOBAL.spr_fireass_intro = sprite_add(MOD_PATH + "/sprites/spr_fireass_intro.png", 6, false, false, 50, 50);
MOD_GLOBAL.spr_fireass_fall = sprite_add(MOD_PATH + "/sprites/spr_fireass_fall.png", 3, false, false, 50, 50);
MOD_GLOBAL.spr_fireass_dash = sprite_add(MOD_PATH + "/sprites/spr_fireass_dash.png", 16, false, false, 75, 75);
MOD_GLOBAL.spr_fireass_ground = sprite_add(MOD_PATH + "/sprites/spr_fireass_ground.png", 11, false, false, 50, 50);

MOD_GLOBAL.spr_wallkickCloud = sprite_add(MOD_PATH + "/sprites/spr_wallkickCloud.png", 4, false, false, 17, 16);
MOD_GLOBAL.spr_spinningFireParticle = sprite_add(MOD_PATH + "/sprites/spr_spinningFireParticle.png", 6, false, false, 50, 50);
MOD_GLOBAL.spr_wallkick_effect = sprite_add(MOD_PATH + "/sprites/spr_wallkick_effect.png", 12, false, false, 50, 50);
MOD_GLOBAL.spr_flowerpetal1 = sprite_add(MOD_PATH + "/sprites/spr_flowerpetal1.png", 7, false, false, 16, 16);
MOD_GLOBAL.spr_flowerpetal2 = sprite_add(MOD_PATH + "/sprites/spr_flowerpetal2.png", 7, false, false, 16, 16);
MOD_GLOBAL.spr_flowerpetal3 = sprite_add(MOD_PATH + "/sprites/spr_flowerpetal3.png", 7, false, false, 16, 16);
MOD_GLOBAL.spr_flowerpetal4 = sprite_add(MOD_PATH + "/sprites/spr_flowerpetal4.png", 7, false, false, 16, 16);

MOD_GLOBAL.spr_fireass_intro = sprite_add(MOD_PATH + "/sprites/spr_fireass_intro.png", 6, false, false, 50, 50);
MOD_GLOBAL.spr_fireass_fall = sprite_add(MOD_PATH + "/sprites/spr_fireass_fall.png", 3, false, false, 50, 50);
MOD_GLOBAL.spr_fireass_dash = sprite_add(MOD_PATH + "/sprites/spr_fireass_dash.png", 16, false, false, 75, 75);

// TOPPINSSS

//1
MOD_GLOBAL.spr_marshmallow_appear = sprite_add(MOD_PATH + "/sprites/toppins/spr_marshmallow_appear.png", 14, false, false, 50, 50);
MOD_GLOBAL.spr_marshmellow_idle = sprite_add(MOD_PATH + "/sprites/toppins/spr_marshmellow_idle.png", 12, false, false, 50, 50);
MOD_GLOBAL.spr_marshmellow_walk = sprite_add(MOD_PATH + "/sprites/toppins/spr_marshmellow_run.png", 15, false, false, 50, 50);
MOD_GLOBAL.spr_marshmellow_taunt = sprite_add(MOD_PATH + "/sprites/toppins/spr_marshmellow_taunt.png", 3, false, false, 50, 50);
MOD_GLOBAL.spr_marshmallow_supertaunt = sprite_add(MOD_PATH + "/sprites/toppins/spr_marshmallow_supertaunt.png", 10, false, false, 50, 50);
MOD_GLOBAL.spr_marshmellow_panic = sprite_add(MOD_PATH + "/sprites/toppins/spr_marshmellow_panic.png", 8, false, false, 50, 50);
MOD_GLOBAL.spr_marshmellow_panicWalk = sprite_add(MOD_PATH + "/sprites/toppins/spr_marshmellow_panicWalk.png", 15, false, false, 50, 50);

//2
MOD_GLOBAL.spr_chocolate_appear = sprite_add(MOD_PATH + "/sprites/toppins/spr_chocolate_appear.png", 22, false, false, 50, 54);
MOD_GLOBAL.spr_chocolate_idle = sprite_add(MOD_PATH + "/sprites/toppins/spr_chocolate_idle.png", 28, false, false, 50, 54);
MOD_GLOBAL.spr_chocolate_walk = sprite_add(MOD_PATH + "/sprites/toppins/spr_chocolate_walk.png", 20, false, false, 50, 54);
MOD_GLOBAL.spr_chocolate_taunt = sprite_add(MOD_PATH + "/sprites/toppins/spr_chocolate_taunt.png", 3, false, false, 50, 54);
MOD_GLOBAL.spr_chocolate_supertaunt = sprite_add(MOD_PATH + "/sprites/toppins/spr_chocolate_supertaunt.png", 10, false, false, 50, 54);
MOD_GLOBAL.spr_chocolate_panic = sprite_add(MOD_PATH + "/sprites/toppins/spr_chocolate_panic.png", 9, false, false, 50, 54);
MOD_GLOBAL.spr_chocolate_panicWalk = sprite_add(MOD_PATH + "/sprites/toppins/spr_chocolate_panicWalk.png", 20, false, false, 50, 54);


//3
MOD_GLOBAL.spr_crack_appear = sprite_add(MOD_PATH + "/sprites/toppins/spr_crack_appear.png", 17, false, false, 54, 54);
MOD_GLOBAL.spr_crack_idle = sprite_add(MOD_PATH + "/sprites/toppins/spr_crack_idle.png", 22, false, false, 50, 54);
MOD_GLOBAL.spr_crack_walk = sprite_add(MOD_PATH + "/sprites/toppins/spr_crack_walk.png", 9, false, false, 50, 54);
MOD_GLOBAL.spr_crack_taunt = sprite_add(MOD_PATH + "/sprites/toppins/spr_crack_taunt.png", 3, false, false, 50, 54);
MOD_GLOBAL.spr_crack_supertaunt = sprite_add(MOD_PATH + "/sprites/toppins/spr_crack_supertaunt.png", 10, false, false, 50, 54);
MOD_GLOBAL.spr_crack_panic = sprite_add(MOD_PATH + "/sprites/toppins/spr_crack_panic.png", 9, false, false, 50, 54);
MOD_GLOBAL.spr_crack_panicWalk = sprite_add(MOD_PATH + "/sprites/toppins/spr_crack_panicWalk.png", 9, false, false, 50, 54);

//4
MOD_GLOBAL.spr_gummyworm_appear = sprite_add(MOD_PATH + "/sprites/toppins/spr_gummyworm_appear.png", 15, false, false, 50, 54);
MOD_GLOBAL.spr_gummyworm_idle = sprite_add(MOD_PATH + "/sprites/toppins/spr_gummyworm_idle.png", 21, false, false, 50, 54);
MOD_GLOBAL.spr_gummyworm_walk = sprite_add(MOD_PATH + "/sprites/toppins/spr_gummyworm_walk.png", 9, false, false, 50, 54);
MOD_GLOBAL.spr_gummyworm_taunt = sprite_add(MOD_PATH + "/sprites/toppins/spr_gummyworm_taunt.png", 3, false, false, 50, 54);
MOD_GLOBAL.spr_gummyworm_supertaunt = sprite_add(MOD_PATH + "/sprites/toppins/spr_gummyworm_supertaunt.png", 10, false, false, 50, 54);
MOD_GLOBAL.spr_gummyworm_panic = sprite_add(MOD_PATH + "/sprites/toppins/spr_gummyworm_panic.png", 10, false, false, 50, 54);
MOD_GLOBAL.spr_gummyworm_panicWalk = sprite_add(MOD_PATH + "/sprites/toppins/spr_gummyworm_panicWalk.png", 9, false, false, 50, 54);

//5
MOD_GLOBAL.spr_candy_appear = sprite_add(MOD_PATH + "/sprites/toppins/spr_candy_appear.png", 18, false, false, 50, 54);
MOD_GLOBAL.spr_candy_idle = sprite_add(MOD_PATH + "/sprites/toppins/spr_candy_idle.png", 34, false, false, 50, 54);
MOD_GLOBAL.spr_candy_walk = sprite_add(MOD_PATH + "/sprites/toppins/spr_candy_walk.png", 15, false, false, 50, 54);
MOD_GLOBAL.spr_candy_taunt = sprite_add(MOD_PATH + "/sprites/toppins/spr_candy_taunt.png", 3, false, false, 50, 54);
MOD_GLOBAL.spr_candy_supertaunt = sprite_add(MOD_PATH + "/sprites/toppins/spr_candy_supertaunt.png", 10, false, false, 50, 54);
MOD_GLOBAL.spr_candy_panic = sprite_add(MOD_PATH + "/sprites/toppins/spr_candy_panic.png", 26, false, false, 50, 54);
MOD_GLOBAL.spr_candy_panicWalk = sprite_add(MOD_PATH + "/sprites/toppins/spr_candy_panicWalk.png", 15, false, false, 50, 54);

MOD_GLOBAL.spr_newpause_bars1 = sprite_add(MOD_PATH + "/sprites/pause/spr_newpause_bars1.png", 2, false, false, 160, 48);
MOD_GLOBAL.spr_newpause_bars2 = sprite_add(MOD_PATH + "/sprites/pause/spr_newpause_bars2.png", 2, false, false, 160, 48);
MOD_GLOBAL.spr_newpause_bars3 = sprite_add(MOD_PATH + "/sprites/pause/spr_newpause_bars3.png", 2, false, false, 160, 48);
MOD_GLOBAL.spr_newpause_bars4 = sprite_add(MOD_PATH + "/sprites/pause/spr_newpause_bars4.png", 2, false, false, 160, 48);
MOD_GLOBAL.spr_newpause_bars5 = sprite_add(MOD_PATH + "/sprites/pause/spr_newpause_bars5.png", 2, false, false, 160, 48);
MOD_GLOBAL.spr_newpause_border = sprite_add(MOD_PATH + "/sprites/pause/spr_newpause_border.png", 2, false, false, 530, 320);
MOD_GLOBAL.spr_pizzelle_pause = sprite_add(MOD_PATH + "/sprites/pause/spr_pizzelle_pause.png", 3, false, false, 184, 162);
MOD_GLOBAL.spr_newpause_icons = sprite_add(MOD_PATH + "/sprites/pause/spr_newpause_icons.png", 9, false, false, 36, 36);

//PAUSE SCREEN FUNCTION
global.fontSS = font_add_sprite_ext(sprite_add(MOD_PATH + "/sprites/spr_font.png", 59, false, false, 0, 0), "AÁÀÂÃBCÇDEÉÊFGHIÍJKLMNÑOÓÔÕPQRSTUÚVWXYZ!¡.,1234567890:?¿_- ", 1, 0);
/*
MOD_GLOBAL.drawpause = function()
{
var is_not_level, bar_x_offsets, bar_y_offsets, bar_text, bar_sprite, _length, i, y_pad, x_pos, y_pos, current_bar_chosen, current_bar_x, _txt, entry, mapentry;

var pausedSprite = undefined;
var pauseBorder = sprite_add(MOD_PATH + "/sprites/pause/spr_newpause_border.png", 2, false, false, 530, 320);
var secretIconScale = [2, 2, 2];
var secretIconVisible = [0, 0, 0];
var bar_sprite = asset_get_index("global.spr_newpause_bars" + string(selected + 1));

 if (instance_exists(obj_option) || instance_exists(obj_achievement_pause))
        exit;

if (!is_undefined(pausedSprite))
    draw_sprite_stretched(pausedSprite, 0, 0, 0, 960, 540);

var is_not_level = global.leveltosave == -4
draw_set_alpha(whitealpha);
draw_rectangle_color(-5000, 0, 5000, 1080, #0D001B, #0D001B, #0D001B, #0D001B, false);
draw_set_alpha(1);
draw_sprite_ext(pauseBorder, is_not_level, 480, 270, borderscale, borderscale, 0, c_white, 1);

if (!is_not_level)
{
    draw_sprite_ext(spr_newpause_secreticon, 0, 804, 64, secretIconScale[0], secretIconScale[0], 0, c_white, secretIconVisible[0]);
    draw_sprite_ext(spr_newpause_secreticon, 1, 855, 54, secretIconScale[1], secretIconScale[1], 0, c_white, secretIconVisible[1]);
    draw_sprite_ext(spr_newpause_secreticon, 2, 906, 70, secretIconScale[2], secretIconScale[2], 0, c_white, secretIconVisible[2]);
}

draw_set_font(global.fontSS);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
bar_x_offsets = [507, 495, 478, 460, 443];
bar_y_offsets = [103, 177, 249, 324, 396];
bar_text = pause_menu;
bar_sprite = asset_get_index("spr_newpause_bars" + string(selected + 1));
_length = array_length(pause_options);

for (i = 0; i < _length; i++)
{
    y_pad = 73;
    x_pos = lerp(507, 443, i / (_length - 1));
    y_pos = ((camera_get_view_height(view_camera[0]) / 2) - round((y_pad * (_length - 1)) / 2)) + (y_pad * i);
    current_bar_chosen = selected == i;
    current_bar_x = x_pos - (pauseslidein * (2 + (i / 2)));
    _txt = lang_get(pause_options[i]);
    draw_sprite(bar_sprite, current_bar_chosen, xx, y_pos + (shake * current_bar_chosen));
    entry = pause_options[selected];
    mapentry = ds_map_find_value(pause_map, entry);
    
    if (!is_undefined(mapentry))
        draw_sprite_ext(spr_newpause_icons, mapentry, current_bar_x + random_range(-1, 1) + 117, y_pos + random_range(-1, 1), 1, 1, 0, c_white, current_bar_chosen);
    
    draw_text_color(current_bar_x - 20, y_pos + (shake * current_bar_chosen), _txt, c_gray, c_gray, c_gray, c_gray, 1);
    draw_text_color(current_bar_x - 20, y_pos + (shake * current_bar_chosen), _txt, c_white, c_white, c_white, c_white, current_bar_chosen);
}

if (!is_not_level)
    draw_sprite(spr_newpause_treasure, treasurefound, 835 + pauseslidein, 400);

if (global.gamePauseState == 1)
{
    draw_sprite_ext_flash(playerPauseSprite, playerPauseIndex, 100 - pauseslidein, 422 + pauseslidein, 1, 1, 0, 5183024, 1);
    draw_player_sprite_ext(playerPauseSprite, playerPauseIndex, 107 - pauseslidein, 411 + pauseslidein, 1, 1, 0, c_white, 1);
}

if (transfotext != -4 && !instance_exists(obj_achievement_pause))
        {
            draw_set_alpha(fade);
            draw_set_font(lang_get_font("creditsfont"));
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);
            draw_set_color(c_white);
            var xx = obj_screensizer.actual_width / 2;
            var yy = obj_screensizer.actual_height - 50;
            var s = transfotext_size;
            xx -= (s[0] / 2);
            yy -= s[1];
            
            if (global.jukebox != -4)
                yy -= 40;
            
            xx = floor(xx);
            yy = floor(yy);
            global.tdp_text_try_outline = true;
            scr_draw_text_arr(xx, yy, transfotext, c_white, fade);
            global.tdp_text_try_outline = false;
            tdp_text_commit();
            draw_set_alpha(1);
        }
}
*/
instance_create(0,0,obj_pizConst);
