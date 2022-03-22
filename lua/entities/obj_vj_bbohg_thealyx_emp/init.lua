AddCSLuaFile("shared.lua")
include("shared.lua")
/*--------------------------------------------------
	*** Copyright (c) 2012-2022 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
ENT.SoundTbl_Startup = {"items/suitchargeok1.wav"}
ENT.SoundTbl_Idle = {"items/suitcharge1.wav"}
ENT.SoundTbl_OnCollide = {"ambient/energy/spark1.wav",
	"ambient/energy/spark2.wav",
	"ambient/energy/spark3.wav",
	"ambient/energy/spark4.wav",
	"ambient/energy/spark5.wav",
	"ambient/energy/spark6.wav"}
ENT.SoundTbl_OnRemove = {"ambient/energy/zap1.wav",
	"ambient/energy/zap2.wav",
	"ambient/energy/zap3.wav",
	"ambient/energy/zap5.wav",
	"ambient/energy/zap6.wav",
	"ambient/energy/zap7.wav",
	"ambient/energy/zap8.wav",
	"ambient/energy/zap9.wav"}

ENT.StartupSoundLevel = 100
ENT.OnRemoveSoundLevel = 100

ENT.StartupSoundPitch = VJ_Set(95, 105)
ENT.IdleSoundPitch = VJ_Set(100, 100)
ENT.OnRemoveSoundPitch = VJ_Set(95, 105)

ENT.Model = {"models/alyx_emptool_prop.mdl"}
ENT.RadiusDamageType = DMG_SHOCK

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
	

	ParticleEffectAttach("vortigaunt_charge_token_b", PATTACH_ABSORIGIN_FOLLOW, self, 0)
	ParticleEffectAttach("vortigaunt_charge_token_b", PATTACH_ABSORIGIN_FOLLOW, self, 0)
	ParticleEffectAttach("hunter_flechette_trail_striderbuster", PATTACH_ABSORIGIN_FOLLOW, self, 0)
	ParticleEffectAttach("hunter_projectile_1", PATTACH_ABSORIGIN_FOLLOW, self, 0)
	
end
---------------------------------------------------------------------------------------------------------------------------------------------
local defAngle = Angle(0, 0, 0)
local vecZ4 = Vector(0, 0, 4)
local vezZ100 = Vector(0, 0, 100)
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DeathEffects()
	local selfPos = self:GetPos()
	
	-- ParticleEffect("vj_explosion1", self:GetPos(), defAngle, nil)
	ParticleEffect("hunter_projectile_explosion_1", self:GetPos(), defAngle, nil)
	ParticleEffect("hunter_projectile_explosion_1", self:GetPos(), defAngle, nil)
	ParticleEffect("hunter_projectile_explosion_1", self:GetPos(), defAngle, nil)
	ParticleEffect("hunter_projectile_explosion_3", self:GetPos(), defAngle, nil)
	
	local effectData = EffectData()
	effectData:SetOrigin(self:GetPos())
	//effectData:SetScale(500)
	-- //util.Effect("HelicopterMegaBomb", effectData)
	//util.Effect("ThumperDust", effectData)
	-- util.Effect("Explosion", effectData)
	-- //util.Effect("VJ_Small_Explosion1", effectData)
	-- //util.Effect("hunter_projectile_explosion_1", effectData)
	-- //util.Effect("hunter_projectile_explosion_3", effectData)

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
	util.Decal(VJ_PICK(self.DecalTbl_DeathDecals), tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)
	
	self:DoDamageCode()
	self:SetDeathVariablesTrue(nil, nil, false)
	self:Remove()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove() 
	VJ_EmitSound(self,"fx/ESPUME.mp3",65)
	-- VJ_EmitSound(self,"fx/ESPUME.mp3",100)
	local Zappy = math.random(1,2)
	if Zappy == 1 then
		VJ_EmitSound(self,"ambient/energy/weld1.wav",80)
	elseif Zappy == 2 then
		VJ_EmitSound(self,"ambient/energy/weld2.wav",80)
	end
end