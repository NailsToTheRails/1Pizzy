// work later
sprite_index = MOD_GLOBAL.bg_optionsbg
scr_init_input();
selection = -1
bgscroll = 0
// decided to do what bronzeclad did
options = [
    {
        name: "Music",
        variables: [
            {
                name: "Escape Theme",
                variable: "escapetheme",
                options: ["Sugar Rush (Lila Mix)", "Sugar Rush (Exhibition Night)", "Glucose Getaway!", "Glucose Getaway! (Construct)", "Glucose Getaway! (Bewitched! Remix)", "Midi Getaway! (Demo 1)", "Midi Getaway! (Construct)", "THE pizzelle's FAVORITE SONG(...)", "It's SugaryPizza Time!", "Glucose Getaway! (Fanmade Demo 2 ver.)"],
                desc: "Change the music that plays during Sugar Rush as Pizzelle."
            },
            {
                name: "Lap 2 Theme",
                variable: "lap2theme",
                options: ["The Sweet Release of Death (Exhibition Night)", "The Sweet Release of Death (Demo 1 ver.)", "The Sweet Release of Death (Remix)", "MIDI", "The Sweet Release of Death (Demo 2 ver.)", "The Sweet Release of Jam", "I'm in The Thick of Death"],
                desc: "Change the music that plays during Lap 2 as Pizzelle."
            },
            {
                name: "Lap 3 Theme",
                variable: "lap3theme",
                options: ["Clockin' Out Late", "Harry's Despair-y (Bilk Mix)", "Harry's Despair-y", "Sugarcube Hailstorm", "UNEXPECTION", "Blue Licorice", "KSI's Despair-y (Bilk Of It)", "Gummy Harry's Brain Freezin' (V1)", "Gummy Harry's Brain Freezin' (V2)", "Coneball Lapping Two"],
                desc: "Change the music that plays during Lap 3 as Pizzelle."
            },
            {
                name: "Lap 3 Theme During Infinite Lapping",
                variable: "lap3duringinf",
                options: ["OFF", "ON"],
                desc: "Plays the lap 3 music during infinite lapping."
            }
        ]
    },
    {
        name: "Cosmetic",
        variables: [
            {
                name: "Combo Meter Type",
                variable: "combometertype",
                options: ["Exhibition Night", "June Build", "P Rank", "Pizza Tower"],
                desc: "Modifies how the combo meter looks."
            },
            {
                name: "Combo Names",
                variable: "combonames",
                options: ["OFF", "ON"],
                desc: "Enables the Sugary Spire combo names."
            },
            {
                name: "Confectis",
                variable: "toppinstyle",
                options: ["OFF", "ON"],
                desc: "Changes the Toppins to match the Confecti sprites. BUGGY"
            },
            {
                name: "Taunt Sounds",
                variable: "tauntstyle",
                options: ["Exhibition Night", "Demo 1", "Pizza Tower"],
                desc: "Changes the taunt sound."
            },
            {
                name: "Pizzelle's Pronouns",
                variable: "pizzypronoun",
                options: ["he/him", "she/her", "they/them"],
                desc: "Modifies Pizzelle's pronouns throughout the mod."
            },
            {
                name: "Spookey Toggle",
                variable: "spookeytoggle",
                options: ["OFF", "ON"],
                desc: "Replaces the key with Spookey."
            },
            {
                name: "Extreme Exhibition Visuals",
                variable: "extremevisual",
                options: ["OFF", "LAP 4", "LAP 3+"],
                desc: "Adds the Lap 4 visuals from Extreme Exhibition."
            },
        ]
    },
	{
        name: "Gameplay",
        variables: [
	     {
                name: "Transformation Changes",
                variable: "experimenPZ",
                options: ["OFF", "ON"],
                desc: "Changes the transformation movesets."
            },
	            {
                name: "Gameplay Style",
                variable: "walljumptype",
                options: ["Exhibition Night", "Scoutdigo", "NJA Style", "Frenzy Worlds"],
                desc: "Modifies certain parts of Pizzelle's moveset."
            },
        ]
    },
]

category = 0;

arrow = 0;