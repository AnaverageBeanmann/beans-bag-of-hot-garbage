AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {""}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ENT.RemoveOnHit = false
ENT.PaintDecalOnCollide = false
ENT.CollideCodeWithoutRemoving = true
ENT.DoesDirectDamage = true
ENT.DirectDamage = math.random(5,10)
ENT.DirectDamageType = DMG_CLUB
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ENT.SoundTbl_Startup = {"npc/zombie/claw_miss1.wav",
	"npc/zombie/claw_miss2.wav"}
ENT.SoundTbl_Idle = {"npc/therock/cinderblock_flying.mp3"}
ENT.SoundTbl_OnCollide = {"physics/plastic/plastic_box_impact_bullet1.wav",
	"physics/plastic/plastic_box_impact_bullet2.wav",
	"physics/plastic/plastic_box_impact_bullet3.wav",
	"physics/plastic/plastic_box_impact_bullet4.wav",
	"physics/plastic/plastic_box_impact_bullet5.wav",
	"physics/plastic/plastic_box_impact_hard1.wav",
	"physics/plastic/plastic_box_impact_hard2.wav",
	"physics/plastic/plastic_box_impact_hard3.wav",
	"physics/plastic/plastic_box_impact_hard4.wav"}
ENT.SoundTbl_OnRemove = {"physics/plastic/plastic_box_break1.wav",
	"physics/plastic/plastic_barrel_impact_bullet1.wav",
	"physics/plastic/plastic_barrel_impact_bullet2.wav",
	"physics/plastic/plastic_barrel_impact_bullet3.wav"}
	
ENT.NextSoundTime_Idle = VJ_Set(0.001,0.001)

ENT.IdleSoundLevel = 70
ENT.OnRemoveSoundLevel = 75

ENT.StartupSoundPitch = VJ_Set(125, 150)

ENT.SMGGrenade = false
ENT.ArmorBattery = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomPhysicsObjectOnInitialize(phys)
	phys:Wake()
	phys:SetMass(1)
	phys:SetBuoyancyRatio(0)
	phys:EnableDrag(false)
	phys:AddAngleVelocity(Vector(0,math.random(300,400),0))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize() 
	local Type = math.random(1,10)
		if Type == 1 then
			self.Model = {"models/items/boxsrounds.mdl"}
		elseif Type == 2 then
			self.Model = {"models/items/357ammo.mdl"}
		elseif Type == 3 then
			self.Model = {"models/items/boxmrounds.mdl"}
		elseif Type == 4 then
			self.Model = {"models/items/combine_rifle_cartridge01.mdl"}
		elseif Type == 5 then
			self.Model = {"models/items/combine_rifle_ammo01.mdl"}
			self.SoundTbl_OnCollide = {"physics/metal/metal_solid_impact_bullet2.wav",
				"physics/metal/metal_solid_impact_bullet1.wav",
				"physics/metal/metal_solid_impact_bullet3.wav",
				"physics/metal/metal_solid_impact_bullet4.wav",
				"physics/metal/metal_solid_impact_hard1.wav",
				"physics/metal/metal_solid_impact_hard4.wav",
				"physics/metal/metal_solid_impact_hard5.wav"}
			self.SoundTbl_OnRemove = {"physics/metal/metal_box_break1.wav",
				"physics/metal/metal_box_break2.wav"}
		elseif Type == 6 then
			self.Model = {"models/items/crossbowrounds.mdl"}
			self.SoundTbl_OnCollide = {"physics/metal/metal_solid_impact_bullet2.wav",
				"physics/metal/metal_solid_impact_bullet1.wav",
				"physics/metal/metal_solid_impact_bullet3.wav",
				"physics/metal/metal_solid_impact_bullet4.wav",
				"physics/metal/metal_solid_impact_hard1.wav",
				"physics/metal/metal_solid_impact_hard4.wav",
				"physics/metal/metal_solid_impact_hard5.wav"}
			self.SoundTbl_OnRemove = {"physics/metal/metal_box_break1.wav",
				"physics/metal/metal_box_break2.wav"}
		elseif Type == 7 then
			self.Model = {"models/items/boxbuckshot.mdl"}
		elseif Type == 8 then
			self.Model = {"models/items/grenadeammo.mdl"}
			self.SoundTbl_OnCollide = {"physics/metal/metal_grenade_impact_hard1.wav",
			"physics/metal/metal_grenade_impact_hard2.wav",
			"physics/metal/metal_grenade_impact_hard3.wav"}
			self.SoundTbl_OnRemove = {"physics/metal/metal_box_break1.wav",
			"physics/metal/metal_box_break2.wav"}
		elseif Type == 9 then
			self.Model = {"models/items/ar2_grenade.mdl"}
			self.SoundTbl_Startup = {"weapons/grenade_launcher1.wav"}
			self.SoundTbl_OnCollide = {"physics/metal/metal_grenade_impact_hard1.wav",
			"physics/metal/metal_grenade_impact_hard2.wav",
			"physics/metal/metal_grenade_impact_hard3.wav"}
			self.SoundTbl_OnRemove = {"physics/metal/metal_box_break1.wav",
			"physics/metal/metal_box_break2.wav"}
			self.StartupSoundLevel = 95
			self.StartupSoundPitch = VJ_Set(100, 100)
			self.SMGGrenade = true
			self.DoesRadiusDamage = true
			self.RadiusDamageRadius = 150
			self.RadiusDamage = 20
			self.RadiusDamageUseRealisticRadius = true
			self.RadiusDamageType = DMG_BLAST
			self.RadiusDamageForce = 90
			self.DecalTbl_DeathDecals = {"Scorch"}
			self.SoundTbl_OnRemove = {""}
			self.RemoveOnHit = true
			self.PaintDecalOnCollide = true
			self.DoesDirectDamage = false
		elseif Type == 10 then
			self.Model = {"models/items/battery.mdl"}
			self.SoundTbl_OnCollide = {"ambient/energy/spark1.wav",
			"ambient/energy/spark2.wav",
			"ambient/energy/spark3.wav",
			"ambient/energy/spark4.wav",
			"ambient/energy/spark5.wav",
			"ambient/energy/spark6.wav"}
			self.SoundTbl_OnRemove = {"ambient/energy/zap1.wav",
			"ambient/energy/zap2.wav",
			"ambient/energy/zap3.wav",
			"ambient/energy/zap5.wav",
			"ambient/energy/zap6.wav",
			"ambient/energy/zap7.wav",
			"ambient/energy/zap8.wav",
			"ambient/energy/zap9.wav"}
			self.DirectDamageType = DMG_SHOCK
			self.ArmorBattery = true
		end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnCollideWithoutRemove(data, phys) 
	self.HasIdleSounds = false
	VJ_STOPSOUND(self.CurrentIdleSound)
	self.DoesDirectDamage = false
	timer.Simple(0.5,function() if IsValid(self) then
	self:Remove() end end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDoDamage_Direct(data, phys, hitEnt)
	self.HasIdleSounds = false
	VJ_STOPSOUND(self.CurrentIdleSound)
	self.DoesDirectDamage = false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	if self.SMGGrenade == true then
	ParticleEffectAttach("smoke_gib_01", PATTACH_ABSORIGIN_FOLLOW, self, 0)
	ParticleEffectAttach("Rocket_Smoke_Trail", PATTACH_ABSORIGIN_FOLLOW, self, 0)
	end
	if self.ArmorBattery == true then
	ParticleEffectAttach("vortigaunt_hand_glow_b", PATTACH_ABSORIGIN_FOLLOW, self, 0)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:DeathEffects()
	if self.SMGGrenade == true then
	local effectData = EffectData()
	effectData:SetOrigin(self:GetPos())
	//effectData:SetScale( 500 )
	util.Effect( "HelicopterMegaBomb", effectData )
	util.Effect( "ThumperDust", effectData )
	util.Effect( "Explosion", effectData )
	util.Effect( "VJ_Small_Explosion1", effectData )

	local ExplosionLight1 = ents.Create("light_dynamic")
	ExplosionLight1:SetKeyValue("brightness", "4")
	ExplosionLight1:SetKeyValue("distance", "300")
	ExplosionLight1:SetLocalPos(self:GetPos())
	ExplosionLight1:SetLocalAngles( self:GetAngles() )
	ExplosionLight1:Fire("Color", "255 150 0")
	ExplosionLight1:SetParent(self)
	ExplosionLight1:Spawn()
	ExplosionLight1:Activate()
	ExplosionLight1:Fire("TurnOn", "", 0)
	self:DeleteOnRemove(ExplosionLight1)
	util.ScreenShake(self:GetPos(), 100, 200, 1, 2500)
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/