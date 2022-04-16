AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/skeleton/skeleton_decomp.mdl"} 
ENT.VJ_IsHugeMonster = true
ENT.StartHealth = 2500
ENT.HullType = HULL_HUMAN
ENT.VJC_Data = {
	CameraMode = 1, 
	ThirdP_Offset = Vector(25, 30, -150), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "ValveBiped.Bip01_Head1", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
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
ENT.AnimTbl_Run = {ACT_WALK}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.Bleeds = false
ENT.HasWorldShakeOnMove = true
ENT.WorldShakeOnMoveAmplitude = 4
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = {"vjseq_death_04"}
ENT.DeathAnimationTime = 3.7
ENT.DeathAnimationChance = 1 -- Put 1 if you want it to play the animation all the time
ENT.HasDeathRagdoll = false
ENT.DeathCorpseEntityClass = "UseDefaultBehavior"
ENT.DeathCorpseModel = {"models/Humans/corpse1.mdl"}
ENT.AllowedToGib = true
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.MeleeAttackDamage = math.Rand(1,1)
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.AnimTbl_MeleeAttack = {"swing"}
ENT.MeleeAttackDistance = 65
ENT.MeleeAttackDamageDistance = 100
ENT.MeleeAttackAngleRadius = 70
ENT.MeleeAttackDamageAngleRadius = 70
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasRangeAttack = true
ENT.RangeAttackEntityToSpawn = "obj_vj_bbohg_lostsoul"
ENT.AnimTbl_RangeAttack = {"cheer2"}
ENT.RangeToMeleeDistance = 1
ENT.TimeUntilRangeAttackProjectileRelease = 2
ENT.NextRangeAttackTime = 5
ENT.NextRangeAttackTime_DoRand = 15
ENT.RangeAttackReps = 5
ENT.RangeAttackExtraTimers = {2.1, 2.2, 2.3, 2.4, 2.5, 2.6, 2.7, 2.8, 2.9, 3}
ENT.RangeUseAttachmentForPos = true
ENT.RangeUseAttachmentForPosID = "chest"
---------------------------------------------------------------------------------------------------------------------------------------------

ENT.FootStepTimeRun = 0.5
ENT.FootStepTimeWalk = 0.5

ENT.CombatIdleSoundChance = 3

ENT.GeneralSoundPitch1 = 70
ENT.GeneralSoundPitch2 = 60

ENT.FootStepSoundLevel = 100

ENT.PainSoundChance = 3
ENT.CanChangeRangedProjectile = true
---------------------------------------------------------------------------------------------------------------------------------------------
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"npc/boner/bigstep.mp3"}
ENT.SoundTbl_MedicBeforeHeal = {"npc/boner/drink.mp3"}
ENT.SoundTbl_MedicAfterHeal = {"ambient/levels/canals/toxic_slime_sizzle1.wav",
	"ambient/levels/canals/toxic_slime_sizzle2.wav",
	"ambient/levels/canals/toxic_slime_sizzle3.wav",
	"ambient/levels/canals/toxic_slime_sizzle4.wav"}
ENT.SoundTbl_Alert = {"npc/boner/frenzy/alert.mp3"}
ENT.SoundTbl_BeforeMeleeAttack = {}
ENT.SoundTbl_MeleeAttack = {}
ENT.SoundTbl_MeleeAttack = {"physics/body/body_medium_impact_hard1.wav",
	"physics/body/body_medium_impact_hard2.wav",
	"physics/body/body_medium_impact_hard3.wav",
	"physics/body/body_medium_impact_hard4.wav",
	"physics/body/body_medium_impact_hard5.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"npc/zombie/claw_miss2.wav",
	"npc/zombie/claw_miss1.wav"}
ENT.SoundTbl_AllyDeath = {"npc/boner/alert.mp3"}
ENT.SoundTbl_Pain = {"npc/boner/knight/pain (1).wav",
	"npc/boner/knight/pain (2).wav",
	"npc/boner/knight/pain (3).wav"}
ENT.SoundTbl_Death = {"npc/boner/knight/death (1).wav",
	"npc/boner/knight/death (2).wav",
	"npc/boner/knight/death (3).wav"}
ENT.HasSoundTrack = false
ENT.SoundTbl_SoundTrack = {"music/Spooky_Scary_Skeletons.mp3"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	if GetConVarNumber("vj_BBOHG_BossNotifications") == 1 then
		PrintMessage(HUD_PRINTCENTER, "A big b0ne(r) has spawned!")
	end
	if GetConVarNumber("vj_BBOHG_BossMusic") == 1 then
		self.HasSoundTrack = true
	end
	if GetConVarNumber("vj_BBOHG_NoGodsNoMasters") == 1 then
		self.VJ_NPC_Class = {"CLASS_BBOHG"}
		self.FriendsWithAllPlayerAllies = false
	end
	if GetConVarNumber("vj_BBOHG_MusicVolume") == 0 then
		self.SoundTrackVolume = 0.1
	elseif GetConVarNumber("vj_BBOHG_MusicVolume") == 1 then
		self.SoundTrackVolume = 0.2
	elseif GetConVarNumber("vj_BBOHG_MusicVolume") == 2 then
		self.SoundTrackVolume = 0.3
	elseif GetConVarNumber("vj_BBOHG_MusicVolume") == 3 then
		self.SoundTrackVolume = 0.4
	elseif GetConVarNumber("vj_BBOHG_MusicVolume") == 4 then
		self.SoundTrackVolume = 0.5
	elseif GetConVarNumber("vj_BBOHG_MusicVolume") == 5 then
		self.SoundTrackVolume = 0.6
	elseif GetConVarNumber("vj_BBOHG_MusicVolume") == 6 then
		self.SoundTrackVolume = 0.7
	elseif GetConVarNumber("vj_BBOHG_MusicVolume") == 7 then
		self.SoundTrackVolume = 0.8
	elseif GetConVarNumber("vj_BBOHG_MusicVolume") == 8 then
		self.SoundTrackVolume = 0.9
	elseif GetConVarNumber("vj_BBOHG_MusicVolume") == 9 then
		self.SoundTrackVolume = 1
	end
	self:SetCollisionBounds(Vector(11, 11, 71), Vector(-11, -11, 0))
	self:SetModelScale(3)
-- ENT.SoundTrackVolume = 1
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetSightDirection()
	return self:GetAttachment(self:LookupAttachment("eyes")).Ang:Forward()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
	if self.VJ_IsBeingControlled == true && self.VJ_TheController:KeyDown(IN_DUCK) && self.CanChangeRangedProjectile == true then
		self.CanChangeRangedProjectile = false
		if self.RangeAttackEntityToSpawn == "obj_vj_bbohg_b0neball" then
		self.RangeAttackEntityToSpawn = "obj_vj_bbohg_lostsoul"
		self.RangeAttackExtraTimers = {2.1, 2.2, 2.3, 2.4, 2.5, 2.6, 2.7, 2.8, 2.9, 3}
			self.VJ_TheController:PrintMessage(HUD_PRINTCENTER,"Prefered Projectile changed to Lost Soul Volley")
		elseif self.RangeAttackEntityToSpawn == "obj_vj_bbohg_lostsoul" then
		self.RangeAttackEntityToSpawn = "obj_vj_bbohg_b0neball"
		self.RangeAttackExtraTimers = nil
			self.VJ_TheController:PrintMessage(HUD_PRINTCENTER,"Prefered Projectile changed to b0ne ball")
		end
		timer.Simple(1,function() if IsValid(self) then
			self.CanChangeRangedProjectile = true
		end end)
	end
	
	
	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMedic_BeforeHeal()
	-- VJ_EmitSound(self,"npc/vort/health_charge.wav",75,150)
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
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRangeAttack_BeforeStartTimer(seed)
	if !self.VJ_IsBeingControlled == true then
	local WhichToThrow = math.random(1,2)
	if WhichToThrow == 1 then
		self.RangeAttackEntityToSpawn = "obj_vj_bbohg_b0neball"
		self.RangeAttackExtraTimers = nil
	else
		self.RangeAttackEntityToSpawn = "obj_vj_bbohg_lostsoul"
		self.RangeAttackExtraTimers = {2.1, 2.2, 2.3, 2.4, 2.5, 2.6, 2.7, 2.8, 2.9, 3}
	end
	end

	VJ_EmitSound(self,{"ambient/fire/mtov_flame2.wav"},100,math.random(100,90))
	ParticleEffectAttach("fire_small_01",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_LH"))
	ParticleEffectAttach("fire_small_01",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_RH"))
	timer.Simple(2,function() if IsValid(self) then
		ParticleEffectAttach("fire_medium_02",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("chest"))
	VJ_EmitSound(self,{"ambient/fire/ignite.wav"},100,math.random(100,90))
	end end)
	timer.Simple(3,function() if IsValid(self) then
		self:StopParticles()
	end end)
	-- fire_medium_02
end
-------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackCode_GetShootPos(projectile)
	return self:CalculateProjectile("Line", self:GetAttachment(self:LookupAttachment(self.RangeUseAttachmentForPosID)).Pos, self:GetEnemy():GetPos() +self:GetUp()*math.random(-50,50) +self:GetRight()*math.random(-50,50) + self:GetEnemy():OBBCenter(), 1000)
end
-------------------------------------------------------------------------------------------------------------------
function ENT:Controller_IntMsg(ply, controlEnt)
	ply:ChatPrint("CROUCH - Swap prefered projectile")
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo,hitgroup)
	self.AnimationPlaybackRate = 0.75
	timer.Simple(2.35,function() if IsValid(self) then
	VJ_EmitSound(self,{"physics/body/body_medium_impact_hard1.wav",
	"physics/body/body_medium_impact_hard2.wav",
	"physics/body/body_medium_impact_hard3.wav",
	"physics/body/body_medium_impact_hard4.wav",
	"physics/body/body_medium_impact_hard5.wav",
	"physics/body/body_medium_impact_hard6.wav"},100,math.random(90,85))
	VJ_EmitSound(self,{"ambient/machines/thumper_dust.wav"},100,math.random(100,90))
	VJ_EmitSound(self,{"npc/boner/frenzy/death.mp3"},100,math.random(100,90))
	util.ScreenShake(self:GetPos(), 100, 200, 3, 500)
	local effectData = EffectData()
	effectData:SetOrigin(self:GetPos())
	effectData:SetScale(500)
	util.Effect("ThumperDust", effectData)
	end end)
	
	timer.Simple(3.55,function() if IsValid(self) then
	VJ_EmitSound(self,{"physics/body/body_medium_impact_hard1.wav",
	"physics/body/body_medium_impact_hard2.wav",
	"physics/body/body_medium_impact_hard3.wav",
	"physics/body/body_medium_impact_hard4.wav",
	"physics/body/body_medium_impact_hard5.wav",
	"physics/body/body_medium_impact_hard6.wav"},100,math.random(90,85))
	VJ_EmitSound(self,{"ambient/machines/thumper_dust.wav"},100,math.random(100,90))
	VJ_EmitSound(self,{"npc/boner/frenzy/death.mp3"},100,math.random(45,40))
	util.ScreenShake(self:GetPos(), 100, 200, 3, 500)
	local effectData = EffectData()
	effectData:SetOrigin(self:GetPos())
	effectData:SetScale(500)
	util.Effect("ThumperDust", effectData)
	end end)
	
	-- timer.Simple(2.98,function() if IsValid(self) then

	-- VJ_EmitSound(self,{"npc/boner/frenzy/death.mp3"},100,math.random(100,90))
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(275,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(275,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(275,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(275,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(275,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(275,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(240,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(240,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(240,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(240,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(240,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(240,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(205,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(205,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(205,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(205,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(205,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(205,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(175,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(175,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(175,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(175,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(175,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(175,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(140,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(140,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(140,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(140,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(140,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(140,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(105,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(105,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(105,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(105,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(105,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(105,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(70,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(70,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(70,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(70,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(70,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(70,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(35,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(35,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(35,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(35,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(35,0,25))})
	-- self:CreateGibEntity("prop_physics","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(35,0,25))})
	
	-- self:CreateGibEntity("prop_physics","models/props_junk/cinderblock01a.mdl",{Pos=self:LocalToWorld(Vector(200,0,50))})
	-- self:CreateGibEntity("prop_physics","models/props_junk/cinderblock01a.mdl",{Pos=self:LocalToWorld(Vector(200,10,50)),Ang=self:GetAngles()+Angle(0,0,0),Vel=self:GetRight()*math.Rand(-100,100)+self:GetForward()*math.Rand(-200,200)+self:GetUp()*math.Rand(-20,400)})
	-- self:CreateGibEntity("prop_physics","models/props_junk/cinderblock01a.mdl",{Pos=self:LocalToWorld(Vector(200,0,50)),Ang=self:GetAngles()+Angle(0,0,0),Vel=self:GetRight()*math.Rand(-100,100)+self:GetForward()*math.Rand(-200,200)+self:GetUp()*math.Rand(-20,400)})
	-- self:CreateGibEntity("prop_physics","models/props_junk/cinderblock01a.mdl",{Pos=self:LocalToWorld(Vector(200,0,40)),Ang=self:GetAngles()+Angle(0,0,0),Vel=self:GetRight()*math.Rand(-100,100)+self:GetForward()*math.Rand(-200,200)+self:GetUp()*math.Rand(-20,400)})
	-- self:CreateGibEntity("prop_physics","models/props_junk/cinderblock01a.mdl",{Pos=self:LocalToWorld(Vector(200,0,25)),Ang=self:GetAngles()+Angle(0,0,0),Vel=self:GetRight()*math.Rand(-100,100)+self:GetForward()*math.Rand(-200,200)+self:GetUp()*math.Rand(-20,400)})
	-- self:CreateGibEntity("prop_physics","models/props_junk/cinderblock01a.mdl",{Pos=self:LocalToWorld(Vector(200,0,5)),Ang=self:GetAngles()+Angle(0,0,0),Vel=self:GetRight()*math.Rand(-100,100)+self:GetForward()*math.Rand(-200,200)+self:GetUp()*math.Rand(-20,400)})

	-- end
-- end)
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
	if self.Dead == false then
		if IsValid(self.Zombie1) then self.Zombie1:Remove() end
		if IsValid(self.Zombie2) then self.Zombie2:Remove() end
		if IsValid(self.Zombie3) then self.Zombie3:Remove() end
		if IsValid(self.Zombie4) then self.Zombie4:Remove() end
	end
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialKilled(dmginfo, hitgroup)
	if GetConVarNumber("vj_BBOHG_BossNotifications") == 1 then
		PrintMessage(HUD_PRINTCENTER, "A big b0ne(r) has been killed!")
	end
	if IsValid(self) then
	self.SoundTrackVolume = 0
    self:AddFlags(FL_NOTARGET)
	self:SetRenderFX( kRenderFxPulseSlowWide )
	if GetConVarNumber("vj_npc_noidleparticle") == 0 then
		ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("chest"))
		timer.Simple(3.64,function() if IsValid(self) then
			ParticleEffectAttach("explosion_huge_g",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("chest"))
			ParticleEffectAttach("explosion_huge_g",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
		end end)
		ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("eyes"))
		ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
		ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
		ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
		ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_RH"))
		ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_LH"))
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
		timer.Simple(0.5,function()
			if IsValid(self) then
				self:SetKeyValue("rendercolor","209 209 209 215")
			end
		end)
		timer.Simple(1,function()
			if IsValid(self) then
				self:SetKeyValue("rendercolor","177 177 177 175")
			end
		end)
		timer.Simple(1.5,function()
			if IsValid(self) then
				self:SetKeyValue("rendercolor","145 145 145 135")
			end
		end)
		timer.Simple(2,function()
		if IsValid(self) then
			self:SetKeyValue("rendercolor","96 96 96 95")
			if GetConVarNumber("vj_npc_noidleparticle") == 0 then
				ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
				ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_RH"))
				ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_LH"))
			end	
		end	
		end)
		timer.Simple(2.5,function()
			if IsValid(self) then
			self:SetKeyValue("rendercolor","55 55 55 45")
			end
		end)
		timer.Simple(3,function()
			if IsValid(self) then
			self:SetKeyValue("rendercolor","0 0 0 1")
			end
		end)
		timer.Simple(2,function()
			if IsValid(self) && GetConVarNumber("vj_BBOHG_BossCleanup") == 1 then
				local dissolver = ents.Create("env_entity_dissolver")
				dissolver:SetKeyValue("dissolvetype", 0)
				dissolver:SetKeyValue("magnitude", 0)
				dissolver:SetPos(Vector(0, 0, 0))
				dissolver:Spawn()
				dissolver:Fire("Dissolve", "npc_vj_bbohg_boner")
				dissolver:Fire("Dissolve", "npc_vj_bbohg_boner_frenzy")
				dissolver:Fire("Dissolve", "npc_vj_bbohg_boner_knight")
				dissolver:Fire("Dissolve", "npc_vj_bbohg_boner_reviver")
				dissolver:Fire("Dissolve", "npc_vj_bbohg_boner_standard")
				dissolver:Fire("Kill", "", 0)
			end
		end)
		end
	end)
end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/