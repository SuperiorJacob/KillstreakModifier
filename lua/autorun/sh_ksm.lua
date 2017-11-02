--------------------------
-- Kill Streak Modifier --
--------------------------
  -- Created by Jacob --
--------------------------

KSM = {}
-- {tablename} = {sound in Killstreakmodifier / sound}, now you can use the {tablename} as a reference. --
-- Sounds must be wav files on a 44100HZ frequency --
KSM.Sounds = { -- Sounds that are downloaded by the client.
	doublekill = "doublekill.wav", 
	triplekill = "triplekill.wav", 
	killingspree = "killingspree.wav", 
	dominating = "dominating.wav", 
	unstoppable = "unstoppable.wav", 
	monsterkill = "monsterkill.wav", 
	ultrakill = "ultrakill.wav", 
	megakill = "megakill.wav",
	wickedsick = "wickedsick.wav", 
	rampage = "rampage.wav", 
	godlike = "godlike.wav" 
} 

-- Killstreak Modifiers --
-- In display using {name} with return the players name --
-- In display using {kills} will return the players killstreak --
-- With the sounds you use the reference above in KSM.Sounds --
-- Streak is how many kills in a row before this happens --
-- func = function() end is required no matter what --
-- With functions if you would like to use "ply" make sure you have this layout before proceeding --
-- func = function( ply ) if IsValid( ply ) then end end ... this will makesure ply is valid! --
KSM.Modifiers = {
	{
		display = "{name} just double killed!",
		sound = "doublekill",
		streak = 2
	},
	{
		display = "{name} just triple killed!",
		sound = "triplekill",
		streak = 3
	},
	{
		display = "{name} is on a killing spree!",
		sound = "killingspree",
		streak = 4
	},
	{
		display = "{name} is dominating with {kills} kills!",
		sound = "dominating",
		streak = 5
	},
	{
		display = "{name} is clearly unstoppable with {kills} kills!",
		sound = "unstoppable",
		streak = 6
	},
	{
		display = "{name} is on a MONSTER killing spree with {kills} kills!",
		sound = "monsterkill",
		streak = 7
	},
	{
		display = "{name} is on a ULTRA killing spree with {kills} kills!",
		sound = "ultrakill",
		streak = 8
	},
	{
		display = "{name} is on a MEGA killing spree with {kills} kills!",
		sound = "megakill",
		streak = 9
	},
	{
		display = "{name} is WICKED SICK with {kills} kills!",
		sound = "wickedsick",
		streak = 10
	},
	{
		display = "{name} is now GODLIKE with {kills} kills!",
		sound = "godlike",
		streak = 11
	},
	{ -- The last killstreak on this table will be repeat if the streak is greater then this!
		display = "{name} is RAMPAGING with {kills} kills!",
		sound = "rampage",
		streak = 12,
		func = function( ply ) if IsValid( ply ) then ply:SetHealth( ply:Health() + 50 ) end end
	},
}
