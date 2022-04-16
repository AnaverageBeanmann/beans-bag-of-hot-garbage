AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/Humans/Group03/male_09.mdl"} 
ENT.StartHealth = 500
ENT.HasHealthRegeneration = true
ENT.HealthRegenerationAmount = math.Rand(1,2)
ENT.HealthRegenerationDelay = VJ_Set(0.5,1)
ENT.VJC_Data = {
	CameraMode = 1, 
	ThirdP_Offset = Vector(45, 15, -50), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "ValveBiped.Bip01_Head1", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_TOSSER"}
ENT.FriendsWithAllPlayerAllies = false
ENT.BecomeEnemyToPlayer = true
ENT.BecomeEnemyToPlayerLevel = 3
ENT.HasOnPlayerSight = true
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.IsMedicSNPC = true
ENT.AnimTbl_Medic_GiveHealth = {"ThrowItem"}
ENT.Medic_TimeUntilHeal = 1
ENT.Medic_HealthAmount = math.Rand(50,75)
ENT.Medic_NextHealTime = VJ_Set(10,15)
ENT.Medic_SpawnPropOnHealModel = "models/custom/box_test/box_test.mdl"
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.AnimTbl_Run = {ACT_WALK}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.BloodColor = "Yellow"
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasItemDropsOnDeath = false
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.MeleeAttackDamage = math.Rand(1,1)
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.AnimTbl_MeleeAttack = {"swing"}
ENT.MeleeAttackDistance = 35
ENT.MeleeAttackDamageDistance = 50
ENT.MeleeAttackAngleRadius = 70
ENT.MeleeAttackDamageAngleRadius = 70
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasRangeAttack = true
ENT.RangeAttackEntityToSpawn = "obj_vj_bbohg_cheese"
ENT.AnimTbl_RangeAttack = {"throw1"}
ENT.RangeToMeleeDistance = 200
ENT.TimeUntilRangeAttackProjectileRelease = 0.9
ENT.NextRangeAttackTime = 5
ENT.NextRangeAttackTime_DoRand = 15
ENT.RangeUseAttachmentForPos = true
ENT.RangeUseAttachmentForPosID = "anim_attachment_RH"
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.FootStepTimeRun = 0.5
ENT.FootStepTimeWalk = 0.5

ENT.IdleSoundChance = 15
ENT.CombatIdleSoundChance = 15

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 95

ENT.IdleDialogueDistance = 175

ENT.Gender = 0
ENT.Explosive = false
ENT.CanExplode = false
---------------------------------------------------------------------------------------------------------------------------------------------
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"npc/footsteps/hardboot_generic1.wav",
	"npc/footsteps/hardboot_generic2.wav",
	"npc/footsteps/hardboot_generic3.wav",
	"npc/footsteps/hardboot_generic4.wav",
	"npc/footsteps/hardboot_generic5.wav",
	"npc/footsteps/hardboot_generic6.wav",
	"npc/footsteps/hardboot_generic8.wav"}
ENT.SoundTbl_Idle = {"ambient/voices/cough1.wav",
	"ambient/voices/cough2.wav",
	"ambient/voices/cough3.wav",
	"ambient/voices/cough4.wav"}
ENT.SoundTbl_IdleDialogue = {"npc/tossers/cheese/cheese.mp3"}
ENT.SoundTbl_IdleDialogueAnswer = {"npc/tossers/cheese/cheese.mp3"}
ENT.SoundTbl_CombatIdle = {}
ENT.SoundTbl_OnReceiveOrder = {"npc/tossers/cheese/cheese.mp3"}
ENT.SoundTbl_FollowPlayer = {"npc/tossers/cheese/cheese.mp3"}
ENT.SoundTbl_UnFollowPlayer = {"npc/tossers/cheese/cheese.mp3"}
ENT.SoundTbl_MoveOutOfPlayersWay = {"npc/tossers/cheese/cheese.mp3"}
ENT.SoundTbl_MedicAfterHeal = {"npc/barnacle/barnacle_crunch2.wav",
	"npc/barnacle/barnacle_crunch3.wav"}
ENT.SoundTbl_OnPlayerSight = {"npc/tossers/cheese/cheese.mp3"}
ENT.SoundTbl_Investigate = {"npc/tossers/cheese/cheese.mp3"}
ENT.SoundTbl_LostEnemy = {"npc/tossers/cheese/cheese.mp3"}
ENT.SoundTbl_Alert = {"npc/tossers/cheese/cheese.mp3"}
ENT.SoundTbl_CallForHelp = {"npc/tossers/cheese/cheese.mp3"}
ENT.SoundTbl_BecomeEnemyToPlayer = {"npc/tossers/cheese/cheese.mp3"}
ENT.SoundTbl_MeleeAttack = {"physics/body/body_medium_impact_hard1.wav",
	"physics/body/body_medium_impact_hard2.wav",
	"physics/body/body_medium_impact_hard3.wav",
	"physics/body/body_medium_impact_hard4.wav",
	"physics/body/body_medium_impact_hard5.wav",
	"physics/body/body_medium_impact_hard6.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"weapons/iceaxe/iceaxe_swing1.wav"}
ENT.SoundTbl_BeforeRangeAttack = {"npc/tossers/cheese/cheese.mp3"}
ENT.SoundTbl_OnKilledEnemy = {"npc/tossers/cheese/cheese.mp3"}
ENT.SoundTbl_AllyDeath = {"npc/tossers/cheese/cheese.mp3"}
ENT.SoundTbl_Pain = {}
ENT.SoundTbl_DamageByPlayer = {"npc/tossers/cheese/cheese.mp3"}
ENT.SoundTbl_Death = {"npc/barnacle/barnacle_die1.wav",
	"npc/barnacle/barnacle_die2.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()
self.Model = {"models/Humans/Group03/male_02.mdl",
	"models/Humans/Group03/male_03.mdl",
	"models/Humans/Group03/Male_05.mdl",
	"models/Humans/Group03/male_07.mdl"} 
	if math.random(1,5) == 1 then
		self.Gender = 1
		self.Model = {"models/Humans/Group03/Female_02.mdl",
	"models/Humans/Group03/Female_04.mdl"} 
	end
	if math.random(1,3) == 1 then
		self.CanExplode = true
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	if GetConVarNumber("vj_BBOHG_Gibs") == 0 then
		self.AllowedToGib = false
	end
	if GetConVarNumber("vj_BBOHG_FriendlyTossers") == 1 then
		self.VJ_NPC_Class = {"CLASS_TOSSER","CLASS_PLAYER_ALLY"}
		self.FriendsWithAllPlayerAllies = true
	end
	if GetConVarNumber("vj_BBOHG_NoGodsNoMasters") == 1 then
		self.VJ_NPC_Class = {"CLASS_BBOHG"}
		self.FriendsWithAllPlayerAllies = false
	end
	if self.Gender == 1 then
		self.Medic_TimeUntilHeal = 0.7
		self.IdleSoundPitch = VJ_Set(115, 130)
		self.DeathSoundPitch = VJ_Set(115, 130)
		self.SoundTbl_IdleDialogue = {"npc/tossers/cheese/cheese_f.mp3"}
		self.SoundTbl_IdleDialogueAnswer = {"npc/tossers/cheese/cheese_f.mp3"}
		self.SoundTbl_CombatIdle = {}
		self.SoundTbl_OnReceiveOrder = {"npc/tossers/cheese/cheese_f.mp3"}
		self.SoundTbl_FollowPlayer = {"npc/tossers/cheese/cheese_f.mp3"}
		self.SoundTbl_UnFollowPlayer = {"npc/tossers/cheese/cheese_f.mp3"}
		self.SoundTbl_MoveOutOfPlayersWay = {"npc/tossers/cheese/cheese_f.mp3"}
		self.SoundTbl_OnPlayerSight = {"npc/tossers/cheese/cheese_f.mp3"}
		self.SoundTbl_Investigate = {"npc/tossers/cheese/cheese_f.mp3"}
		self.SoundTbl_LostEnemy = {"npc/tossers/cheese/cheese_f.mp3"}
		self.SoundTbl_Alert = {"npc/tossers/cheese/cheese_f.mp3"}
		self.SoundTbl_CallForHelp = {"npc/tossers/cheese/cheese_f.mp3"}
		self.SoundTbl_BecomeEnemyToPlayer = {"npc/tossers/cheese/cheese_f.mp3"}
		self.SoundTbl_BeforeRangeAttack = {"npc/tossers/cheese/cheese_f.mp3"}
		self.SoundTbl_OnKilledEnemy = {"npc/tossers/cheese/cheese_f.mp3"}
		self.SoundTbl_AllyDeath = {"npc/tossers/cheese/cheese_f.mp3"}
		self.SoundTbl_DamageByPlayer = {"npc/tossers/cheese/cheese_f.mp3"}
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetSightDirection()
	return self:GetAttachment(self:LookupAttachment("eyes")).Ang:Forward()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
	if self.CanExplode == true && self:Health() <= (self:GetMaxHealth() / 1.5) && self.VJ_IsBeingControlled == false or self.VJ_IsBeingControlled == true && self.VJ_TheController:KeyDown(IN_DUCK) && self.Explosive == false then
		self.HasHealthRegeneration = false
		self.AnimTbl_Walk = {ACT_RUN}
		self.AnimTbl_Run = {ACT_RUN}
		self.DeathCorpseModel = {"models/custom/box_test/box_test.mdl"}
		self.AllowedToGib = false
		self.IdleAlwaysWander = true
		self.HasRangeAttack = false
		self.FootStepTimeRun = 0.25
		self.FootStepTimeWalk = 0.25
		self.SoundTbl_Breath = {"npc/tossers/cheese/death_approaches_swiftly.mp3"}
		self.NextSoundTime_Breath = VJ_Set(0.1,0.1)
		self.BreathSoundLevel = 95
		self.Explosive = true
	timer.Simple(0.2,function() if IsValid(self) then
		self.NextSoundTime_Breath = VJ_Set(91,92)
	end end)
	timer.Simple(91,function() if IsValid(self) then
		local d = DamageInfo()
		d:SetDamage(self:GetMaxHealth())
		d:SetAttacker(self)
		d:SetDamageType(DMG_GENERIC) 
		self:TakeDamageInfo(d)
	end end)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_BeforeStartTimer()
	if self.Explosive == true then
		self.GodMode = false
		timer.Simple(0.1,function() if IsValid(self) then
			local d = DamageInfo()
			d:SetDamage(self:GetMaxHealth())
			d:SetAttacker(self)
			d:SetDamageType(DMG_GENERIC) 
			self:TakeDamageInfo(d)
			end
		end)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleMeleeAttacks()
	local randattack_stand = math.random(1,8)

	if randattack_stand == 1 then
		self.AnimTbl_MeleeAttack = {"swing"}
		if self.Gender == 1 then
			self.TimeUntilMeleeAttackDamage = 0.69
		else
			self.TimeUntilMeleeAttackDamage = 0.4
		end
		self.MeleeAttackDamage = math.Rand(15,20)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 2 then
		self.AnimTbl_MeleeAttack = {"swing"}
		if self.Gender == 1 then
			self.TimeUntilMeleeAttackDamage = 0.69
		else
			self.TimeUntilMeleeAttackDamage = 0.4
		end
		self.MeleeAttackDamage = math.Rand(15,20)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 3 then
		self.AnimTbl_MeleeAttack = {"swing"}
		if self.Gender == 1 then
			self.TimeUntilMeleeAttackDamage = 0.69
		else
			self.TimeUntilMeleeAttackDamage = 0.4
		end
		self.MeleeAttackDamage = math.Rand(15,20)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 4 then
		self.AnimTbl_MeleeAttack = {"swing"}
		if self.Gender == 1 then
			self.TimeUntilMeleeAttackDamage = 0.69
		else
			self.TimeUntilMeleeAttackDamage = 0.4
		end
		self.MeleeAttackDamage = math.Rand(15,20)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 5 then
		self.AnimTbl_MeleeAttack = {"throw1"}
		self.TimeUntilMeleeAttackDamage = 0.95
		self.MeleeAttackDamage = math.Rand(20,25)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 6 then
		self.AnimTbl_MeleeAttack = {"ThrowItem"}
		self.TimeUntilMeleeAttackDamage = 1
		self.MeleeAttackDamage = math.Rand(20,25)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = true
		self.MeleeAttackKnockBack_Forward1 = 55
		self.MeleeAttackKnockBack_Forward2 = 60
		self.MeleeAttackKnockBack_Up1 = 100
		self.MeleeAttackKnockBack_Up2 = 100
		
	elseif randattack_stand == 7 then
		self.AnimTbl_MeleeAttack = {"MeleeAttack01"}
		self.TimeUntilMeleeAttackDamage = 0.5
		self.MeleeAttackDamage = math.Rand(15,20)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = true
		self.MeleeAttackKnockBack_Forward1 = 55
		self.MeleeAttackKnockBack_Forward2 = 60
		self.MeleeAttackKnockBack_Up1 = 35
		self.MeleeAttackKnockBack_Up2 = 45

	elseif randattack_stand == 8 then
		self.AnimTbl_MeleeAttack = {"MeleeAttack01"}
		self.TimeUntilMeleeAttackDamage = 0.5
		self.MeleeAttackDamage = math.Rand(15,20)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = true
		self.MeleeAttackKnockBack_Forward1 = 55
		self.MeleeAttackKnockBack_Forward2 = 60
		self.MeleeAttackKnockBack_Up1 = 35
		self.MeleeAttackKnockBack_Up2 = 45
		
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackCode_GetShootPos(projectile)
	return self:CalculateProjectile("Curve", self:GetAttachment(self:LookupAttachment(self.RangeUseAttachmentForPosID)).Pos, self:GetEnemy():GetPos() + self:GetEnemy():OBBCenter(), 1500)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Controller_IntMsg(ply, controlEnt)
	ply:ChatPrint("CROUCH - Enter Kamikaze Mode")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnKilled(dmginfo,hitgroup)
	if self.Explosive == true then
	local effectdata = EffectData()
		effectdata:SetOrigin(self:GetPos())
		//effectdata:SetScale( 500 )
		//util.Effect( "HelicopterMegaBomb", effectdata )
		//util.Effect( "ThumperDust", effectdata )
		-- util.Effect( "Explosion", effectdata )
		//util.Effect( "VJ_Small_Explosion1", effectdata )
		VJ_EmitSound(self,"fx/explosion2.mp3",100)
		VJ_EmitSound(self,"fx/explosion2.mp3",70)
		VJ_EmitSound(self,"fx/explosion2.mp3",70)
		ParticleEffect("vj_explosion2",self:GetPos() + self:GetUp()*48 + self:GetForward()*1,Angle(0,0,0),nil) 
		ParticleEffect("vj_explosion1",self:GetPos() + self:GetUp()*15,Angle(0,0,0),nil)
		ParticleEffect("vj_explosionfire2",self:GetPos() + self:GetUp()*20,Angle(0,0,0),nil)
		ParticleEffect("vj_explosionfire1",self:GetPos() + self:GetUp()*20,Angle(0,0,0),nil)
		util.VJ_SphereDamage(self,self,self:GetPos(),150,math.random(65,80),DMG_BLAST,true,true,{Force=20})
		-- for k,v in ipairs(ents.FindInSphere(self:GetPos(),150)) do
			-- v:TakeDamage(math.random(65,80),self,self)
		-- end
		util.ScreenShake(self:GetPos(),44,600,1.5,1000)
		util.ScreenShake(self:GetPos(),44,600,1.5,1000)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetUpGibesOnDeath(dmginfo, hitgroup)
	self.HasDeathSounds = false
	if self.HasGibDeathParticles == true then
		local effectBlood = EffectData()
		effectBlood:SetOrigin(self:GetPos() + self:OBBCenter())
		effectBlood:SetColor(VJ_Color2Byte(Color(42,110,198)))
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
	self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/mgib_01.mdl",{BloodDecal="VJ_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/mgib_02.mdl",{BloodDecal="VJ_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/mgib_03.mdl",{BloodDecal="VJ_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/mgib_04.mdl",{BloodDecal="VJ_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,50))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_rib.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_rib.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_scapula.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_spine.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/grub_nugget_large.mdl",{BloodDecal="VJ_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/grub_nugget_large.mdl",{BloodDecal="VJ_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,45))})
	self:CreateGibEntity("obj_vj_gib","models/grub_nugget_large.mdl",{BloodDecal="VJ_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,45))})
	self:CreateGibEntity("obj_vj_gib","models/grub_nugget_large.mdl",{BloodDecal="VJ_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,60))})
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