AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/bbohg/zombie_soldier_new.mdl"} 
ENT.StartHealth = 100
ENT.VJC_Data = {
	CameraMode = 1,
	ThirdP_Offset = Vector(40, 20, -50),
	FirstP_Bone = "ValveBiped.Bip01_Spine4",
	FirstP_Offset = Vector(0, 0, 5),
}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.BloodColor = "Red"
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = {"flinchsmall","flinchbig"}
ENT.HitGroupFlinching_Values = {
{HitGroup = {HITGROUP_HEAD}, Animation = {"vjseq_flinchhead"}}, 
{HitGroup = {HITGROUP_STOMACH}, Animation = {"vjseq_flinchgut"}}, 
{HitGroup = {HITGROUP_CHEST}, Animation = {"vjseq_flinchchest"}}, 
{HitGroup = {HITGROUP_LEFTARM}, Animation = {"vjseq_flinchleft"}}, 
{HitGroup = {HITGROUP_RIGHTARM}, Animation = {"vjseq_flinchright"}}}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasItemDropsOnDeath = false
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.MeleeAttackDamage = math.Rand(10,15)
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.AnimTbl_MeleeAttack = {"melee_gunhit"}
ENT.MeleeAttackDistance = 40
ENT.MeleeAttackDamageDistance = 60
ENT.MeleeAttackAngleRadius = 70
ENT.MeleeAttackDamageAngleRadius = 70
ENT.TimeUntilMeleeAttackDamage = 0.45
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.WeaponSpread = 2
ENT.CanUseSecondaryOnWeaponAttack = false
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasGrenadeAttack = true
ENT.GrenadeAttackEntity = "npc_grenade_frag" -- The entity that the SNPC throws | Half Life 2 Grenade: "npc_grenade_frag"
ENT.GrenadeAttackAttachment = "grenade_attachment" -- The attachment that the grenade will spawn at | false = Custom position
ENT.AnimTbl_GrenadeAttack = {"grenThrow"}
ENT.ThrowGrenadeChance = 1 -- Chance that it will throw the grenade | Set to 1 to throw all the time
ENT.GrenadeAttackThrowDistanceClose = 1
ENT.TimeUntilGrenadeIsReleased = 0.75
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.FootStepTimeRun = 0.25
ENT.FootStepTimeWalk = 0.5

-- ENT.IdleSoundChance = 15
-- ENT.CombatIdleSoundChance = 15

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 95
-- ENT.DeathSoundPitch = VJ_Set(135, 150)

ENT.IdleDialogueDistance = 175

ENT.HasCrab = false
ENT.ZombType = 0
-- 0 = Standard
-- 1 = Shotgunner
-- 2 = Nova Prospekt
-- 3 = Elite
ENT.CanChangeGrenadeAnimation = true
ENT.DoGrenDropVel = 0
-- 0 = Over-Hand Throw
-- 1 = Under-Hand Throw
-- 2 = Dropping on Ground
ENT.ExtraCrispy = false
ENT.WhatDoCrab = 0
-- 0 = Nothing
-- 1 = Crab Ragdoll
-- 2 = Live Crab
---------------------------------------------------------------------------------------------------------------------------------------------
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"npc/zombknees/zombine/gear1.wav",
	"npc/zombknees/zombine/gear2.wav",
	"npc/zombknees/zombine/gear3.wav"}
ENT.SoundTbl_Idle = {"npc/zombknees/zombine/zombine_idle1.wav",
	"npc/zombknees/zombine/zombine_idle2.wav",
	"npc/zombknees/zombine/zombine_idle3.wav",
	"npc/zombknees/zombine/zombine_idle4.wav"}
ENT.SoundTbl_IdleDialogue = {}
ENT.SoundTbl_IdleDialogueAnswer = {}
ENT.SoundTbl_CombatIdle = {"npc/zombknees/zombine/zombine_idle1.wav",
	"npc/zombknees/zombine/zombine_idle2.wav",
	"npc/zombknees/zombine/zombine_idle3.wav",
	"npc/zombknees/zombine/zombine_idle4.wav"}
ENT.SoundTbl_OnReceiveOrder = {}
ENT.SoundTbl_FollowPlayer = {}
ENT.SoundTbl_UnFollowPlayer = {}
ENT.SoundTbl_MoveOutOfPlayersWay = {}
ENT.SoundTbl_OnPlayerSight = {}
ENT.SoundTbl_Investigate = {}
ENT.SoundTbl_LostEnemy = {}
ENT.SoundTbl_Alert = {"npc/zombknees/zombine/zombine_alert1.wav",
	"npc/zombknees/zombine/zombine_alert2.wav",
	"npc/zombknees/zombine/zombine_alert3.wav",
	"npc/zombknees/zombine/zombine_alert4.wav",
	"npc/zombknees/zombine/zombine_alert5.wav",
	"npc/zombknees/zombine/zombine_alert6.wav",
	"npc/zombknees/zombine/zombine_alert7.wav"}
ENT.SoundTbl_CallForHelp = {}
ENT.SoundTbl_BecomeEnemyToPlayer = {}
ENT.SoundTbl_Suppressing = {"npc/zombknees/zombine/zombine_charge1.wav",
	"npc/zombknees/zombine/zombine_charge2.wav"}
ENT.SoundTbl_WeaponReload = {"npc/zombknees/zombine/zombine_charge1.wav",
	"npc/zombknees/zombine/zombine_charge2.wav"}
ENT.SoundTbl_MeleeAttack = {"physics/body/body_medium_impact_hard1.wav",
	"physics/body/body_medium_impact_hard2.wav",
	"physics/body/body_medium_impact_hard3.wav",
	"physics/body/body_medium_impact_hard4.wav",
	"physics/body/body_medium_impact_hard5.wav",
	"physics/body/body_medium_impact_hard6.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"weapons/iceaxe/iceaxe_swing1.wav"}
ENT.SoundTbl_GrenadeAttack = {"npc/zombknees/zombine/zombine_readygrenade1.wav",
	"npc/zombknees/zombine/zombine_readygrenade2.wav"}
ENT.SoundTbl_OnGrenadeSight = {"npc/zombknees/zombine/zombine_readygrenade1.wav",
	"npc/zombknees/zombine/zombine_readygrenade2.wav"}
ENT.SoundTbl_OnKilledEnemy = {}
ENT.SoundTbl_AllyDeath = {}
ENT.SoundTbl_Pain = {"npc/zombknees/zombine/zombine_pain1.wav",
	"npc/zombknees/zombine/zombine_pain2.wav",
	"npc/zombknees/zombine/zombine_pain3.wav",
	"npc/zombknees/zombine/zombine_pain4.wav"}
ENT.SoundTbl_DamageByPlayer = {}
ENT.SoundTbl_Death = {"npc/zombknees/zombine/zombine_die1.wav",
	"npc/zombknees/zombine/zombine_die2.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()
	if math.random(1,3) == 1 then
		self.HasCrab = true
	end
	local SpawnZombType = math.random(1,30)
	if SpawnZombType == 1 || SpawnZombType == 2 || SpawnZombType == 3 || SpawnZombType == 4 || SpawnZombType == 5 || SpawnZombType == 6 || SpawnZombType == 7 || SpawnZombType == 8 || SpawnZombType == 9 || SpawnZombType == 10 then
		self.ZombType = 1
	elseif SpawnZombType == 11 || SpawnZombType == 12 || SpawnZombType == 13 || SpawnZombType == 14 || SpawnZombType == 15 then
		self.ZombType = 2
	elseif SpawnZombType == 16 || SpawnZombType == 17 || SpawnZombType == 18 || SpawnZombType == 19 || SpawnZombType == 20 then
		self.ZombType = 3
		self.StartHealth = 125
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
	-- self.HasItemDropsOnDeath = true
	-- self.ItemDropsOnDeathChance = 3
	if math.random(1,3) == 1 then
		self:Give("weapon_vj_ar2")
		-- self.ItemDropsOnDeath_EntityList = {}
	else
		self:Give("weapon_vj_smg1")
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
		self.SoundTbl_OnGrenadeSight = {"npc/zombknees/xom/seegren.mp3"}
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
		self:Give("weapon_vj_spas12")
		self:SetSkin(1)
	elseif self.ZombType == 2 then
		self:SetSkin(2)
		if math.random(1,3) == 1 then
			self:Give("weapon_vj_spas12")
		else
		end
	elseif self.ZombType == 3 then
		self:Give("weapon_vj_ar2")
		self:SetSkin(3)
		self.CanUseSecondaryOnWeaponAttack = true
	end
	
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetSightDirection()
	return self:GetAttachment(self:LookupAttachment("eyes")).Ang:Forward()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
	if self.CanChangeGrenadeAnimation == false then return end
	if self:GetEnemy() != nil then
	local EnemyDistance = self:VJ_GetNearestPointToEntityDistance(self:GetEnemy(),self:GetPos():Distance(self:GetEnemy():GetPos()))
	if EnemyDistance <= 100 then
		self.DoGrenDropVel = 2
		self.AnimTbl_GrenadeAttack = {"grenPlace"}
		self.TimeUntilGrenadeIsReleased = 0.75
	elseif EnemyDistance <= 500 then
		self.DoGrenDropVel = 1
		self.AnimTbl_GrenadeAttack = {"grenDrop"}
		self.TimeUntilGrenadeIsReleased = 0.8
	else
		self.DoGrenDropVel = 0
		self.AnimTbl_GrenadeAttack = {"grenThrow"}
		self.TimeUntilGrenadeIsReleased = 0.75
	end
	end
end 
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnGrenadeAttack_ThrowVelocity(grEnt, grTargetPos)
	if self.DoGrenDropVel == 2 then
		return (grTargetPos - grEnt:GetPos()) + (self:GetUp()*5 + self:GetForward()*5 + self:GetRight()*math.Rand(-5, 5))
	end
	if self.DoGrenDropVel == 1 then
		return (grTargetPos - grEnt:GetPos()) + (self:GetUp()*100 + self:GetForward()*250 + self:GetRight()*math.Rand(-10, 10))
	end
	if self.DoGrenDropVel == 0 then
		return (grTargetPos - grEnt:GetPos()) + (self:GetUp()*200 + self:GetForward()*500 + self:GetRight()*math.Rand(-20, 20))
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo, hitgroup)
	if hitgroup == HITGROUP_HEAD && self.HasCrab == false then
		dmginfo:ScaleDamage(0)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo, hitgroup)
	if dmginfo:IsDamageType(DMG_BURN) or dmginfo:IsDamageType(DMG_SLOWBURN) then
	self.ExtraCrispy = true
	end
	local DeathCrabThing = math.random(1,3)
	if DeathCrabThing == 2 then
		self.WhatDoCrab = 1
	elseif DeathCrabThing == 3 then
		self.WhatDoCrab = 2
		self.SoundTbl_Death = {"npc/zombknees/zombine/zombine_die1.wav",
		"npc/zombknees/zombine/zombine_die2.wav"}
	end
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
			self.crab:SetPos(self:GetAttachment(self:LookupAttachment("headcrab")).Pos or self:EyePos())
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
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_rib.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_rib.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_scapula.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_spine.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/lung_gib.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/liver_gib.mdl",{BloodDecal="VJ_Blood_Red",Pos=self:LocalToWorld(Vector(0,0,45))})
	
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