AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/bbohg/bogeyman.mdl"} 
ENT.StartHealth = 750
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
ENT.HasWorldShakeOnMove = true
ENT.WorldShakeOnMoveAmplitude = 1
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.DeathCorpseModel = {"models/bbohg/bogeyman_ragdoll.mdl"}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = {ACT_FLINCH}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.MeleeAttackDamage = math.Rand(65,70)
ENT.MeleeAttackDamageType = DMG_CRUSH
ENT.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1}
ENT.MeleeAttackDistance = 75
ENT.MeleeAttackDamageDistance = 110
ENT.MeleeAttackAngleRadius = 70
ENT.MeleeAttackDamageAngleRadius = 70
ENT.TimeUntilMeleeAttackDamage = 1.7
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.FootStepTimeRun = 0.25
ENT.FootStepTimeWalk = 0.5

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 95

ENT.IdleSoundLevel = 60
ENT.CombatIdleSoundLevel = 70
ENT.FootStepSoundLevel = 75
ENT.MeleeAttackSoundLevel = 80
ENT.ExtraMeleeAttackSoundLevel = 80
ENT.MeleeAttackMissSoundLevel = 80
ENT.DisableFootStepSoundTimer = true
ENT.HasExtraMeleeAttackSounds = true -- Set to true to use the extra melee attack sounds
---------------------------------------------------------------------------------------------------------------------------------------------
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"npc/zombknees/bogeyman/step_1.mp3",
	"npc/zombknees/bogeyman/step_2.mp3",
	"npc/zombknees/bogeyman/step_3.mp3",
	"npc/zombknees/bogeyman/step_4.mp3",
	"npc/zombknees/bogeyman/step_5.mp3",
	"npc/zombknees/bogeyman/step_6.mp3"}
ENT.SoundTbl_Idle = {"npc/zombknees/bogeyman/idle1.mp3",
	"npc/zombknees/bogeyman/idle2.mp3"}
ENT.SoundTbl_IdleDialogue = {}
ENT.SoundTbl_IdleDialogueAnswer = {}
ENT.SoundTbl_CombatIdle = {}
ENT.SoundTbl_Investigate = {}
ENT.SoundTbl_LostEnemy = {}
ENT.SoundTbl_Alert = {"npc/zombknees/bogeyman/alert1.mp3",
	"npc/zombknees/bogeyman/alert2.mp3",
	"npc/zombknees/bogeyman/alert3.mp3"}
ENT.SoundTbl_CallForHelp = {}
ENT.SoundTbl_BeforeMeleeAttack = {}
ENT.SoundTbl_MeleeAttack = {"npc/zombknees/bogeyman/impact1.mp3",
	"npc/zombknees/bogeyman/impact2.mp3"}
ENT.SoundTbl_MeleeAttackExtra = {"npc/zombknees/bogeyman/New folder/concrete_break2.wav",
	"npc/zombknees/bogeyman/New folder/concrete_break3.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"npc/zombknees/bogeyman/impact1.mp3",
	"npc/zombknees/bogeyman/impact2.mp3"}
ENT.SoundTbl_BeforeRangeAttack = {}
ENT.SoundTbl_OnKilledEnemy = {}
ENT.SoundTbl_AllyDeath = {}
ENT.SoundTbl_Pain = {}
ENT.SoundTbl_Death = {"npc/zombknees/bogeyman/alert1.mp3",
	"npc/zombknees/bogeyman/alert2.mp3",
	"npc/zombknees/bogeyman/alert3.mp3"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	if GetConVarNumber("vj_BBOHG_Gibs") == 0 then
		self.AllowedToGib = false
	end
	if GetConVarNumber("vj_BBOHG_NoGodsNoMasters") == 1 then
		self.VJ_NPC_Class = {"CLASS_BBOHG"}
		self.FriendsWithAllPlayerAllies = false
	end
	self:SetCollisionBounds(Vector(15, 11, 90), Vector(-15, -11, 0))
	self:CapabilitiesAdd(bit.bor(CAP_MOVE_JUMP))
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------
-- function ENT:GetSightDirection()
	-- return self:GetAttachment(self:LookupAttachment("eyes")).Ang:Forward()
-- end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAlert(ent)
	if math.random(1,3) == 1 then
		self.SoundTbl_Alert = {"npc/zombknees/bogeyman/idle1.mp3",
	"npc/zombknees/bogeyman/idle2.mp3"}
		self:VJ_ACT_PLAYACTIVITY("extra", true, false, true)
	else
		self.SoundTbl_Alert = {"npc/zombknees/bogeyman/alert1.mp3",
	"npc/zombknees/bogeyman/alert2.mp3",
	"npc/zombknees/bogeyman/alert3.mp3"}
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleMeleeAttacks()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_BeforeStartTimer(seed)
	self.CanFlinch = 0
	timer.Simple(0.1,function() if IsValid(self) then
		VJ_EmitSound(self,{"physics/nearmiss/whoosh_huge2.wav"},75,math.random(100,90))
	end end)
	
	timer.Simple(0.25,function() if IsValid(self) then
		VJ_EmitSound(self,{"npc/zombknees/bogeyman/New folder/New folder/raiseweapon1.mp3",
		"npc/zombknees/bogeyman/New folder/New folder/raiseweapon2.mp3",
		"npc/zombknees/bogeyman/New folder/New folder/raiseweapon3.mp3",
		"npc/zombknees/bogeyman/New folder/New folder/raiseweapon4.mp3"},75,math.random(97,100))
	end end)
	
	timer.Simple(1,function() if IsValid(self) then
		self.MeleeAttackAnimationFaceEnemy = false
        VJ_EmitSound(self,{"npc/zombknees/bogeyman/New folder/New folder/swing1.mp3",
		"npc/zombknees/bogeyman/New folder/New folder/swing2.mp3",
		"npc/zombknees/bogeyman/New folder/New folder/swing3.mp3",
		"npc/zombknees/bogeyman/New folder/New folder/swing4.mp3"},75,math.random(97,100))
	end end)
	
	timer.Simple(1.4,function() if IsValid(self) then
        VJ_EmitSound(self,{"npc/zombknees/bogeyman/New folder/New folder/woosh.mp3"},75,math.random(120,125))
	end end)
	
	timer.Simple(1.7,function() if IsValid(self) then
		local pos = self:LocalToWorld(Vector(100,0,0))
		ParticleEffect("strider_impale_ground",pos,Angle(0,0,0),nil)
		ParticleEffect("strider_cannon_impact",pos,Angle(0,0,0),nil)
		util.VJ_SphereDamage(self, self, pos, 100, 20, DMG_PHYSGUN, true, true, {DisableVisibilityCheck=true, Force=8110})
		util.ScreenShake(pos, 300, 500, 1.6, 1200)
		VJ_EmitSound(self,{"ambient/machines/thumper_dust.wav"},100,math.random(100,90))
		util.ScreenShake(self:GetPos(), 100, 200, 3, 500)
		local effectData = EffectData()
		effectData:SetOrigin(self:GetPos()+self:GetForward()*100)
		effectData:SetScale(500)
		util.Effect("ThumperDust", effectData)
		
	self.InvestigateSoundDistance = 0
	self.DisableFindEnemy = true
	end end)
	-- timer.Simple(1.7,function() if IsValid(self) then
		-- self.CanFlinch = 1
	-- end end)
	
	timer.Simple(3.35,function() if IsValid(self) then
        VJ_EmitSound(self,{"npc/zombknees/bogeyman/New folder/New folder/lowerweapon1.mp3",
		"npc/zombknees/bogeyman/New folder/New folder/lowerweapon2.mp3",
		"npc/zombknees/bogeyman/New folder/New folder/lowerweapon3.mp3",
		"npc/zombknees/bogeyman/New folder/New folder/lowerweapon4.mp3"},75,math.random(97,100))
	end end)
	
	timer.Simple(4,function() if IsValid(self) then
		self.MeleeAttackAnimationFaceEnemy = true
		self.InvestigateSoundDistance = 9
		self.DisableFindEnemy = false
		self.CanFlinch = 1
	end end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnResetEnemy()
	-- if math.random(1,3) == 1 && !self:IsBusy() then
		-- self:VJ_ACT_PLAYACTIVITY("extra", true, false, false)
	-- end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialKilled(dmginfo, hitgroup)
    self:AddFlags(FL_NOTARGET)
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