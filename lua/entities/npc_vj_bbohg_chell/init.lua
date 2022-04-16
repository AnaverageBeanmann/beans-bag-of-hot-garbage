AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/player/errolliamp/p2_chell_new.mdl"} 
ENT.StartHealth = 100
ENT.VJC_Data = {
	CameraMode = 1,
	ThirdP_Offset = Vector(40, 20, -50),
	FirstP_Bone = "ValveBiped.Bip01_Spine4",
	FirstP_Offset = Vector(0, 0, 5),
}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_CHELL"}
ENT.FriendsWithAllPlayerAllies = false
ENT.BecomeEnemyToPlayer = true
ENT.BecomeEnemyToPlayerLevel = 3
ENT.HasOnPlayerSight = true
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.BloodColor = "Red"
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = {"cower"}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasItemDropsOnDeath = false
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.MeleeAttackDamage = math.Rand(10,15)
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.AnimTbl_MeleeAttack = {"vjseq_MeleeAttack01"}
ENT.MeleeAttackDistance = 35
ENT.MeleeAttackDamageDistance = 50
ENT.MeleeAttackAngleRadius = 70
ENT.MeleeAttackDamageAngleRadius = 70
ENT.TimeUntilMeleeAttackDamage = 0.6
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasGrenadeAttack = true
ENT.AnimTbl_GrenadeAttack = {"ThrowItem"}
ENT.TimeUntilGrenadeIsReleased = 1.05
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.FootStepTimeRun = 0.25
ENT.FootStepTimeWalk = 0.5

-- ENT.IdleSoundChance = 15
-- ENT.CombatIdleSoundChance = 15

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 95
-- ENT.DeathSoundPitch = VJ_Set(135, 150)

ENT.IdleDialogueDistance = 175
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
ENT.SoundTbl_Idle = {"npc/chell/idle (1).wav",
	"npc/chell/idle (2).wav",
	"npc/chell/idle (3).wav",
	"npc/chell/idle (4).wav",
	"npc/chell/idle (5).wav",
	"npc/chell/idle (6).wav",
	"npc/chell/idle (7).wav"}
ENT.SoundTbl_IdleDialogue = {"npc/chell/question (1).wav",
	"npc/chell/question (2).wav",
	"npc/chell/question (3).wav",
	"npc/chell/question (4).wav"}
ENT.SoundTbl_IdleDialogueAnswer = {"npc/chell/ans (1).wav",
	"npc/chell/ans (2).wav",
	"npc/chell/ans (3).wav",
	"npc/chell/ans (4).wav",
	"npc/chell/ans (5).wav",
	"npc/chell/ans (6).wav"}
ENT.SoundTbl_CombatIdle = {"npc/chell/cidle (1).wav",
	"npc/chell/cidle (2).wav",
	"npc/chell/cidle (3).wav",
	"npc/chell/cidle (4).wav",
	"npc/chell/cidle (5).wav",
	"npc/chell/cidle (6).wav",
	"npc/chell/cidle (7).wav",
	"npc/chell/cidle (8).wav",
	"npc/chell/cidle (9).wav",
	"npc/chell/cidle (10).wav",
	"npc/chell/cidle (11).wav",
	"npc/chell/cidle (12).wav",
	"npc/chell/cidle (13).wav"}
ENT.SoundTbl_OnReceiveOrder = {}
ENT.SoundTbl_FollowPlayer = {}
ENT.SoundTbl_UnFollowPlayer = {}
ENT.SoundTbl_MoveOutOfPlayersWay = {}
ENT.SoundTbl_OnPlayerSight = {}
ENT.SoundTbl_Investigate = {"npc/chell/inv (1).wav",
	"npc/chell/inv (2).wav",
	"npc/chell/inv (3).wav",
	"npc/chell/inv (4).wav"}
ENT.SoundTbl_LostEnemy = {}
ENT.SoundTbl_Alert = {"npc/chell/alert (1).wav",
	"npc/chell/alert (2).wav",
	"npc/chell/alert (3).wav",
	"npc/chell/alert (4).wav",
	"npc/chell/alert (5).wav",
	"npc/chell/alert (6).wav",
	"npc/chell/alert (7).wav",
	"npc/chell/alert (8).wav",
	"npc/chell/alert (9).wav"}
ENT.SoundTbl_CallForHelp = {}
ENT.SoundTbl_BecomeEnemyToPlayer = {}
ENT.SoundTbl_Suppressing = {}
ENT.SoundTbl_WeaponReload = {"npc/chell/reloading (1).wav",
	"npc/chell/reloading (2).wav",
	"npc/chell/reloading (3).wav",
	"npc/chell/reloading (4).wav",
	"npc/chell/reloading (5).wav",
	"npc/chell/reloading (6).wav",
	"npc/chell/reloading (7).wav",
	"npc/chell/reloading (8).wav",
	"npc/chell/reloading (9).wav"}
ENT.SoundTbl_MeleeAttack = {"physics/body/body_medium_impact_hard1.wav",
	"physics/body/body_medium_impact_hard2.wav",
	"physics/body/body_medium_impact_hard3.wav",
	"physics/body/body_medium_impact_hard4.wav",
	"physics/body/body_medium_impact_hard5.wav",
	"physics/body/body_medium_impact_hard6.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"weapons/iceaxe/iceaxe_swing1.wav"}
ENT.SoundTbl_GrenadeAttack = {"npc/chell/gren (1).wav",
	"npc/chell/gren (2).wav",
	"npc/chell/gren (3).wav",
	"npc/chell/gren (4).wav",
	"npc/chell/gren (5).wav"}
ENT.SoundTbl_OnGrenadeSight = {"npc/chell/seegren1.wav",
	"npc/chell/seegren2.wav",
	"npc/chell/seegren3.wav",
	"npc/chell/seegren4.wav",
	"npc/chell/seegren5.wav"}
ENT.SoundTbl_OnKilledEnemy = {"npc/chell/kill (1).wav",
	"npc/chell/kill (2).wav",
	"npc/chell/kill (3).wav",
	"npc/chell/kill (4).wav",
	"npc/chell/kill (5).wav",
	"npc/chell/kill (6).wav",
	"npc/chell/kill (7).wav",
	"npc/chell/kill (8).wav"}
ENT.SoundTbl_AllyDeath = {}
ENT.SoundTbl_Pain = {"npc/chell/pain (1).wav",
	"npc/chell/pain (2).wav",
	"npc/chell/pain (3).wav",
	"npc/chell/pain (4).wav"}
ENT.SoundTbl_DamageByPlayer = {}
ENT.SoundTbl_Death = {"npc/chell/death (1).wav",
	"npc/chell/death (2).wav",
	"npc/chell/death (3).wav",
	"npc/chell/death (4).wav",
	"npc/chell/death (5).wav",
	"npc/chell/death (6).wav",
	"npc/chell/death (7).wav",
	"npc/chell/death (8).wav",
	"npc/chell/death (9).wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	if GetConVarNumber("vj_BBOHG_Gibs") == 0 then
		self.AllowedToGib = false
	end
	if GetConVarNumber("vj_BBOHG_NoGodsNoMasters") == 1 then
		self.VJ_NPC_Class = {"CLASS_BBOHG"}
		self.FriendsWithAllPlayerAllies = false
	end
	self:Give("weapon_vj_spas12")
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetSightDirection()
	return self:GetAttachment(self:LookupAttachment("eyes")).Ang:Forward()
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