// work later lang_get_value("chuckus")
sprite_index = MOD_GLOBAL.bg_optionsbg
scr_init_input();
selection = -1
bgscroll = 0
// decided to do what bronzeclad did
options = [
    {
        name: lang_get_value("PZConfigT1"),// Music
        variables: [
            {
                name: lang_get_value("PZConfigM1"),//Escape Theme
                variable: "escapetheme",
 		options: ["Sugar Rush (Lila Mix)", "Sugar Rush (Exhibition Night)", "Glucose Getaway!", "Glucose Getaway! (Construct)", "Glucose Getaway! (Bewitched! Remix)", "Midi Getaway! (Demo 1)", "Midi Getaway! (Construct)", "THE pizzelle's FAVORITE SONG(...)", "It's SugaryPizza Time!", "Glucose Getaway! (Fanmade Demo 2 ver.)"],
                desc: lang_get_value("PZConfigM1D") // Change the music that plays during Sugar Rush as Pizzelle.
            },
            {
                name: lang_get_value("PZConfigM2"),//Lap 2 Theme
                variable: "lap2theme",
                options: ["The Sweet Release of Death (Exhibition Night)", "The Sweet Release of Death (Demo 1 ver.)", "The Sweet Release of Death (Remix)", "MIDI", "The Sweet Release of Jam"],
                desc: lang_get_value("PZConfigM2D")//"Change the music that plays during Lap 2 as Pizzelle."
            },
            {
                name: lang_get_value("PZConfigM3"),//Lap 3 Theme
                variable: "lap3theme",
                options: ["Clockin' Out Late", "Harry's Despair-y (Bilk Mix)", "Harry's Despair-y", "Sugarcube Hailstorm", "UNEXECUTION", "Blue Licorice", "Gummy Harry's Brain Freezin' (V1)", "Gummy Harry's Brain Freezin' (V2)", "Coneball Lapping Two"],
                desc:lang_get_value("PZConfigM3D") //"Change the music that plays during Lap 3 as Pizzelle."
            },
            {
                name: lang_get_value("PZConfigM4"),
                variable: "lap3duringinf",
                options: ["OFF", "ON"],
                desc: lang_get_value("PZConfigM4D")
            }
        ]
    },
    {
        name: lang_get_value("PZConfigT2"),// Cosmetic
        variables: [
            {
                name: lang_get_value("PZConfigC1"),//"Combo Meter Type",
                variable: "combometertype",
                options: ["Exhibition Night", "June Build", "P Rank", "Pizza Tower"],
                desc: lang_get_value("PZConfigC1D") //"Modifies how the combo meter looks."
            },
            {
                name: lang_get_value("PZConfigC2"),// Combo Names
                variable: "combonames",
                options: ["OFF", "ON"],
                desc:lang_get_value("PZConfigC2D")
            },
            {
                name: lang_get_value("PZConfigC3"),//Confectis
                variable: "toppinstyle",
                options: ["OFF", "ON"],
                desc: lang_get_value("PZConfigC3D")
            },
            {
                name: lang_get_value("PZConfigC4"),//Taunt Sounds
                variable: "tauntstyle",
                options: ["Exhibition Night", "Demo 1", "Pizza Tower"],
                desc: lang_get_value("PZConfigC4D")
            },
            {
                name: lang_get_value("PZConfigC5"),//Pizzelle's Pronouns
                variable: "pizzypronoun",
                options: ["he/him", "she/her", "they/them"],
                desc: lang_get_value("PZConfigC5D")
            },
            {
                name: lang_get_value("PZConfigC6"),// Spookey Toggle
                variable: "spookeytoggle",
                options: ["OFF", "ON"],
                desc: lang_get_value("PZConfigC6D")
            },
            {
                name: lang_get_value("PZConfigC7"),// Extreme Exhibition Visuals
                variable: "extremevisual",
                options: ["OFF", "LAP 4", "LAP 3+"],
                desc: lang_get_value("PZConfigC7D")
            },
        ]
    },
	{
        name: lang_get_value("PZConfigT3"),//Gameplay
        variables: [
	     {
                name: lang_get_value("PZConfigG1"),//Transformation Changes
                variable: "experimenPZ",
                options: ["OFF", "ON"],
                desc: lang_get_value("PZConfigG1D")//"Changes the transformation movesets."
            },
	            {
                name: lang_get_value("PZConfigG2"),//Gameplay Style
                variable: "walljumptype",
                options: ["Exhibition Night", "Scoutdigo", "NJA Style", "Frenzy Worlds"],
                desc: lang_get_value("PZConfigG2D")//"Modifies certain parts of Pizzelle's moveset."
            },
        ]
    },
]

category = 0;

arrow = 0;