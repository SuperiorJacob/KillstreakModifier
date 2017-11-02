AddCSLuaFile()
AddCSLuaFile( "sh_ksm.lua" )

include( "sh_ksm.lua" )

if SERVER then
	for k,v in pairs( KSM.Sounds ) do
		resource.AddSingleFile( tostring(v) )
		resource.AddSingleFile( "sound/"..tostring(v) )
		resource.AddSingleFile( "killstreakmodifier/sound/"..tostring(v) )
	end
end

hook.Add( "PlayerSpawn", "KillstreakModifierSpawn", function( ply ) ply.streak = 0 end )
hook.Add( "PlayerDeath", "KillstreakModifierDeath", function( vic, inf, ply )
	if vic != ply then
		ply.streak = ply.streak + 1

		for k,v in pairs( KSM.Modifiers ) do
			local display = v["display"]
			local send = [[surface.PlaySound("]] ..KSM.Sounds[ v["sound"] ].. [[")]]
			
			if string.find(display,"{name}") then display = string.Replace(display,"{name}",tostring( ply:Nick() )) end
			if string.find(display,"{kills}") then display = string.Replace(display,"{kills}",tostring( ply.streak )) end

			if ply.streak == v.streak then
				for _,p in pairs( player.GetAll() ) do
					p:SendLua( send )
				end
				if v["func"] != nil then
					v["func"]( ply )	
				end
				PrintMessage( HUD_PRINTCENTER, display )
			elseif ( table.Count(KSM.Modifiers) == k ) then
				if ply.streak >= v.streak then
					for _,p in pairs( player.GetAll() ) do
						p:SendLua( send )
					end
					if v["func"] != nil then
						v["func"]( ply )	
					end
					PrintMessage( HUD_PRINTCENTER, display )
				end
			end
		end
	end
end ) 
