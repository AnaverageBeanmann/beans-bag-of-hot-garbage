ENT.Base 			= "obj_vj_grenade" -- Full list of bases is in the base, or go back to this link and read the list: https://saludos.sites.google.com/site/vrejgaming/makingvjbaseaddon
ENT.Type 			= "anim"
ENT.PrintName		= "THE ALYX's EMP"
ENT.Author 			= "Bean"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Information		= "Zappy."
ENT.Category		= "BBOHG"

if (CLIENT) then
	local Name = "THE ALYX's EMP"
	local LangName = "obj_vj_bbohg_thealyx_emp"
	language.Add(LangName, Name)
	killicon.Add(LangName,"HUD/killicons/default",Color(255,80,0,255))
	language.Add("#"..LangName, Name)
	killicon.Add("#"..LangName,"HUD/killicons/default",Color(255,80,0,255))
end