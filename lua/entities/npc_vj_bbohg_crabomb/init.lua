AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/headcrabblack.mdl"} 
ENT.StartHealth = 25
ENT.HullType = HULL_TINY
ENT.VJC_Data = {
	CameraMode = 1, 
	ThirdP_Offset = Vector(10, 20, -5), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "ValveBiped.Bip01_Head1", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.BloodColor = "Yellow"
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.CanFlinch = 0
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.GibOnDeathDamagesTable = {"All"} -- Damages that it gibs from | "UseDefault" = Uses default damage types | "All" = Gib from any damage
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasMeleeAttack = false
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasLeapAttack = true
ENT.AnimTbl_LeapAttack = {ACT_RANGE_ATTACK1}
ENT.LeapDistance = 300
ENT.LeapToMeleeDistance = 0
ENT.TimeUntilLeapAttackDamage = 1.5
ENT.NextLeapAttackTime = 1.4
ENT.NextAnyAttackTime_Leap = 0.85
ENT.TimeUntilLeapAttackVelocity = 1.5
ENT.LeapAttackVelocityForward = 70
ENT.LeapAttackVelocityUp = 200
ENT.LeapAttackDamage = 8
ENT.LeapAttackExtraTimers = {1.6,1.7,1.8,1.9,2,2.1,2.2,2.3}
ENT.StopLeapAttackAfterFirstHit = true
ENT.LeapAttackDamageDistance = 40
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.FootStepTimeRun = 0.25
ENT.FootStepTimeWalk = 0.5

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 90

ENT.GottaGoFast = false
---------------------------------------------------------------------------------------------------------------------------------------------
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {}
ENT.SoundTbl_Idle = {}
ENT.SoundTbl_CombatIdle = {}
ENT.SoundTbl_Alert = {"npc/zombknees/crabomb/bobomb.mp3"}
ENT.SoundTbl_BeforeMeleeAttack = {}
ENT.SoundTbl_MeleeAttack = {}
ENT.SoundTbl_MeleeAttackMiss = {}
ENT.SoundTbl_BeforeRangeAttack = {}
-- ENT.SoundTbl_BeforeLeapAttack = {"npc/zombknees/bobomb.mp3"}
ENT.SoundTbl_LeapAttackJump = {"npc/headcrab_poison/ph_jump1.wav",
	"npc/headcrab_poison/ph_jump2.wav",
	"npc/headcrab_poison/ph_jump3.wav"}
ENT.SoundTbl_LeapAttackDamage = {"physics/body/body_medium_impact_hard1.wav",
	"physics/body/body_medium_impact_hard2.wav",
	"physics/body/body_medium_impact_hard3.wav",
	"physics/body/body_medium_impact_hard4.wav",
	"physics/body/body_medium_impact_hard5.wav",
	"physics/body/body_medium_impact_hard6.wav"}
ENT.SoundTbl_OnKilledEnemy = {}
ENT.SoundTbl_AllyDeath = {}
ENT.SoundTbl_Pain = {}
ENT.SoundTbl_Death = {}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()
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
	self:CapabilitiesAdd(bit.bor(CAP_MOVE_JUMP))
	self.ScurryAnimation = VJ_SequenceToActivity(self,"Scurry")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
	if self.GottaGoFast == true then return end
	if self:GetEnemy() != nil then
	local EnemyDistance = self:VJ_GetNearestPointToEntityDistance(self:GetEnemy(),self:GetPos():Distance(self:GetEnemy():GetPos()))
	if EnemyDistance <= 500 && self.VJ_IsBeingControlled == false or self.VJ_IsBeingControlled == true && self.VJ_TheController:KeyDown(IN_DUCK) then
		self.GottaGoFast = true
			VJ_STOPSOUND(self.CurrentBreathSound)
		self.NextSoundTime_Breath = VJ_Set(1,1)
		self.SoundTbl_Breath = {"npc/zombknees/crabomb/fuse.mp3"}
		self.BreathSoundLevel = 95
		self.IdleAlwaysWander = true
		self.AnimTbl_Walk = {self.ScurryAnimation}
		self.AnimTbl_Run = {self.ScurryAnimation}
					if self.VJ_IsBeingControlled == true then
				self.VJ_TheController:PrintMessage(HUD_PRINTCENTER,"10 Seconds until auto-detonation!")
			end
		
	ParticleEffectAttach("smoke_gib_01",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
		
		timer.Simple(10,function() if IsValid(self) then
		self.GodMode = false
		local d = DamageInfo()
		d:SetDamage(self:GetMaxHealth())
		d:SetAttacker(self)
		d:SetDamageType(DMG_GENERIC) 
		self:TakeDamageInfo(d)
	end end)
	end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnLeapAttack_BeforeStartTimer(seed)
	VJ_EmitSound(self,{"npc/zombknees/crabomb/bobomb.mp3"},80,math.random(100,90))

end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnLeapAttack_AfterChecks(hitEnt)
	self.GodMode = false
	if IsValid(self) then
		local d = DamageInfo()
		d:SetDamage(self:GetMaxHealth())
		d:SetAttacker(self)
		d:SetDamageType(DMG_GENERIC) 
		self:TakeDamageInfo(d)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Controller_IntMsg(ply, controlEnt)
	ply:ChatPrint("CROUCH - Light Fuse")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialKilled(dmginfo, hitgroup)
    self:AddFlags(FL_NOTARGET)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnKilled(dmginfo,hitgroup)
	local effectdata = EffectData()
		effectdata:SetOrigin(self:GetPos())
		//effectdata:SetScale( 500 )
		//util.Effect( "HelicopterMegaBomb", effectdata )
		//util.Effect( "ThumperDust", effectdata )
		-- util.Effect( "Explosion", effectdata )
		//util.Effect( "VJ_Small_Explosion1", effectdata )
		VJ_EmitSound(self,"npc/zombknees/crabomb/explode.mp3",100)
		VJ_EmitSound(self,"npc/zombknees/crabomb/explode.mp3",70)
		VJ_EmitSound(self,"npc/zombknees/crabomb/explode.mp3",70)
		-- VJ_EmitSound(self,"fx/explosion2.mp3",70)
		-- VJ_EmitSound(self,"fx/explosion2.mp3",70)
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
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetUpGibesOnDeath(dmginfo, hitgroup)
	self.HasDeathSounds = false
		if self.HasGibDeathParticles == true then
			local effectBlood = EffectData()
			effectBlood:SetOrigin(self:GetPos() + self:OBBCenter())
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
	
		self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/sgib_01.mdl",{BloodDecal="VJ_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,15))})
		self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/sgib_01.mdl",{BloodDecal="VJ_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,15))})
		self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/sgib_01.mdl",{BloodDecal="VJ_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,15))})
		self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/sgib_01.mdl",{BloodDecal="VJ_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,15))})
		self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/sgib_02.mdl",{BloodDecal="VJ_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,15))})
		self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/sgib_02.mdl",{BloodDecal="VJ_Blood_Yellow",Pos=self:LocalToWorld(Vector(0,0,15))})
	
	
	
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