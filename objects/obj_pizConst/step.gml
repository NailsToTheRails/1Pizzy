if !instance_exists(obj_player1) exit;

MOD_GLOBAL.pl_char = obj_player.character

if (obj_player1.character != "PZ") exit;

if instance_exists(obj_taxitransition)
{
    with obj_taxitransition
    {
        if (sprite_index == spr_taxitransition_pep) sprite_index = MOD_GLOBAL.spr_taxitransitionPZ
        if (sprite_index == spr_taxitransition_cop) sprite_index = MOD_GLOBAL.spr_taxitransitionPZCOP
        if (sprite_index == spr_taxitransition_pizzaface) sprite_index = MOD_GLOBAL.spr_taxitransitionPZPIZZA  
    }
}
if instance_exists(obj_spaceshuttlecutscene)
{
    with obj_spaceshuttlecutscene
    {
        if (sprite_index == spr_spacetravelcutscene) sprite_index = MOD_GLOBAL.spr_spacePZ
    }   
}
if instance_exists(obj_skinchoice)
{
    MOD_GLOBAL.PZPatLoaded = false;
    MOD_GLOBAL.pizzloaded = false;
}

with (obj_player)
{
	switch (global.PZ_opts.spritestyle)
	{
		case 0:
		if (other.sprreset)
		{
			scr_characterspr()
			other.sprreset = 0;
		}
		break;
		case 2:
		other.sprreset = 1;
		spr_idle = MOD_GLOBAL.spr_idleD1;
		spr_move = MOD_GLOBAL.spr_moveD1;
		spr_mach1 = MOD_GLOBAL.spr_mach1D1;
		spr_mach = MOD_GLOBAL.spr_machD1;
		spr_mach4 = MOD_GLOBAL.spr_mach4D1;
		spr_crazyrun = MOD_GLOBAL.spr_crazyrunD1;
		spr_machslideboost3 = MOD_GLOBAL.spr_machslideboost3D1;
		break;
	}
}

var portalobjs = [obj_lapportal, obj_lapportalentrance, "obj_practiceportal", "obj_practiceportal_exit", "obj_lotw_enterportal", "obj_lotw_exitportal"];
for (var i = 0; i < array_length(portalobjs); i++)
{
	var index = i;
	var obj = portalobjs[index];
	var isModded = is_string(obj);
	if (isModded)
	{
		with (obj_mod_object)
		{
			if (__OBJECT.name == obj)
			{
				if (index % 2 == 0)
				{
					spr_enter = MOD_GLOBAL.spr_PZLapPortalEnd
					image_speed = 0.75;
				}
				else
					spr_spit = MOD_GLOBAL.spr_PZLapPortalStart;
			}
		}
	}
	else
	{
		with (obj)
		{
			if (index % 2 == 0)
			{
				spr_enter = MOD_GLOBAL.spr_PZLapPortalEnd
				image_speed = 0.75;
			}
			else
				spr_spit = MOD_GLOBAL.spr_PZLapPortalStart;
		}
	}
}

if instance_exists(obj_bosscontroller)
{
    with (obj_bosscontroller)
    {
        player_hpsprite = MOD_GLOBAL.spr_PZbossHP;
    }
} // todo: change most of these sets to a switch later
with (obj_superattackeffect)
{
    sprite_index = MOD_GLOBAL.spr_PZbossSuperHUD;
}
with (obj_ghostdrapes)
{
    sprite_index = MOD_GLOBAL.spr_PZghostdrape;
}
// Its Quite That Simple Really.
with (obj_combotitle)
{
	if (global.PZ_opts.combonames) 
	{
		sprite_index = MOD_GLOBAL.spr_SScomboTitles;
	} 
	else 
	{
		sprite_index = spr_comboend_title1;
	}
}
with (obj_comboend) 
{
	if (global.PZ_opts.combonames) 
	{
		sprite = MOD_GLOBAL.spr_SScomboTitles;
	} 
	else
	{
		sprite = spr_comboend_title1;
	}
}

//instance_activate_object(self);