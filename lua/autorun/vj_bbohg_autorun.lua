/*--------------------------------------------------
	=============== Autorun File ===============
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
------------------ Addon Information ------------------
local PublicAddonName = "Bean's Bag of Hot Garbage"
local AddonName = "Bean's Bag of Hot Garbage"
local AddonType = "SNPC"
local AutorunFile = "autorun/vj_bbohg_autorun.lua"
-------------------------------------------------------
local VJExists = file.Exists("lua/autorun/vj_base_autorun.lua","GAME")
if VJExists == true then
	include('autorun/vj_controls.lua')
	local vCat = "Bean's Bag of Hot Garbage"
	VJ.AddCategoryInfo(vCat,{Icon = "icons/icon.png"})
	local vCat2 = "Bean's Bag of Hot Garbage - Spawners"
	VJ.AddCategoryInfo(vCat2,{Icon = "icons/icon.png"})
	
	-- Definately Getting Added
	-- Tossers
		VJ.AddNPC("Ammo","npc_vj_bbohg_ammo",vCat)
		VJ.AddNPC("Medkit","npc_vj_bbohg_medkit",vCat)
		VJ.AddNPC("Medvial","npc_vj_bbohg_medvial",vCat)
		VJ.AddNPC("Barnyot","npc_vj_bbohg_barnyot",vCat)
		VJ.AddNPC("Cheese","npc_vj_bbohg_cheese",vCat)
		VJ.AddNPC("THE ALYX","npc_vj_bbohg_alyx",vCat)
		-- VJ.AddNPC("THE Medkit Man","npc_vj_bbohg_themedkitman",vCat)
		
	-- The Pizza Gang:tm:
		-- VJ.AddNPC("Pizza Bear","npc_vj_bbohg_pizza_bear",vCat)
		-- VJ.AddNPC("Pizza Bunny","npc_vj_bbohg_pizza_bunny",vCat)
		-- VJ.AddNPC("Pizza Chicken","npc_vj_bbohg_pizza_chicken",vCat)
		-- VJ.AddNPC("Pizza Fox","npc_vj_bbohg_pizza_fox",vCat)
		-- VJ.AddNPC("Golden Pizza Bear","npc_vj_bbohg_pizza_goldenbear",vCat)
		-- VJ.AddNPC("Pizza Remnant","npc_vj_bbohg_pizza_remnant",vCat)
	
	-- DarkRP Dimension
		VJ.AddNPC("Hobo","npc_vj_bbohg_hobo",vCat)
		VJ.AddNPC("Hobo King","npc_vj_bbohg_hobo_king",vCat)
		-- VJ.AddNPC("DarkRP Demon","npc_vj_bbohg_rdm",vCat)
	
	-- b0ne(r)s
		VJ.AddNPC("b0ne(r)","npc_vj_bbohg_boner",vCat)
		VJ.AddNPC("b0ne(r) (Standard)","npc_vj_bbohg_boner_standard",vCat)
		VJ.AddNPC("b0ne(r) (Knight)","npc_vj_bbohg_boner_knight",vCat)
		VJ.AddNPC("b0ne(r) (Frenzy)","npc_vj_bbohg_boner_frenzy",vCat)
		VJ.AddNPC("b0ne(r) (Reviver)","npc_vj_bbohg_boner_reviver",vCat)
		VJ.AddNPC("big b0ne(r)","npc_vj_bbohg_boner_big",vCat)
		-- VJ.AddNPC("Fatman","npc_vj_bbohg_fat",vCat) -- he has an unofficial alliance
		-- VJ.AddNPC("Fatman's Skeleton",npc_vj_bbohg_fat_skel",vCat)
		-- VJ.AddNPC("small b0ne(r)",npc_vj_bbohg_boner_small",vCat)
	
	-- Zombknees
		VJ.AddNPC("Headcrap Xombie","npc_vj_bbohg_zombie",vCat)
		VJ.AddNPC("Headcrap Xombie Torso","npc_vj_bbohg_zombie_torso",vCat)
		VJ.AddNPC("Headcrap Xombie Legs","npc_vj_bbohg_zombie_legs",vCat)
		VJ.AddNPC("Crab","npc_vj_bbohg_crab",vCat)
		-- Mr. Krabs -- voiced by mr krabs (boss?)
		-- Krab -- voiced by mr krabs (boss?)
		-- Krabomb -- make it play this https://gamebanana.com/sounds/27238
		VJ.AddNPC("Crabomb","npc_vj_bbohg_crabomb",vCat)
		-- Fat
		-- Explosive Poison Zombie
		-- VJ.AddNPC("Poizamikaze","npc_vj_bbohg_poizamikaze",vCat)
		-- VJ.AddNPC("Explosive Zombie","npc_vj_bbohg_exploder",vCat)
		-- VJ.AddNPC("Explosive Fast Zombie","npc_vj_bbohg_exploder_fast",vCat)
		-- VJ.AddNPC("Explosive Poison Zombie","npc_vj_bbohg_exploder_poison",vCat)
		-- Rake
		VJ.AddNPC("Zombine","npc_vj_bbohg_zombine",vCat) -- zombine but is actually combine zombie (works like normal combine)
		VJ.AddNPC("le bebe","npc_vj_bbohg_lebebe",vCat)
		VJ.AddNPC("Giga Gore Child","npc_vj_bbohg_gorechild_giga",vCat)
		-- Garmstrong
		-- Garmstrong's Mech
		-- Gekkome -- gekko but gonome
		-- G'nome
		-- Zamkhin
	
	-- Rock and Stones
		VJ.AddNPC("The Rock","npc_vj_bbohg_therock",vCat)
		VJ.AddNPC("Rockling","npc_vj_bbohg_therock_minion",vCat)
		-- Stoner
		-- Rich
	
	-- Generic Enemies
		-- VJ.AddNPC("Generic Enemy","npc_vj_bbohg_genemy",vCat)
		-- VJ.AddNPC("Generic Enemy (Grunt)","npc_vj_bbohg_genemy_grunt",vCat)
		-- VJ.AddNPC("Generic Enemy (Bruiser)","npc_vj_bbohg_genemy_bruiser",vCat)
		-- VJ.AddNPC("Generic Enemy (Sniper)","npc_vj_bbohg_genemy_sniper",vCat)
		-- VJ.AddNPC("Generic Enemy (Demoman)","npc_vj_bbohg_genemy_demoman",vCat)
	
	-- Generic Allies
		
	
	-- Faction Unaffiliated
		VJ.AddNPC("Flemming","npc_vj_bbohg_flemming",vCat)
		-- VJ.AddNPC("Shadow Walker","npc_vj_bbohg_shadowwalker",vCat)
		VJ.AddNPC("Mark","npc_vj_bbohg_mark",vCat)
		VJ.AddNPC("Chell","npc_vj_bbohg_chell",vCat)
		-- VJ.AddNPC("ERR","npc_vj_bbohg_error",vCat)
		-- VJ.AddNPC("The_","npc_vj_bbohg_the",vCat)
		VJ.AddNPC("Grampa","npc_vj_bbohg_grampa",vCat)
		-- VJ.AddNPC("Dr. Hax","npc_vj_bbohg_hax",vCat)
		-- VJ.AddNPC("Griefer Grigori","npc_vj_bbohg_griggs",vCat)

		-- 34 NPCs!!
		-- 38 if you count seperate versions of the b0ne(r)


	VJ.AddNPC("Tosser Spawner","sent_vj_bbohg_spawner_tosser",vCat2)
	-- VJ.AddNPC("Pizza Gang Spawner","sent_vj_bbohg_spawner_pizza",vCat2)
	VJ.AddNPC("Hobo Spawner","sent_vj_bbohg_spawner_hobo",vCat2)
	VJ.AddNPC("Hobo Spawner (Kingless)","sent_vj_bbohg_spawner_hobo_noking",vCat2)
	VJ.AddNPC("b0ne(r) spawner","sent_vj_bbohg_spawner_b0ner",vCat2)
	VJ.AddNPC("b0ne(r) spawner (big boneless)","sent_vj_bbohg_spawner_b0ner_bigboneless",vCat2)
	VJ.AddNPC("Zombknee Spawner","sent_vj_bbohg_spawner_zombknee",vCat2)
	VJ.AddNPC("Flemming Spawner","sent_vj_bbohg_spawner_flemming",vCat2)
	VJ.AddNPC("Rockling Spawner","sent_vj_bbohg_spawner_rockling",vCat2)
	VJ.AddNPC("Rockling Spawner (With The Rock)","sent_vj_bbohg_spawner_rockling_rock",vCat2)
	VJ.AddNPC("Mark Spawner","sent_vj_bbohg_spawner_mark",vCat2)
    VJ.AddNPC("Chell Spawner","sent_vj_bbohg_spawner_chell",vCat2)
	VJ.AddNPC("Fully Loaded Spawner","sent_vj_bbohg_spawner_fl",vCat2)
	VJ.AddNPC("Fully Loaded Spawner (big b0ne(r)less)","sent_vj_bbohg_spawner_fl_nobig",vCat2)
	VJ.AddNPC("Fully Loaded Spawner (Bossless)","sent_vj_bbohg_spawner_fl_bossless",vCat2)
	VJ.AddNPC("Boss Spawner","sent_vj_bbohg_spawner_boss",vCat2)
	VJ.AddNPC("Boss Spawner (big b0ne(r)less)","sent_vj_bbohg_spawner_boss_nobig",vCat2)
	
	VJ.AddNPC("Tosser Spawner (Single)","sent_vj_bbohg_spawner_tosser_single",vCat2)
	-- VJ.AddNPC("Pizza Gang Spawner (Single)","sent_vj_bbohg_spawner_pizza_single",vCat2)
	VJ.AddNPC("Hobo Spawner (Single)","sent_vj_bbohg_spawner_hobo_single",vCat2)
	VJ.AddNPC("Hobo Spawner (Single, Kingless)","sent_vj_bbohg_spawner_hobo_single_noking",vCat2)
	VJ.AddNPC("b0ne(r) spawner (single)","sent_vj_bbohg_spawner_b0ner_single",vCat2)
	VJ.AddNPC("b0ne(r) spawner (single, big boneless)","sent_vj_bbohg_spawner_b0ner_bigboneless_single",vCat2)
	VJ.AddNPC("Zombknee Spawner (Single)","sent_vj_bbohg_spawner_zombknee_single",vCat2)
	VJ.AddNPC("Flemming Spawner (Single)","sent_vj_bbohg_spawner_flemming_single",vCat2)
	VJ.AddNPC("Rockling Spawner (Single)","sent_vj_bbohg_spawner_rockling_single",vCat2)
	VJ.AddNPC("Rockling Spawner (Single, With The Rock)","sent_vj_bbohg_spawner_rockling_single_rock",vCat2)
	VJ.AddNPC("Mark Spawner (Single)","sent_vj_bbohg_spawner_mark_single",vCat2)
    VJ.AddNPC("Chell Spawner (Single)","sent_vj_bbohg_spawner_chell_single",vCat2)
	VJ.AddNPC("Fully Loaded Spawner (Single)","sent_vj_bbohg_spawner_fl_single",vCat2)
	VJ.AddNPC("Fully Loaded Spawner (Single, big b0ne(r)less)","sent_vj_bbohg_spawner_fl_single_nobig",vCat2)
	VJ.AddNPC("Fully Loaded Spawner (Single, Bossless)","sent_vj_bbohg_spawner_fl_single_bossless",vCat2)
	
	VJ.AddNPC("Random Tosser","sent_vj_bbohg_random_tosser",vCat2)
	-- VJ.AddNPC("Random Pizza Gang Member","sent_vj_bbohg_random_pizza",vCat2)
	
	-- VJ.AddNPC("Worshiper of Pii'zza Spawner","sent_vj_bbohg_piizaaspawner",vCat2)
	-- VJ.AddNPC("Worshiper of Pii'zza Spawner (Single)","sent_vj_bbohg_piizaaspawner_single",vCat2)
	-- VJ.AddNPC("Random Worshiper of Pii'zza","sent_vj_bbohg_randompiizaa",vCat2)
	
	

	-- May or May Not Get Added
	
	-- The Pizza Gang:tm:
		-- VJ.AddNPC("Pii'zza, The Egyptian God of Italy","npc_vj_bbohg_piizaa",vCat)
		-- VJ.AddNPC("Sentient Pizza","npc_vj_bbohg_sentientpizza",vCat)
		
	-- DarkRP Dimension
		-- corrupt admin
	
	-- b0ne(r)s
		-- VJ.AddNPC("Sandpaper","npc_vj_bbohg_sandpaper",vCat)
		-- VJ.AddNPC("Skeleton King","npc_vj_bbohg_skelking",vCat)
		-- Death
		-- Famine
		-- War
		-- Pestilance
		-- Bonalgam
	
	-- Clowns
		-- VJ.AddNPC_HUMAN("Clown Gunner","npc_vj_bbohg_clown_gun",{"weapon_vj_bbohg_ggg"},vCat)
		-- VJ.AddNPC("Clown Acrobat","npc_vj_bbohg_clown_acro",vCat)
		-- VJ.AddNPC("Clown Strongman","npc_vj_bbohg_clown_str",vCat)
		-- VJ.AddNPC("Clown Magician","npc_vj_bbohg_clown_mag",vCat)
	
	-- Deep Rock Demakes
		-- Lootgrub
		-- Glarphid Grunt
	
	-- Hotlads (fire)
		-- Hotboy
	
	-- Moistboys (water)
		-- Moistboy
	
	-- Swirlycones (wind)
		-- Windston
	
	-- Aperture Science
		-- VJ.AddNPC("Aperture Science Sentry Turret","npc_vj_bbohg_portalturret",vCat)
		-- Cave Johnson (but is actually a robot)
	
	-- Pill Pack Peckers
		-- Dingus
		-- Dragon Agent
		-- Skeeter
		-- Melon
		-- Facepunch

	-- Faction Unaffiliated
		-- VJ.AddNPC("Fake Julio","npc_vj_bbohg_fakejulio",vCat)
		-- VJ.AddNPC("Generic Enemy","npc_vj_bbohg_badguy",vCat)
		-- VJ.AddNPC("Gnome","npc_vj_bbohg_gnome",vCat)
		-- VJ.AddNPC("Imperial Metrocop","npc_vj_bbohg_imperial",vCat)
		-- VJ.AddNPC("Julio","npc_vj_bbohg_julio",vCat)
		-- VJ.AddNPC("Lenny","npc_vj_bbohg_lenny",vCat)
		-- VJ.AddNPC("Mario.","npc_vj_bbohg_mariohasloggedin",vCat)
		-- VJ.AddNPC("Meat Man","npc_vj_bbohg_meat",vCat)
		-- VJ.AddNPC("Mecha Grampa","npc_vj_bbohg_grampa_mecha",vCat)
		-- VJ.AddNPC("Overwatch Chaingunner","npc_vj_bbohg_chaingunner",vCat)
		-- VJ.AddNPC("Pepsi Man","npc_vj_bbohg_pepsiman",vCat)
		-- VJ.AddNPC("Rebel Enforcer","npc_vj_bbohg_enforcer",vCat)
		-- VJ.AddNPC("Scintist","npc_vj_bbohg_scintist",vCat)
		-- VJ.AddNPC("Spooky Black Figure","npc_vj_bbohg_spook",vCat)
		-- VJ.AddNPC("たらこ","npc_vj_bbohg_tarako",vCat)
		-- VJ.AddNPC("たらこボス","npc_vj_bbohg_tarako_boss",vCat)
		-- VJ.AddNPC("The Trashman","npc_vj_bbohg_trash",vCat)
		-- VJ.AddNPC("Tree, The God of Locomotives","npc_vj_bbohg_tree",vCat)
		-- VJ.AddNPC("Wario","npc_vj_bbohg_wario",vCat)
		-- VJ.AddNPC("You Need Me","npc_vj_bbohg_youneedme",vCat)
		-- Do you know who ate all the donuts?
		-- Shrek
		-- Canyon Crown

		-- 28 NPCs
	
	
	-- likely not getting added
	
	-- b0ne(r)s
		-- VJ.AddNPC("dancing b0ne(r)","npc_vj_bbohg_boner_dance",vCat)
	
	-- Faction Unaffiliated
		--VJ.AddNPC("Melon Friend","npc_vj_bbohg_melon",vCat)
		--VJ.AddNPC("Yes Man","npc_vj_bbohg_yesman",vCat)
		--VJ.AddNPC("sans","npc_vj_bbohg_sans",vCat)
		-- VJ.AddNPC("Turbo Bird","npc_vj_bbohg_turbo",vCat)
		-- VJ.AddNPC("Biomorph","npc_vj_bbohg_biomorph",vCat)
		--VJ.AddNPC("Haunted Astolfo Plushie","npc_vj_bbohg_astolfo",vCat)
	
		-- 7 NPCs
	
	
	-- VJ.AddNPC("Tosser Spawner","sent_vj_bbohg_spawner_tosser",vCat2)
	-- VJ.AddNPC("Tosser Spawner (Single)","sent_vj_bbohg_spawner_tosser_single",vCat2)
	-- VJ.AddNPC("Random Tosser","sent_vj_bbohg_randomtosser",vCat2)
	-- VJ.AddNPC("Worshiper of Pii'zza Spawner","sent_vj_bbohg_piizaaspawner",vCat2)
	-- VJ.AddNPC("Worshiper of Pii'zza Spawner (Single)","sent_vj_bbohg_piizaaspawner_single",vCat2)
	-- VJ.AddNPC("Random Worshiper of Pii'zza","sent_vj_bbohg_randompiizaa",vCat2)
	-- VJ.AddNPC("b0ne(r) spawner","sent_vj_bbohg_spawner_b0ner",vCat2)
	-- VJ.AddNPC("b0ne(r) spawner (big boneless)","sent_vj_bbohg_spawner_b0ner_bigboneless",vCat2)
	-- VJ.AddNPC("Hobo Spawner","sent_vj_bbohg_spawner_hobo",vCat2)
	-- VJ.AddNPC("Fully Loaded Spawner","sent_vj_bbohg_fl",vCat2)
	-- VJ.AddNPC("Fully Loaded Spawner (Single)","sent_vj_bbohg_fl_single",vCat2)
	-- VJ.AddNPC("","sent_vj_bbohg_",vCat2)
	
	--Weapons
	-- VJ.AddNPCWeapon("VJ_BBOHG_Griefer_Grigori's_Gun","weapon_vj_bbohg_ggg")
	
	util.PrecacheModel("models/jessev92/characters/highvis/mark/npccit.mdl")
	
	local AddConvars = {}
	-- AddConvars["vj_BBOHG_KillableGriggs"] = 0
	-- AddConvars["vj_BBOHG_GoldenSummonsAllies"] = 1
	-- AddConvars["vj_BBOHG_PiizaaSummonsAllies"] = 1
	-- AddConvars["vj_BBOHG_PiizaaSummonsGoldens"] = 1
	-- AddConvars["vj_BBOHG_KleinerScintist"] = 0
	-- AddConvars["vj_BBOHG_YouNeedMe"] = 1
	-- AddConvars["vj_BBOHG_HostileJulio"] = 0
	-- AddConvars["vj_BBOHG_HostileImperials"] = 0
	-- AddConvars["vj_BBOHG_HostileGrampa"] = 0
	-- AddConvars["vj_BBOHG_Hostilesans"] = 0
	-- AddConvars["vj_BBOHG_HostileSandpaper"] = 0
	-- AddConvars["vj_BBOHG_HostileScintists"] = 0
	-- AddConvars["vj_BBOHG_FriendlyTossers"] = 0
	-- AddConvars["vj_BBOHG_FriendlyPiizaa"] = 0
	-- AddConvars["vj_BBOHG_GnomeModel"] = 0
	-- AddConvars["vj_BBOHG_ReasonableRock"] = 0
	-- AddConvars["vj_BBOHG_FearlessTossers"] = 0
	AddConvars["vj_BBOHG_BossMusic"] = 1
	AddConvars["vj_BBOHG_NoGodsNoMasters"] = 0
	-- AddConvars["vj_BBOHG_FriendlyBoners"] = 1
	-- AddConvars["vj_BBOHG_TosserNocollide"] = 1
	-- AddConvars["vj_BBOHG_ShadowRevival"] = 1
	-- AddConvars["vj_BBOHG_GriggsPlaysDarkRP"] = 0
	-- AddConvars["vj_BBOHG_BossDrops"] = 0
	AddConvars["vj_BBOHG_Gibs"] = 1
	AddConvars["vj_BBOHG_FriendlyTossers"] = 1
	AddConvars["vj_BBOHG_BossNotifications"] = 1
	AddConvars["vj_BBOHG_BossReinforcements"] = 1
	AddConvars["vj_BBOHG_BossCleanup"] = 1
	AddConvars["vj_BBOHG_Difficulty"] = 2
	AddConvars["vj_BBOHG_AmmoDrops"] = 0
	AddConvars["vj_BBOHG_HealthDrops"] = 0
	AddConvars["vj_BBOHG_ZombineHeadshots"] = 0
	AddConvars["vj_BBOHG_ZombieSplits"] = 1
	AddConvars["vj_BBOHG_ZombieCrabs"] = 1
	AddConvars["vj_BBOHG_ZombineCrabs"] = 1
	AddConvars["vj_BBOHG_BonemergePipe"] = 0
	AddConvars["vj_BBOHG_MusicVolume"] = 5
	-- AddConvars["vj_BBOHG_Instrumentals"] = 0
	
	
	for k, v in pairs(AddConvars) do
		if !ConVarExists( k ) then CreateConVar( k, v, {FCVAR_ARCHIVE} ) end
	end
	
	if (CLIENT) then
		local function VJ_BBOHG(Panel)
			if !game.SinglePlayer() then
			if !LocalPlayer():IsAdmin() or !LocalPlayer():IsSuperAdmin() then
				Panel:AddControl( "Label", {Text = "You are not an admin!"})
				Panel:ControlHelp("Note: Only admins can change these settings!")
			return
		end
	end
		Panel:AddControl( "Label", {Text = "Note: Only admins can change these settings!"})
	local vj_resetbutton = {Options = {}, CVars = {}, Label = "Reset Everything:", MenuButton = "0"}
		vj_resetbutton.Options["#vjbase.menugeneral.default"] = { 
			-- vj_BBOHG_KillableGriggs = "0",
			-- vj_BBOHG_GoldenSummonsAllies = "1",
			-- vj_BBOHG_PiizaaSummonsAllies = "1",
			-- vj_BBOHG_PiizaaSummonsGoldens = "1",
			-- vj_BBOHG_KleinerScintist = "0",
			-- vj_BBOHG_YouNeedMe = "1",
			-- vj_BBOHG_HostileJulio = "0",
			-- vj_BBOHG_HostileImperials = "0",
			-- vj_BBOHG_HostileGrampa = "0",
			-- vj_BBOHG_Hostilesans = "0",
			-- vj_BBOHG_HostileSandpaper = "0",
			-- vj_BBOHG_HostileScintists = "0",
			-- vj_BBOHG_FriendlyTossers = "0",
			-- vj_BBOHG_FriendlyPiizaa = "0",
			-- vj_BBOHG_GnomeModel = "0",
			-- vj_BBOHG_ReasonableRock = "0",
			-- vj_BBOHG_FearlessTossers = "0",
			vj_BBOHG_BossMusic = "1",
			vj_BBOHG_NoGodsNoMasters = "0",
			-- vj_BBOHG_FriendlyBoners = "0",
			-- vj_BBOHG_TosserNocollide = "0",
			-- vj_BBOHG_ShadowRevival = "1",
			-- vj_BBOHG_GriggsPlaysDarkRP = "0",
			-- vj_BBOHG_BossDrops = "0",
			vj_BBOHG_Gibs = "1",
			vj_BBOHG_FriendlyTossers = "1",
			vj_BBOHG_BossNotifications = "1",
			vj_BBOHG_BossReinforcements = "1",
			vj_BBOHG_BossCleanup = "1",
			vj_BBOHG_Difficulty = "2",
			vj_BBOHG_AmmoDrops = "0",
			vj_BBOHG_HealthDrops = "0",
			vj_BBOHG_ZombineHeadshots = "0",
			vj_BBOHG_ZombieSplits = "1",
			vj_BBOHG_ZombieCrabs = "1",
			vj_BBOHG_ZombineCrabs = "1",
			vj_BBOHG_BonemergePipe = "0",
			vj_BBOHG_MusicVolume = "5",
			-- vj_BBOHG_Instrumentals = "0",
}

	Panel:AddControl("ComboBox", vj_resetbutton)
	Panel:ControlHelp("Note: Only future spawned npcs will be affected!")
	
	
	Panel:AddControl("Checkbox", {Label ="Eveyone is allied and against you?", Command ="vj_BBOHG_NoGodsNoMasters"})
	Panel:ControlHelp("Warning: This will override any and all {*NPC* is friendly?} convars!")
	
	Panel:AddControl("Checkbox", {Label ="Tossers are friendly?", Command ="vj_BBOHG_FriendlyTossers"})
	
	Panel:AddControl("Checkbox", {Label ="Bosses can spawn reinforcements?", Command ="vj_BBOHG_BossReinforcements"})
	
	Panel:AddControl("Checkbox", {Label ="Crabless Zombines can be headshot?", Command ="vj_BBOHG_ZombineHeadshots"})
	Panel:AddControl("Checkbox", {Label ="Headcrap Xombies can split?", Command ="vj_BBOHG_ZombieSplits"})
	Panel:AddControl("Checkbox", {Label ="Headcrap Xombies can drop live Crabs?", Command ="vj_BBOHG_ZombieCrabs"})
	Panel:AddControl("Checkbox", {Label ="Zombines can drop live Crabs?", Command ="vj_BBOHG_ZombineCrabs"})
	
	Panel:AddControl("Checkbox", {Label ="Enable Gibbing?", Command ="vj_BBOHG_Gibs"})
	Panel:ControlHelp("If you're crashing from something in BBoHG Gibbing, try disabling this.")
	
	Panel:AddControl("Checkbox", {Label ="Tweaked Headcrap Xombie pipe visuals?", Command ="vj_BBOHG_BonemergePipe"})
	Panel:ControlHelp("For some reason, the pipe messes with or completely disables shadows on the Headcrap Xombie.")
	Panel:ControlHelp("If this is off, the shadow issue won't be present, but the pipe will look a bit off.")
	
	Panel:AddControl("Checkbox", {Label ="Enable Boss Notifications?", Command ="vj_BBOHG_BossNotifications"})
	Panel:ControlHelp("Messages for bosses spawning and dying.")
	
	Panel:AddControl("Checkbox", {Label ="Bosses remove all living minions apon death?", Command ="vj_BBOHG_BossCleanup"})
	Panel:ControlHelp("Note: Due to how they summon minions, when a Giga Gore Child or big b0ne(r) dies, they will kill all existing le bebe's or b0ne(r)s respectively.")
	
	Panel:AddControl("Checkbox", {Label ="Boss Music?", Command ="vj_BBOHG_BossMusic"})
	-- Panel:AddControl("Checkbox", {Label ="Use instrumental boss tracks?", Command ="vj_BBOHG_Instrumentals"})
	-- Panel:ControlHelp("If no instrumental version is available, this will not affect the boss's track.")
	Panel:AddControl("Slider", {Label ="Boss Music volume.",Command ="vj_BBOHG_MusicVolume",Min = "0",Max = "9"})
	Panel:ControlHelp("All music in BBoHG has been normalized to 0 dB in Audacity.")
	Panel:ControlHelp("0 - 0.1")
	Panel:ControlHelp("1 - 0.2")
	Panel:ControlHelp("2 - 0.3")
	Panel:ControlHelp("3 - 0.4")
	Panel:ControlHelp("4 - 0.5")
	Panel:ControlHelp("5 - 0.6")
	Panel:ControlHelp("6 - 0.7")
	Panel:ControlHelp("7 - 0.8")
	Panel:ControlHelp("8 - 0.9")
	Panel:ControlHelp("9 - 1")
	
	Panel:AddControl("Slider", {Label ="Ammo drop type preference.",Command ="vj_BBOHG_AmmoDrops",Min = "0",Max = "11"})
	Panel:ControlHelp("You will need the respective addon for their ammo to work!")
	Panel:ControlHelp("0 - Default / Half-Life 2")
	Panel:ControlHelp("1 - ARCCW Base")
	Panel:ControlHelp("2 - TFA Base")
	Panel:ControlHelp("3 - C.W. 2.0")
	Panel:ControlHelp("4 - FA:S")
	Panel:ControlHelp("5 - M9K")
	Panel:ControlHelp("6 - Underhell")
	Panel:ControlHelp("7 - Darken217's SciFi Weapons")
	Panel:ControlHelp("8 - Crunchy's Ultimate Item Pickups")
	Panel:ControlHelp("9 - Half-Life Source")
	Panel:ControlHelp("10 - Upset's Half-Life 1 SWEPs")
	Panel:ControlHelp("11 - RAGE SWEP Pack")
	
	Panel:AddControl("Slider", {Label ="Health / Armor drop type preference.",Command ="vj_BBOHG_HealthDrops",Min = "0",Max = "5"})
	Panel:ControlHelp("You will need the respective addon for their drops to work!")
	Panel:ControlHelp("0 - Default / Half-Life 2")
	Panel:ControlHelp("1 - Arctic's Combat Stims")
	Panel:ControlHelp("2 - Underhell")
	Panel:ControlHelp("3 - Darken217's SciFi Weapons")
	Panel:ControlHelp("4 - Crunchy's Ultimate Item Pickups")
	Panel:ControlHelp("5 - VIVO")
	
	Panel:AddControl("Slider", {Label ="BBoHG NPC overall difficulty.",Command ="vj_BBOHG_Difficulty",Min = "0",Max = "4"})
	Panel:ControlHelp("0 - I'm Too Young To Die\n")
	Panel:ControlHelp("1 - Hey, Not Too Rough\nBalanced for Half-Life 2 weapons.\n")
	Panel:ControlHelp("2 - Hurt Me Plenty\nBalanced for more powerfull weaponry, like TFA and ARCCW.\n")
	Panel:ControlHelp("3 - Ultra Violence\n")
	Panel:ControlHelp("4 - NIGHTMARE!\nAre you sure? This skill level isn't even remotely fair.")
	
	
	
	
	-- Panel:AddControl("Checkbox", {Label ="Griefer Grigori teams up with Hobos?", Command ="vj_BBOHG_GriggsPlaysDarkRP"})
	-- Panel:AddControl("Checkbox", {Label ="Bosses drop special items?", Command ="vj_BBOHG_BossDrops"})
	-- Panel:ControlHelp("Sample Text.")
	-- Panel:ControlHelp("Sample Text.")
	-- Panel:ControlHelp("Sample Text.")
	-- Panel:ControlHelp("Sample Text.")
	-- Panel:ControlHelp("Sample Text.")
	-- Panel:ControlHelp("Sample Text.")
	-- Panel:AddControl("Checkbox", {Label ="Shadow Walkers can revive corpse?", Command ="vj_BBOHG_ShadowRevival"})
	-- Panel:ControlHelp("They turn corpses into more Shadow Walkers.")
	-- Panel:AddControl("Checkbox", {Label ="Griefer Grigori is killable?", Command ="vj_BBOHG_KillableGriggs"})
	-- Panel:AddControl("Checkbox", {Label ="You Need Me.", Command ="vj_BBOHG_YouNeedMe"})
	-- Panel:ControlHelp("You Need Me.")
	-- Panel:AddControl("Checkbox", {Label ="The Rock has reasonable hp and damage?", Command ="vj_BBOHG_ReasonableRock"})
	-- Panel:AddControl("Checkbox", {Label ="Pii'zaa summons allies?", Command ="vj_BBOHG_PiizaaSummonsAllies"})
	-- Panel:AddControl("Checkbox", {Label ="Pii'zaa summons Golden Pizza Bears?", Command ="vj_BBOHG_PiizaaSummonsGoldens"})
	-- Panel:ControlHelp("If disabled, he'll just summon normal pizza worshipers.")
	-- Panel:AddControl("Checkbox", {Label ="Golden Pizza Bear summons allies?", Command ="vj_BBOHG_GoldenSummonsAllies"})
	-- Panel:AddControl("Checkbox", {Label ="Tossers are fearless?", Command ="vj_BBOHG_FearlessTossers"})
	-- Panel:ControlHelp("If disabled, most Tossers will flee from certain enemies.")
	-- Panel:AddControl("Checkbox", {Label ="Bosses have music?", Command ="vj_BBOHG_BossMusic"})
	-- Panel:AddControl("Checkbox", {Label ="Julio is hostile?", Command ="vj_BBOHG_HostileJulio"})
	-- Panel:AddControl("Checkbox", {Label ="B0ne(r)s and Sandpaper are friendly?", Command ="vj_BBOHG_FriendlyBoners"})
	-- Panel:AddControl("Checkbox", {Label ="Imperial Metrocops are hostile?", Command ="vj_BBOHG_HostileImperials"})
	-- Panel:AddControl("Checkbox", {Label ="Grampa is hostile?", Command ="vj_BBOHG_HostileGrampa"})
	-- Panel:AddControl("Checkbox", {Label ="sans is hostile?", Command ="vj_BBOHG_Hostilesans"})
	-- Panel:AddControl("Checkbox", {Label ="Sandpaper is hostile?", Command ="vj_BBOHG_HostileSandpaper"})
	-- Panel:AddControl("Checkbox", {Label ="Scinists are hostile?", Command ="vj_BBOHG_HostileScintists"})
	-- Panel:AddControl("Checkbox", {Label ="Tossers are friendly?", Command ="vj_BBOHG_FriendlyTossers"})
	-- Panel:AddControl("Checkbox", {Label ="Worshipers of Pii'zaa are friendly?", Command ="vj_BBOHG_FriendlyPiizaa"})
	-- Panel:AddControl("Checkbox", {Label ="Tossers don't collide with eachother?", Command ="vj_BBOHG_TosserNocollide"})
	-- Panel:AddControl("Checkbox", {Label ="Scintist uses Kleiner model instead of HL1 Scientist?", Command ="vj_BBOHG_KleinerScintist"})
	-- Panel:AddControl("Checkbox", {Label ="Gnome Model?", Command ="vj_BBOHG_GnomeModel"})
	-- Panel:ControlHelp("Set to 0 to use the HL2:EP2 one, set to 1 to use the L4D2 one.")
	-- Panel:AddControl("Checkbox", {Label ="Everyone is allied against you?", Command ="vj_BBOHG_NoGodsNoMasterss"})
	-- Panel:ControlHelp("This overrides all the other friendly/hostile convars.")
	Panel:AddPanel(typebox)

end

	function VJ_ADDTOMENU_BBOHG(Panel)
		spawnmenu.AddToolMenuOption("DrVrej","SNPC Configures","BBOHG","BBOHG","","", VJ_BBOHG, {} )
	end
		hook.Add("PopulateToolMenu","VJ_ADDTOMENU_BBOHG", VJ_ADDTOMENU_BBOHG )
	end

-- !!!!!! DON'T TOUCH ANYTHING BELOW THIS !!!!!! -------------------------------------------------------------------------------------------------------------------------
	AddCSLuaFile(AutorunFile)
	VJ.AddAddonProperty(AddonName,AddonType)
else
	if (CLIENT) then
		chat.AddText(Color(0,200,200),PublicAddonName,
		Color(0,255,0)," was unable to install, you are missing ",
		Color(255,100,0),"VJ Base!")
	end
	timer.Simple(1,function()
		if not VJF then
			if (CLIENT) then
				VJF = vgui.Create("DFrame")
				VJF:SetTitle("ERROR!")
				VJF:SetSize(790,560)
				VJF:SetPos((ScrW()-VJF:GetWide())/2,(ScrH()-VJF:GetTall())/2)
				VJF:MakePopup()
				VJF.Paint = function()
					draw.RoundedBox(8,0,0,VJF:GetWide(),VJF:GetTall(),Color(200,0,0,150))
				end
				
				local VJURL = vgui.Create("DHTML",VJF)
				VJURL:SetPos(VJF:GetWide()*0.005, VJF:GetTall()*0.03)
				VJURL:Dock(FILL)
				VJURL:SetAllowLua(true)
				VJURL:OpenURL("https://sites.google.com/site/vrejgaming/vjbasemissing")
			elseif (SERVER) then
				timer.Create("VJBASEMissing",5,0,function() print("VJ Base is Missing! Download it from the workshop!") end)
			end
		end
	end)
end