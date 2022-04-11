AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/bbohg/classic_new.mdl"} 
ENT.StartHealth = 50
ENT.VJC_Data = {
	CameraMode = 1, 
	ThirdP_Offset = Vector(45, 15, -50), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "ValveBiped.Bip01_Head1", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.BloodColor = "Red"
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = {"cower"}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.MeleeAttackDamage = math.Rand(1,1)
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.AnimTbl_MeleeAttack = {"swing"}
ENT.MeleeAttackDistance = 40
ENT.MeleeAttackDamageDistance = 60
ENT.MeleeAttackAngleRadius = 70
ENT.MeleeAttackDamageAngleRadius = 70
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.FootStepTimeRun = 0.25
ENT.FootStepTimeWalk = 0.5

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 95

ENT.IdleDialogueDistance = 175

ENT.HasCrab = false
ENT.ZombType = 0
-- 0 = Refugee / Civvie
-- 1 = Rebel
-- 2 = Medic
-- 3 = Civil Protection
ENT.ZombWeapon = 0
-- 0 = Unarmed
-- 1 = Crowbar
-- 2 = Pipe
-- 3 = Stunstick
ENT.ExtraCrispy = false
ENT.WhatDoCrab = 0
-- 0 = Nothing
-- 1 = Crab Ragdoll
-- 2 = Live Crab
ENT.CanSpontaniouslyBisect = false
ENT.CivvieSkin = 0
-- 0 = Refugee
-- 1 = Civvie
ENT.RebelSkinn = 0
-- 0 = Green
-- 1 = Blue
ENT.MedicSkinn = 0
-- 0 = White
-- 1 = Blue
ENT.MyAss = false
ENT.MoveTheCrabBack = false
---------------------------------------------------------------------------------------------------------------------------------------------
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"npc/zombie/foot1.wav","npc/zombie/foot2.wav","npc/zombie/foot3.wav"}
ENT.SoundTbl_Idle = {"npc/zombie/zombie_voice_idle1.wav",
	"npc/zombie/zombie_voice_idle2.wav",
	"npc/zombie/zombie_voice_idle3.wav",
	"npc/zombie/zombie_voice_idle4.wav",
	"npc/zombie/zombie_voice_idle5.wav",
	"npc/zombie/zombie_voice_idle6.wav",
	"npc/zombie/zombie_voice_idle7.wav",
	"npc/zombie/zombie_voice_idle8.wav",
	"npc/zombie/zombie_voice_idle9.wav",
	"npc/zombie/zombie_voice_idle10.wav",
	"npc/zombie/zombie_voice_idle11.wav",
	"npc/zombie/zombie_voice_idle12.wav",
	"npc/zombie/zombie_voice_idle13.wav",
	"npc/zombie/zombie_voice_idle14.wav"}
ENT.SoundTbl_CombatIdle = {"npc/zombie/zombie_voice_idle1.wav",
	"npc/zombie/zombie_voice_idle2.wav",
	"npc/zombie/zombie_voice_idle3.wav",
	"npc/zombie/zombie_voice_idle4.wav",
	"npc/zombie/zombie_voice_idle5.wav",
	"npc/zombie/zombie_voice_idle6.wav",
	"npc/zombie/zombie_voice_idle7.wav",
	"npc/zombie/zombie_voice_idle8.wav",
	"npc/zombie/zombie_voice_idle9.wav",
	"npc/zombie/zombie_voice_idle10.wav",
	"npc/zombie/zombie_voice_idle11.wav",
	"npc/zombie/zombie_voice_idle12.wav",
	"npc/zombie/zombie_voice_idle13.wav",
	"npc/zombie/zombie_voice_idle14.wav"}
ENT.SoundTbl_Alert = {"npc/zombie/zombie_alert1.wav",
	"npc/zombie/zombie_alert2.wav",
	"npc/zombie/zombie_alert3.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"npc/zombie/zo_attack1.wav",
	"npc/zombie/zo_attack2.wav"}
ENT.SoundTbl_MeleeAttack = {"physics/body/body_medium_impact_hard1.wav",
	"physics/body/body_medium_impact_hard2.wav",
	"physics/body/body_medium_impact_hard3.wav",
	"physics/body/body_medium_impact_hard4.wav",
	"physics/body/body_medium_impact_hard5.wav",
	"physics/body/body_medium_impact_hard6.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"npc/zombie/claw_miss1.wav",
	"npc/zombie/claw_miss2.wav"}
ENT.SoundTbl_BeforeRangeAttack = {}
ENT.SoundTbl_OnKilledEnemy = {}
ENT.SoundTbl_AllyDeath = {}
ENT.SoundTbl_Pain = {"npc/zombie/zombie_pain1.wav",
	"npc/zombie/zombie_pain2.wav",
	"npc/zombie/zombie_pain3.wav",
	"npc/zombie/zombie_pain4.wav",
	"npc/zombie/zombie_pain5.wav",
	"npc/zombie/zombie_pain6.wav"}
ENT.SoundTbl_Death = {"npc/zombie/zombie_die1.wav",
	"npc/zombie/zombie_die2.wav",
	"npc/zombie/zombie_die3.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()
	if math.random(1,3) == 1 then
		self.HasCrab = true
	end
	local SpawnZombType = math.random(1,30)
	if SpawnZombType == 1 || SpawnZombType == 2 || SpawnZombType == 3 || SpawnZombType == 4 || SpawnZombType == 5 || SpawnZombType == 6 || SpawnZombType == 7 || SpawnZombType == 8 || SpawnZombType == 9 || SpawnZombType == 10 then
		self.ZombType = 1
		self.StartHealth = 75
	elseif SpawnZombType == 11 || SpawnZombType == 12 || SpawnZombType == 13 || SpawnZombType == 14 || SpawnZombType == 15 then
		self.ZombType = 2
		self.StartHealth = 75
	elseif SpawnZombType == 16 || SpawnZombType == 17 || SpawnZombType == 18 || SpawnZombType == 19 || SpawnZombType == 20 then
		self.ZombType = 3
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
	if math.random(1,4) == 1 then
		self.AnimTbl_Run = {ACT_RUN_CROUCH}
	end
	if math.random(1,2) == 1 then
		self:SetSkin(1)
		self.CivvieSkin = 1
	end
	if math.random(1,4) == 1 then
		self.CanSpontaniouslyBisect = true
	end
	if self.HasCrab == true then
		self:SetBodygroup(1,1)
		self.SoundTbl_Idle = {"npc/zombknees/xom/idle.mp3",
			"npc/zombknees/xom/idle2.mp3"}
		self.SoundTbl_Investigate = {"npc/zombknees/xom/inves.mp3"}
		self.SoundTbl_LostEnemy = {"npc/zombknees/xom/lost1.mp3",
			"npc/zombknees/xom/lost2.mp3"}
		self.SoundTbl_Alert = {"npc/zombknees/xom/alert1.mp3",
			"npc/zombknees/xom/alert2.mp3",
			"npc/zombknees/xom/alert3.mp3",
			"npc/zombknees/xom/alert4.mp3"}
		self.SoundTbl_BeforeMeleeAttack = {"npc/zombknees/xom/melee1.mp3",
			"npc/zombknees/xom/melee2.mp3"}
		self.SoundTbl_OnKilledEnemy = {"npc/zombknees/xom/kill.mp3",
			"npc/zombknees/xom/kill2.mp3"}
		self.SoundTbl_Pain = {"npc/zombknees/xom/pain1.mp3",
			"npc/zombknees/xom/pain2.mp3",
			"npc/zombknees/xom/pain3.mp3",
			"npc/zombknees/xom/pain4.mp3"}
		self.SoundTbl_Death = {"npc/zombknees/xom/death1.mp3",
			"npc/zombknees/xom/death2.mp3",
			"npc/zombknees/xom/death3.mp3"}
	end
	if self.ZombType == 1 then
		local RebelSkin = math.random(1,2)
		if RebelSkin == 1 then
			self:SetSkin(2)
			self.RebelSkinn = 0
		else
			self:SetSkin(3)
			self.RebelSkinn = 1
		end
		if math.random(1,3) == 1 then
		local RebelWeapon = math.random(1,3)
			if RebelWeapon == 1 then
				self.ZombWeapon = 2
			elseif RebelWeapon == 2 then
				self.ZombWeapon = 1
			end
		end
		if GetConVarNumber("vj_npc_itemdrops") == 1 then
			self.HasItemDropsOnDeath = true
			self.ItemDropsOnDeathChance = 3
			self.ItemDropsOnDeath_EntityList = {"item_ammo_357",
				"item_ammo_ar2",
				"item_ammo_ar2_altfire",
				"item_ammo_crossbow",
				"item_ammo_pistol",
				"item_box_buckshot",
				"item_ammo_smg1",
				"item_ammo_smg1_grenade",
				"item_battery",
				"weapon_frag"}
			if GetConVarNumber("vj_BBOHG_AmmoDrops") == 10 then
				self.ItemDropsOnDeath_EntityList = {"ent_rage_pickup_ammo_pistol",
					"ent_rage_pickup_ammo_pistol",
					"ent_rage_pickup_ammo_pistol",
					"ent_rage_pickup_ammo_pistol",
					"ent_rage_pickup_ammo_pistol",
					"ent_rage_pickup_ammo_pistol",
					"ent_rage_pickup_ammo_pistol",
					"ent_rage_pickup_ammo_pistol",
					"ent_rage_pickup_ammo_pistol",
					"ent_rage_pickup_ammo_pistol",
					"ent_rage_pickup_ammo_fatboy",
					"ent_rage_pickup_ammo_fatboy",
					"ent_rage_pickup_ammo_fatboy",
					"ent_rage_pickup_ammo_fatboy",
					"ent_rage_pickup_ammo_fatboy",
					"ent_rage_pickup_ammo_killburst",
					"ent_rage_pickup_ammo_killburst",
					"ent_rage_pickup_ammo_killburst",
					"ent_rage_pickup_ammo_killburst",
					"ent_rage_pickup_ammo_killburst",
					"ent_rage_pickup_ammo_fatmomma",
					"ent_rage_pickup_ammo_fatmomma",
					"ent_rage_pickup_ammo_rifle",
					"ent_rage_pickup_ammo_rifle",
					"ent_rage_pickup_ammo_rifle",
					"ent_rage_pickup_ammo_rifle",
					"ent_rage_pickup_ammo_rifle",
					"ent_rage_pickup_ammo_rifle",
					"ent_rage_pickup_ammo_rifle",
					"ent_rage_pickup_ammo_rifle",
					"ent_rage_pickup_ammo_feltritear",
					"ent_rage_pickup_ammo_feltritear",
					"ent_rage_pickup_ammo_feltritear",
					"ent_rage_pickup_ammo_feltritear",
					"ent_rage_pickup_ammo_mg",
					"ent_rage_pickup_ammo_mg",
					"ent_rage_pickup_ammo_mg",
					"ent_rage_pickup_ammo_mg",
					"ent_rage_pickup_ammo_mg",
					"ent_rage_pickup_ammo_mg",
					"ent_rage_pickup_ammo_mg",
					"ent_rage_pickup_ammo_feltritemg",
					"ent_rage_pickup_ammo_feltritemg",
					"ent_rage_pickup_ammo_feltritemg",
					"ent_rage_pickup_ammo_nails",
					"ent_rage_pickup_ammo_nails",
					"ent_rage_pickup_ammo_nails",
					"ent_rage_pickup_ammo_nails",
					"ent_rage_pickup_ammo_nails",
					"ent_rage_pickup_ammo_nails",
					"ent_rage_pickup_ammo_nails",
					"ent_rage_pickup_ammo_nails",
					"ent_rage_pickup_ammo_rebar",
					"ent_rage_pickup_ammo_rebar",
					"ent_rage_pickup_ammo_rebar",
					"ent_rage_pickup_ammo_rail",
					"ent_rage_pickup_ammo_shells",
					"ent_rage_pickup_ammo_shells",
					"ent_rage_pickup_ammo_shells",
					"ent_rage_pickup_ammo_shells",
					"ent_rage_pickup_ammo_shells",
					"ent_rage_pickup_ammo_shells",
					"ent_rage_pickup_ammo_shells",
					"ent_rage_pickup_ammo_pulse",
					"ent_rage_pickup_ammo_pulse",
					"ent_rage_pickup_ammo_pulse",
					"ent_rage_pickup_ammo_pulse",
					"ent_rage_pickup_ammo_popper",
					"ent_rage_pickup_ammo_sniper",
					"ent_rage_pickup_ammo_arrow",
					"ent_rage_pickup_ammo_arrow",
					"ent_rage_pickup_ammo_arrow",
					"ent_rage_pickup_ammo_arrow",
					"ent_rage_pickup_ammo_electric",
					"ent_rage_pickup_ammo_electric",
					"ent_rage_pickup_ammo_tnt",
					"ent_rage_pickup_ammo_rockets",
					"ent_rage_pickup_ammo_cannon",
					"ent_rage_pickup_ammo_bfg",
					"ent_rage_pickup_ammo_wingstick",
					"ent_rage_pickup_ammo_wingstick",
					"ent_rage_pickup_ammo_wingstick",
					"ent_rage_pickup_ammo_wingstick",
					"ent_rage_pickup_ammo_wingstick"}
					-- shorten all this into "tiers" or something
			end
		end
	elseif self.ZombType == 2 then
		local MedicSkin = math.random(1,2)
		if MedicSkin == 1 then
			self:SetSkin(4)
			self.MedicSkinn = 0
		else
			self:SetSkin(5)
			self.MedicSkinn = 1
		end
		if math.random(1,3) == 1 then
		local MedicWeapon = math.random(1,3)
			if MedicWeapon == 1 then
				self.ZombWeapon = 2
			elseif MedicWeapon == 2 then
				self.ZombWeapon = 1
			end
		end
		if GetConVarNumber("vj_npc_itemdrops") == 1 then
			self.HasItemDropsOnDeath = true
			self.ItemDropsOnDeathChance = 3
			self.ItemDropsOnDeath_EntityList = {"item_healthkit",
				"item_healthvial",
				"item_healthvial",
				"item_battery",}
		end
	elseif self.ZombType == 3 then
		self:SetSkin(6)
		self.ZombWeapon = 3
		if GetConVarNumber("vj_npc_itemdrops") == 1 then
			self.HasItemDropsOnDeath = true
			self.ItemDropsOnDeathChance = 3
			self.ItemDropsOnDeath_EntityList = {"item_healthvial",
				"item_battery",
				"item_ammo_pistol"}
		end
	end
	if self.ZombWeapon == 1 then
		self.AnimTbl_MeleeAttack = {"swing"}
		self.TimeUntilMeleeAttackDamage = 0.4
		
		self.Weapon = ents.Create("prop_physics")
		self.Weapon:SetModel("models/weapons/w_crowbar.mdl")
		self.Weapon:SetLocalPos(self:GetPos())
		//self.Weapon:SetPos(self:GetPos())
		self.Weapon:SetOwner(self)
		self.Weapon:SetParent(self)
		self.Weapon:SetLocalAngles(Angle(-120,45,90))
		self.Weapon:Fire("SetParentAttachmentMaintainOffset","Blood_Left")
		self.Weapon:Fire("SetParentAttachment","Blood_Right")
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
		
	elseif self.ZombWeapon == 2 then
	
	
		self.AnimTbl_MeleeAttack = {"swing"}
		self.TimeUntilMeleeAttackDamage = 0.4
		
		self.Weapon = ents.Create("prop_physics")
		self.Weapon:SetModel("models/props_canal/mattpipe.mdl")
		self.Weapon:SetLocalPos(self:GetPos())
		//self.Weapon:SetPos(self:GetPos())
		self.Weapon:SetOwner(self)
		self.Weapon:SetParent(self)
		self.Weapon:SetLocalAngles(Angle(-120,45,90))
		self.Weapon:Fire("SetParentAttachmentMaintainOffset","Blood_Left")
		self.Weapon:Fire("SetParentAttachment","Blood_Right")
		self.Weapon:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
		self.Weapon:Spawn()
		self.Weapon:Activate()
		self.Weapon:SetSolid(SOLID_NONE)
		if GetConVarNumber("vj_BBOHG_BonemergePipe") == 1 then
			self.Weapon:AddEffects(EF_BONEMERGE)
		end
		-- disabled because it causes zomb to have no shadows
		-- no idea why this happens
		-- removing "AddEffects(EF_BONEMERGE) fixes it
		
		self.MeleeAttackDamage = math.Rand(15,20)
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
			
	elseif self.ZombWeapon == 3 then
		
		self.AnimTbl_MeleeAttack = {"swing"}
		self.TimeUntilMeleeAttackDamage = 0.4
		
		self.Weapon = ents.Create("prop_physics")
		self.Weapon:SetModel("models/weapons/w_stunbaton.mdl")
		self.Weapon:SetLocalPos(self:GetPos())
		//self.Weapon:SetPos(self:GetPos())
		self.Weapon:SetOwner(self)
		self.Weapon:SetParent(self)
		self.Weapon:SetLocalAngles(Angle(-120,45,90))
		self.Weapon:Fire("SetParentAttachmentMaintainOffset","Blood_Left")
		self.Weapon:Fire("SetParentAttachment","Blood_Right")
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
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetSightDirection()
	return self:GetAttachment(self:LookupAttachment("eyes")).Ang:Forward()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleMeleeAttacks()
	if self.ZombWeapon != 0 then return end
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
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	-- if dmginfo:IsDamageType(DMG_BURN) or dmginfo:IsDamageType(DMG_SLOWBURN) or dmginfo:IsDamageType(DMG_ENERGYBEAM) or dmginfo:IsDamageType(DMG_DISSOLVE) or dmginfo:IsDamageType (DMG_PLASMA) or dmginfo:IsDamageType(DMG_SHOCK) then return end
	if self.CanSpontaniouslyBisect == true && hitgroup == HITGROUP_CHEST && math.random(1,30) == 1 && self:Health() <= (self:GetMaxHealth() / 1) or dmginfo:IsDamageType(DMG_BLAST) && math.random(1,10) == 1 then
		self.MyAss = true
		self.CanSpontaniouslyBisect = false
		local WhatWeSpawning = math.random(2,2)
		if WhatWeSpawning == 1 then
			self.HasDeathRagdoll = true
			self.DeathCorpseModel = {"models/zombie_new/classic_new_legs.mdl"}
			if self.ZombType == 0 then
				self.DeathCorpseSkin = 0
			elseif self.ZombType == 1 then
				self.DeathCorpseSkin = 1
			elseif self.ZombType == 2 then
				self.DeathCorpseSkin = 2
			elseif self.ZombType == 3 then
				self.DeathCorpseSkin = 3
			end
			self.HasDeathSounds = false
			VJ_EmitSound(self,{"physics/body/body_medium_break2.wav",
				"physics/body/body_medium_break3.wav",
				"physics/body/body_medium_break4.wav"},80,math.random(100,95))
			self.Zombie1 = ents.Create("npc_vj_bbohg_zombie_torso")
			self.Zombie1:SetPos(self:GetPos())
			self.Zombie1:SetAngles(self:GetAngles())
			self.Zombie1:Spawn()
			if self.HasCrab == false then
				self.Zombie1.HasCrab = false
				self.Zombie1:SetBodygroup(1,0)
				self.Zombie1.SoundTbl_Idle = {"npc/zombie/zombie_voice_idle1.wav",
					"npc/zombie/zombie_voice_idle2.wav",
					"npc/zombie/zombie_voice_idle3.wav",
					"npc/zombie/zombie_voice_idle4.wav",
					"npc/zombie/zombie_voice_idle5.wav",
					"npc/zombie/zombie_voice_idle6.wav",
					"npc/zombie/zombie_voice_idle7.wav",
					"npc/zombie/zombie_voice_idle8.wav",
					"npc/zombie/zombie_voice_idle9.wav",
					"npc/zombie/zombie_voice_idle10.wav",
					"npc/zombie/zombie_voice_idle11.wav",
					"npc/zombie/zombie_voice_idle12.wav",
					"npc/zombie/zombie_voice_idle13.wav",
					"npc/zombie/zombie_voice_idle14.wav"}
				self.Zombie1.SoundTbl_CombatIdle = {"npc/zombie/zombie_voice_idle1.wav",
					"npc/zombie/zombie_voice_idle2.wav",
					"npc/zombie/zombie_voice_idle3.wav",
					"npc/zombie/zombie_voice_idle4.wav",
					"npc/zombie/zombie_voice_idle5.wav",
					"npc/zombie/zombie_voice_idle6.wav",
					"npc/zombie/zombie_voice_idle7.wav",
					"npc/zombie/zombie_voice_idle8.wav",
					"npc/zombie/zombie_voice_idle9.wav",
					"npc/zombie/zombie_voice_idle10.wav",
					"npc/zombie/zombie_voice_idle11.wav",
					"npc/zombie/zombie_voice_idle12.wav",
					"npc/zombie/zombie_voice_idle13.wav",
					"npc/zombie/zombie_voice_idle14.wav"}
				self.Zombie1.SoundTbl_Investigate = {}
				self.Zombie1.SoundTbl_LostEnemy = {}
				self.Zombie1.SoundTbl_Alert = {"npc/zombie/zombie_alert1.wav",
					"npc/zombie/zombie_alert2.wav",
					"npc/zombie/zombie_alert3.wav"}
				self.Zombie1.SoundTbl_BeforeMeleeAttack = {"npc/zombie/zo_attack1.wav",
					"npc/zombie/zo_attack2.wav"}
				self.Zombie1.SoundTbl_OnKilledEnemy = {}
				self.Zombie1.SoundTbl_Pain = {"npc/zombie/zombie_pain1.wav",
					"npc/zombie/zombie_pain2.wav",
					"npc/zombie/zombie_pain3.wav",
					"npc/zombie/zombie_pain4.wav",
					"npc/zombie/zombie_pain5.wav",
					"npc/zombie/zombie_pain6.wav"}
				self.Zombie1.SoundTbl_Death = {"npc/zombie/zombie_die1.wav",
					"npc/zombie/zombie_die2.wav",
					"npc/zombie/zombie_die3.wav"}
			elseif self.HasCrab == true then
				self.Zombie1.HasCrab = true
				self.Zombie1:SetBodygroup(1,1)
				self.Zombie1.SoundTbl_Idle = {"npc/zombknees/xom/idle.mp3",
					"npc/zombknees/xom/idle2.mp3"}
				self.Zombie1.SoundTbl_Investigate = {"npc/zombknees/xom/inves.mp3"}
				self.Zombie1.SoundTbl_LostEnemy = {"npc/zombknees/xom/lost1.mp3",
					"npc/zombknees/xom/lost2.mp3"}
				self.Zombie1.SoundTbl_Alert = {"npc/zombknees/xom/alert1.mp3",
					"npc/zombknees/xom/alert2.mp3",
					"npc/zombknees/xom/alert3.mp3",
					"npc/zombknees/xom/alert4.mp3"}
				self.Zombie1.SoundTbl_BeforeMeleeAttack = {"npc/zombknees/xom/melee1.mp3",
					"npc/zombknees/xom/melee2.mp3"}
				self.Zombie1.SoundTbl_OnKilledEnemy = {"npc/zombknees/xom/kill.mp3",
					"npc/zombknees/xom/kill2.mp3"}
				self.Zombie1.SoundTbl_Pain = {"npc/zombknees/xom/pain1.mp3",
					"npc/zombknees/xom/pain2.mp3",
					"npc/zombknees/xom/pain3.mp3",
					"npc/zombknees/xom/pain4.mp3"}
				self.Zombie1.SoundTbl_Death = {"npc/zombknees/xom/death1.mp3",
					"npc/zombknees/xom/death2.mp3",
					"npc/zombknees/xom/death3.mp3"}
			end
			if self.ZombType == 0 then
				self.Zombie1.ZombType = 0
				if self.CivvieSkin == 1 then
					self.Zombie1:SetSkin(1)
				else
					self.Zombie1:SetSkin(0)
				end
			elseif self.ZombType == 1 then
				self.Zombie1.ZombType = 1
				if self.RebelSkinn == 1 then
					self.Zombie1:SetSkin(3)
				else
					self.Zombie1:SetSkin(2)
				end
			elseif self.ZombType == 2 then
				self.Zombie1.ZombType = 2
				if self.MedicSkinn == 1 then
					self.Zombie1:SetSkin(5)
				else
					self.Zombie1:SetSkin(4)
				end
			elseif self.ZombType == 3 then
				self.Zombie1.ZombType = 3
				self.Zombie1:SetSkin(6)
			end
			self.Zombie1:VJ_ACT_PLAYACTIVITY("vjseq_fall",true,0.8,true,0,{SequenceDuration=0.8})
			-- self.Zombie1:SetOwner(self)
			local d = DamageInfo()
			d:SetDamage(self:GetMaxHealth())
			d:SetAttacker(self)
			d:SetDamageType(DMG_GENERIC) 
			self:TakeDamageInfo(d)
		elseif WhatWeSpawning == 2 then
			self.MoveTheCrabBack = true
			self.MyAss = false
			self.HasDeathRagdoll = true
			self.DeathCorpseModel = {"models/zombie_new/classic_new_torso.mdl"}
			if self.ZombType == 0 then
				if self.CivvieSkin == 1 then
					self.DeathCorpseSkin = 1
				else
					self.DeathCorpseSkin = 0
				end
			elseif self.ZombType == 1 then
				if self.RebelSkinn == 1 then
					self.DeathCorpseSkin = 3
				else
					self.DeathCorpseSkin = 2
				end
			elseif self.ZombType == 2 then
				if self.MedicSkinn == 1 then
					self.DeathCorpseSkin = 5
				else
					self.DeathCorpseSkin = 4
				end
			elseif self.ZombType == 3 then
				self.DeathCorpseSkin = 6
			end
			-- self.HasDeathSounds = false
			VJ_EmitSound(self,{"physics/body/body_medium_break2.wav",
				"physics/body/body_medium_break3.wav",
				"physics/body/body_medium_break4.wav"},80,math.random(100,95))
			self.Zombie1 = ents.Create("npc_vj_bbohg_zombie_legs")
			self.Zombie1:SetPos(self:GetPos())
			self.Zombie1:SetAngles(self:GetAngles())
			self.Zombie1:Spawn()
			if self.ZombType == 0 then
				self.Zombie1.ZombType = 0
				self.Zombie1:SetSkin(0)
				self.Zombie1.TheModel:SetSkin(0)
				self.Zombie1.DeathCorpseSkin = 0
			elseif self.ZombType == 1 then
				self.Zombie1.ZombType = 1
				self.Zombie1:SetSkin(1)
				self.Zombie1.TheModel:SetSkin(1)
				self.Zombie1.DeathCorpseSkin = 1
			elseif self.ZombType == 2 then
				self.Zombie1.ZombType = 2
				self.Zombie1:SetSkin(2)
				self.Zombie1.TheModel:SetSkin(2)
				self.Zombie1.DeathCorpseSkin = 2
			elseif self.ZombType == 3 then
				self.Zombie1.ZombType = 3
				self.Zombie1:SetSkin(3)
				self.Zombie1.TheModel:SetSkin(3)
				self.Zombie1.DeathCorpseSkin = 3
			end
			if IsValid(Zombie1) && IsValid(crab) then
				self.Zombie1.EntitiesToNoCollide = {"npc_vj_bbohg_crab"}
				self.crab.EntitiesToNoCollide = {"npc_vj_bbohg_zombie_legs"}
			end
			-- self.Zombie1:VJ_ACT_PLAYACTIVITY("vjseq_fall",true,0.8,true,0,{SequenceDuration=0.8})
			-- self.Zombie1:SetOwner(self)
			local d = DamageInfo()
			d:SetDamage(self:GetMaxHealth())
			d:SetAttacker(self)
			d:SetDamageType(DMG_GENERIC) 
			self:TakeDamageInfo(d)
		elseif WhatWeSpawning == 3 then
			self.HasDeathRagdoll = false
			self.HasDeathSounds = false
			VJ_EmitSound(self,{"physics/body/body_medium_break2.wav",
				"physics/body/body_medium_break3.wav",
				"physics/body/body_medium_break4.wav"},80,math.random(100,95))
			self.Zombie1 = ents.Create("npc_vj_bbohg_zombie_torso")
			self.Zombie1:SetPos(self:GetPos() +self:GetForward()*15)
			self.Zombie1:SetAngles(self:GetAngles())
			self.Zombie1:Spawn()
			if self.HasCrab == false then
				self.Zombie1.HasCrab = false
				self.Zombie1:SetBodygroup(1,0)
				self.Zombie1.SoundTbl_Idle = {"npc/zombie/zombie_voice_idle1.wav",
					"npc/zombie/zombie_voice_idle2.wav",
					"npc/zombie/zombie_voice_idle3.wav",
					"npc/zombie/zombie_voice_idle4.wav",
					"npc/zombie/zombie_voice_idle5.wav",
					"npc/zombie/zombie_voice_idle6.wav",
					"npc/zombie/zombie_voice_idle7.wav",
					"npc/zombie/zombie_voice_idle8.wav",
					"npc/zombie/zombie_voice_idle9.wav",
					"npc/zombie/zombie_voice_idle10.wav",
					"npc/zombie/zombie_voice_idle11.wav",
					"npc/zombie/zombie_voice_idle12.wav",
					"npc/zombie/zombie_voice_idle13.wav",
					"npc/zombie/zombie_voice_idle14.wav"}
				self.Zombie1.SoundTbl_CombatIdle = {"npc/zombie/zombie_voice_idle1.wav",
					"npc/zombie/zombie_voice_idle2.wav",
					"npc/zombie/zombie_voice_idle3.wav",
					"npc/zombie/zombie_voice_idle4.wav",
					"npc/zombie/zombie_voice_idle5.wav",
					"npc/zombie/zombie_voice_idle6.wav",
					"npc/zombie/zombie_voice_idle7.wav",
					"npc/zombie/zombie_voice_idle8.wav",
					"npc/zombie/zombie_voice_idle9.wav",
					"npc/zombie/zombie_voice_idle10.wav",
					"npc/zombie/zombie_voice_idle11.wav",
					"npc/zombie/zombie_voice_idle12.wav",
					"npc/zombie/zombie_voice_idle13.wav",
					"npc/zombie/zombie_voice_idle14.wav"}
				self.Zombie1.SoundTbl_Investigate = {}
				self.Zombie1.SoundTbl_LostEnemy = {}
				self.Zombie1.SoundTbl_Alert = {"npc/zombie/zombie_alert1.wav",
					"npc/zombie/zombie_alert2.wav",
					"npc/zombie/zombie_alert3.wav"}
				self.Zombie1.SoundTbl_BeforeMeleeAttack = {"npc/zombie/zo_attack1.wav",
					"npc/zombie/zo_attack2.wav"}
				self.Zombie1.SoundTbl_OnKilledEnemy = {}
				self.Zombie1.SoundTbl_Pain = {"npc/zombie/zombie_pain1.wav",
					"npc/zombie/zombie_pain2.wav",
					"npc/zombie/zombie_pain3.wav",
					"npc/zombie/zombie_pain4.wav",
					"npc/zombie/zombie_pain5.wav",
					"npc/zombie/zombie_pain6.wav"}
				self.Zombie1.SoundTbl_Death = {"npc/zombie/zombie_die1.wav",
					"npc/zombie/zombie_die2.wav",
					"npc/zombie/zombie_die3.wav"}
			elseif self.HasCrab == true then
				self.Zombie1.HasCrab = true
				self.Zombie1:SetBodygroup(1,1)
				self.Zombie1.SoundTbl_Idle = {"npc/zombknees/xom/idle.mp3",
					"npc/zombknees/xom/idle2.mp3"}
				self.Zombie1.SoundTbl_Investigate = {"npc/zombknees/xom/inves.mp3"}
				self.Zombie1.SoundTbl_LostEnemy = {"npc/zombknees/xom/lost1.mp3",
					"npc/zombknees/xom/lost2.mp3"}
				self.Zombie1.SoundTbl_Alert = {"npc/zombknees/xom/alert1.mp3",
					"npc/zombknees/xom/alert2.mp3",
					"npc/zombknees/xom/alert3.mp3",
					"npc/zombknees/xom/alert4.mp3"}
				self.Zombie1.SoundTbl_BeforeMeleeAttack = {"npc/zombknees/xom/melee1.mp3",
					"npc/zombknees/xom/melee2.mp3"}
				self.Zombie1.SoundTbl_OnKilledEnemy = {"npc/zombknees/xom/kill.mp3",
					"npc/zombknees/xom/kill2.mp3"}
				self.Zombie1.SoundTbl_Pain = {"npc/zombknees/xom/pain1.mp3",
					"npc/zombknees/xom/pain2.mp3",
					"npc/zombknees/xom/pain3.mp3",
					"npc/zombknees/xom/pain4.mp3"}
				self.Zombie1.SoundTbl_Death = {"npc/zombknees/xom/death1.mp3",
					"npc/zombknees/xom/death2.mp3",
					"npc/zombknees/xom/death3.mp3"}
			end
			if self.ZombType == 0 then
				self.Zombie1.ZombType = 0
				if self.CivvieSkin == 1 then
					self.Zombie1:SetSkin(1)
				else
					self.Zombie1:SetSkin(0)
				end
			elseif self.ZombType == 1 then
				self.Zombie1.ZombType = 1
				if self.RebelSkinn == 1 then
					self.Zombie1:SetSkin(3)
				else
					self.Zombie1:SetSkin(2)
				end
			elseif self.ZombType == 2 then
				self.Zombie1.ZombType = 2
				if self.MedicSkinn == 1 then
					self.Zombie1:SetSkin(5)
				else
					self.Zombie1:SetSkin(4)
				end
			elseif self.ZombType == 3 then
				self.Zombie1.ZombType = 3
				self.Zombie1:SetSkin(6)
			end
			self.Zombie1:VJ_ACT_PLAYACTIVITY("vjseq_fall",true,0.8,true,0,{SequenceDuration=0.8})
			-- self.Zombie1:SetOwner(self)
			local d = DamageInfo()
			d:SetDamage(self:GetMaxHealth())
			d:SetAttacker(self)
			d:SetDamageType(DMG_GENERIC) 
			self:TakeDamageInfo(d)
			
			self.Zombie2 = ents.Create("npc_vj_bbohg_zombie_legs")
			self.Zombie2:SetPos(self:GetPos() +self:GetForward()*-15)
			self.Zombie2:SetAngles(self:GetAngles())
			self.Zombie2:Spawn()
			if self.ZombType == 0 then
				self.Zombie2.ZombType = 0
				self.Zombie2:SetSkin(0)
				self.Zombie2.TheModel:SetSkin(0)
				self.Zombie2.DeathCorpseSkin = 0
			elseif self.ZombType == 1 then
				self.Zombie2.ZombType = 1
				self.Zombie2:SetSkin(1)
				self.Zombie2.TheModel:SetSkin(1)
				self.Zombie2.DeathCorpseSkin = 1
			elseif self.ZombType == 2 then
				self.Zombie2.ZombType = 2
				self.Zombie2:SetSkin(2)
				self.Zombie2.TheModel:SetSkin(2)
				self.Zombie2.DeathCorpseSkin = 2
			elseif self.ZombType == 3 then
				self.Zombie2.ZombType = 3
				self.Zombie2:SetSkin(3)
				self.Zombie2.TheModel:SetSkin(3)
				self.Zombie2.DeathCorpseSkin = 3
			end
			if IsValid(Zombie2) && IsValid(crab) then
				self.Zombie2.EntitiesToNoCollide = {"npc_vj_bbohg_crab"}
				self.crab.EntitiesToNoCollide = {"npc_vj_bbohg_zombie_legs"}
			end
			-- self.Zombie1:VJ_ACT_PLAYACTIVITY("vjseq_fall",true,0.8,true,0,{SequenceDuration=0.8})
			-- self.Zombie1:SetOwner(self)
			local d = DamageInfo()
			d:SetDamage(self:GetMaxHealth())
			d:SetAttacker(self)
			d:SetDamageType(DMG_GENERIC) 
			self:TakeDamageInfo(d)
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo, hitgroup)
	if self.MyAss == true then return end
	if dmginfo:IsDamageType(DMG_BURN) or dmginfo:IsDamageType(DMG_SLOWBURN) then
	self.ExtraCrispy = true
	end
	local DeathCrabThing = math.random(1,3)
	if DeathCrabThing == 2 then
		self.WhatDoCrab = 1
	elseif DeathCrabThing == 3 then
		self.WhatDoCrab = 2
		self.SoundTbl_Death = {"npc/zombie/zombie_die1.wav",
			"npc/zombie/zombie_die2.wav",
			"npc/zombie/zombie_die3.wav"}
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialKilled(dmginfo, hitgroup)
    self:AddFlags(FL_NOTARGET)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo,hitgroup)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_BeforeCorpseSpawned(dmginfo, hitgroup)

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo,hitgroup,GetCorpse)
	if self.HasCrab == true then
		if self.WhatDoCrab == 1 && self.ExtraCrispy == false then
			GetCorpse:SetBodygroup(1,0)
			self:CreateGibEntity("prop_ragdoll","models/headcrabclassic.mdl",{Pos=self:GetAttachment(self:LookupAttachment("headcrab")).Pos or self:EyePos()})
		elseif self.WhatDoCrab == 2 then
			GetCorpse:SetBodygroup(1,0)
			self.crab = ents.Create("npc_vj_bbohg_crab")
			if self.MoveTheCrabBack == false then
				self.crab:SetPos(self:GetAttachment(self:LookupAttachment("headcrab")).Pos or self:EyePos())
			else
				self.crab:SetPos(self:GetPos() +self:GetForward()*-30 +self:GetUp()*60)
			end
			self.crab:SetAngles(self:GetAngles())
			self.crab:Spawn()
			self.crab:SetGroundEntity(NULL)
			self.crab:Activate()
			if self.ExtraCrispy == true then
				self.crab:Ignite(10)
			end
		end
	end
	if self.ZombWeapon == 1 then
		self:CreateGibEntity("prop_physics","models/weapons/w_crowbar.mdl")
	elseif self.ZombWeapon == 2 then
		self:CreateGibEntity("prop_physics","models/props_canal/mattpipe.mdl")
	elseif self.ZombWeapon == 3 then
		self:CreateGibEntity("prop_physics","models/weapons/w_stunbaton.mdl")
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetUpGibesOnDeath(dmginfo, hitgroup)
	self.HasDeathSounds = false
	if self.HasGibDeathParticles == true then
		local effectBlood = EffectData()
		effectBlood:SetOrigin(self:GetPos() + self:OBBCenter())
		effectBlood:SetColor(VJ_Color2Byte(Color(130,19,10)))
		effectBlood:SetScale(120)
		util.Effect("VJ_Blood1",effectBlood)
		
		local bloodspray = EffectData()
		bloodspray:SetOrigin(self:GetPos())
		bloodspray:SetScale(8)
		bloodspray:SetFlags(3)
		bloodspray:SetColor(0)
		util.Effect("bloodspray",bloodspray)
		util.Effect("bloodspray",bloodspray)
	end
	
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/mgib_01.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/mgib_02.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/mgib_03.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/mgib_04.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,50))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_rib.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_rib.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_scapula.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_spine.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/lung_gib.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/liver_gib.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,45))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/eye_gib.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,45))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/eye_gib.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,60))})
	
	if self.HasCrab == true then
		if self.HasGibDeathParticles == true then
			local effectBlood = EffectData()
			effectBlood:SetOrigin(self:GetPos() + self:OBBCenter() +self:GetUp()*30)
			effectBlood:SetColor(VJ_Color2Byte(Color(230,164,20)))
			effectBlood:SetScale(35)
			util.Effect("VJ_Blood1",effectBlood)
		
			local bloodspray = EffectData()
			bloodspray:SetOrigin(self:GetPos())
			bloodspray:SetScale(8)
			bloodspray:SetFlags(3)
			bloodspray:SetColor(0)
			util.Effect("bloodspray",bloodspray)
			util.Effect("bloodspray",bloodspray)
		end
	
		self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/sgib_01.mdl",{BloodDecal="VJ_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,65))})
		self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/sgib_01.mdl",{BloodDecal="VJ_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,65))})
		self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/sgib_01.mdl",{BloodDecal="VJ_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,65))})
		self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/sgib_01.mdl",{BloodDecal="VJ_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,65))})
		self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/sgib_02.mdl",{BloodDecal="VJ_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,65))})
		self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/sgib_02.mdl",{BloodDecal="VJ_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,65))})
	end
	
	if self.ZombWeapon == 1 then
		self:CreateGibEntity("prop_physics","models/weapons/w_crowbar.mdl")
	elseif self.ZombWeapon == 2 then
		self:CreateGibEntity("prop_physics","models/props_canal/mattpipe.mdl")
	elseif self.ZombWeapon == 3 then
		self:CreateGibEntity("prop_physics","models/weapons/w_stunbaton.mdl")
	end
	
	return true
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomGibOnDeathSounds(dmginfo, hitgroup)
	VJ_EmitSound(self, "vj_gib/default_gib_splat.wav", 100, 100)
	return false
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/