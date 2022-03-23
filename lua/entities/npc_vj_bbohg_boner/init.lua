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

ENT.HasWeapon = false
ENT.Crowbar = false
ENT.Reviver = false

-- ENT.move = false
-- ENT.move2 = false
-- ENT.move3 = false
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
	if self.SkelllyType == 3 then
		self:SetSkin(3)
		self.Reviver = true
		self.IsMedicSNPC = true
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
	if self.Reviver == false then return end
	for _,v in ipairs(ents.FindInSphere(self:GetPos(),1000)) do
		if self.infect == true && self.MoveToCorpose == false && self.MeleeAttacking == false then
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
	if self.infect2 == true && self.MeleeAttacking == false then 
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
			
			self:VJ_ACT_PLAYACTIVITY("cheer2",true,4.6999999019504,false)
			
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
				self.sworm13:VJ_ACT_PLAYACTIVITY("zombie_slump_rise_01",true,2.8,false)
				self.sworm13:Activate()
				self.sworm13:SetOwner(self)
				
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
function ENT:CustomOnMedic_OnHeal(ent)
	if IsValid(ent) then
		ent:PlaySoundSystem("GeneralSpeech", "npc/boner/drowning.mp3")
		return true
	end
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialKilled(dmginfo, hitgroup)
    self:AddFlags(FL_NOTARGET)
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