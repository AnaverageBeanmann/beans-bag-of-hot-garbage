ENT.Base 			= "obj_vj_grenade" -- Full list of bases is in the base, or go back to this link and read the list: https://saludos.sites.google.com/site/vrejgaming/makingvjbaseaddon
ENT.Type 			= "anim"
ENT.PrintName		= "Arby's Sandwich"
ENT.Author 			= "Bean"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Information		= "All our food keeps blowing up!"
ENT.Category		= "BBOHG"

if (CLIENT) then
	local Name = "Arby's Sandwich"
	local LangName = "obj_vj_bbohg_arbys_sandwich"
	language.Add(LangName, Name)
	killicon.Add(LangName,"HUD/killicons/default",Color(255,80,0,255))
	language.Add("#"..LangName, Name)
	killicon.Add("#"..LangName,"HUD/killicons/default",Color(255,80,0,255))
end