if !instance_exists(obj_player1) exit;
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

if instance_exists(obj_lapportal)
{
    with (obj_lapportal)
    {
        spr_enter = MOD_GLOBAL.spr_PZLapPortalEnd
    }
}

// Its Quite That Simple Really.
with (obj_combotitle) {
	if (global.combonames) {
	sprite_index = MOD_GLOBAL.spr_SScomboTitles;
	} else {
	sprite_index = spr_comboend_title1;
	}
}
with (obj_comboend) {
	if (global.combonames) {
	sprite = MOD_GLOBAL.spr_SScomboTitles;
	} else {
	sprite = spr_comboend_title1;
	}
}

instance_activate_object(self);