AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/Humans/Group01/male_08.mdl"}
-- ENT.VJ_IsHugeMonster = true
ENT.StartHealth = 500
ENT.VJC_Data = {
	CameraMode = 1, 
	ThirdP_Offset = Vector(45, 15, -50), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "ValveBiped.Bip01_Head1", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_ROCK"}
ENT.FriendsWithAllPlayerAllies = false
ENT.BecomeEnemyToPlayer = true
ENT.BecomeEnemyToPlayerLevel = 3
ENT.HasOnPlayerSight = true
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.IsMedicSNPC = true
ENT.AnimTbl_Medic_GiveHealth = {"heal"}
ENT.Medic_TimeUntilHeal = 1.20
ENT.Medic_HealthAmount = 25
ENT.Medic_SpawnPropOnHealModel = "models/props_junk/cinderblock01a.mdl"
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.BloodColor = "Oil"
-- ENT.HasWorldShakeOnMove = true
-- ENT.WorldShakeOnMoveAmplitude = 1
---------------------------------------------------------------------------------------------------------------------------------------------
-- ENT.HasDeathAnimation = true
-- ENT.DeathAnimationTime = 0.6
-- ENT.DeathAnimationChance = 1
-- ENT.AnimTbl_Death = {"preSkewer"} 
-- ENT.HasDeathRagdoll = false
-- ENT.AllowedToGib = false
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.CanFlinch = 0
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
ENT.HasRangeAttack = true
ENT.RangeAttackEntityToSpawn = "obj_vj_bbohg_cinderblock"
ENT.AnimTbl_RangeAttack = {"throw1"}
ENT.RangeToMeleeDistance = 200
ENT.TimeUntilRangeAttackProjectileRelease = 0.9
ENT.NextRangeAttackTime = 5
ENT.NextRangeAttackTime_DoRand = 15
ENT.RangeUseAttachmentForPos = true
ENT.RangeUseAttachmentForPosID = "anim_attachment_RH"
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasLeapAttack = true
ENT.LeapAttackDamage = math.random(20,25)
ENT.LeapAttackDamageType = DMG_CLUB
ENT.AnimTbl_LeapAttack = {"headcrabbed"} -- Melee Attack Animations
ENT.LeapAttackAnimationDecreaseLengthAmount = 8.5
ENT.LeapDistance = 350 -- The distance of the leap, for example if it is set to 500, when the SNPC is 500 Unit away, it will jump
ENT.LeapToMeleeDistance = 1 -- How close does it have to be until it uses melee?
ENT.LeapAttackDamageDistance = 40 -- How far does the damage go?
ENT.TimeUntilLeapAttackDamage = 0.1 -- How much time until it runs the leap damage code?
ENT.TimeUntilLeapAttackVelocity = 0.1 -- How much time until it runs the velocity code?
ENT.NextLeapAttackTime = 5 -- How much time until it can use a leap attack?
ENT.LeapAttackExtraTimers = {0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1, 1.1, 1.2, 1.3, 1.4} -- Extra leap attack timers | it will run the damage code after the given amount of seconds
ENT.StopLeapAttackAfterFirstHit = true -- Should it stop the leap attack from running rest of timers when it hits an enemy?
ENT.LeapAttackVelocityForward = 450 -- How much forward force should it apply?
ENT.LeapAttackVelocityUp = 200 -- How much upward force should it apply?
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.FootStepTimeRun = 0.25
ENT.FootStepTimeWalk = 0.5

ENT.IdleSoundChance = 15
ENT.CombatIdleSoundChance = 15

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 95

ENT.IdleDialogueDistance = 175

ENT.LNR_HealerHeal = true
ENT.LNR_HealerNextT = CurTime()
ENT.LNR_Heal = true
---------------------------------------------------------------------------------------------------------------------------------------------
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"physics/concrete/rock_impact_soft1.wav",
	"physics/concrete/rock_impact_soft2.wav",
	"physics/concrete/rock_impact_soft3.wav"}
ENT.SoundTbl_Idle = {}
ENT.SoundTbl_IdleDialogue = {}
ENT.SoundTbl_IdleDialogueAnswer = {}
ENT.SoundTbl_CombatIdle = {}
ENT.SoundTbl_OnReceiveOrder = {}
ENT.SoundTbl_FollowPlayer = {}
ENT.SoundTbl_UnFollowPlayer = {}
ENT.SoundTbl_MoveOutOfPlayersWay = {}
ENT.SoundTbl_MedicBeforeHeal = {}
ENT.SoundTbl_MedicAfterHeal = {"physics/concrete/rock_impact_soft1.wav",
	"physics/concrete/rock_impact_soft2.wav",
	"physics/concrete/rock_impact_soft3.wav"}
ENT.SoundTbl_OnPlayerSight = {}
ENT.SoundTbl_Investigate = {}
ENT.SoundTbl_LostEnemy = {}
ENT.SoundTbl_Alert = {}
ENT.SoundTbl_CallForHelp = {}
ENT.SoundTbl_BecomeEnemyToPlayer = {}
ENT.SoundTbl_MeleeAttack = {"physics/concrete/boulder_impact_hard1.wav",
	"physics/concrete/boulder_impact_hard2.wav",
	"physics/concrete/boulder_impact_hard3.wav",
	"physics/concrete/boulder_impact_hard4.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"npc/zombie/claw_miss2.wav","npc/zombie/claw_miss1.wav"}
ENT.SoundTbl_BeforeRangeAttack = {}
ENT.SoundTbl_RangeAttack = {"npc/zombie/claw_miss2.wav","npc/zombie/claw_miss1.wav"}
ENT.SoundTbl_LeapAttackJump = {"npc/therock/slide.mp3"}
ENT.SoundTbl_LeapAttackDamage = {"physics/concrete/boulder_impact_hard1.wav",
	"physics/concrete/boulder_impact_hard2.wav",
	"physics/concrete/boulder_impact_hard3.wav",
	"physics/concrete/boulder_impact_hard4.wav"}
ENT.SoundTbl_OnKilledEnemy = {}
ENT.SoundTbl_AllyDeath = {}
ENT.SoundTbl_Pain = {}
ENT.SoundTbl_DamageByPlayer = {}
ENT.SoundTbl_Death = {"physics/concrete/boulder_impact_hard1.wav",
	"physics/concrete/boulder_impact_hard2.wav",
	"physics/concrete/boulder_impact_hard3.wav",
	"physics/concrete/boulder_impact_hard4.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	if GetConVarNumber("vj_BBOHG_NoGodsNoMasters") == 1 then
		self.VJ_NPC_Class = {"CLASS_BBOHG"}
		self.FriendsWithAllPlayerAllies = false
	end
	-- if math.random(1,4) == 1 then
		-- self.AnimTbl_Run = {ACT_RUN_CROUCH}
	-- end
	local SpawnMaterial = math.random(1,4)
	if SpawnMaterial == 1 then
		self:SetMaterial("models/props_debris/concretedebris_chunk01")
	elseif SpawnMaterial == 2 then
		self:SetMaterial("models/props_debris/concretefloor013a")
	elseif SpawnMaterial == 3 then
		self:SetMaterial("models/props_wasteland/rockcliff04a")
	elseif SpawnMaterial == 4 then
		self:SetMaterial("models/props_wasteland/rockcliff02a")
	end
	-- self:SetMaterial("models/props_c17/column02a")
	-- self:SetModelScale(1.20)
	self:SetCollisionBounds(Vector(13, 13, 70), Vector(-13, -13, 0))
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetSightDirection()
	return self:GetAttachment(self:LookupAttachment("eyes")).Ang:Forward()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAlert(argent)
    if math.random(1,5) == 1 then
        self:PlaySoundSystem("Alert", {"npc/therock/spawned.mp3"}) 	
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleMeleeAttacks()
	local randattack_stand = math.random(1,8)

	if randattack_stand == 1 then
		self.AnimTbl_MeleeAttack = {"swing"}
		self.TimeUntilMeleeAttackDamage = 0.4
		self.MeleeAttackDamage = math.Rand(20,25)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 2 then
		self.AnimTbl_MeleeAttack = {"swing"}
		self.TimeUntilMeleeAttackDamage = 0.4
		self.MeleeAttackDamage = math.Rand(20,25)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 3 then
		self.AnimTbl_MeleeAttack = {"swing"}
		self.TimeUntilMeleeAttackDamage = 0.4
		self.MeleeAttackDamage = math.Rand(20,25)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 4 then
		self.AnimTbl_MeleeAttack = {"swing"}
		self.TimeUntilMeleeAttackDamage = 0.4
		self.MeleeAttackDamage = math.Rand(20,25)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 5 then
		self.AnimTbl_MeleeAttack = {"throw1"}
		self.TimeUntilMeleeAttackDamage = 0.95
		self.MeleeAttackDamage = math.Rand(25,30)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 6 then
		self.AnimTbl_MeleeAttack = {"ThrowItem"}
		self.TimeUntilMeleeAttackDamage = 1
		self.MeleeAttackDamage = math.Rand(20,25)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = true
		self.MeleeAttackKnockBack_Forward1 = 150
		self.MeleeAttackKnockBack_Forward2 = 300
		self.MeleeAttackKnockBack_Up1 = 95
		self.MeleeAttackKnockBack_Up2 = 145
		
	elseif randattack_stand == 7 then
		self.AnimTbl_MeleeAttack = {"MeleeAttack01"}
		self.TimeUntilMeleeAttackDamage = 0.5
		self.MeleeAttackDamage = math.Rand(20,25)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = true
		self.MeleeAttackKnockBack_Forward1 = 150
		self.MeleeAttackKnockBack_Forward2 = 300
		self.MeleeAttackKnockBack_Up1 = 55
		self.MeleeAttackKnockBack_Up2 = 80

	elseif randattack_stand == 8 then
		self.AnimTbl_MeleeAttack = {"MeleeAttack01"}
		self.TimeUntilMeleeAttackDamage = 0.5
		self.MeleeAttackDamage = math.Rand(20,25)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = true
		self.MeleeAttackKnockBack_Forward1 = 150
		self.MeleeAttackKnockBack_Forward2 = 300
		self.MeleeAttackKnockBack_Up1 = 55
		self.MeleeAttackKnockBack_Up2 = 80
		
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackCode_GetShootPos(projectile)
	return self:CalculateProjectile("Curve", self:GetAttachment(self:LookupAttachment(self.RangeUseAttachmentForPosID)).Pos, self:GetEnemy():GetPos() + self:GetEnemy():OBBCenter(), 1500)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetUpGibesOnDeath(dmginfo, hitgroup)
	self.HasDeathSounds = false
	if self.HasGibDeathParticles == true then
		local effectBlood = EffectData()
		effectBlood:SetOrigin(self:GetPos() + self:OBBCenter())
		effectBlood:SetColor(VJ_Color2Byte(Color(104,104,104)))
		effectBlood:SetScale(85)
		util.Effect("VJ_Blood1",effectBlood)
		
		local bloodspray = EffectData()
		bloodspray:SetOrigin(self:GetPos())
		bloodspray:SetScale(8)
		bloodspray:SetFlags(3)
		bloodspray:SetColor(0)
		util.Effect("bloodspray",bloodspray)
		util.Effect("bloodspray",bloodspray)
	end
	
	
	self:CreateGibEntity("prop_physics","models/props_junk/CinderBlock01a.mdl")
	-- self:CreateGibEntity("prop_physics","models/props_junk/CinderBlock01a.mdl")
	-- self:CreateGibEntity("prop_physics","models/props_junk/CinderBlock01a.mdl")
	self:CreateGibEntity("prop_physics","models/props_debris/concrete_spawnchunk001g.mdl",{Pos=self:LocalToWorld(Vector(0,0,30))})
	self:CreateGibEntity("prop_physics","models/props_debris/concrete_spawnchunk001g.mdl",{Pos=self:LocalToWorld(Vector(0,0,30))})
	self:CreateGibEntity("prop_physics","models/props_debris/concrete_spawnchunk001g.mdl",{Pos=self:LocalToWorld(Vector(0,0,30))})
	self:CreateGibEntity("prop_physics","models/props_debris/concrete_spawnchunk001k.mdl",{Pos=self:LocalToWorld(Vector(0,0,30))})
	self:CreateGibEntity("prop_physics","models/props_debris/concrete_spawnchunk001k.mdl",{Pos=self:LocalToWorld(Vector(0,0,30))})
	self:CreateGibEntity("prop_physics","models/props_debris/concrete_spawnchunk001k.mdl",{Pos=self:LocalToWorld(Vector(0,0,30))})
	self:CreateGibEntity("prop_physics","models/props_debris/rebar001a_32.mdl",{Pos=self:LocalToWorld(Vector(0,0,15))})
	self:CreateGibEntity("prop_physics","models/props_debris/rebar001a_32.mdl",{Pos=self:LocalToWorld(Vector(0,0,15))})
	-- self:CreateGibEntity("prop_physics","models/props_junk/CinderBlock01a.mdl")
	-- self:CreateGibEntity("prop_physics","models/props_junk/CinderBlock01a.mdl")
	return true
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomGibOnDeathSounds(dmginfo, hitgroup)
	local BreakNoise = math.random(1,2)
	if BreakNoise == 1 then
		VJ_EmitSound(self, "physics/concrete/concrete_break2.wav", 100, 100)
	elseif BreakNoise == 2 then
		VJ_EmitSound(self, "physics/concrete/concrete_break3.wav", 100, 100)
	end
	return false
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/