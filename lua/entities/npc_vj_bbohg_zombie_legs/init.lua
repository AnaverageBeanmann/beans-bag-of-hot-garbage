AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/bbohg/classic_dew.mdl"} 
ENT.StartHealth = 15
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
ENT.BloodPoolSize = "Small" -- What's the size of the blood pool? | Sizes: "Normal" || "Small" || "Tiny"
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.CanFlinch = 0
ENT.AnimTbl_Flinch = {"cower"}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.DeathCorpseModel = {"models/zombie_new/classic_new_legs.mdl"}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.MeleeAttackDamage = math.Rand(1,5)
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.AnimTbl_MeleeAttack = {"vjseq_d2_coast_03_antlion_shove"}
ENT.MeleeAttackAnimationDecreaseLengthAmount = 0.6
ENT.MeleeAttackDistance = 40
ENT.MeleeAttackDamageDistance = 60
ENT.MeleeAttackAngleRadius = 70
ENT.MeleeAttackDamageAngleRadius = 70
ENT.TimeUntilMeleeAttackDamage = 1.05
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.FootStepTimeRun = 0.25
ENT.FootStepTimeWalk = 0.5

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 95

ENT.IdleDialogueDistance = 175

ENT.ZombType = 0
-- 0 = Refugee / Civvie
-- 1 = Rebel
-- 2 = Medic
-- 3 = Civil Protection
ENT.WhoNeedsArmsWithLegsLikeThese = false
---------------------------------------------------------------------------------------------------------------------------------------------
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"npc/zombie/foot1.wav","npc/zombie/foot2.wav","npc/zombie/foot3.wav"}
ENT.SoundTbl_Idle = {}
ENT.SoundTbl_CombatIdle = {}
ENT.SoundTbl_Alert = {}
ENT.SoundTbl_BeforeMeleeAttack = {}
ENT.SoundTbl_MeleeAttack = {"physics/body/body_medium_impact_hard1.wav",
	"physics/body/body_medium_impact_hard2.wav",
	"physics/body/body_medium_impact_hard3.wav",
	"physics/body/body_medium_impact_hard4.wav",
	"physics/body/body_medium_impact_hard5.wav",
	"physics/body/body_medium_impact_hard6.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"weapons/iceaxe/iceaxe_swing1.wav"}
ENT.SoundTbl_BeforeRangeAttack = {}
ENT.SoundTbl_OnKilledEnemy = {}
ENT.SoundTbl_AllyDeath = {}
ENT.SoundTbl_Pain = {}
ENT.SoundTbl_Death = {}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()
	local SpawnZombType = math.random(1,30)
	if SpawnZombType == 1 || SpawnZombType == 2 || SpawnZombType == 3 || SpawnZombType == 4 || SpawnZombType == 5 || SpawnZombType == 6 || SpawnZombType == 7 || SpawnZombType == 8 || SpawnZombType == 9 || SpawnZombType == 10 then
		self.ZombType = 1
		self.StartHealth = 20
	elseif SpawnZombType == 11 || SpawnZombType == 12 || SpawnZombType == 13 || SpawnZombType == 14 || SpawnZombType == 15 then
		self.ZombType = 2
		self.StartHealth = 20
	elseif SpawnZombType == 16 || SpawnZombType == 17 || SpawnZombType == 18 || SpawnZombType == 19 || SpawnZombType == 20 then
		self.ZombType = 3
		self.StartHealth = 25
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()

	self:SetMaterial("hud/killicons/default")
	self:DrawShadow(false)
	self:SetCollisionBounds(Vector(11, 11, 40), Vector(-11, -11, 0))
	
	self.TheModel = ents.Create("prop_dynamic")
	self.TheModel:SetModel("models/zombie_new/classic_new_legs.mdl")
	self.TheModel:SetLocalPos(self:GetPos())
	//self.TheModel:SetPos(self:GetPos())
	self.TheModel:SetOwner(self)
	self.TheModel:SetParent(self)
	self.TheModel:SetLocalAngles(Angle(-120,45,90))
	self.TheModel:Fire("SetParentAttachmentMaintainOffset","Blood_Left")
	self.TheModel:Fire("SetParentAttachment","Blood_Left")
	self.TheModel:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
	self.TheModel:Spawn()
	self.TheModel:Activate()
	self.TheModel:SetSolid(SOLID_NONE)
	self.TheModel:AddEffects(EF_BONEMERGE)
	-- this method does work but it impacts performance (stinky)

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
	if self.ZombType == 1 then
		self.TheModel:SetSkin(1)
		self.DeathCorpseSkin = 1
	elseif self.ZombType == 2 then
		self.TheModel:SetSkin(2)
		self.DeathCorpseSkin = 2
	elseif self.ZombType == 3 then
		self.TheModel:SetSkin(3)
		self.DeathCorpseSkin = 3
	end
	timer.Simple(0.1,function() if IsValid(self) then
		self:RemoveAllDecals()
	end end)
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetSightDirection()
	return self:GetAttachment(self:LookupAttachment("maw")).Ang:Forward()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleMeleeAttacks()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo, hitgroup)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_AfterDamage(dmginfo, hitgroup)
	timer.Simple(0.1,function() if IsValid(self) then
		self:RemoveAllDecals()
	end end)
	-- jank but oh well
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo, hitgroup)
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
	GetCorpse:SetMaterial("")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetUpGibesOnDeath(dmginfo, hitgroup)
	self.HasDeathSounds = false
	if self.HasGibDeathParticles == true then
		local effectBlood = EffectData()
		effectBlood:SetOrigin(self:GetPos() + self:OBBCenter())
		effectBlood:SetColor(VJ_Color2Byte(Color(130,19,10)))
		effectBlood:SetScale(75)
		util.Effect("VJ_Blood1",effectBlood)
		
		local bloodspray = EffectData()
		bloodspray:SetOrigin(self:GetPos())
		bloodspray:SetScale(8)
		bloodspray:SetFlags(3)
		bloodspray:SetColor(0)
		util.Effect("bloodspray",bloodspray)
		util.Effect("bloodspray",bloodspray)
	end
	
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/sgib_03.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,25))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/sgib_03.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,25))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/sgib_01.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,25))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/sgib_01.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,25))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/mgib_07.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,25))})
	-- self:CreateGibEntity("obj_vj_gib","models/gibs/humans/mgib_02.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	-- self:CreateGibEntity("obj_vj_gib","models/gibs/humans/mgib_03.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	-- self:CreateGibEntity("obj_vj_gib","models/gibs/humans/mgib_04.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	
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