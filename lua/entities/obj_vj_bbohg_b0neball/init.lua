AddCSLuaFile("shared.lua")
include("shared.lua")
/*--------------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
ENT.SoundTbl_Startup = {"ambient/fire/ignite.wav"}
ENT.SoundTbl_Idle = {"ambient/fire/fire_med_loop1.wav"}
ENT.SoundTbl_OnCollide = {"physics/body/body_medium_impact_hard1.wav",
	"physics/body/body_medium_impact_hard2.wav",
	"physics/body/body_medium_impact_hard3.wav",
	"physics/body/body_medium_impact_hard4.wav",
	"physics/body/body_medium_impact_hard5.wav",
	"physics/body/body_medium_impact_hard6.wav"}
-- ENT.SoundTbl_OnRemove = {"fx/lostsoul_explode.mp3"}

ENT.StartupSoundLevel = 100
ENT.OnRemoveSoundLevel = 100

ENT.StartupSoundPitch = VJ_Set(95, 105)
ENT.OnRemoveSoundPitch = VJ_Set(95, 105)
ENT.OnCollideSoundPitch = VJ_Set(70, 65)

ENT.Model = {"models/hunter/misc/sphere2x2.mdl"}
ENT.RadiusDamageType = DMG_BURN

ENT.RadiusDamageRadius = 375 -- How far the damage go? The farther away it's from its enemy, the less damage it will do | Counted in world units
ENT.RadiusDamage = 200

ENT.FussTime = 2.5
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomPhysicsObjectOnInitialize(phys)
	phys:Wake()
	phys:SetMass(1)
	phys:SetBuoyancyRatio(0)
	phys:EnableDrag(false)
	phys:AddAngleVelocity(Vector(0,math.random(300,400),0))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	//if self:GetOwner():IsValid() && (self:GetOwner().GrenadeAttackFussTime) then
	//timer.Simple(self:GetOwner().GrenadeAttackFussTime,function() if IsValid(self) then self:DeathEffects() end end) else
	timer.Simple(self.FussTime,function() if IsValid(self) then self:DeathEffects() end end)
	//end
	
	ParticleEffectAttach("fire_medium_02", PATTACH_ABSORIGIN_FOLLOW, self, 0)
	
	self.Light1 = ents.Create("light_dynamic")
	self.Light1:SetKeyValue("brightness", "5")
	self.Light1:SetKeyValue("distance", "95")
	self.Light1:SetLocalPos(self:GetPos() + self:GetUp()*0 + self:GetForward()*0)
	self.Light1:SetLocalAngles(self:GetAngles())
	self.Light1:Fire("Color", "255 93 0")
	self.Light1:SetParent(self)
	self.Light1:Spawn()
	self.Light1:Activate()
	-- self.Light1:Fire("SetParentAttachment","origin")
	self.Light1:Fire("TurnOn", "", 0)
	self:DeleteOnRemove(self.Light1)
	
	self:SetMaterial("models/gibs/hgibs/spine")
	-- models/gibs/hgibs/spine
	-- models/hunter/misc/sphere2x2.mdl
	
end
---------------------------------------------------------------------------------------------------------------------------------------------
local defAngle = Angle(0, 0, 0)
local vecZ4 = Vector(0, 0, 4)
local vezZ100 = Vector(0, 0, 100)
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPhysicsCollide(data, phys)
	local getVel = phys:GetVelocity()
	local curVelSpeed = getVel:Length()
	//print(curVelSpeed)
	if curVelSpeed > 500 then -- Or else it will go flying!
		phys:SetVelocity(getVel * 0.1)
	end
	
	if curVelSpeed > 100 then -- If the grenade is going faster than 100, then play the touch sound
		self:OnCollideSoundCode()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DeathEffects()
	local selfPos = self:GetPos()
	
	ParticleEffect("vj_explosion1", self:GetPos(), defAngle, nil)
	
	local effectData = EffectData()
	effectData:SetOrigin(self:GetPos())
	//effectData:SetScale(500)
	//util.Effect("HelicopterMegaBomb", effectData)
	//util.Effect("ThumperDust", effectData)
	util.Effect("Explosion", effectData)
	//util.Effect("VJ_Small_Explosion1", effectData)

	local expLight = ents.Create("light_dynamic")
	expLight:SetKeyValue("brightness", "4")
	expLight:SetKeyValue("distance", "300")
	expLight:SetLocalPos(selfPos)
	expLight:SetLocalAngles(self:GetAngles())
	expLight:Fire("Color", "255 150 0")
	expLight:SetParent(self)
	expLight:Spawn()
	expLight:Activate()
	expLight:Fire("TurnOn", "", 0)
	self:DeleteOnRemove(expLight)
	util.ScreenShake(self:GetPos(), 100, 200, 1, 2500)

	self:SetLocalPos(selfPos + vecZ4) -- Because the entity is too close to the ground
	local tr = util.TraceLine({
		start = self:GetPos(),
		endpos = self:GetPos() - vezZ100,
		filter = self
	})
	-- util.Decal(VJ_PICK(self.DecalTbl_DeathDecals), tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)
	
	self:DoDamageCode()
	self:SetDeathVariablesTrue(nil, nil, false)
	self:Remove()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
	VJ_EmitSound(self,{"physics/body/body_medium_break2.wav",
	"physics/body/body_medium_break3.wav",
	"physics/body/body_medium_break4.wav"},100,math.random(100,100))
	VJ_EmitSound(self, "vj_gib/default_gib_splat.wav", 100, 100)

	self.Zombie1 = ents.Create("npc_vj_bbohg_boner")
	self.Zombie1:SetPos(self:GetPos() +self:GetRight()*45 +self:GetUp()*10)
	-- self.Zombie1:SetAngles(self:GetAngles())
	self.Zombie1:Spawn()
	-- timer.Simple(0.3,function() if IsValid(self.Zombie1) then self.Zombie1:SetNoDraw(false) end end)
	local SpawnAnimation = math.random(1,3)
	if SpawnAnimation == 1 then
		self.Zombie1:VJ_ACT_PLAYACTIVITY("zombie_slump_rise_02_slow", true, false, false)
	elseif SpawnAnimation == 2 then
		self.Zombie1:VJ_ACT_PLAYACTIVITY("zombie_slump_rise_02_fast", true, false, false)
	elseif SpawnAnimation == 3 then
		self.Zombie1:VJ_ACT_PLAYACTIVITY("zombie_slump_rise_01", true, false, false)
	end
end