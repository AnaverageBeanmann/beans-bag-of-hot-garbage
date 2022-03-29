AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/skeleton/skeleton_bleached.mdl"} 
ENT.StartHealth = 50
ENT.HullType = HULL_HUMAN
ENT.VJC_Data = {
	CameraMode = 1,
	ThirdP_Offset = Vector(40, 20, -50),
	FirstP_Bone = "ValveBiped.Bip01_Spine4",
	FirstP_Offset = Vector(0, 0, 5),
}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_b0ne(r)"} 
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.IsMedicSNPC = false
ENT.AnimTbl_Medic_GiveHealth = {"heal"}
ENT.Medic_TimeUntilHeal = 1.20
ENT.Medic_HealthAmount = 25
ENT.Medic_SpawnPropOnHealModel = "models/props_junk/garbage_milkcarton002a.mdl"
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.Bleeds = false
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = {"death_01",
	"death_02",
	"death_03",
	"death_04"}
ENT.DeathAnimationChance = 3 -- Put 1 if you want it to play the animation all the time
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.MeleeAttackDamage = math.Rand(1,1)
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.AnimTbl_MeleeAttack = {"swing"}
ENT.MeleeAttackDistance = 40
ENT.MeleeAttackDamageDistance = 60
ENT.MeleeAttackAngleRadius = 70
ENT.MeleeAttackDamageAngleRadius = 70
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasRangeAttack = false
ENT.RangeAttackEntityToSpawn = "obj_vj_bbohg_lostsoul"
ENT.AnimTbl_RangeAttack = {"cheer2"}
ENT.RangeToMeleeDistance = 1
ENT.TimeUntilRangeAttackProjectileRelease = 2
ENT.NextRangeAttackTime = 5
ENT.NextRangeAttackTime_DoRand = 15
ENT.RangeUseAttachmentForPos = true
ENT.RangeUseAttachmentForPosID = "chest"
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasLeapAttack = false
ENT.LeapAttackDamage = math.random(10,15)
ENT.LeapAttackDamageType = DMG_CLUB
ENT.AnimTbl_LeapAttack = {"vjges_zombie_leap_mid"}
ENT.LeapDistance = 250
ENT.LeapToMeleeDistance = 1
ENT.LeapAttackDamageDistance = 75
ENT.LeapAttackAnimationFaceEnemy = 2
ENT.TimeUntilLeapAttackDamage = 0.4
ENT.TimeUntilLeapAttackVelocity = 0.1
ENT.NextLeapAttackTime = 1
ENT.LeapAttackExtraTimers = {0.6, 0.8, 1, 1.2, 1.4}
ENT.StopLeapAttackAfterFirstHit = true
ENT.LeapAttackVelocityForward = 70
ENT.LeapAttackVelocityUp = 235
---------------------------------------------------------------------------------------------------------------------------------------------

ENT.FootStepTimeRun = 0.25
ENT.FootStepTimeWalk = 0.5

ENT.CombatIdleSoundChance = 3

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 90

ENT.PainSoundChance = 3
---------------------------------------------------------------------------------------------------------------------------------------------
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"npc/boner/step (1).mp3",
	"npc/boner/step (2).mp3",
	"npc/boner/step (3).mp3",
	"npc/boner/step (4).mp3"}
ENT.SoundTbl_MedicBeforeHeal = {"npc/boner/drink.mp3"}
ENT.SoundTbl_MedicAfterHeal = {"ambient/levels/canals/toxic_slime_sizzle1.wav",
	"ambient/levels/canals/toxic_slime_sizzle2.wav",
	"ambient/levels/canals/toxic_slime_sizzle3.wav",
	"ambient/levels/canals/toxic_slime_sizzle4.wav"}
ENT.SoundTbl_Alert = {"npc/boner/alert.mp3",
	"npc/boner/doot.mp3"}
ENT.SoundTbl_BeforeMeleeAttack = {"npc/boner/shortdoot (1).mp3",
	"npc/boner/shortdoot (2).mp3"}
ENT.SoundTbl_MeleeAttack = {}
ENT.SoundTbl_MeleeAttack = {"physics/body/body_medium_impact_hard1.wav",
	"physics/body/body_medium_impact_hard2.wav",
	"physics/body/body_medium_impact_hard3.wav",
	"physics/body/body_medium_impact_hard4.wav",
	"physics/body/body_medium_impact_hard5.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"npc/zombie/claw_miss2.wav",
	"npc/zombie/claw_miss1.wav"}
ENT.SoundTbl_AllyDeath = {"npc/boner/alert.mp3"}
ENT.SoundTbl_Pain = {"npc/boner/alert.mp3"}
ENT.SoundTbl_Death = {"npc/boner/death.mp3",
	"npc/boner/doot.mp3"}

ENT.SkelllyType = 0
-- 0 = Standard
-- 1 = Knight
-- 2 = Frenzy
-- 3 = Reviver
ENT.KnightWeapon = 0
-- 0 = None
-- 1 = Crowbar
-- 2 = Pipe
-- 3 = Stunstick
ENT.Reviver = false
ENT.CanReviveStuff = true

ENT.infect = true
ENT.infect2 = false
ENT.MoveToCorpose = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()
	local SkelType = math.random(1,10)
	if SkelType == 1 then
		self.SkelllyType = 3
	elseif SkelType == 2 || SkelType == 3 then
		self.SkelllyType = 2
	elseif SkelType == 4 || SkelType == 5 then
		self.SkelllyType = 1
		self.StartHealth = 100
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	if GetConVarNumber("vj_BBOHG_Gibs") == 0 then
		self.AllowedToGib = false
	end
	if GetConVarNumber("vj_BBOHG_NoGodsNoMasters") == 1 then
		self.VJ_NPC_Class = {"CLASS_BBOHG"}
		self.FriendsWithAllPlayerAllies = false
	end
	if self.SkelllyType == 3 then
		self:SetSkin(3)
		self.Reviver = true
		self.HasRangeAttack = true
		self.IsMedicSNPC = true
		self.PainSoundChance = 2
		
		
self.SoundTbl_Idle = {"npc/boner/reviver/vo/soldier_autocappedintelligence01.mp3",
	"npc/boner/reviver/vo/soldier_battlecry02.mp3",
	"npc/boner/reviver/vo/soldier_battlecry03.mp3",
	"npc/boner/reviver/vo/soldier_battlecry04.mp3",
	"npc/boner/reviver/vo/soldier_cloakedspyidentify03.mp3",
	"npc/boner/reviver/vo/soldier_dominationheavy06.mp3",
	"npc/boner/reviver/vo/soldier_dominationmedic04.mp3",
	"npc/boner/reviver/vo/soldier_dominationscout02.mp3",
	"npc/boner/reviver/vo/soldier_dominationscout06.mp3",
	"npc/boner/reviver/vo/soldier_dominationsniper02.mp3",
	"npc/boner/reviver/vo/soldier_dominationsniper03.mp3",
	"npc/boner/reviver/vo/soldier_dominationsniper10.mp3",
	"npc/boner/reviver/vo/soldier_dominationsniper14.mp3",
	"npc/boner/reviver/vo/soldier_dominationsoldier04.mp3",
	"npc/boner/reviver/vo/soldier_hatoverhearttaunt05.mp3",
	"npc/boner/reviver/vo/soldier_item_birdhead_domination01.mp3",
	"npc/boner/reviver/vo/soldier_mvm_loot_common02.mp3",
	"npc/boner/reviver/vo/soldier_mvm_loot_godlike03.mp3",
	"npc/boner/reviver/vo/soldier_mvm_resurrect01.mp3",
	"npc/boner/reviver/vo/soldier_mvm_stand_alone01.mp3",
	"npc/boner/reviver/vo/soldier_mvm_wave_end05.mp3",
	"npc/boner/reviver/vo/soldier_mvm_wave_end06.mp3",
	"npc/boner/reviver/vo/soldier_mvm_wave_end07.mp3",
	"npc/boner/reviver/vo/soldier_robot01.mp3",
	"npc/boner/reviver/vo/soldier_robot02.mp3",
	"npc/boner/reviver/vo/soldier_robot03.mp3",
	"npc/boner/reviver/vo/soldier_robot04.mp3",
	"npc/boner/reviver/vo/soldier_robot05.mp3",
	"npc/boner/reviver/vo/soldier_robot06.mp3",
	"npc/boner/reviver/vo/soldier_robot07.mp3",
	"npc/boner/reviver/vo/soldier_robot08.mp3",
	"npc/boner/reviver/vo/soldier_robot09.mp3",
	"npc/boner/reviver/vo/soldier_robot10.mp3",
	"npc/boner/reviver/vo/soldier_robot11.mp3",
	"npc/boner/reviver/vo/soldier_robot12.mp3",
	"npc/boner/reviver/vo/soldier_robot13.mp3",
	"npc/boner/reviver/vo/soldier_robot14.mp3",
	"npc/boner/reviver/vo/soldier_robot15.mp3",
	"npc/boner/reviver/vo/soldier_robot16.mp3",
	"npc/boner/reviver/vo/soldier_robot17.mp3",
	"npc/boner/reviver/vo/soldier_robot18.mp3",
	"npc/boner/reviver/vo/soldier_robot19.mp3",
	"npc/boner/reviver/vo/soldier_robot20.mp3",
	"npc/boner/reviver/vo/soldier_robot21.mp3",
	"npc/boner/reviver/vo/soldier_robot22.mp3",
	"npc/boner/reviver/vo/soldier_robot23.mp3",
	"npc/boner/reviver/vo/soldier_robot24.mp3",
	"npc/boner/reviver/vo/soldier_robot25.mp3",
	"npc/boner/reviver/vo/soldier_robot26.mp3",
	"npc/boner/reviver/vo/soldier_robot27.mp3",
	"npc/boner/reviver/vo/soldier_robot28.mp3",
	"npc/boner/reviver/vo/soldier_sf12_badmagic07.mp3",
	"npc/boner/reviver/vo/soldier_sf12_badmagic10.mp3",
	"npc/boner/reviver/vo/soldier_sf13_round_start01.mp3",
	"npc/boner/reviver/vo/soldier_sf13_round_start03.mp3",
	"npc/boner/reviver/vo/soldier_sf13_spell_earthquake01.mp3",
	"npc/boner/reviver/vo/soldier_specialcompleted04.mp3",
	"npc/boner/reviver/vo/soldier_weapon_taunts04.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_pregamefirst_02.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_tank_03.wav",
	"npc/boner/reviver/vo/taunts/soldier/soldier_tank_warcry_12.wav",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_admire_01.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_cong_fun_27.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_cong_fun_29.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_cong_int_03.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_cong_int_11.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_dosi_fun_09.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_dosi_fun_11.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_flip_end_03.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_flip_int_17.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_flip_int_19.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_flip_int_20.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_flip_int_24.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_kill_01.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_kill_04.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_kill_10.mp3",
	"npc/boner/reviver/pcoptimizer/bathroom.mp3",
	"npc/boner/reviver/pcoptimizer/cocks.mp3",
	"npc/boner/reviver/pcoptimizer/kokomo.mp3",
	"npc/boner/reviver/pcoptimizer/nipples.mp3",
	"npc/boner/reviver/pcoptimizer/taxes.mp3",
	"npc/boner/reviver/viavoice/circus.mp3",
	"npc/boner/reviver/viavoice/horse.mp3",
	"npc/boner/reviver/viavoice/jesus.mp3",
	"npc/boner/reviver/viavoice/jiAa.mp3",
	"npc/boner/reviver/viavoice/luigi.mp3",
	"npc/boner/reviver/vo/taunts/soldier_taunts08.mp3",
	"npc/boner/reviver/gostboster/burgerghost.mp3",
	"npc/boner/reviver/gostboster/foodpoision.mp3",
	"npc/boner/reviver/gostboster/joke.mp3",
	"npc/boner/reviver/gostboster/kfm.mp3",
	"npc/boner/reviver/gostboster/milkgood.mp3",
	"npc/boner/reviver/gostboster/needmilk.mp3",
	"npc/boner/reviver/gostboster/nomilk.mp3",
	"npc/boner/reviver/gostboster/shit.mp3",
	"npc/boner/reviver/gostboster/usethegun.mp3",
	}
self.SoundTbl_IdleDialogue = {"npc/boner/reviver/vo/soldier_battlecry05.mp3",
	"npc/boner/reviver/vo/soldier_cartgoingforwarddefense01.mp3",
	"npc/boner/reviver/vo/soldier_cartgoingforwarddefense02.mp3",
	"npc/boner/reviver/vo/soldier_cartgoingforwardoffense05.mp3",
	"npc/boner/reviver/vo/soldier_cartgoingforwardoffense06.mp3",
	"npc/boner/reviver/vo/soldier_cartgoingforwardoffense08.mp3",
	"npc/boner/reviver/vo/soldier_cartgoingforwardoffense10.mp3",
	"npc/boner/reviver/vo/soldier_cartgoingforwardoffense13.mp3",
	"npc/boner/reviver/vo/soldier_cartgoingforwardoffense15.mp3",
	"npc/boner/reviver/vo/soldier_cartstaycloseoffense01.mp3",
	"npc/boner/reviver/vo/soldier_cartstaycloseoffense06.mp3",
	"npc/boner/reviver/vo/soldier_cloakedspyidentify04.mp3",
	"npc/boner/reviver/vo/soldier_cloakedspyidentify06.mp3",
	"npc/boner/reviver/vo/soldier_directhittaunt03.mp3",
	"npc/boner/reviver/vo/soldier_directhittaunt04.mp3",
	"npc/boner/reviver/vo/soldier_dominationdemoman02.mp3",
	"npc/boner/reviver/vo/soldier_dominationdemoman06.mp3",
	"npc/boner/reviver/vo/soldier_dominationengineer01.mp3",
	"npc/boner/reviver/vo/soldier_dominationengineer03.mp3",
	"npc/boner/reviver/vo/soldier_dominationengineer04.mp3",
	"npc/boner/reviver/vo/soldier_dominationengineer05.mp3",
	"npc/boner/reviver/vo/soldier_dominationengineer06.mp3",
	"npc/boner/reviver/vo/soldier_dominationheavy05.mp3",
	"npc/boner/reviver/vo/soldier_dominationheavy06.mp3",
	"npc/boner/reviver/vo/soldier_dominationheavy07.mp3",
	"npc/boner/reviver/vo/soldier_dominationmedic05.mp3",
	"npc/boner/reviver/vo/soldier_dominationpyro02.mp3",
	"npc/boner/reviver/vo/soldier_dominationpyro03.mp3",
	"npc/boner/reviver/vo/soldier_dominationpyro04.mp3",
	"npc/boner/reviver/vo/soldier_dominationpyro06.mp3",
	"npc/boner/reviver/vo/soldier_dominationpyro07.mp3",
	"npc/boner/reviver/vo/soldier_dominationscout01.mp3",
	"npc/boner/reviver/vo/soldier_dominationscout05.mp3",
	"npc/boner/reviver/vo/soldier_dominationscout06.mp3",
	"npc/boner/reviver/vo/soldier_dominationsniper04.mp3",
	"npc/boner/reviver/vo/soldier_dominationsniper08.mp3",
	"npc/boner/reviver/vo/soldier_dominationsniper12.mp3",
	"npc/boner/reviver/vo/soldier_dominationsoldier01.mp3",
	"npc/boner/reviver/vo/soldier_dominationspy02.mp3",
	"npc/boner/reviver/vo/soldier_dominationspy06.mp3",
	"npc/boner/reviver/vo/soldier_dominationspy07.mp3",
	"npc/boner/reviver/vo/soldier_dominationspy08.mp3",
	"npc/boner/reviver/vo/soldier_headleft02.mp3",
	"npc/boner/reviver/vo/soldier_headleft03.mp3",
	"npc/boner/reviver/vo/soldier_headleft02.mp3",
	"npc/boner/reviver/vo/soldier_headleft03.mp3",
	"npc/boner/reviver/vo/soldier_item_birdhead_round_start01.mp3",
	"npc/boner/reviver/vo/soldier_item_unicorn_round_start01.mp3",
	"npc/boner/reviver/vo/soldier_item_unicorn_round_start02.mp3",
	"npc/boner/reviver/vo/soldier_item_wizard_domination01.mp3",
	"npc/boner/reviver/vo/soldier_mvm_loot_common03.mp3",
	"npc/boner/reviver/vo/soldier_mvm_mannhattan_gate_atk01.mp3",
	"npc/boner/reviver/vo/soldier_mvm_resurrect02.mp3",
	"npc/boner/reviver/vo/soldier_mvm_resurrect03.mp3",
	"npc/boner/reviver/vo/soldier_needdispenser01.mp3",
	"npc/boner/reviver/vo/soldier_needsentry01.mp3",
	"npc/boner/reviver/vo/soldier_needteleporter01.mp3",
	"npc/boner/reviver/vo/soldier_pickaxetaunt03.mp3",
	"npc/boner/reviver/vo/soldier_sf12_bombinomicon01.mp3",
	"npc/boner/reviver/vo/soldier_sf12_bombinomicon02.mp3",
	"npc/boner/reviver/vo/soldier_sf12_zombie02.mp3",
	"npc/boner/reviver/vo/soldier_sf12_zombie03.mp3",
	"npc/boner/reviver/vo/soldier_sf12_zombie04.mp3",
	"npc/boner/reviver/vo/soldier_sf13_cart_forward01.mp3",
	"npc/boner/reviver/vo/soldier_sf13_cart_forward02.mp3",
	"npc/boner/reviver/vo/soldier_sf13_midnight01.mp3",
	"npc/boner/reviver/vo/soldier_sf13_midnight02.mp3",
	"npc/boner/reviver/vo/soldier_sf13_round_start02.mp3",
	"npc/boner/reviver/vo/soldier_sf13_spell_devil_bargain01.mp3",
	"npc/boner/reviver/vo/soldier_sf13_spell_zombie_horde01.mp3",
	"npc/boner/reviver/vo/soldier_specialcompleted-assistedkill01.mp3",
	"npc/boner/reviver/vo/soldier_thanksfortheteleporter03.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_gamewon_08.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_pregamefirst_01.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_pregamefirst_03.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_pregamefirst_08.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_pregamefirst_10.mp3",
	"npc/boner/reviver/vo/taunts/soldier_taunts14.mp3",
	"npc/boner/reviver/vo/taunts/soldier_taunts16.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_admire_16.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_flip_fun_04.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_flip_fun_06.mp3",
	"npc/boner/reviver/pcoptimizer/devil.mp3",
	"npc/boner/reviver/pcoptimizer/job.mp3",
	"npc/boner/reviver/pcoptimizer/nipples.mp3",
	"npc/boner/reviver/pcoptimizer/steve_jobs.mp3",
	"npc/boner/reviver/pcoptimizer/viruses.mp3",
	"npc/boner/reviver/viavoice/jesus.mp3",
	}
self.SoundTbl_IdleDialogueAnswer = {"npc/boner/reviver/vo/soldier_cartgoingforwardoffense02.mp3",
	"npc/boner/reviver/vo/soldier_cartgoingforwardoffense11.mp3",
	"npc/boner/reviver/vo/soldier_cartgoingforwardoffense12.mp3",
	"npc/boner/reviver/vo/soldier_cartstaycloseoffense06.mp3",
	"npc/boner/reviver/vo/soldier_cartstopitdefense03.mp3",
	"npc/boner/reviver/vo/soldier_cheers01.mp3",
	"npc/boner/reviver/vo/soldier_cheers06.mp3",
	"npc/boner/reviver/vo/soldier_cloakedspy01.mp3",
	"npc/boner/reviver/vo/soldier_cloakedspyidentify02.mp3",
	"npc/boner/reviver/vo/soldier_cloakedspyidentify03.mp3",
	"npc/boner/reviver/vo/soldier_cloakedspyidentify05.mp3",
	"npc/boner/reviver/vo/soldier_cloakedspyidentify07.mp3",
	"npc/boner/reviver/vo/soldier_cloakedspyidentify08.mp3",
	"npc/boner/reviver/vo/soldier_directhittaunt03.mp3",
	"npc/boner/reviver/vo/soldier_dominationdemoman01.mp3",
	"npc/boner/reviver/vo/soldier_dominationdemoman03.mp3",
	"npc/boner/reviver/vo/soldier_dominationengineer02.mp3",
	"npc/boner/reviver/vo/soldier_dominationheavy01.mp3",
	"npc/boner/reviver/vo/soldier_dominationmedic02.mp3",
	"npc/boner/reviver/vo/soldier_dominationmedic06.mp3",
	"npc/boner/reviver/vo/soldier_dominationpyro05.mp3",
	"npc/boner/reviver/vo/soldier_dominationpyro09.mp3",
	"npc/boner/reviver/vo/soldier_dominationscout03.mp3",
	"npc/boner/reviver/vo/soldier_dominationsniper05.mp3",
	"npc/boner/reviver/vo/soldier_dominationsniper11.mp3",
	"npc/boner/reviver/vo/soldier_dominationsoldier03.mp3",
	"npc/boner/reviver/vo/soldier_dominationsoldier05.mp3",
	"npc/boner/reviver/vo/soldier_dominationspy01.mp3",
	"npc/boner/reviver/vo/soldier_dominationspy03.mp3",
	"npc/boner/reviver/vo/soldier_dominationspy04.mp3",
	"npc/boner/reviver/vo/soldier_dominationspy05.mp3",
	"npc/boner/reviver/vo/soldier_goodjob02.mp3",
	"npc/boner/reviver/vo/soldier_hatoverhearttaunt05.mp3",
	"npc/boner/reviver/vo/soldier_item_wizard_domination02.mp3",
	"npc/boner/reviver/vo/soldier_mvm_bomb_destroyed01.mp3",
	"npc/boner/reviver/vo/soldier_mvm_bomb_see03.mp3",
	"npc/boner/reviver/vo/soldier_mvm_loot_godlike01.mp3",
	"npc/boner/reviver/vo/soldier_mvm_loot_rare04.mp3",
	"npc/boner/reviver/vo/soldier_mvm_tank_alert01.mp3",
	"npc/boner/reviver/vo/soldier_mvm_wave_end01.mp3",
	"npc/boner/reviver/vo/soldier_mvm_wave_end02.mp3",
	"npc/boner/reviver/vo/soldier_no01.mp3",
	"npc/boner/reviver/vo/soldier_no02.mp3",
	"npc/boner/reviver/vo/soldier_no03.mp3",
	"npc/boner/reviver/vo/soldier_sf12_badmagic08.mp3",
	"npc/boner/reviver/vo/soldier_sf13_influx_big03.mp3",
	"npc/boner/reviver/vo/soldier_yes01.mp3",
	"npc/boner/reviver/vo/soldier_yes02.mp3",
	"npc/boner/reviver/vo/soldier_yes03.mp3",
	"npc/boner/reviver/vo/soldier_yes04.mp3",
	"npc/boner/reviver/vo/taunts/soldier_taunts08.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_tank_warcry_13.wav",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_cong_fun_24.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_cong_int_04.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_int_03.mp3",
	"npc/boner/reviver/pcoptimizer/crisis.mp3",
	"npc/boner/reviver/viavoice/fUCk.mp3",
	}
self.SoundTbl_CombatIdle = {"npc/boner/reviver/vo/soldier_cartgoingforwardoffense09.mp3",
	"npc/boner/reviver/vo/soldier_cartgoingforwardoffense14.mp3",
	"npc/boner/reviver/vo/soldier_cheers05.mp3",
	"npc/boner/reviver/vo/soldier_directhittaunt02.mp3",
	"npc/boner/reviver/vo/soldier_dominationscout10.mp3",
	"npc/boner/reviver/vo/soldier_dominationscout11.mp3",
	"npc/boner/reviver/vo/soldier_pickaxetaunt01.mp3",
	"npc/boner/reviver/vo/soldier_pickaxetaunt02.mp3",
	"npc/boner/reviver/vo/soldier_pickaxetaunt04.mp3",
	"npc/boner/reviver/vo/soldier_sf12_zombie01.mp3",
	"npc/boner/reviver/vo/soldier_autocappedintelligence01.mp3",
	"npc/boner/reviver/vo/soldier_battlecry05.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_pregamefirst_07.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_pregamefirst_09.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_pregamefirst_12.mp3",
	"npc/boner/reviver/vo/taunts/soldier_taunts08.mp3",
	"npc/boner/reviver/vo/taunts/soldier_taunts09.mp3",
	"npc/boner/reviver/vo/taunts/soldier_taunts17.mp3",
	"npc/boner/reviver/vo/taunts/soldier_taunts20.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_tank_04.wav",
	"npc/boner/reviver/vo/taunts/soldier/soldier_tank_06.wav",
	"npc/boner/reviver/vo/taunts/soldier/soldier_tank_16.wav",
	"npc/boner/reviver/vo/taunts/soldier/soldier_aerobic_04.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_aerobic_07.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_aerobic_13.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_aerobic_14.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_cong_fun_01.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_cong_fun_04.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_cong_fun_08.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_cong_fun_11.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_cong_int_02.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_cong_int_13.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_dosi_fun_32.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_dosi_int_03.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_dosi_int_05.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_dosi_int_12.mp3",
	"npc/boner/reviver/pcoptimizer/bathroom.mp3",
	"npc/boner/reviver/pcoptimizer/cocks.mp3",
	"npc/boner/reviver/pcoptimizer/kokomo.mp3",
	"npc/boner/reviver/pcoptimizer/nipples.mp3",
	"npc/boner/reviver/pcoptimizer/taxes.mp3",
	"npc/boner/reviver/viavoice/circus.mp3",
	"npc/boner/reviver/viavoice/horse.mp3",
	"npc/boner/reviver/viavoice/jesus.mp3",
	"npc/boner/reviver/viavoice/jiAa.mp3",
	"npc/boner/reviver/viavoice/luigi.mp3",
	"npc/boner/reviver/gostboster/nomilk.mp3",
	}
self.SoundTbl_OnReceiveOrder = {"npc/boner/reviver/vo/soldier_cartgoingforwardoffense03.mp3",
	"npc/boner/reviver/vo/soldier_cartgoingforwardoffense04.mp3",
	"npc/boner/reviver/vo/soldier_cartgoingforwardoffense07.mp3",
	"npc/boner/reviver/vo/soldier_cartgoingforwardoffense09.mp3",
	"npc/boner/reviver/vo/soldier_cartstaycloseoffense04.mp3",
	"npc/boner/reviver/vo/soldier_cartstopitdefense01.mp3",
	"npc/boner/reviver/vo/soldier_cartstoppedoffense02.mp3",
	"npc/boner/reviver/vo/soldier_cheers01.mp3",
	"npc/boner/reviver/vo/soldier_cheers02.mp3",
	"npc/boner/reviver/vo/soldier_cloakedspyidentify01.mp3",
	"npc/boner/reviver/vo/soldier_cloakedspyidentify05.mp3",
	"npc/boner/reviver/vo/soldier_dominationpyro06.mp3",
	"npc/boner/reviver/vo/soldier_headleft01.mp3",
	"npc/boner/reviver/vo/soldier_mvm_ask_ready01.mp3",
	"npc/boner/reviver/vo/soldier_mvm_ask_ready02.mp3",
	"npc/boner/reviver/vo/soldier_mvm_encourage_upgrade01.mp3",
	"npc/boner/reviver/vo/soldier_mvm_resurrect06.mp3",
	"npc/boner/reviver/vo/soldier_mvm_say_ready01.mp3",
	"npc/boner/reviver/vo/soldier_mvm_say_ready02.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_end_01.mp3",
	}
-- self.SoundTbl_MedicBeforeHeal = {}
-- self.SoundTbl_MedicAfterHeal = {}
self.SoundTbl_MedicReceiveHeal = {"npc/boner/reviver/vo/soldier_item_maggot_healed01.mp3",
	"npc/boner/reviver/vo/soldier_item_maggot_healed02.mp3",
	"npc/boner/reviver/vo/soldier_thanksfortheheal01.mp3",
	"npc/boner/reviver/vo/soldier_thanksfortheheal02.mp3",
	"npc/boner/reviver/vo/soldier_thanksfortheheal03.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_kill_16.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_kill_18.mp3",
	"npc/boner/reviver/vo/taunts/soldier/taunt_soldier_coffee_4_coffee_sip.mp3",
	"npc/boner/reviver/vo/taunts/soldier/taunt_soldier_coffee_5_coffee_ahh.mp3",
	}
self.SoundTbl_Investigate = {"npc/boner/reviver/vo/soldier_cartgoingforwardoffense01.mp3",
	"npc/boner/reviver/vo/soldier_cartstaycloseoffense02.mp3",
	"npc/boner/reviver/vo/soldier_cartstaycloseoffense04.mp3",
	"npc/boner/reviver/vo/soldier_cartstoppedoffense02.mp3",
	"npc/boner/reviver/vo/soldier_cloakedspy01.mp3",
	"npc/boner/reviver/vo/soldier_cloakedspy02.mp3",
	"npc/boner/reviver/vo/soldier_cloakedspyidentify05.mp3",
	"npc/boner/reviver/vo/soldier_dominationscout06.mp3",
	"npc/boner/reviver/vo/soldier_dominationscout08.mp3",
	"npc/boner/reviver/vo/soldier_dominationsoldier06.mp3",
	"npc/boner/reviver/vo/soldier_jeers06.mp3",
	"npc/boner/reviver/vo/soldier_mvm_ask_ready03.mp3",
	"npc/boner/reviver/vo/soldier_mvm_mannhattan_gate_atk01.mp3",
	"npc/boner/reviver/vo/soldier_mvm_sentry_buster01.mp3",
	"npc/boner/reviver/vo/soldier_mvm_sniper01.mp3",
	"npc/boner/reviver/vo/soldier_sentryahead01.mp3",
	"npc/boner/reviver/vo/soldier_sentryahead02.mp3",
	"npc/boner/reviver/vo/soldier_sentryahead03.mp3",
	"npc/boner/reviver/vo/soldier_sf12_badmagic06.mp3",
	"npc/boner/reviver/vo/soldier_sf12_badmagic15.mp3",
	"npc/boner/reviver/vo/soldier_sf12_scared01.mp3",
	"npc/boner/reviver/vo/soldier_sf12_seeking01.mp3",
	"npc/boner/reviver/vo/soldier_sf12_seeking02.mp3",
	"npc/boner/reviver/vo/soldier_sf12_seeking03.mp3",
	"npc/boner/reviver/vo/soldier_sf12_seeking04.mp3",
	"npc/boner/reviver/vo/soldier_sf12_seeking05.mp3",
	"npc/boner/reviver/vo/soldier_sf12_seeking06.mp3",
	"npc/boner/reviver/vo/soldier_sf12_seeking07.mp3",
	"npc/boner/reviver/vo/soldier_sf12_seeking08.mp3",
	"npc/boner/reviver/vo/soldier_sf12_seeking09.mp3",
	"npc/boner/reviver/vo/soldier_sf13_spell_super_jump01.mp3",
	"npc/boner/reviver/vo/soldier_standonthepoint03.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_flip_fun_08.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_rps_int_03.mp3",
	"npc/boner/reviver/pcoptimizer/hello.mp3",
	"npc/boner/reviver/pcoptimizer/job.mp3",
	}
self.SoundTbl_LostEnemy = {"npc/boner/reviver/vo/soldier_cartstoppedoffense01.mp3",
	"npc/boner/reviver/vo/soldier_cloakedspyidentify09.mp3",
	"npc/boner/reviver/vo/soldier_dominationscout04.mp3",
	"npc/boner/reviver/vo/soldier_dominationscout07.mp3",
	"npc/boner/reviver/vo/soldier_dominationscout09.mp3",
	"npc/boner/reviver/vo/soldier_jeers06.mp3",
	"npc/boner/reviver/vo/soldier_mvm_bomb_upgrade01.mp3",
	"npc/boner/reviver/vo/soldier_mvm_bomb_upgrade02.mp3",
	"npc/boner/reviver/vo/soldier_mvm_giant_robot04.mp3",
	"npc/boner/reviver/vo/soldier_mvm_resurrect05.mp3",
	"npc/boner/reviver/vo/soldier_sf12_badmagic05.mp3",
	"npc/boner/reviver/vo/soldier_sf12_reseeking01.mp3",
	"npc/boner/reviver/vo/soldier_sf13_magic_reac01.mp3",
	"npc/boner/reviver/vo/soldier_sf13_midnight03.mp3",
	"npc/boner/reviver/vo/soldier_sf13_spell_super_speed01.mp3",
	"npc/boner/reviver/vo/soldier_thanksfortheteleporter01.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_gamewon_rare_09.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_pregamefirst_11.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_pregamefirst_12.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_tank_11.wav",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_int_02.mp3",
	}
self.SoundTbl_Alert = {"npc/boner/reviver/vo/soldier_battlecry01.mp3",
	"npc/boner/reviver/vo/soldier_battlecry02.mp3",
	"npc/boner/reviver/vo/soldier_battlecry03.mp3",
	"npc/boner/reviver/vo/soldier_cartgoingforwardoffense03.mp3",
	"npc/boner/reviver/vo/soldier_cartgoingforwardoffense14.mp3",
	"npc/boner/reviver/vo/soldier_cloakedspy03.mp3",
	"npc/boner/reviver/vo/soldier_dominationmedic01.mp3",
	"npc/boner/reviver/vo/soldier_dominationscout10.mp3",
	"npc/boner/reviver/vo/soldier_dominationsniper04.mp3",
	"npc/boner/reviver/vo/soldier_dominationsniper13.mp3",
	"npc/boner/reviver/vo/soldier_hatoverhearttaunt04.mp3",
	"npc/boner/reviver/vo/soldier_mvm_ask_ready02.mp3",
	"npc/boner/reviver/vo/soldier_mvm_giant_robot02.mp3",
	"npc/boner/reviver/vo/soldier_mvm_loot_rare01.mp3",
	"npc/boner/reviver/vo/soldier_robot09.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_pregamefirst_04.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_pregamefirst_05.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_pregamefirst_06.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_pregamefirst_09.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_pregamefirst_13.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_pregamefirst_10.mp3",
	"npc/boner/reviver/vo/taunts/soldier_taunts07.mp3",
	"npc/boner/reviver/vo/taunts/soldier_taunts14.mp3",
	"npc/boner/reviver/vo/taunts/soldier_taunts20.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_tank_10.wav",
	"npc/boner/reviver/vo/taunts/soldier/soldier_tank_13.wav",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_flip_int_01.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_flip_int_03.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_flip_int_04.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_flip_int_15.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_head_int_02.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_head_int_07.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_head_int_17.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_head_int_21.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_int_02.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_int_04.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_int_10.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_int_08.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_int_15.mp3",
	}
self.SoundTbl_CallForHelp = {"npc/boner/reviver/vo/soldier_cartgoingforwardoffense01.mp3",
	"npc/boner/reviver/vo/soldier_cartgoingforwardoffense07.mp3",
	"npc/boner/reviver/vo/soldier_dominationsniper06.mp3",
	"npc/boner/reviver/vo/soldier_go01.mp3",
	"npc/boner/reviver/vo/soldier_go02.mp3",
	"npc/boner/reviver/vo/soldier_go03.mp3",
	"npc/boner/reviver/vo/soldier_hatoverhearttaunt04.mp3",
	"npc/boner/reviver/vo/soldier_headright01.mp3",
	"npc/boner/reviver/vo/soldier_helpme01.mp3",
	"npc/boner/reviver/vo/soldier_helpme02.mp3",
	"npc/boner/reviver/vo/soldier_helpme03.mp3",
	"npc/boner/reviver/vo/soldier_helpmecapture01.mp3",
	"npc/boner/reviver/vo/soldier_helpmecapture02.mp3",
	"npc/boner/reviver/vo/soldier_helpmecapture03.mp3",
	"npc/boner/reviver/vo/soldier_helpmedefend01.mp3",
	"npc/boner/reviver/vo/soldier_helpmedefend02.mp3",
	"npc/boner/reviver/vo/soldier_helpmedefend03.mp3",
	"npc/boner/reviver/vo/soldier_helpmedefend04.mp3",
	"npc/boner/reviver/vo/soldier_moveup01.mp3",
	"npc/boner/reviver/vo/soldier_moveup02.mp3",
	"npc/boner/reviver/vo/soldier_moveup03.mp3",
	"npc/boner/reviver/vo/soldier_mvm_ask_ready02.mp3",
	"npc/boner/reviver/vo/soldier_mvm_collect_credits01.mp3",
	"npc/boner/reviver/vo/soldier_mvm_collect_credits02.mp3",
	"npc/boner/reviver/vo/soldier_standonthepoint01.mp3",
	"npc/boner/reviver/vo/soldier_standonthepoint02.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_int_09.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_int_14.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_int_16.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_int_19.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_int_24.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_int_25.mp3",
	}
-- self.SoundTbl_BeforeMeleeAttack = {}
self.SoundTbl_BeforeRangeAttack = {"npc/boner/reviver/vo/soldier_item_birdhead_uber01.mp3",
	"npc/boner/reviver/vo/soldier_sf13_spell_bombhead01.mp3",
	"npc/boner/reviver/vo/soldier_sf13_spell_generic04.mp3",
	"npc/boner/reviver/vo/soldier_sf13_spell_invisibility01.mp3",
	"npc/boner/reviver/vo/soldier_sf13_spell_lightning_bolt01.mp3",
	"npc/boner/reviver/vo/soldier_sf13_spell_teleport_self01.mp3",
	"npc/boner/reviver/vo/soldier_sf13_spell_uber01.mp3",
	"npc/boner/reviver/vo/soldier_specialcompleted01.mp3",
	"npc/boner/reviver/vo/soldier_specialcompleted03.mp3",
	"npc/boner/reviver/vo/taunts/soldier_taunts01.mp3",
	"npc/boner/reviver/vo/taunts/soldier_taunts02.mp3",
	"npc/boner/reviver/vo/taunts/soldier_taunts03.mp3",
	"npc/boner/reviver/vo/taunts/soldier_taunts04.mp3",
	"npc/boner/reviver/vo/taunts/soldier_taunts05.mp3",
	"npc/boner/reviver/vo/taunts/soldier_taunts07.mp3",
	"npc/boner/reviver/vo/taunts/soldier_taunts09.mp3",
	"npc/boner/reviver/vo/taunts/soldier_taunts10.mp3",
	"npc/boner/reviver/vo/taunts/soldier_taunts15.mp3",
	"npc/boner/reviver/vo/taunts/soldier_taunts19.mp3",
	"npc/boner/reviver/vo/taunts/soldier_taunts21.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_tank_02.wav",
	"npc/boner/reviver/vo/taunts/soldier/soldier_tank_08.wav",
	"npc/boner/reviver/vo/taunts/soldier/soldier_tank_09.wav",
	"npc/boner/reviver/vo/taunts/soldier/soldier_tank_12.wav",
	"npc/boner/reviver/vo/taunts/soldier/soldier_tank_14.wav",
	"npc/boner/reviver/vo/taunts/soldier/soldier_tank_warcry_04.wav",
	"npc/boner/reviver/vo/taunts/soldier/soldier_tank_warcry_08.wav",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_admire_17.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_dosi_end_01.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_dosi_end_03.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_int_08.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_rps_int_05.mp3",
	"npc/boner/reviver/vo/taunts/soldier_taunts08.mp3",
	"npc/boner/reviver/gostboster/joke.mp3",
	}
-- self.SoundTbl_RangeAttack = {}
self.SoundTbl_OnKilledEnemy = {"npc/boner/reviver/vo/soldier_autocappedcontrolpoint01.mp3",
	"npc/boner/reviver/vo/soldier_autocappedcontrolpoint02.mp3",
	"npc/boner/reviver/vo/soldier_autocappedcontrolpoint03.mp3",
	"npc/boner/reviver/vo/soldier_autocappedintelligence01.mp3",
	"npc/boner/reviver/vo/soldier_autocappedintelligence02.mp3",
	"npc/boner/reviver/vo/soldier_autocappedintelligence03.mp3",
	"npc/boner/reviver/vo/soldier_battlecry05.mp3",
	"npc/boner/reviver/vo/soldier_battlecry06.mp3",
	"npc/boner/reviver/vo/soldier_cartgoingbackdefense01.mp3",
	"npc/boner/reviver/vo/soldier_cartgoingforwardoffense11.mp3",
	"npc/boner/reviver/vo/soldier_cartgoingforwardoffense12.mp3",
	"npc/boner/reviver/vo/soldier_cartstaycloseoffense03.mp3",
	"npc/boner/reviver/vo/soldier_cartstopitdefense03.mp3",
	"npc/boner/reviver/vo/soldier_cheers01.mp3",
	"npc/boner/reviver/vo/soldier_cheers02.mp3",
	"npc/boner/reviver/vo/soldier_cheers03.mp3",
	"npc/boner/reviver/vo/soldier_cheers04.mp3",
	"npc/boner/reviver/vo/soldier_cheers05.mp3",
	"npc/boner/reviver/vo/soldier_cheers06.mp3",
	"npc/boner/reviver/vo/soldier_cloakedspy01.mp3",
	"npc/boner/reviver/vo/soldier_cloakedspyidentify01.mp3",
	"npc/boner/reviver/vo/soldier_cloakedspyidentify02.mp3",
	"npc/boner/reviver/vo/soldier_cloakedspyidentify03.mp3",
	"npc/boner/reviver/vo/soldier_dominationdemoman02.mp3",
	"npc/boner/reviver/vo/soldier_dominationdemoman05.mp3",
	"npc/boner/reviver/vo/soldier_dominationengineer02.mp3",
	"npc/boner/reviver/vo/soldier_dominationheavy01.mp3",
	"npc/boner/reviver/vo/soldier_dominationheavy02.mp3",
	"npc/boner/reviver/vo/soldier_dominationheavy03.mp3",
	"npc/boner/reviver/vo/soldier_dominationheavy04.mp3",
	"npc/boner/reviver/vo/soldier_dominationmedic03.mp3",
	"npc/boner/reviver/vo/soldier_dominationmedic07.mp3",
	"npc/boner/reviver/vo/soldier_dominationpyro05.mp3",
	"npc/boner/reviver/vo/soldier_dominationpyro07.mp3",
	"npc/boner/reviver/vo/soldier_dominationpyro08.mp3",
	"npc/boner/reviver/vo/soldier_dominationscout04.mp3",
	"npc/boner/reviver/vo/soldier_dominationscout05.mp3",
	"npc/boner/reviver/vo/soldier_dominationscout07.mp3",
	"npc/boner/reviver/vo/soldier_dominationsniper01.mp3",
	"npc/boner/reviver/vo/soldier_dominationsniper09.mp3",
	"npc/boner/reviver/vo/soldier_dominationsoldier02.mp3",
	"npc/boner/reviver/vo/soldier_dominationsoldier05.mp3",
	"npc/boner/reviver/vo/soldier_goodjob03.mp3",
	"npc/boner/reviver/vo/soldier_hatoverhearttaunt01.mp3",
	"npc/boner/reviver/vo/soldier_hatoverhearttaunt02.mp3",
	"npc/boner/reviver/vo/soldier_hatoverhearttaunt03.mp3",
	"npc/boner/reviver/vo/soldier_item_birdhead_domination02.mp3",
	"npc/boner/reviver/vo/soldier_item_birdhead_domination03.mp3",
	"npc/boner/reviver/vo/soldier_item_birdhead_round_start01.mp3",
	"npc/boner/reviver/vo/soldier_item_birdhead_round_start02.mp3",
	"npc/boner/reviver/vo/soldier_item_birdhead_round_start03.mp3",
	"npc/boner/reviver/vo/soldier_item_birdhead_round_start04.mp3",
	"npc/boner/reviver/vo/soldier_item_birdhead_round_start05.mp3",
	"npc/boner/reviver/vo/soldier_item_birdhead_uber02.mp3",
	"npc/boner/reviver/vo/soldier_kaboomalts01.mp3",
	"npc/boner/reviver/vo/soldier_kaboomalts02.mp3",
	"npc/boner/reviver/vo/soldier_kaboomalts03.mp3",
	"npc/boner/reviver/vo/soldier_laughevil01.mp3",
	"npc/boner/reviver/vo/soldier_laughevil02.mp3",
	"npc/boner/reviver/vo/soldier_laughevil03.mp3",
	"npc/boner/reviver/vo/soldier_laughhappy01.mp3",
	"npc/boner/reviver/vo/soldier_laughhappy02.mp3",
	"npc/boner/reviver/vo/soldier_laughhappy03.mp3",
	"npc/boner/reviver/vo/soldier_laughlong01.mp3",
	"npc/boner/reviver/vo/soldier_laughlong02.mp3",
	"npc/boner/reviver/vo/soldier_laughlong03.mp3",
	"npc/boner/reviver/vo/soldier_laughshort01.mp3",
	"npc/boner/reviver/vo/soldier_laughshort02.mp3",
	"npc/boner/reviver/vo/soldier_laughshort03.mp3",
	"npc/boner/reviver/vo/soldier_laughshort04.mp3",
	"npc/boner/reviver/vo/soldier_medic01.mp3",
	"npc/boner/reviver/vo/soldier_medic02.mp3",
	"npc/boner/reviver/vo/soldier_medic03.mp3",
	"npc/boner/reviver/vo/soldier_mvm_close_call01.mp3",
	"npc/boner/reviver/vo/soldier_mvm_get_upgrade01.mp3",
	"npc/boner/reviver/vo/soldier_mvm_get_upgrade02.mp3",
	"npc/boner/reviver/vo/soldier_mvm_get_upgrade03.mp3",
	"npc/boner/reviver/vo/soldier_mvm_loot_common01.mp3",
	"npc/boner/reviver/vo/soldier_mvm_loot_godlike02.mp3",
	"npc/boner/reviver/vo/soldier_mvm_sentry_buster02.mp3",
	"npc/boner/reviver/vo/soldier_mvm_tank_dead01.mp3",
	"npc/boner/reviver/vo/soldier_mvm_tank_dead02.mp3",
	"npc/boner/reviver/vo/soldier_mvm_wave_end02.mp3",
	"npc/boner/reviver/vo/soldier_mvm_wave_end03.mp3",
	"npc/boner/reviver/vo/soldier_mvm_wave_end04.mp3",
	"npc/boner/reviver/vo/soldier_niceshot01.mp3",
	"npc/boner/reviver/vo/soldier_niceshot02.mp3",
	"npc/boner/reviver/vo/soldier_niceshot03.mp3",
	"npc/boner/reviver/vo/soldier_pickaxetaunt05.mp3",
	"npc/boner/reviver/vo/soldier_positivevocalization01.mp3",
	"npc/boner/reviver/vo/soldier_positivevocalization02.mp3",
	"npc/boner/reviver/vo/soldier_positivevocalization03.mp3",
	"npc/boner/reviver/vo/soldier_positivevocalization04.mp3",
	"npc/boner/reviver/vo/soldier_positivevocalization05.mp3",
	"npc/boner/reviver/vo/soldier_sf12_badmagic01.mp3",
	"npc/boner/reviver/vo/soldier_sf12_goodmagic01.mp3",
	"npc/boner/reviver/vo/soldier_sf12_goodmagic02.mp3",
	"npc/boner/reviver/vo/soldier_sf12_goodmagic03.mp3",
	"npc/boner/reviver/vo/soldier_sf12_goodmagic04.mp3",
	"npc/boner/reviver/vo/soldier_sf13_influx_big01.mp3",
	"npc/boner/reviver/vo/soldier_sf13_influx_big02.mp3",
	"npc/boner/reviver/vo/soldier_sf13_round_start02.mp3",
	"npc/boner/reviver/vo/soldier_sf13_spell_summon_monoculous01.mp3",
	"npc/boner/reviver/vo/soldier_specialcompleted05.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_gamewon_01.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_gamewon_03.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_gamewon_05.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_gamewon_06.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_gamewon_rare_01.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_gamewon_rare_02.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_gamewon_rare_03.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_gamewon_rare_04.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_gamewon_rare_05.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_gamewon_rare_06.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_gamewon_rare_07.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_matchwon_01.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_matchwon_02.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_matchwon_03.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_matchwon_04.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_matchwon_05.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_matchwon_06.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_matchwon_07.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_matchwon_08.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_matchwon_09.mp3",
	"npc/boner/reviver/vo/taunts/soldier_taunts01.mp3",
	"npc/boner/reviver/vo/taunts/soldier_taunts02.mp3",
	"npc/boner/reviver/vo/taunts/soldier_taunts03.mp3",
	"npc/boner/reviver/vo/taunts/soldier_taunts04.mp3",
	"npc/boner/reviver/vo/taunts/soldier_taunts05.mp3",
	"npc/boner/reviver/vo/taunts/soldier_taunts11.mp3",
	"npc/boner/reviver/vo/taunts/soldier_taunts12.mp3",
	"npc/boner/reviver/vo/taunts/soldier_taunts15.mp3",
	"npc/boner/reviver/vo/taunts/soldier_taunts16.mp3",
	"npc/boner/reviver/vo/taunts/soldier_taunts20.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_tank_01.wav",
	"npc/boner/reviver/vo/taunts/soldier/soldier_tank_08.wav",
	"npc/boner/reviver/vo/taunts/soldier/soldier_tank_warcry_03.wav",
	"npc/boner/reviver/vo/taunts/soldier/soldier_tank_warcry_05.wav",
	"npc/boner/reviver/vo/taunts/soldier/soldier_tank_warcry_06.wav",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_admire_22.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_cong_fun_28.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_dosi_fun_06.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_dosi_fun_29.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_dosi_fun_30.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_flip_end_01.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_flip_end_16.mp3",
	"npc/boner/reviver/pcoptimizer/crisis.mp3",
	}
self.SoundTbl_AllyDeath = {"npc/boner/reviver/vo/soldier_autocappedcontrolpoint02.mp3",
	"npc/boner/reviver/vo/soldier_autocappedintelligence01.mp3",
	"npc/boner/reviver/vo/soldier_autodejectedtie02.mp3",
	"npc/boner/reviver/vo/soldier_autodejectedtie03.mp3",
	"npc/boner/reviver/vo/soldier_autoonfire02.mp3",
	"npc/boner/reviver/vo/soldier_cartgoingbackoffense01.mp3",
	"npc/boner/reviver/vo/soldier_cartgoingbackoffense02.mp3",
	"npc/boner/reviver/vo/soldier_cartgoingforwarddefense01.mp3",
	"npc/boner/reviver/vo/soldier_cartgoingforwarddefense03.mp3",
	"npc/boner/reviver/vo/soldier_cartstaycloseoffense05.mp3",
	"npc/boner/reviver/vo/soldier_cartstopitdefense01.mp3",
	"npc/boner/reviver/vo/soldier_cartstopitdefense02.mp3",
	"npc/boner/reviver/vo/soldier_cartstopitdefense03.mp3",
	"npc/boner/reviver/vo/soldier_cartstoppedoffense03.mp3",
	"npc/boner/reviver/vo/soldier_cloakedspyidentify03.mp3",
	"npc/boner/reviver/vo/soldier_dominationdemoman04.mp3",
	"npc/boner/reviver/vo/soldier_dominationsniper01.mp3",
	"npc/boner/reviver/vo/soldier_dominationsniper07.mp3",
	"npc/boner/reviver/vo/soldier_dominationsoldier02.mp3",
	"npc/boner/reviver/vo/soldier_goodjob01.mp3",
	"npc/boner/reviver/vo/soldier_goodjob02.mp3",
	"npc/boner/reviver/vo/soldier_hatoverhearttaunt03.mp3",
	"npc/boner/reviver/vo/soldier_hatoverhearttaunt06.mp3",
	"npc/boner/reviver/vo/soldier_incoming01.mp3",
	"npc/boner/reviver/vo/soldier_jeers01.mp3",
	"npc/boner/reviver/vo/soldier_jeers02.mp3",
	"npc/boner/reviver/vo/soldier_jeers03.mp3",
	"npc/boner/reviver/vo/soldier_jeers04.mp3",
	"npc/boner/reviver/vo/soldier_jeers06.mp3",
	"npc/boner/reviver/vo/soldier_jeers07.mp3",
	"npc/boner/reviver/vo/soldier_jeers09.mp3",
	"npc/boner/reviver/vo/soldier_jeers10.mp3",
	"npc/boner/reviver/vo/soldier_jeers12.mp3",
	"npc/boner/reviver/vo/soldier_medic01.mp3",
	"npc/boner/reviver/vo/soldier_medic02.mp3",
	"npc/boner/reviver/vo/soldier_medic03.mp3",
	"npc/boner/reviver/vo/soldier_mvm_bomb_destroyed02.mp3",
	"npc/boner/reviver/vo/soldier_mvm_bomb_see01.mp3",
	"npc/boner/reviver/vo/soldier_mvm_bomb_see02.mp3",
	"npc/boner/reviver/vo/soldier_mvm_bomb_upgrade01.mp3",
	"npc/boner/reviver/vo/soldier_mvm_bomb_upgrade03.mp3",
	"npc/boner/reviver/vo/soldier_mvm_class_is_dead01.mp3",
	"npc/boner/reviver/vo/soldier_mvm_class_is_dead02.mp3",
	"npc/boner/reviver/vo/soldier_mvm_class_is_dead03.mp3",
	"npc/boner/reviver/vo/soldier_mvm_class_is_dead04.mp3",
	"npc/boner/reviver/vo/soldier_mvm_class_is_dead05.mp3",
	"npc/boner/reviver/vo/soldier_mvm_class_is_dead06.mp3",
	"npc/boner/reviver/vo/soldier_mvm_class_is_dead07.mp3",
	"npc/boner/reviver/vo/soldier_mvm_class_is_dead08.mp3",
	"npc/boner/reviver/vo/soldier_mvm_class_is_dead09.mp3",
	"npc/boner/reviver/vo/soldier_mvm_encourage_upgrade01.mp3",
	"npc/boner/reviver/vo/soldier_mvm_giant_robot01.mp3",
	"npc/boner/reviver/vo/soldier_mvm_giant_robot03.mp3",
	"npc/boner/reviver/vo/soldier_mvm_giant_robot04.mp3",
	"npc/boner/reviver/vo/soldier_mvm_loot_rare02.mp3",
	"npc/boner/reviver/vo/soldier_mvm_loot_rare03.mp3",
	"npc/boner/reviver/vo/soldier_mvm_mannhattan_gate_take01.mp3",
	"npc/boner/reviver/vo/soldier_mvm_resurrect04.mp3",
	"npc/boner/reviver/vo/soldier_mvm_stand_alone02.mp3",
	"npc/boner/reviver/vo/soldier_mvm_tank_alert02.mp3",
	"npc/boner/reviver/vo/soldier_negativevocalization01.mp3",
	"npc/boner/reviver/vo/soldier_negativevocalization02.mp3",
	"npc/boner/reviver/vo/soldier_negativevocalization03.mp3",
	"npc/boner/reviver/vo/soldier_negativevocalization04.mp3",
	"npc/boner/reviver/vo/soldier_negativevocalization05.mp3",
	"npc/boner/reviver/vo/soldier_negativevocalization06.mp3",
	"npc/boner/reviver/vo/soldier_niceshot01.mp3",
	"npc/boner/reviver/vo/soldier_niceshot02.mp3",
	"npc/boner/reviver/vo/soldier_niceshot03.mp3",
	"npc/boner/reviver/vo/soldier_sf12_badmagic01.mp3",
	"npc/boner/reviver/vo/soldier_sf12_badmagic02.mp3",
	"npc/boner/reviver/vo/soldier_sf12_badmagic03.mp3",
	"npc/boner/reviver/vo/soldier_sf12_badmagic05.mp3",
	"npc/boner/reviver/vo/soldier_sf12_badmagic09.mp3",
	"npc/boner/reviver/vo/soldier_sf12_badmagic11.mp3",
	"npc/boner/reviver/vo/soldier_sf12_badmagic12.mp3",
	"npc/boner/reviver/vo/soldier_sf12_badmagic13.mp3",
	"npc/boner/reviver/vo/soldier_sf13_influx_big01.mp3",
	"npc/boner/reviver/vo/soldier_sf13_influx_big02.mp3",
	"npc/boner/reviver/vo/soldier_sf13_spell_summon_monoculous01.mp3",
	"npc/boner/reviver/vo/soldier_specialcompleted05.mp3",
	"npc/boner/reviver/vo/soldier_thanks01.mp3",
	"npc/boner/reviver/vo/soldier_thanks02.mp3",
	"npc/boner/reviver/vo/soldier_thanksfortheteleporter02.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_gamewon_03.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_gamewon_04.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_gamewon_rare_02.mp3",
	"npc/boner/reviver/vo/taunts/soldier_taunts06.mp3",
	"npc/boner/reviver/vo/taunts/soldier_taunts12.mp3",
	"npc/boner/reviver/vo/taunts/soldier_taunts13.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_admire_10.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_admire_22.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_cong_fun_28.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_dosi_fun_29.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_dosi_fun_30.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_exert_02.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_flip_end_02.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_flip_end_05.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_flip_end_15.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_flip_end_17.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_int_12.mp3",
	}
self.SoundTbl_Pain = {"npc/boner/reviver/vo/soldier_autoonfire01.mp3",
	"npc/boner/reviver/vo/soldier_autoonfire03.mp3",
	"npc/boner/reviver/vo/soldier_cloakedspyidentify03.mp3",
	"npc/boner/reviver/vo/soldier_item_birdhead_on_fire01.mp3",
	"npc/boner/reviver/vo/soldier_item_birdhead_on_fire02.mp3",
	"npc/boner/reviver/vo/soldier_jeers07.mp3",
	"npc/boner/reviver/vo/soldier_jeers08.mp3",
	"npc/boner/reviver/vo/soldier_jeers12.mp3",
	"npc/boner/reviver/vo/soldier_mvm_loot_rare02.mp3",
	"npc/boner/reviver/vo/soldier_mvm_tank_deploy01.mp3",
	"npc/boner/reviver/vo/soldier_no01.mp3",
	"npc/boner/reviver/vo/soldier_no02.mp3",
	"npc/boner/reviver/vo/soldier_no03.mp3",
	"npc/boner/reviver/vo/soldier_painsevere01.mp3",
	"npc/boner/reviver/vo/soldier_painsevere02.mp3",
	"npc/boner/reviver/vo/soldier_painsevere03.mp3",
	"npc/boner/reviver/vo/soldier_painsevere04.mp3",
	"npc/boner/reviver/vo/soldier_painsevere05.mp3",
	"npc/boner/reviver/vo/soldier_painsevere06.mp3",
	"npc/boner/reviver/vo/soldier_painsharp01.mp3",
	"npc/boner/reviver/vo/soldier_painsharp02.mp3",
	"npc/boner/reviver/vo/soldier_painsharp03.mp3",
	"npc/boner/reviver/vo/soldier_painsharp04.mp3",
	"npc/boner/reviver/vo/soldier_painsharp05.mp3",
	"npc/boner/reviver/vo/soldier_painsharp06.mp3",
	"npc/boner/reviver/vo/soldier_painsharp07.mp3",
	"npc/boner/reviver/vo/soldier_painsharp08.mp3",
	"npc/boner/reviver/vo/taunts/soldier_taunts13.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_tank_warcry_01.wav",
	"npc/boner/reviver/vo/taunts/soldier/soldier_tank_warcry_02.wav",
	"npc/boner/reviver/vo/taunts/soldier/soldier_tank_warcry_09.wav",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_bos_pain_01.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_bos_pain_02.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_bos_pain_06.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_exert_02.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_flip_exert_02.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_flip_exert_06.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_flip_exert_21.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_flip_exert_31.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_head_end_01.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_head_end_13.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_head_end_24.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_head_end_29.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_head_exert_02.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_head_pain_02.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_head_pain_13.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_int_12.mp3",
	"npc/boner/reviver/viavoice/ape.mp3",
	"npc/boner/reviver/viavoice/fUCk.mp3",
	"npc/boner/reviver/viavoice/filename.mp3",
	"npc/boner/reviver/viavoice/jesus.mp3",
	"npc/boner/reviver/viavoice/jiAa.mp3",
	"npc/boner/reviver/viavoice/luigi.mp3",
	"npc/boner/reviver/vo/taunts/soldier_taunts08.mp3",
	}
self.SoundTbl_Death = {"npc/boner/reviver/vo/soldier_autocappedcontrolpoint02.mp3",
	"npc/boner/reviver/vo/soldier_autocappedintelligence03.mp3",
	"npc/boner/reviver/vo/soldier_autodejectedtie01.mp3",
	"npc/boner/reviver/vo/soldier_cartgoingbackdefense01.mp3",
	"npc/boner/reviver/vo/soldier_cartgoingbackdefense02.mp3",
	"npc/boner/reviver/vo/soldier_cartstoppedoffense03.mp3",
	"npc/boner/reviver/vo/soldier_directhittaunt01.mp3",
	"npc/boner/reviver/vo/soldier_dominationpyro01.mp3",
	"npc/boner/reviver/vo/soldier_dominationsoldier02.mp3",
	"npc/boner/reviver/vo/soldier_hatoverhearttaunt05.mp3",
	"npc/boner/reviver/vo/soldier_item_birdhead_on_fire01.mp3",
	"npc/boner/reviver/vo/soldier_item_birdhead_on_fire02.mp3",
	"npc/boner/reviver/vo/soldier_item_maggot_on_fire01.mp3",
	"npc/boner/reviver/vo/soldier_item_maggot_on_fire02.mp3",
	"npc/boner/reviver/vo/soldier_jeers05.mp3",
	"npc/boner/reviver/vo/soldier_jeers07.mp3",
	"npc/boner/reviver/vo/soldier_jeers08.mp3",
	"npc/boner/reviver/vo/soldier_jeers10.mp3",
	"npc/boner/reviver/vo/soldier_jeers11.mp3",
	"npc/boner/reviver/vo/soldier_jeers12.mp3",
	"npc/boner/reviver/vo/soldier_mvm_mannhattan_gate_take01.mp3",
	"npc/boner/reviver/vo/soldier_mvm_wave_end02.mp3",
	"npc/boner/reviver/vo/soldier_paincrticialdeath01.mp3",
	"npc/boner/reviver/vo/soldier_paincrticialdeath02.mp3",
	"npc/boner/reviver/vo/soldier_paincrticialdeath03.mp3",
	"npc/boner/reviver/vo/soldier_paincrticialdeath04.mp3",
	"npc/boner/reviver/vo/soldier_painsevere01.mp3",
	"npc/boner/reviver/vo/soldier_painsevere02.mp3",
	"npc/boner/reviver/vo/soldier_painsevere03.mp3",
	"npc/boner/reviver/vo/soldier_painsevere04.mp3",
	"npc/boner/reviver/vo/soldier_painsevere05.mp3",
	"npc/boner/reviver/vo/soldier_painsevere06.mp3",
	"npc/boner/reviver/vo/soldier_sf12_badmagic04.mp3",
	"npc/boner/reviver/vo/soldier_sf12_badmagic14.mp3",
	"npc/boner/reviver/vo/soldier_sf12_falling01.mp3",
	"npc/boner/reviver/vo/soldier_sf12_falling02.mp3",
	"npc/boner/reviver/vo/soldier_sf12_seeking10.mp3",
	"npc/boner/reviver/vo/soldier_sf12_seeking11.mp3",
	"npc/boner/reviver/vo/soldier_sf13_magic_reac03.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_gamewon_07.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_gamewon_rare_08.mp3",
	"npc/boner/reviver/vo/compmode/cm_soldier_gamewon_rare_09.mp3",
	"npc/boner/reviver/vo/taunts/soldier_taunts12.mp3",
	"npc/boner/reviver/vo/taunts/soldier_taunts18.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_tank_06.wav",
	"npc/boner/reviver/vo/taunts/soldier/soldier_tank_warcry_01.wav",
	"npc/boner/reviver/vo/taunts/soldier/soldier_tank_warcry_02.wav",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_admire_04.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_admire_09.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_admire_10.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_admire_16.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_admire_18.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_admire_24.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_admire_26.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_cong_fun_28.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_dosi_fun_05.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_exert_06.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_flip_int_11.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_int_12.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_rps_lose_12.mp3",
	"npc/boner/reviver/vo/taunts/soldier/soldier_taunt_rps_lose_21.mp3",
	"npc/boner/reviver/viavoice/filename.mp3",
	"npc/boner/reviver/viavoice/jesus.mp3",
	"npc/boner/reviver/viavoice/jiAa.mp3",
	"npc/boner/reviver/viavoice/luigi.mp3",
	"npc/boner/reviver/viavoice/tornado.mp3",
	"npc/boner/reviver/gostboster/AAAAAAAAAAAAAAAAAA.mp3",
	}
		
		
	elseif self.SkelllyType == 2 then
		self.SkelllyType = 2
		self.AnimTbl_IdleStand = {ACT_HL2MP_IDLE_ANGRY}
		self.AnimTbl_Walk = {ACT_WALK_CROUCH}
		self.AnimTbl_Run = {ACT_RUN_CROUCH}
		self.AnimTbl_MeleeAttack = {"vjges_zombie_attack_frenzy"}
		self.TimeUntilMeleeAttackDamage = 0.1
		self.MeleeAttackReps = 2
		self.MeleeAttackDamage = math.Rand(5,10)
		self.HasLeapAttack = true
		self:SetSkin(2)
		self.SoundTbl_Investigate = {"npc/boner/frenzy/searching.mp3"}
		self.SoundTbl_LostEnemy = {"npc/boner/frenzy/searching.mp3"}
		self.SoundTbl_Alert = {"npc/boner/frenzy/alert.mp3"}
		self.SoundTbl_CallForHelp = {"npc/boner/frenzy/alert.mp3"}
		self.SoundTbl_CombatIdle = {"npc/boner/frenzy/searching.mp3"}
		self.SoundTbl_BeforeMeleeAttack = {"npc/boner/frenzy/woosh.mp3"}
		self.SoundTbl_MeleeAttack = {"npc/boner/frenzy/punch.mp3"}
		self.SoundTbl_MeleeAttackMiss = {"npc/zombie/claw_miss2.wav"}
		self.SoundTbl_BeforeLeapAttack = {"npc/boner/frenzy/alert.mp3"}
		self.SoundTbl_LeapAttackJump = {"npc/boner/frenzy/woosh.mp3"}
		self.SoundTbl_LeapAttackDamage = {"npc/boner/frenzy/punch.mp3"}
		self.SoundTbl_AllyDeath = {"npc/boner/frenzy/alert.mp3"}
		self.SoundTbl_Pain = {"npc/boner/frenzy/pain.mp3"}
		self.SoundTbl_Death = {"npc/boner/frenzy/death.mp3"}
		
	elseif self.SkelllyType == 1 then
		self.AnimTbl_IdleStand = {ACT_IDLE_ANGRY_MELEE,ACT_HL2MP_IDLE_KNIFE}
		self.TimeUntilMeleeAttackDamage = 0.4
		self.PainSoundChance = 2	
		self:SetSkin(1)
		self.SoundTbl_Pain = {"npc/boner/knight/pain (1).wav",
			"npc/boner/knight/pain (2).wav",
			"npc/boner/knight/pain (3).wav"}
		self.SoundTbl_Death = {"npc/boner/knight/death (1).wav",
			"npc/boner/knight/death (2).wav",
			"npc/boner/knight/death (3).wav"}
			
			self.HasRangeAttack = true
			self.RangeAttackEntityToSpawn = "obj_vj_bbohg_b0nerbomb"
			self.RangeDistance = 750
			self.NextRangeAttackTime = 15
			self.NextRangeAttackTime_DoRand = 35
			self.AnimTbl_RangeAttack = {"ThrowItem"}
			self.TimeUntilRangeAttackProjectileRelease = 1.05
			self.RangeUseAttachmentForPosID = "anim_attachment_LH"

			
		local Weapon = math.random(1,3)
		if Weapon == 1 then
			self.Weapon = ents.Create("prop_physics")
			self.Weapon:SetModel("models/weapons/w_crowbar.mdl")
			self.Weapon:SetLocalPos(self:GetPos())
			//self.Weapon:SetPos(self:GetPos())
			self.Weapon:SetOwner(self)
			self.Weapon:SetParent(self)
			self.Weapon:SetLocalAngles(Angle(-120,45,90))
			self.Weapon:Fire("SetParentAttachmentMaintainOffset","anim_attachment_LH")
			self.Weapon:Fire("SetParentAttachment","anim_attachment_RH")
			self.Weapon:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
			self.Weapon:Spawn()
			self.Weapon:Activate()
			self.Weapon:SetSolid(SOLID_NONE)
			self.Weapon:AddEffects(EF_BONEMERGE)
		
			self.MeleeAttackDamage = math.Rand(10,15)
			self.MeleeAttackDamageType = DMG_SLASH
			self.SoundTbl_MeleeAttack = {"physics/flesh/flesh_impact_bullet1.wav",
				"physics/flesh/flesh_impact_bullet2.wav",
				"physics/flesh/flesh_impact_bullet3.wav",
				"physics/flesh/flesh_impact_bullet4.wav",
				"physics/flesh/flesh_impact_bullet5.wav"}
			self.SoundTbl_MeleeAttackExtra = {}
			self.SoundTbl_MeleeAttackMiss = {"weapons/iceaxe/iceaxe_swing1.wav"}
			self.KnightWeapon = 1
			
		elseif Weapon == 2 then
			self.Weapon = ents.Create("prop_physics")
			self.Weapon:SetModel("models/props_canal/mattpipe.mdl")
			self.Weapon:SetLocalPos(self:GetPos())
			//self.Weapon:SetPos(self:GetPos())
			self.Weapon:SetOwner(self)
			self.Weapon:SetParent(self)
			self.Weapon:SetLocalAngles(Angle(-120,45,90))
			self.Weapon:Fire("SetParentAttachmentMaintainOffset","anim_attachment_LH")
			self.Weapon:Fire("SetParentAttachment","anim_attachment_RH")
			self.Weapon:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
			self.Weapon:Spawn()
			self.Weapon:Activate()
			self.Weapon:SetSolid(SOLID_NONE)
			self.Weapon:AddEffects(EF_BONEMERGE)
			
			self.AnimTbl_MeleeAttack = {"vjseq_seq_baton_swing"}
			self.MeleeAttackDamage = math.Rand(15,20)
			self.TimeUntilMeleeAttackDamage = 0.45
			self.HasExtraMeleeAttackSounds = true
			self.ExtraMeleeAttackSoundLevel = 80
			self.SoundTbl_MeleeAttack = {"physics/metal/metal_canister_impact_hard1.wav",
				"physics/metal/metal_canister_impact_hard2.wav",
				"physics/metal/metal_canister_impact_hard3.wav"}
			self.SoundTbl_MeleeAttackExtra = {"physics/flesh/flesh_impact_hard1.wav",
				"physics/flesh/flesh_impact_hard2.wav",
				"physics/flesh/flesh_impact_hard3.wav",
				"physics/flesh/flesh_impact_hard4.wav",
				"physics/flesh/flesh_impact_hard5.wav",
				"physics/flesh/flesh_impact_hard6.wav"}
			self.SoundTbl_MeleeAttackMiss = {"npc/zombie/claw_miss1.wav",
				"npc/zombie/claw_miss2.wav"}
			self.KnightWeapon = 2
			
		elseif Weapon == 3 then
			self.Weapon = ents.Create("prop_physics")
			self.Weapon:SetModel("models/weapons/w_stunbaton.mdl")
			self.Weapon:SetLocalPos(self:GetPos())
			//self.Weapon:SetPos(self:GetPos())
			self.Weapon:SetOwner(self)
			self.Weapon:SetParent(self)
			self.Weapon:SetLocalAngles(Angle(-120,45,90))
			self.Weapon:Fire("SetParentAttachmentMaintainOffset","anim_attachment_LH")
			self.Weapon:Fire("SetParentAttachment","anim_attachment_RH")
			self.Weapon:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
			self.Weapon:Spawn()
			self.Weapon:Activate()
			self.Weapon:SetSolid(SOLID_NONE)
			self.Weapon:AddEffects(EF_BONEMERGE)

			self.MeleeAttackDamage = math.Rand(10,15)
			self.MeleeAttackDamageType = DMG_SHOCK
			self.HasExtraMeleeAttackSounds = true
			
			self.MeleeAttackSoundLevel = 80
			self.ExtraMeleeAttackSoundLevel = 80
			self.SoundTbl_MeleeAttack = {"weapons/stunstick/stunstick_fleshhit1.wav",
				"weapons/stunstick/stunstick_fleshhit2.wav"}
			self.SoundTbl_MeleeAttackExtra = {"physics/flesh/flesh_impact_hard1.wav",
				"physics/flesh/flesh_impact_hard2.wav",
				"physics/flesh/flesh_impact_hard3.wav",
				"physics/flesh/flesh_impact_hard4.wav",
				"physics/flesh/flesh_impact_hard5.wav",
				"physics/flesh/flesh_impact_hard6.wav"}
			self.SoundTbl_MeleeAttackMiss = {"weapons/stunstick/stunstick_swing1.wav",
				"weapons/stunstick/stunstick_swing2.wav"}
			self.KnightWeapon = 3
			
			
		end
end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetSightDirection()
	return self:GetAttachment(self:LookupAttachment("eyes")).Ang:Forward()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
	if self.CanReviveStuff == false or self.Reviver == false then return end
	for _,v in ipairs(ents.FindInSphere(self:GetPos(),1000)) do
		if self.infect == true && self.MoveToCorpose == false && self.MeleeAttacking == false && self.RangeAttacking == false then
			if IsValid(v) && v:GetClass() == "prop_ragdoll" &&
			v:GetClass() != "prop_physics" &&
			v:GetModel() != "models/combine_strider.mdl" &&
			v:GetModel() != "models/lamarr.mdl" &&
			v:GetModel() != "models/combine_scanner.mdl" &&
			v:GetModel() != "models/manhack.mdl" &&
			v:GetModel() != "models/antlion.mdl" &&
			v:GetModel() != "models/antlion_guard.mdl" &&
			v:GetModel() != "models/headcrabclassic.mdl" &&
			v:GetModel() != "models/headcrab.mdl" &&
			v:GetModel() != "models/headcrabblack.mdl" &&
			v:GetModel() != "models/gibs/fast_zombie_legs.mdl" &&
			v:GetModel() != "models/gibs/fast_zombie_torso.mdl" &&
			v:GetModel() != "models/zombie/classic_legs.mdl" &&
			v:GetModel() != "models/zombie/classic_torso.mdl" &&
			v:GetModel() != "models/humans/charple03.mdl" &&
			v:GetModel() != "models/combine_dropship.mdl" &&
			v:GetModel() != "models/props_vehicles/car001a_phy.mdl" &&
			v:GetModel() != "models/props_vehicles/wagon001a_phy.mdl" &&
			v:GetModel() != "models/shield_scanner.mdl" &&
			v:GetModel() != "models/gunship.mdl" &&
			v:GetModel() != "models/hunter.mdl" &&
			v:GetModel() != "models/Humans/Charple02.mdl"  &&
			v:GetModel() != "models/Humans/Charple01.mdl" &&
			v:GetModel() != "models/Humans/Charple04.mdl" &&
			v:GetModel() != "models/props_c17/furnituremattress001a.mdl" &&
			v:GetModel() != "models/dog.mdl" then
			self.infect2 = true
			self.MoveToCorpose = true
			self:SetTarget(v)
			self:VJ_TASK_GOTO_TARGET("TASK_RUN_PATH")
			timer.Simple(math.random(1.2,2.5),function() if IsValid(self) then
				self.MoveToCorpose = false
			end end)
			end
		end
	end
	if self.infect2 == true && self.MeleeAttacking == false && self.RangeAttacking == false  then 
		for _,v in ipairs(ents.FindInSphere(self:GetPos(),20)) do
			if IsValid(v) &&
			v:GetClass() == "prop_ragdoll" &&
			v:GetClass() != "prop_physics" &&
			v:GetModel() != "models/combine_strider.mdl" &&
			v:GetModel() != "models/lamarr.mdl" &&
			v:GetModel() != "models/combine_scanner.mdl" &&
			v:GetModel() != "models/manhack.mdl" &&
			v:GetModel() != "models/antlion.mdl" &&
			v:GetModel() != "models/antlion_guard.mdl" &&
			v:GetModel() != "models/headcrabclassic.mdl" &&
			v:GetModel() != "models/headcrab.mdl" &&
			v:GetModel() != "models/headcrabblack.mdl" &&
			v:GetModel() != "models/gibs/fast_zombie_legs.mdl" &&
			v:GetModel() != "models/gibs/fast_zombie_torso.mdl" &&
			v:GetModel() != "models/zombie/classic_legs.mdl" &&
			v:GetModel() != "models/zombie/classic_torso.mdl" &&
			v:GetModel() != "models/humans/charple03.mdl" &&
			v:GetModel() != "models/combine_dropship.mdl" &&
			v:GetModel() != "models/props_vehicles/car001a_phy.mdl" &&
			v:GetModel() != "models/props_vehicles/wagon001a_phy.mdl" &&
			v:GetModel() != "models/shield_scanner.mdl" &&
			v:GetModel() != "models/gunship.mdl" &&
			v:GetModel() != "models/hunter.mdl" &&
			v:GetModel() != "models/Humans/Charple02.mdl"  &&
			v:GetModel() != "models/Humans/Charple01.mdl" &&
			v:GetModel() != "models/Humans/Charple04.mdl" &&
			v:GetModel() != "models/props_c17/furnituremattress001a.mdl" &&
			v:GetModel() != "models/dog.mdl" then
			
			self:VJ_ACT_PLAYACTIVITY("cheer2", true, false, false)
			
			ParticleEffectAttach("generic_smoke", PATTACH_POINT_FOLLOW, v, 0)
			for i = 0,v:GetBoneCount() -1 do
				ParticleEffect("vortigaunt_glow_beam_cp0",v:GetBonePosition(i),Angle(0,0,0),nil)
			end
			for i = 0,self:GetBoneCount() -1 do
				ParticleEffect("vortigaunt_glow_beam_cp1",self:GetBonePosition(i),Angle(0,0,0),nil)
			end
				
			timer.Simple(0.01,function() if IsValid(self) && IsValid(v) then
				VJ_EmitSound(self,"npc/vort/health_charge.wav",75,150)
			end end)
	
			timer.Simple(1,function() if IsValid(self) && IsValid(v) then
				for i = 0,self:GetBoneCount() -1 do
					ParticleEffect("vortigaunt_glow_beam_cp1",self:GetBonePosition(i),Angle(0,0,0),nil)
				end
				for i = 0,v:GetBoneCount() -1 do
					ParticleEffect("vortigaunt_glow_beam_cp0",v:GetBonePosition(i),Angle(0,0,0),nil)
				end
			end end)
				
			timer.Simple(2.02,function() if IsValid(self) then
				VJ_EmitSound(self,"npc/boner/revived.mp3",75,100) 	
				for i = 0,self:GetBoneCount() -1 do
					ParticleEffect("vortigaunt_glow_beam_cp1",self:GetBonePosition(i),Angle(0,0,0),nil)
				end
			end end)
			
			timer.Simple(0.2,function() if IsValid(self) && IsValid(v) then
				self:FaceCertainEntity(v)
			end end)
			v:SetPersistent(true) 
			v:SetCollisionGroup(COLLISION_GROUP_DEBRIS)

			self.MovementType = VJ_MOVETYPE_STATIONARY
			self.CanTurnWhileStationary = false
			self.infect = false
			self.DisableChasingEnemy = true
			self.DisableFindEnemy = true
			self.infect2 = false
	
			timer.Simple(2.02,function() if IsValid(self) && IsValid(v) then
			if IsValid(v) && v:GetClass() == "prop_ragdoll" &&
				v:GetClass() != "prop_physics" &&
				v:GetModel() != "models/combine_strider.mdl" &&
				v:GetModel() != "models/lamarr.mdl" &&
				v:GetModel() != "models/combine_scanner.mdl" &&
				v:GetModel() != "models/manhack.mdl" &&
				v:GetModel() != "models/antlion.mdl" &&
				v:GetModel() != "models/antlion_guard.mdl" &&
				v:GetModel() != "models/headcrabclassic.mdl" &&
				v:GetModel() != "models/headcrab.mdl" &&
				v:GetModel() != "models/headcrabblack.mdl" &&
				v:GetModel() != "models/gibs/fast_zombie_legs.mdl" &&
				v:GetModel() != "models/gibs/fast_zombie_torso.mdl" &&
				v:GetModel() != "models/zombie/classic_legs.mdl" &&
				v:GetModel() != "models/zombie/classic_torso.mdl" &&
				v:GetModel() != "models/humans/charple03.mdl" &&
				v:GetModel() != "models/combine_dropship.mdl" &&
				v:GetModel() != "models/props_vehicles/car001a_phy.mdl" &&
				v:GetModel() != "models/props_vehicles/wagon001a_phy.mdl" &&
				v:GetModel() != "models/shield_scanner.mdl" &&
				v:GetModel() != "models/gunship.mdl" &&
				v:GetModel() != "models/hunter.mdl" &&
				v:GetModel() != "models/Humans/Charple02.mdl" &&
				v:GetModel() != "models/Humans/Charple01.mdl" &&
				v:GetModel() != "models/Humans/Charple04.mdl" &&
				v:GetModel() != "models/props_c17/furnituremattress001a.mdl" &&
				v:GetModel() != "models/dog.mdl" then
				v:Remove()

				self.sworm13 = ents.Create("npc_vj_bbohg_boner")
				self.sworm13:SetPos(v:GetPos() + self:GetUp()*10)
				self.sworm13:SetAngles(self:GetAngles())
				self.sworm13:Spawn()
				self.sworm13:VJ_ACT_PLAYACTIVITY("zombie_slump_rise_01", true, false, false)
				self.sworm13:Activate()
				-- self.sworm13:SetOwner(self)
				
				for i = 0,self.sworm13:GetBoneCount() -1 do
					ParticleEffect("vortigaunt_glow_beam_cp1",self.sworm13:GetBonePosition(i),Angle(0,0,0),nil)
				end
			end
	end end)

			timer.Simple(4.6999999019504,function() if IsValid(self) then 
				self.infect = true
				self.DisableChasingEnemy = false
				self.DisableFindEnemy = false
			end end)
				timer.Simple(3,function() if IsValid(self) then 
					self.MovementType = VJ_MOVETYPE_GROUND
				end end)
			end
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMedic_BeforeHeal()
	-- VJ_EmitSound(self,"npc/vort/health_charge.wav",75,150)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleMeleeAttacks()
	if self.SkelllyType == 1 or self.SkelllyType == 2 then return end
	local randattack_stand = math.random(1,8)

	if randattack_stand == 1 then
		self.AnimTbl_MeleeAttack = {"swing"}
		self.TimeUntilMeleeAttackDamage = 0.4
		self.MeleeAttackDamage = math.Rand(5,10)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 2 then
		self.AnimTbl_MeleeAttack = {"swing"}
		self.TimeUntilMeleeAttackDamage = 0.4
		self.MeleeAttackDamage = math.Rand(5,10)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 3 then
		self.AnimTbl_MeleeAttack = {"swing"}
		self.TimeUntilMeleeAttackDamage = 0.4
		self.MeleeAttackDamage = math.Rand(5,10)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 4 then
		self.AnimTbl_MeleeAttack = {"swing"}
		self.TimeUntilMeleeAttackDamage = 0.4
		self.MeleeAttackDamage = math.Rand(5,10)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 5 then
		self.AnimTbl_MeleeAttack = {"throw1"}
		self.TimeUntilMeleeAttackDamage = 0.95
		self.MeleeAttackDamage = math.Rand(10,15)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 6 then
		self.AnimTbl_MeleeAttack = {"ThrowItem"}
		self.TimeUntilMeleeAttackDamage = 1
		self.MeleeAttackDamage = math.Rand(5,10)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = true
		self.MeleeAttackKnockBack_Forward1 = 55
		self.MeleeAttackKnockBack_Forward2 = 60
		self.MeleeAttackKnockBack_Up1 = 100
		self.MeleeAttackKnockBack_Up2 = 100
		
	elseif randattack_stand == 7 then
		self.AnimTbl_MeleeAttack = {"MeleeAttack01"}
		self.TimeUntilMeleeAttackDamage = 0.5
		self.MeleeAttackDamage = math.Rand(5,10)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = true
		self.MeleeAttackKnockBack_Forward1 = 55
		self.MeleeAttackKnockBack_Forward2 = 60
		self.MeleeAttackKnockBack_Up1 = 35
		self.MeleeAttackKnockBack_Up2 = 45

	elseif randattack_stand == 8 then
		self.AnimTbl_MeleeAttack = {"MeleeAttack01"}
		self.TimeUntilMeleeAttackDamage = 0.5
		self.MeleeAttackDamage = math.Rand(5,10)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = true
		self.MeleeAttackKnockBack_Forward1 = 55
		self.MeleeAttackKnockBack_Forward2 = 60
		self.MeleeAttackKnockBack_Up1 = 35
		self.MeleeAttackKnockBack_Up2 = 45
		
	end
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRangeAttack_BeforeStartTimer(seed)
	if self.SkelllyType == 0 || self.SkelllyType == 1 || self.SkelllyType == 2 then return end
	VJ_EmitSound(self,{"ambient/fire/mtov_flame2.wav"},100,math.random(100,90))
	ParticleEffectAttach("fire_small_02",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_LH"))
	ParticleEffectAttach("fire_small_02",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_RH"))
	timer.Simple(2,function() if IsValid(self) then
		ParticleEffectAttach("fire_small_01",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("chest"))
	VJ_EmitSound(self,{"ambient/fire/ignite.wav"},100,math.random(100,90))
	end end)
	timer.Simple(3,function() if IsValid(self) then
		self:StopParticles()
	end end)
	-- fire_medium_02
end
-------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackCode_GetShootPos(projectile)
	if self.SkelllyType == 3 then
	return self:CalculateProjectile("Line", self:GetAttachment(self:LookupAttachment(self.RangeUseAttachmentForPosID)).Pos, self:GetEnemy():GetPos() + self:GetEnemy():OBBCenter(), 1000)
	end
	if self.SkelllyType == 1 then
	return self:CalculateProjectile("Curve", self:GetAttachment(self:LookupAttachment(self.RangeUseAttachmentForPosID)).Pos, self:GetEnemy():GetPos() + self:GetEnemy():OBBCenter(), 1500)
	end
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMedic_OnHeal(ent)
	if IsValid(ent) then
		ent:PlaySoundSystem("GeneralSpeech", "npc/boner/drowning.mp3")
		return true
	end
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialKilled(dmginfo, hitgroup)
    self:AddFlags(FL_NOTARGET)
	self.CanReviveStuff = false
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo,hitgroup,GetCorpse)
	if self.KnightWeapon == 1 then
		self:CreateGibEntity("prop_physics","models/weapons/w_crowbar.mdl")
	elseif self.KnightWeapon == 2 then
		self:CreateGibEntity("prop_physics","models/props_canal/mattpipe.mdl")
	elseif self.KnightWeapon == 3 then
		self:CreateGibEntity("prop_physics","models/weapons/w_stunbaton.mdl")
	end
end
-------------------------------------------------------------------------------------------------------------------
function ENT:SetUpGibesOnDeath(dmginfo, hitgroup)
	self.HasDeathSounds = false
	self:CreateGibEntity("prop_physics","models/Gibs/HGIBS.mdl")
	self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl")
	self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl")
	self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl")
	self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl")
	self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl")
	self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_scapula.mdl")
	self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_spine.mdl")
	if self.KnightWeapon == 1 then
		self:CreateGibEntity("prop_physics","models/weapons/w_crowbar.mdl")
	elseif self.KnightWeapon == 2 then
		self:CreateGibEntity("prop_physics","models/props_canal/mattpipe.mdl")
	elseif self.KnightWeapon == 3 then
		self:CreateGibEntity("prop_physics","models/weapons/w_stunbaton.mdl")
	end
	return true
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomGibOnDeathSounds(dmginfo, hitgroup)
	if self.SkelllyType == 2 or self.SkelllyType == 1 then
		VJ_EmitSound(self, "npc/boner/frenzy/death.mp3", 90, 100)
	else
		VJ_EmitSound(self, "npc/boner/death.mp3", 90, 100)
	end
	return false
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/