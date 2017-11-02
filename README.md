# KillstreakModifier
KMS, Kill Streak Modifier addon created for Garry's Mod.

# What is this addon?
Created by Jacob, this addon is a great way to track kills and reward players during the killing phases of your server.

# What does it do?
This addon (editable in sh_kms.lua) allows creation of individual killstreaks and rewards, for example; Jimmy gets a 3 player killstreak, one of the default sounds will play (unless you add your own) and a function will run (if you added one).

# How to add sounds?
Go into killstreakmodifier/sound/ and add your own .wav file on a 44100 HZ frequency (Garry's Mod requirement) and go into sh_kms.lua and add it to KMS.Sounds, then use the abbreviation in your KMS.Modifier.

# How do I add functions?
This is simple when creating your own Kill Streak in KMS.Modifiers, insert a line a table value into your modifier and call it func, now you will have to put func = function(ply) if IsValid(ply) then end end, put your function like ply:SetHealth() between the IsValid( ply ) then and end, the reason I use IsValid is because ply will always return an error until the killstreak is played out (remember that).

The function will run when the player reaches the streak, so its great to set points or do other things like buff the player, this addon has some endless possiblities so have fun!

# Full Template
  {
		display = "{name} is RAMPAGING with {kills} kills!", -- {name} is players name, {kills} is the current streak.
		sound = "rampage", -- Sound abbreviation
		streak = 12, -- Current streak
		func = function( ply ) if IsValid( ply ) then end end -- If you are using a function, remove if not!
	}
