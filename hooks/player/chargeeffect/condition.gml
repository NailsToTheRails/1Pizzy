// Return true to keep chargeeffect alive
return playerid.character == "PZ" && ((playerid.state == states.tumble && playerid.movespeed > 12) or (playerid.state == states.climbwall && playerid.wallspeed > 12) or (playerid.state == states.Sjump && playerid.vsp != 0.5));
