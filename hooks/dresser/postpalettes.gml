

// Patterns
// WIP

with (obj_skinchoice)
{
if (global.sandbox)
{
    add_pattern(MOD_GLOBAL.spr_PZENpat1, "pattern_PZEN_1").set_entry("Brainy").set_palette(12);
    add_pattern(MOD_GLOBAL.spr_PZENpat2, "pattern_PZEN_2").set_entry("BrainyG").set_palette(12);
    add_pattern(MOD_GLOBAL.spr_PZENpat3, "pattern_PZEN_3").set_entry("Hazard").set_palette(12);
    add_pattern(MOD_GLOBAL.spr_PZENpat4, "pattern_PZEN_4").set_entry("Steamy").set_palette(12);
    add_pattern(MOD_GLOBAL.spr_PZENpat5, "pattern_PZEN_5").set_entry("Worm").set_palette(12);
    add_pattern(MOD_GLOBAL.spr_PZENpat6, "pattern_PZEN_6").set_entry("Frog").set_palette(12);
    add_pattern(MOD_GLOBAL.spr_PZENpat7, "pattern_PZEN_7").set_entry("Notebook").set_palette(12);

    if (MOD_GLOBAL.remux == true)
    {
        add_pattern(MOD_GLOBAL.spr_PZMpat1, "pattern_PZM_1").set_entry("Creamed").set_palette(12);
        add_pattern(MOD_GLOBAL.spr_PZMpat2, "pattern_PZM_2").set_entry("Heroic").set_palette(12);
        add_pattern(MOD_GLOBAL.spr_PZMpat3, "pattern_PZM_3").set_entry("Muerte").set_palette(12);
        add_pattern(MOD_GLOBAL.spr_PZMpat4, "pattern_PZM_4").set_entry("Swirl").set_palette(12);
        add_pattern(MOD_GLOBAL.spr_PZMpat5, "pattern_PZM_5").set_entry("CaramelAP").set_palette(12);
        add_pattern(MOD_GLOBAL.spr_PZMpat6, "pattern_PZM_6").set_entry("Funkay").set_palette(12);
        add_pattern(MOD_GLOBAL.spr_PZMpat7, "pattern_PZM_7").set_entry("Autumn").set_palette(12);
        add_pattern(MOD_GLOBAL.spr_PZMpat8, "pattern_PZM_8").set_entry("Napolitano").set_palette(12);
        add_pattern(MOD_GLOBAL.spr_PZMpat9, "pattern_PZM_9").set_entry("Cookie").set_palette(12);
        //add_pattern(MOD_GLOBAL.spr_PZMpat10, "pattern_PZM_10").set_entry("Missing").set_palette(12);
        add_pattern(MOD_GLOBAL.spr_PZMpat11, "pattern_PZM_11").set_entry("Solid").set_palette(12);
        add_pattern(MOD_GLOBAL.spr_PZMpat12, "pattern_PZM_12").set_entry("Choco").set_palette(12);

        add_pattern(MOD_GLOBAL.spr_PZQpat1, "pattern_PZQ_1").set_entry("Alright").set_palette(12);
        add_pattern(MOD_GLOBAL.spr_PZQpat2, "pattern_PZQ_2").set_entry("Smooth").set_palette(12);
        add_pattern(MOD_GLOBAL.spr_PZQpat3, "pattern_PZQ_3").set_entry("LookinGood").set_palette(12);
        add_pattern(MOD_GLOBAL.spr_PZQpat4, "pattern_PZQ_4").set_entry("Fruity").set_palette(12);
        add_pattern(MOD_GLOBAL.spr_PZQpat5, "pattern_PZQ_5").set_entry("Mesmerizing").set_palette(12);
        add_pattern(MOD_GLOBAL.spr_PZQpat6, "pattern_PZQ_6").set_entry("Striking").set_palette(12);
        add_pattern(MOD_GLOBAL.spr_PZQpat7, "pattern_PZQ_7").set_entry("Soulcr").set_palette(12);
        add_pattern(MOD_GLOBAL.spr_PZQpat8, "pattern_PZQ_8").set_entry("Awesome").set_palette(12);
        add_pattern(MOD_GLOBAL.spr_PZQpat9, "pattern_PZQ_9").set_entry("WTF").set_palette(12);

        add_pattern(MOD_GLOBAL.spr_PZCpat1, "pattern_PZC_1").set_entry("DoubleFlavor").set_palette(12);
        add_pattern(MOD_GLOBAL.spr_PZCpat2, "pattern_PZC_2").set_entry("Sugary").set_palette(12);
	add_pattern(MOD_GLOBAL.spr_VLCpat, "pattern_VLC").set_entry("VLC").set_palette(12);
	add_pattern(MOD_GLOBAL.spr_lammypat, "pattern_LAMMY").set_entry("Lammy").set_palette(12);
	add_pattern(MOD_GLOBAL.spr_sugarysecretpat, "pattern_sugarysecret").set_entry("SugarySecret").set_palette(12);
	add_pattern(MOD_GLOBAL.spr_mytimepat, "pattern_mytime").set_entry("PaleMachine").set_palette(12);
    }

}
}

// Replace names to have pronouns AFTER REMUX! for pronouns
var pro = MOD_GLOBAL.pizzypronoun[global.PZ_opts.pizzypronoun];
for(var i = 0, n = array_length(palettes); i < n; ++i)
{
    var this = palettes[i];
    this.description = string_replace_all(this.description, "PRONOUN_1", lang_get_value("PRONOUN_1" + pro));
    this.description = string_replace_all(this.description, "PRONOUN_2", lang_get_value("PRONOUN_2" + pro));
    this.description = string_replace_all(this.description, "PRONOUN_3", lang_get_value("PRONOUN_3" + pro));
    this.description = string_replace_all(this.description, "PRONOUN_4", lang_get_value("PRONOUN_4" + pro));
    this.description = string_replace_all(this.description, "PRONOUN_5", lang_get_value("PRONOUN_5" + pro));
    this.description = string_replace_all(this.description, "PRONOUN_6", lang_get_value("PRONOUN_6" + pro));
}