AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/Humans/Group02/male_08.mdl"}
ENT.VJ_IsHugeMonster = true
ENT.StartHealth = 3000
ENT.VJC_Data = {
	CameraMode = 1,
	ThirdP_Offset = Vector(40, 20, -50),
	FirstP_Bone = "ValveBiped.Bip01_Spine4",
	FirstP_Offset = Vector(0, 0, 5),
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
ENT.HasWorldShakeOnMove = true
ENT.WorldShakeOnMoveAmplitude = 1
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasDeathAnimation = true
ENT.DeathAnimationTime = false
ENT.DeathAnimationChance = 1
ENT.AnimTbl_Death = {"deathpose_back",
	"deathpose_front",
	"deathpose_left",
	"deathpose_right"}
ENT.HasDeathRagdoll = false
ENT.AllowedToGib = false
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.CanFlinch = 0
ENT.AnimTbl_Flinch = {"cower"}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.MeleeAttackDamage = math.Rand(1,1)
ENT.MeleeAttackDamageType = DMG_CRUSH
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
ENT.LeapAttackDamage = math.random(35,45)
ENT.LeapAttackDamageType = DMG_CRUSH
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

ENT.NextZombieSpawnT = 0
ENT.AlreadySpawned = false
ENT.CanSummonHelp = true
---------------------------------------------------------------------------------------------------------------------------------------------
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"physics/concrete/concrete_impact_hard1.wav",
	"physics/concrete/concrete_impact_hard2.wav",
	"physics/concrete/concrete_impact_hard3.wav"}
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
	"physics/concrete/concrete_break3.wav"}
ENT.HasSoundTrack = false
ENT.SoundTbl_SoundTrack = {"music/Can't_Stop_The_Rock.mp3"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	if GetConVarNumber("vj_BBOHG_BossNotifications") == 1 then
		PrintMessage(HUD_PRINTCENTER, "The Rock has spawned!")
	end
	if GetConVarNumber("vj_BBOHG_BossMusic") == 1 then
		self.HasSoundTrack = true
	end
	if GetConVarNumber("vj_BBOHG_NoGodsNoMasters") == 1 then
		self.VJ_NPC_Class = {"CLASS_BBOHG"}
		self.FriendsWithAllPlayerAllies = false
	end
	-- if math.random(1,4) == 1 then
		-- self.AnimTbl_Run = {ACT_RUN_CROUCH}
	-- end
	self:SetMaterial("models/props_c17/column02a")
	self:SetModelScale(1.20)
	self:SetCollisionBounds(Vector(13, 13, 70), Vector(-13, -13, 0))
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetSightDirection()
	return self:GetAttachment(self:LookupAttachment("eyes")).Ang:Forward()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
	if GetConVarNumber("vj_BBOHG_BossReinforcements") == 1 && self.CanSummonHelp == true then
		if IsValid(self:GetEnemy()) && CurTime() > self.NextZombieSpawnT then
			if self.AlreadySpawned == false && !IsValid(self.Zombie1) or !IsValid(self.Zombie2) or !IsValid(self.Zombie3) or !IsValid(self.Zombie4) then
				self.CanSummonHelp = false
				self.AlreadySpawned = true
				self.MovementType = VJ_MOVETYPE_STATIONARY
				self.HasMeleeAttack = false
				self.HasRangeAttack = false
				self.HasLeapAttack = false
				self:VJ_ACT_PLAYACTIVITY("vjges_g_armsout_high", true, false, false)
				VJ_EmitSound(self,{"ambient/machines/wall_move1.wav"},100,math.random(100,95))
				VJ_EmitSound(self,{"ambient/machines/thumper_hit.wav"},100,math.random(100,95))
				VJ_EmitSound(self,{"ambient/atmosphere/terrain_rumble1.wav"},100,math.random(100,95))
				util.ScreenShake(self:GetPos(), 100, 200, 3, 500)
			timer.Simple(3,function() if IsValid(self) then
				VJ_EmitSound(self,{"ambient/energy/weld1.wav","ambient/energy/weld2.wav"},100,math.random(100,95))
				effects.BeamRingPoint(self:GetPos(), 0.3, 2, 400, 16, 0, Color(116, 116, 116, 255), {material="sprites/physgbeamb", framerate=20})
				effects.BeamRingPoint(self:GetPos(), 0.3, 2, 200, 16, 0, Color(116, 116, 116, 255), {material="sprites/physgbeamb", framerate=20})
				util.ScreenShake(self:GetPos(), 100, 200, 1, 500)
				VJ_EmitSound(self,{"npc/combine_gunship/gunship_ping_search.wav"},100,math.random(100,95))
				VJ_EmitSound(self,{"physics/concrete/boulder_impact_hard1.wav",
				"physics/concrete/boulder_impact_hard2.wav",
				"physics/concrete/boulder_impact_hard3.wav",
				"physics/concrete/boulder_impact_hard4.wav"},100,math.random(100,95))
				VJ_EmitSound(self,{"ambient/machines/thumper_hit.wav"},100,math.random(100,95))
				
				local effectData = EffectData()
				effectData:SetOrigin(self:GetPos())
				effectData:SetScale(500)
				util.Effect("ThumperDust", effectData)
			
			if !IsValid(self.Zombie1) then
				self.Zombie1 = ents.Create("npc_vj_bbohg_therock_minion")
				self.Zombie1:SetPos(self:GetPos() +self:GetRight()*45 +self:GetUp()*5)
				self.Zombie1:SetAngles(self:GetAngles())
				self.Zombie1:Spawn()
				-- timer.Simple(0.3,function() if IsValid(self.Zombie1) then self.Zombie1:SetNoDraw(false) end end)
				local SpawnAnimation = math.random(1,3)
				self.Zombie1:VJ_ACT_PLAYACTIVITY("Sit_Ground_to_Idle", true, false, false)
			end

			if !IsValid(self.Zombie2) then
				self.Zombie2 = ents.Create("npc_vj_bbohg_therock_minion")
				self.Zombie2:SetPos(self:GetPos() +self:GetRight()*-45 +self:GetUp()*5)
				self.Zombie2:SetAngles(self:GetAngles())
				self.Zombie2:Spawn()
				-- timer.Simple(0.3,function() if IsValid(self.Zombie2) then self.Zombie2:SetNoDraw(false) end end)
				local SpawnAnimation = math.random(1,3)
				self.Zombie2:VJ_ACT_PLAYACTIVITY("Sit_Ground_to_Idle", true, false, false)
			end

			if !IsValid(self.Zombie3) then
				self.Zombie3 = ents.Create("npc_vj_bbohg_therock_minion")
				self.Zombie3:SetPos(self:GetPos() +self:GetForward()*45 +self:GetUp()*5)
				self.Zombie3:SetAngles(self:GetAngles())
				self.Zombie3:Spawn()
				-- timer.Simple(0.3,function() if IsValid(self.Zombie3) then self.Zombie3:SetNoDraw(false) end end)
				local SpawnAnimation = math.random(1,3)
				self.Zombie3:VJ_ACT_PLAYACTIVITY("Sit_Ground_to_Idle", true, false, false)
			end
	
			if !IsValid(self.Zombie4) then
				self.Zombie4 = ents.Create("npc_vj_bbohg_therock_minion")
				self.Zombie4:SetPos(self:GetPos() +self:GetForward()*-45 +self:GetUp()*5)
				self.Zombie4:SetAngles(self:GetAngles())
				self.Zombie4:Spawn()
				-- timer.Simple(0.3,function() if IsValid(self.Zombie4) then self.Zombie4:SetNoDraw(false) end end)
				local SpawnAnimation = math.random(1,3)
				self.Zombie4:VJ_ACT_PLAYACTIVITY("Sit_Ground_to_Idle", true, false, false)
			end

				self.AlreadySpawned = false
				self.CanSummonHelp = true
				self.NextZombieSpawnT = CurTime() + 45
				self.MovementType = VJ_MOVETYPE_GROUND
				self.HasMeleeAttack = true
				self.HasRangeAttack = true
				self.HasLeapAttack = true
			end end)
			end
		end
	end
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
		self.MeleeAttackDamage = math.Rand(30,35)
		self.MeleeAttackDamageType = DMG_CRUSH
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 2 then
		self.AnimTbl_MeleeAttack = {"swing"}
		self.TimeUntilMeleeAttackDamage = 0.4
		self.MeleeAttackDamage = math.Rand(30,35)
		self.MeleeAttackDamageType = DMG_CRUSH
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 3 then
		self.AnimTbl_MeleeAttack = {"swing"}
		self.TimeUntilMeleeAttackDamage = 0.4
		self.MeleeAttackDamage = math.Rand(30,35)
		self.MeleeAttackDamageType = DMG_CRUSH
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 4 then
		self.AnimTbl_MeleeAttack = {"swing"}
		self.TimeUntilMeleeAttackDamage = 0.4
		self.MeleeAttackDamage = math.Rand(30,35)
		self.MeleeAttackDamageType = DMG_CRUSH
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 5 then
		self.AnimTbl_MeleeAttack = {"throw1"}
		self.TimeUntilMeleeAttackDamage = 0.95
		self.MeleeAttackDamage = math.Rand(35,40)
		self.MeleeAttackDamageType = DMG_CRUSH
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 6 then
		self.AnimTbl_MeleeAttack = {"ThrowItem"}
		self.TimeUntilMeleeAttackDamage = 1
		self.MeleeAttackDamage = math.Rand(30,35)
		self.MeleeAttackDamageType = DMG_CRUSH
		self.HasMeleeAttackKnockBack = true
		self.MeleeAttackKnockBack_Forward1 = 300
		self.MeleeAttackKnockBack_Forward2 = 500
		self.MeleeAttackKnockBack_Up1 = 200
		self.MeleeAttackKnockBack_Up2 = 175
		
	elseif randattack_stand == 7 then
		self.AnimTbl_MeleeAttack = {"MeleeAttack01"}
		self.TimeUntilMeleeAttackDamage = 0.5
		self.MeleeAttackDamage = math.Rand(30,35)
		self.MeleeAttackDamageType = DMG_CRUSH
		self.HasMeleeAttackKnockBack = true
		self.MeleeAttackKnockBack_Forward1 = 300
		self.MeleeAttackKnockBack_Forward2 = 500
		self.MeleeAttackKnockBack_Up1 = 75
		self.MeleeAttackKnockBack_Up2 = 100

	elseif randattack_stand == 8 then
		self.AnimTbl_MeleeAttack = {"MeleeAttack01"}
		self.TimeUntilMeleeAttackDamage = 0.5
		self.MeleeAttackDamage = math.Rand(30,35)
		self.MeleeAttackDamageType = DMG_CRUSH
		self.HasMeleeAttackKnockBack = true
		self.MeleeAttackKnockBack_Forward1 = 300
		self.MeleeAttackKnockBack_Forward2 = 500
		self.MeleeAttackKnockBack_Up1 = 75
		self.MeleeAttackKnockBack_Up2 = 100
		
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackCode_GetShootPos(projectile)
	return self:CalculateProjectile("Curve", self:GetAttachment(self:LookupAttachment(self.RangeUseAttachmentForPosID)).Pos, self:GetEnemy():GetPos() + self:GetEnemy():OBBCenter(), 1500)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
	if self.Dead == false then
		if IsValid(self.Zombie1) then self.Zombie1:Remove() end
		if IsValid(self.Zombie2) then self.Zombie2:Remove() end
		if IsValid(self.Zombie3) then self.Zombie3:Remove() end
		if IsValid(self.Zombie4) then self.Zombie4:Remove() end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialKilled(dmginfo, hitgroup)
	if GetConVarNumber("vj_BBOHG_BossNotifications") == 1 then
		PrintMessage(HUD_PRINTCENTER, "The Rock has been stopped!")
	end
	self.CanSummonHelp = false
	if IsValid(self) then
	self.SoundTrackVolume = 0
	-- self:StartSoundTrack()
	-- self.SoundTbl_SoundTrack = {}
	-- self:StartSoundTrack()
    self:AddFlags(FL_NOTARGET)
	self:SetRenderFX( kRenderFxPulseSlowWide )
	if GetConVarNumber("vj_npc_noidleparticle") == 0 then
		-- ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
		-- ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("chest"))
		-- ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_RH"))
		-- ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_LH"))
		-- ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("eyes"))
		ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
		-- ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("chest"))
		ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_RH"))
		ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_LH"))
		-- ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("eyes"))
	end
	timer.Simple(0.1,function()
	if IsValid(self) then
	local STabb = math.random(1,2)
		if STabb == 1 then
			VJ_EmitSound(self,"fx/boss_death_initial_1.mp3",100,100)
		else
			VJ_EmitSound(self,"fx/boss_death_initial_2.mp3",100,100)
		end
		VJ_EmitSound(self,"fx/boss_death.mp3",100,100)
		VJ_EmitSound(self,"fx/boss_death.mp3",100,100)
	
	
	-- self:SetKeyValue("rendercolor","255 255 255 250")
		timer.Simple(0.5,function()
		self:SetKeyValue("rendercolor","209 209 209 215") end)
		timer.Simple(1,function()
		self:SetKeyValue("rendercolor","177 177 177 175") end)
		timer.Simple(1.5,function()
		self:SetKeyValue("rendercolor","145 145 145 135") end)
		timer.Simple(2,function()
		self:SetKeyValue("rendercolor","96 96 96 95")
		if GetConVarNumber("vj_npc_noidleparticle") == 0 then
			-- ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
			-- ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("chest"))
			-- ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_RH"))
			-- ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_LH"))
			-- ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("eyes"))
			ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
			-- ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("chest"))
			ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_RH"))
			ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_LH"))
			-- ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("eyes"))
		end	end)
		timer.Simple(2.5,function()
		self:SetKeyValue("rendercolor","55 55 55 45") end)
		timer.Simple(3,function()
		self:SetKeyValue("rendercolor","0 0 0 1") end)
		timer.Simple(5.9,function()
		-- PrintMessage( HUD_PRINTTALK, "Hobo King has been banned permanently." )
		-- PrintMessage( HUD_PRINTTALK, "Reason: RDM." )
		end)
		end
	end)
		-- self:SetKeyValue("ColorAlpha","255 255 255 88")
end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/