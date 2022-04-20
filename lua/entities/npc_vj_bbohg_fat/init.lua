AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/zombie/fat_Classic.mdl"} 
ENT.StartHealth = 200
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
-- ENT.AnimTbl_Flinch = {"cower"}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.MeleeAttackDamage = math.Rand(1,1)
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.AnimTbl_MeleeAttack = {"swing"}
ENT.MeleeAttackDistance = 35
ENT.MeleeAttackDamageDistance = 50
ENT.MeleeAttackAngleRadius = 70
ENT.MeleeAttackDamageAngleRadius = 70
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.FootStepTimeRun = 0.75
ENT.FootStepTimeWalk = 0.75

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 95

ENT.IdleDialogueDistance = 175

ENT.HasCrab = false
ENT.ExtraCrispy = false
ENT.WhatDoCrab = 0
-- 0 = Nothing
-- 1 = Crab Ragdoll
-- 2 = Live Crab
ENT.CanSpontaniouslyBisect = false
ENT.MyAss = true
ENT.MoveTheCrabBack = false
---------------------------------------------------------------------------------------------------------------------------------------------
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"npc/zombie/foot1.wav","npc/zombie/foot2.wav","npc/zombie/foot3.wav"}
ENT.SoundTbl_Idle = {"tripwire/killing floor/bloat/voiceidle/idle1.wav",
	"tripwire/killing floor/bloat/voiceidle/idle2.wav",
	"tripwire/killing floor/bloat/voiceidle/idle3.wav",
	"tripwire/killing floor/bloat/voiceidle/idle4.wav",
	"tripwire/killing floor/bloat/voiceidle/idle5.wav",
	"tripwire/killing floor/bloat/voiceidle/idle6.wav",
	"tripwire/killing floor/bloat/voiceidle/idle7.wav",
	"tripwire/killing floor/bloat/voiceidle/idle8.wav",
	"tripwire/killing floor/bloat/voiceidle/idle9.wav",
	"tripwire/killing floor/bloat/voiceidle/idle10.wav",
	"tripwire/killing floor/bloat/voiceidle/idle11.wav",
	"tripwire/killing floor/bloat/voiceidle/idle12.wav",
	"tripwire/killing floor/bloat/voiceidle/idle13.wav",
	"tripwire/killing floor/bloat/voiceidle/idle14.wav",
	"tripwire/killing floor/bloat/voiceidle/idle15.wav",
	"tripwire/killing floor/bloat/voiceidle/idle16.wav",
	"tripwire/killing floor/bloat/voiceidle/idle17.wav",
	"tripwire/killing floor/bloat/voiceidle/idle18.wav",
	"tripwire/killing floor/bloat/voiceidle/idle19.wav"}
ENT.SoundTbl_CombatIdle = {"tripwire/killing floor/bloat/voicechase/chase1.wav",
	"tripwire/killing floor/bloat/voicechase/chase2.wav",
	"tripwire/killing floor/bloat/voicechase/chase3.wav",
	"tripwire/killing floor/bloat/voicechase/chase4.wav",
	"tripwire/killing floor/bloat/voicechase/chase5.wav",
	"tripwire/killing floor/bloat/voicechase/chase6.wav",
	"tripwire/killing floor/bloat/voicechase/chase7.wav",
	"tripwire/killing floor/bloat/voicechase/chase8.wav",
	"tripwire/killing floor/bloat/voicechase/chase9.wav"}
ENT.SoundTbl_Alert = {"tripwire/killing floor/bloat/voicechase/chase1.wav",
	"tripwire/killing floor/bloat/voicechase/chase2.wav",
	"tripwire/killing floor/bloat/voicechase/chase3.wav",
	"tripwire/killing floor/bloat/voicechase/chase4.wav",
	"tripwire/killing floor/bloat/voicechase/chase5.wav",
	"tripwire/killing floor/bloat/voicechase/chase6.wav",
	"tripwire/killing floor/bloat/voicechase/chase7.wav",
	"tripwire/killing floor/bloat/voicechase/chase8.wav",
	"tripwire/killing floor/bloat/voicechase/chase9.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"tripwire/killing floor/bloat/voicemelee/attack1.wav",
	"tripwire/killing floor/bloat/voicemelee/attack2.wav",
	"tripwire/killing floor/bloat/voicemelee/attack3.wav",
	"tripwire/killing floor/bloat/voicemelee/attack4.wav",
	"tripwire/killing floor/bloat/voiceranged/attack5.wav",
	"tripwire/killing floor/bloat/voiceranged/attack6.wav",
	"tripwire/killing floor/bloat/voiceranged/attack7.wav",
	"tripwire/killing floor/bloat/voiceranged/attack8.wav",
	"tripwire/killing floor/bloat/voiceranged/attack9.wav"}
ENT.SoundTbl_MeleeAttack = {{"npc/zombie/claw_strike1.wav",
	"npc/zombie/claw_strike2.wav",
	"npc/zombie/claw_strike3.wav"}}
ENT.SoundTbl_MeleeAttackMiss = {"npc/zombie/claw_miss1.wav",
	"npc/zombie/claw_miss2.wav"}
ENT.SoundTbl_OnKilledEnemy = {}
ENT.SoundTbl_AllyDeath = {}
ENT.SoundTbl_Pain = {"tripwire/killing floor/bloat/voicepain/pain1.wav",
	"tripwire/killing floor/bloat/voicepain/pain2.wav",
	"tripwire/killing floor/bloat/voicepain/pain3.wav",
	"tripwire/killing floor/bloat/voicepain/pain4.wav",
	"tripwire/killing floor/bloat/voicepain/pain5.wav",
	"tripwire/killing floor/bloat/voicepain/pain6.wav",
	"tripwire/killing floor/bloat/voiceranged/attack2.wav"}
ENT.SoundTbl_Death = {"tripwire/killing floor/bloat/voicedeath/death1.wav",
	"tripwire/killing floor/bloat/voicedeath/death2.wav",
	"tripwire/killing floor/bloat/voicedeath/death3.wav",
	"tripwire/killing floor/bloat/voicedeath/death4.wav",
	"tripwire/killing floor/bloat/voiceranged/attack1.wav",
	"tripwire/killing floor/bloat/voiceranged/attack3.wav",
	"tripwire/killing floor/bloat/voiceranged/attack4.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()
	if math.random(13,3) == 1 then
		self.HasCrab = true
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
	if math.random(12,4) == 1 then
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
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetSightDirection()
	return self:GetAttachment(self:LookupAttachment("eyes")).Ang:Forward()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleMeleeAttacks()
	local randattack_stand = math.random(1,6)
	local randattack_moving = math.random(1,3)

	if self:IsMoving() && randattack_moving == 1 then
		self.AnimTbl_MeleeAttack = {"vjges_swatleftlow"}
		self.MeleeAttackDamage = math.Rand(15,20)
		self.NextAnyAttackTime_Melee = 0.8
		self.TimeUntilMeleeAttackDamage = 0.6
		self.MeleeAttackReps = 1
		self.MeleeAttackExtraTimers = nil
		self.MeleeAttackAnimationFaceEnemy = false
		-- self.MeleeAttackDistance = 35
		-- self.MeleeAttackDamageDistance = 50
		
	elseif self:IsMoving() && randattack_moving == 2 then
		self.AnimTbl_MeleeAttack = {"vjges_swatrightlow"}
		self.MeleeAttackDamage = math.Rand(15,20)
		self.NextAnyAttackTime_Melee = 0.8
		self.TimeUntilMeleeAttackDamage = 0.6
		self.MeleeAttackReps = 1
		self.MeleeAttackExtraTimers = nil
		self.MeleeAttackAnimationFaceEnemy = false
		-- self.MeleeAttackDistance = 35
		-- self.MeleeAttackDamageDistance = 50
	
	elseif self:IsMoving() && randattack_moving == 3 then
		self.AnimTbl_MeleeAttack = {"vjges_breakthrough"}
		self.MeleeAttackDamage = math.Rand(15,20)
		self.NextAnyAttackTime_Melee = 1.75
		self.TimeUntilMeleeAttackDamage = 0.4
		self.MeleeAttackReps = 1
		self.MeleeAttackExtraTimers = {1.2}
		self.MeleeAttackAnimationFaceEnemy = false
		-- self.MeleeAttackDistance = 35
		-- self.MeleeAttackDamageDistance = 50
	elseif randattack_stand == 1 then
		self.AnimTbl_MeleeAttack = {"vjseq_attackB"}
		self.MeleeAttackDamage = math.Rand(15,20)
		self.NextAnyAttackTime_Melee = 0.92
		self.TimeUntilMeleeAttackDamage = 0.91
		self.MeleeAttackReps = 1
		self.MeleeAttackExtraTimers = nil
		self.MeleeAttackAnimationFaceEnemy = true
		-- self.MeleeAttackDistance = 35
		-- self.MeleeAttackDamageDistance = 50

	elseif randattack_stand == 2 then
		self.AnimTbl_MeleeAttack = {"vjseq_attackD"}
		self.MeleeAttackDamage = math.Rand(15,20)
		self.NextAnyAttackTime_Melee = 0.92
		self.TimeUntilMeleeAttackDamage = 0.91
		self.MeleeAttackReps = 1
		self.MeleeAttackExtraTimers = nil
		self.MeleeAttackAnimationFaceEnemy = true
		-- self.MeleeAttackDistance = 35
		-- self.MeleeAttackDamageDistance = 50

	elseif randattack_stand == 3 then
		self.AnimTbl_MeleeAttack = {"vjseq_attackE"}
		self.MeleeAttackDamage = math.Rand(20,25)
		self.NextAnyAttackTime_Melee = 0.81
		self.TimeUntilMeleeAttackDamage = 0.8
		self.MeleeAttackReps = 1
		self.MeleeAttackExtraTimers = nil
		self.MeleeAttackAnimationFaceEnemy = true
		-- self.MeleeAttackDistance = 35
		-- self.MeleeAttackDamageDistance = 50
		
    elseif randattack_stand == 4 then
		self.AnimTbl_MeleeAttack = {"vjseq_attackF"}
		self.MeleeAttackDamage = math.Rand(20,25)
		self.NextAnyAttackTime_Melee = 0.81
		self.TimeUntilMeleeAttackDamage = 0.8
		self.MeleeAttackReps = 1
		self.MeleeAttackExtraTimers = nil
		self.MeleeAttackAnimationFaceEnemy = true
		-- self.MeleeAttackDistance = 35
		-- self.MeleeAttackDamageDistance = 50
	
	elseif randattack_stand == 5 then
		self.AnimTbl_MeleeAttack = {"vjseq_swatrightmid"}
		self.MeleeAttackDamage = math.Rand(15,20)
		self.NextAnyAttackTime_Melee = 0.5
		self.TimeUntilMeleeAttackDamage = 0.49
		self.MeleeAttackReps = 1
		self.MeleeAttackExtraTimers = nil
		self.MeleeAttackAnimationFaceEnemy = true
		-- self.MeleeAttackDistance = 35
		-- self.MeleeAttackDamageDistance = 50
	
	elseif randattack_stand == 6 then
		self.AnimTbl_MeleeAttack = {"vjseq_swatleftmid"}
		self.MeleeAttackDamage = math.Rand(15,20)
		self.NextAnyAttackTime_Melee = 0.41
		self.TimeUntilMeleeAttackDamage = 0.4
		self.MeleeAttackReps = 1
		self.MeleeAttackExtraTimers = nil
		self.MeleeAttackAnimationFaceEnemy = true
		-- self.MeleeAttackDistance = 35
		-- self.MeleeAttackDamageDistance = 50
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
function ENT:RangeAttackCode_GetShootPos(projectile)
	return self:CalculateProjectile("Curve", self:GetAttachment(self:LookupAttachment(self.RangeUseAttachmentForPosID)).Pos, self:GetEnemy():GetPos() + self:GetEnemy():OBBCenter(), 500)
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