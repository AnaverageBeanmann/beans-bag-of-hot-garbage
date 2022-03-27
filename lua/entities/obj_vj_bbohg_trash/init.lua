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
	local Type = math.random(1,26)
	
		if Type == 1 then
			self.Model = {"models/props_junk/garbage_milkcarton002a.mdl"}
			self.SoundTbl_OnCollide = {"physics/cardboard/cardboard_box_impact_soft1.wav",
				"physics/cardboard/cardboard_box_impact_soft2.wav",
				"physics/cardboard/cardboard_box_impact_soft3.wav",
				"physics/cardboard/cardboard_box_impact_soft4.wav",
				"physics/cardboard/cardboard_box_impact_soft5.wav",
				"physics/cardboard/cardboard_box_impact_soft6.wav",
				"physics/cardboard/cardboard_box_impact_soft7.wav"}
			self.SoundTbl_OnRemove = {"physics/cardboard/cardboard_box_break1.wav",
				"physics/cardboard/cardboard_box_break2.wav",
				"physics/cardboard/cardboard_box_break3.wav"}
			self.DirectDamage = math.random(2,5)
			
		elseif Type == 2 then
			self.Model = {"models/props_lab/binderblue.mdl",
				"models/props_lab/binderbluelabel.mdl",
				"models/props_lab/bindergraylabel01a.mdl",
				"models/props_lab/bindergreen.mdl",
				"models/props_lab/bindergraylabel01b.mdl",
				"models/props_lab/bindergreenlabel.mdl",
				"models/props_lab/binderredlabel.mdl"}
			self.SoundTbl_OnCollide = {"physics/cardboard/cardboard_box_impact_soft1.wav",
				"physics/cardboard/cardboard_box_impact_soft2.wav",
				"physics/cardboard/cardboard_box_impact_soft3.wav",
				"physics/cardboard/cardboard_box_impact_soft4.wav",
				"physics/cardboard/cardboard_box_impact_soft5.wav",
				"physics/cardboard/cardboard_box_impact_soft6.wav",
				"physics/cardboard/cardboard_box_impact_soft7.wav"}
			self.SoundTbl_OnRemove = {"physics/cardboard/cardboard_box_break1.wav",
				"physics/cardboard/cardboard_box_break2.wav",
				"physics/cardboard/cardboard_box_break3.wav"}
			self.DirectDamage = math.random(3,6)
			
			
		elseif Type == 3 then
			self.Model = {"models/props_c17/BriefCase001a.mdl"}
			self.SoundTbl_OnCollide = {"physics/cardboard/cardboard_box_impact_soft1.wav",
				"physics/cardboard/cardboard_box_impact_soft2.wav",
				"physics/cardboard/cardboard_box_impact_soft3.wav",
				"physics/cardboard/cardboard_box_impact_soft4.wav",
				"physics/cardboard/cardboard_box_impact_soft5.wav",
				"physics/cardboard/cardboard_box_impact_soft6.wav",
				"physics/cardboard/cardboard_box_impact_soft7.wav"}
			self.SoundTbl_OnRemove = {"physics/cardboard/cardboard_box_break1.wav",
				"physics/cardboard/cardboard_box_break2.wav",
				"physics/cardboard/cardboard_box_break3.wav"}
			self.DirectDamage = math.random(4,10)
			
			
		elseif Type == 4 then
			self.Model = {"models/props_junk/garbage_takeoutcarton001a.mdl"}
			self.SoundTbl_OnCollide = {"physics/cardboard/cardboard_box_impact_soft1.wav",
				"physics/cardboard/cardboard_box_impact_soft2.wav",
				"physics/cardboard/cardboard_box_impact_soft3.wav",
				"physics/cardboard/cardboard_box_impact_soft4.wav",
				"physics/cardboard/cardboard_box_impact_soft5.wav",
				"physics/cardboard/cardboard_box_impact_soft6.wav",
				"physics/cardboard/cardboard_box_impact_soft7.wav"}
			self.SoundTbl_OnRemove = {"physics/cardboard/cardboard_box_break1.wav",
				"physics/cardboard/cardboard_box_break2.wav",
				"physics/cardboard/cardboard_box_break3.wav"}
			self.DirectDamage = math.random(2,5)
			
			
		elseif Type == 5 then
			self.Model = {"models/props_junk/garbage_bag001a.mdl"}
			self.SoundTbl_OnCollide = {"physics/cardboard/cardboard_box_impact_soft1.wav",
				"physics/cardboard/cardboard_box_impact_soft2.wav",
				"physics/cardboard/cardboard_box_impact_soft3.wav",
				"physics/cardboard/cardboard_box_impact_soft4.wav",
				"physics/cardboard/cardboard_box_impact_soft5.wav",
				"physics/cardboard/cardboard_box_impact_soft6.wav",
				"physics/cardboard/cardboard_box_impact_soft7.wav"}
			self.SoundTbl_OnRemove = {"physics/cardboard/cardboard_box_break1.wav",
				"physics/cardboard/cardboard_box_break2.wav",
				"physics/cardboard/cardboard_box_break3.wav"}
			self.DirectDamage = math.random(2,5)
			
			
		elseif Type == 6 then
			self.Model = {"models/props_junk/Shoe001a.mdl"}
			self.SoundTbl_OnCollide = {"physics/cardboard/cardboard_box_impact_soft1.wav",
				"physics/cardboard/cardboard_box_impact_soft2.wav",
				"physics/cardboard/cardboard_box_impact_soft3.wav",
				"physics/cardboard/cardboard_box_impact_soft4.wav",
				"physics/cardboard/cardboard_box_impact_soft5.wav",
				"physics/cardboard/cardboard_box_impact_soft6.wav",
				"physics/cardboard/cardboard_box_impact_soft7.wav"}
			self.SoundTbl_OnRemove = {"physics/cardboard/cardboard_box_break1.wav",
				"physics/cardboard/cardboard_box_break2.wav",
				"physics/cardboard/cardboard_box_break3.wav"}
			self.DirectDamage = math.random(3,6)
			
			
		elseif Type == 7 then
			self.Model = {"models/props_c17/playgroundTick-tack-toe_block01a.mdl"}
			self.SoundTbl_OnCollide = {"physics/wood/wood_box_impact_hard1.wav",
				"physics/wood/wood_box_impact_hard2.wav",
				"physics/wood/wood_box_impact_hard3.wav"}
			self.SoundTbl_OnRemove = {"physics/wood/wood_plank_break1.wav",
				"physics/wood/wood_plank_break2.wav",
				"physics/wood/wood_plank_break3.wav",
				"physics/wood/wood_plank_break4.wav"}
			self.DirectDamage = math.random(4,10)
			
			
		elseif Type == 8 then
			self.Model = {"models/props_lab/clipboard.mdl"}
			self.SoundTbl_OnCollide = {"physics/wood/wood_box_impact_hard1.wav",
				"physics/wood/wood_box_impact_hard2.wav",
				"physics/wood/wood_box_impact_hard3.wav"}
			self.SoundTbl_OnRemove = {"physics/wood/wood_plank_break1.wav",
				"physics/wood/wood_plank_break2.wav",
				"physics/wood/wood_plank_break3.wav",
				"physics/wood/wood_plank_break4.wav"}
			self.DirectDamage = math.random(2,5)
			
			
		elseif Type == 9 then
			self.Model = {"models/props_c17/metalPot001a.mdl"}
			self.SoundTbl_OnCollide = {"physics/metal/metal_solid_impact_hard1.wav",
			"physics/metal/metal_solid_impact_hard4.wav",
			"physics/metal/metal_solid_impact_hard5.wav"}
			self.SoundTbl_OnRemove = {"physics/metal/metal_box_break1.wav",
			"physics/metal/metal_box_break2.wav"}
			self.DirectDamage = math.random(4,10)
			
						
		elseif Type == 10 then
			self.Model = {"models/props_c17/metalPot002a.mdl"}
			self.SoundTbl_OnCollide = {"physics/metal/metal_solid_impact_hard1.wav",
			"physics/metal/metal_solid_impact_hard4.wav",
			"physics/metal/metal_solid_impact_hard5.wav"}
			self.SoundTbl_OnRemove = {"physics/metal/metal_box_break1.wav",
			"physics/metal/metal_box_break2.wav"}
			self.DirectDamage = math.random(4,10)
			
						
		elseif Type == 11 then
			self.Model = {"models/props_interiors/pot01a.mdl"}
			self.SoundTbl_OnCollide = {"physics/metal/metal_solid_impact_hard1.wav",
			"physics/metal/metal_solid_impact_hard4.wav",
			"physics/metal/metal_solid_impact_hard5.wav"}
			self.SoundTbl_OnRemove = {"physics/metal/metal_box_break1.wav",
			"physics/metal/metal_box_break2.wav"}
			self.DirectDamage = math.random(4,10)
			
				
		elseif Type == 12 then
			self.Model = {"models/props_interiors/pot02a.mdl"}
			self.SoundTbl_OnCollide = {"physics/metal/metal_solid_impact_hard1.wav",
			"physics/metal/metal_solid_impact_hard4.wav",
			"physics/metal/metal_solid_impact_hard5.wav"}
			self.SoundTbl_OnRemove = {"physics/metal/metal_box_break1.wav",
			"physics/metal/metal_box_break2.wav"}
			self.DirectDamage = math.random(4,10)
			
			
		elseif Type == 13 then
			self.Model = {"models/props_c17/streetsign001c.mdl",
			"models/props_c17/streetsign002b.mdl",
			"models/props_c17/streetsign003b.mdl",
			"models/props_c17/streetsign004e.mdl",
			"models/props_c17/streetsign004f.mdl"}
			self.SoundTbl_OnCollide = {"physics/metal/metal_solid_impact_hard1.wav",
			"physics/metal/metal_solid_impact_hard4.wav",
			"physics/metal/metal_solid_impact_hard5.wav"}
			self.SoundTbl_OnRemove = {"physics/metal/metal_box_break1.wav",
			"physics/metal/metal_box_break2.wav"}
			self.DirectDamage = math.random(4,10)
			
			
		elseif Type == 14 then
			self.Model = {"models/props_c17/streetsign005b.mdl",
			"models/props_c17/streetsign005c.mdl",
			"models/props_c17/streetsign005d.mdl"}
			self.SoundTbl_OnCollide = {"physics/metal/metal_solid_impact_hard1.wav",
			"physics/metal/metal_solid_impact_hard4.wav",
			"physics/metal/metal_solid_impact_hard5.wav"}
			self.SoundTbl_OnRemove = {"physics/metal/metal_box_break1.wav",
			"physics/metal/metal_box_break2.wav"}
			self.DirectDamage = math.random(4,10)
			
			
		elseif Type == 15 then
			self.Model = {"models/props_junk/garbage_milkcarton001a.mdl"}
			self.SoundTbl_OnCollide = {"physics/plastic/plastic_box_impact_hard1.wav",
			"physics/plastic/plastic_box_impact_hard2.wav",
			"physics/plastic/plastic_box_impact_hard3.wav",
			"physics/plastic/plastic_box_impact_hard4.wav"}
			self.SoundTbl_OnRemove = {"physics/plastic/plastic_box_break1.wav",
			"physics/plastic/plastic_barrel_impact_bullet1.wav",
			"physics/plastic/plastic_barrel_impact_bullet2.wav",
			"physics/plastic/plastic_barrel_impact_bullet3.wav"}
			self.DirectDamage = math.random(3,6)
			
			
		elseif Type == 16 then
			self.Model = {"models/props_c17/TrapPropeller_Lever.mdl"}
			self.SoundTbl_OnCollide = {"physics/plastic/plastic_box_impact_hard1.wav",
			"physics/plastic/plastic_box_impact_hard2.wav",
			"physics/plastic/plastic_box_impact_hard3.wav",
			"physics/plastic/plastic_box_impact_hard4.wav"}
			self.SoundTbl_OnRemove = {"physics/plastic/plastic_box_break1.wav",
			"physics/plastic/plastic_barrel_impact_bullet1.wav",
			"physics/plastic/plastic_barrel_impact_bullet2.wav",
			"physics/plastic/plastic_barrel_impact_bullet3.wav"}
			self.DirectDamage = math.random(3,6)
			
			
		elseif Type == 17 then
			self.Model = {"models/props_junk/garbage_plasticbottle001a.mdl"}
			self.SoundTbl_OnCollide = {"physics/plastic/plastic_box_impact_hard1.wav",
			"physics/plastic/plastic_box_impact_hard2.wav",
			"physics/plastic/plastic_box_impact_hard3.wav",
			"physics/plastic/plastic_box_impact_hard4.wav"}
			self.SoundTbl_OnRemove = {"physics/plastic/plastic_box_break1.wav",
			"physics/plastic/plastic_barrel_impact_bullet1.wav",
			"physics/plastic/plastic_barrel_impact_bullet2.wav",
			"physics/plastic/plastic_barrel_impact_bullet3.wav"}
			self.DirectDamage = math.random(3,6)
			
			
		elseif Type == 18 then
			self.Model = {"models/props_junk/garbage_plasticbottle002a.mdl"}
			self.SoundTbl_OnCollide = {"physics/plastic/plastic_box_impact_hard1.wav",
			"physics/plastic/plastic_box_impact_hard2.wav",
			"physics/plastic/plastic_box_impact_hard3.wav",
			"physics/plastic/plastic_box_impact_hard4.wav"}
			self.SoundTbl_OnRemove = {"physics/plastic/plastic_box_break1.wav",
			"physics/plastic/plastic_barrel_impact_bullet1.wav",
			"physics/plastic/plastic_barrel_impact_bullet2.wav",
			"physics/plastic/plastic_barrel_impact_bullet3.wav"}
			self.DirectDamage = math.random(3,6)
			
			
		elseif Type == 19 then
			self.Model = {"models/props_c17/computer01_keyboard.mdl"}
			self.SoundTbl_OnCollide = {"physics/plastic/plastic_box_impact_hard1.wav",
			"physics/plastic/plastic_box_impact_hard2.wav",
			"physics/plastic/plastic_box_impact_hard3.wav",
			"physics/plastic/plastic_box_impact_hard4.wav"}
			self.SoundTbl_OnRemove = {"physics/plastic/plastic_box_break1.wav",
			"physics/plastic/plastic_barrel_impact_bullet1.wav",
			"physics/plastic/plastic_barrel_impact_bullet2.wav",
			"physics/plastic/plastic_barrel_impact_bullet3.wav"}
			self.DirectDamage = math.random(3,6)
			
			
		elseif Type == 20 then
			self.Model = {"models/props_c17/clock01.mdl"}
			self.SoundTbl_OnCollide = {"physics/plastic/plastic_box_impact_hard1.wav",
			"physics/plastic/plastic_box_impact_hard2.wav",
			"physics/plastic/plastic_box_impact_hard3.wav",
			"physics/plastic/plastic_box_impact_hard4.wav"}
			self.SoundTbl_OnRemove = {"physics/plastic/plastic_box_break1.wav",
			"physics/plastic/plastic_barrel_impact_bullet1.wav",
			"physics/plastic/plastic_barrel_impact_bullet2.wav",
			"physics/plastic/plastic_barrel_impact_bullet3.wav"}
			self.DirectDamage = math.random(3,6)
			
			
		elseif Type == 21 then
			self.Model = {"models/props_trainstation/payphone_reciever001a.mdl"}
			self.SoundTbl_OnCollide = {"physics/plastic/plastic_box_impact_hard1.wav",
			"physics/plastic/plastic_box_impact_hard2.wav",
			"physics/plastic/plastic_box_impact_hard3.wav",
			"physics/plastic/plastic_box_impact_hard4.wav"}
			self.SoundTbl_OnRemove = {"physics/plastic/plastic_box_break1.wav",
			"physics/plastic/plastic_barrel_impact_bullet1.wav",
			"physics/plastic/plastic_barrel_impact_bullet2.wav",
			"physics/plastic/plastic_barrel_impact_bullet3.wav"}
			self.DirectDamage = math.random(3,6)
			
			
		elseif Type == 22 then
			self.Model = {"models/props_junk/garbage_plasticbottle003a.mdl"}
			self.SoundTbl_OnCollide = {"physics/plastic/plastic_box_impact_hard1.wav",
			"physics/plastic/plastic_box_impact_hard2.wav",
			"physics/plastic/plastic_box_impact_hard3.wav",
			"physics/plastic/plastic_box_impact_hard4.wav"}
			self.SoundTbl_OnRemove = {"physics/plastic/plastic_box_break1.wav",
			"physics/plastic/plastic_barrel_impact_bullet1.wav",
			"physics/plastic/plastic_barrel_impact_bullet2.wav",
			"physics/plastic/plastic_barrel_impact_bullet3.wav"}
			self.DirectDamage = math.random(3,6)
			
			
		elseif Type == 23 then
			self.Model = {"models/props_junk/garbage_coffeemug001a.mdl",
			"models/props_junk/garbage_glassbottle001a.mdl",
			"models/props_junk/garbage_glassbottle002a.mdl",
			"models/props_junk/garbage_glassbottle003a.mdl",
			"models/props_junk/GlassBottle01a.mdl",
			"models/props_junk/glassjug01.mdl"}
			self.HasOnCollideSounds = false
			self.SoundTbl_OnRemove = {"physics/glass/glass_bottle_break1.wav",
			"physics/glass/glass_bottle_break2.wav",
			"physics/glass/glass_cup_break1.wav",
			"physics/glass/glass_cup_break2.wav"}
			self.RemoveOnHit = true
			self.DirectDamage = math.random(2,5)
			
		elseif Type == 24 then
			self.Model = {"models/props_junk/garbage_metalcan001a.mdl",
			"models/props_junk/garbage_metalcan002a.mdl",
			"models/props_junk/PopCan01a.mdl"}
			self.SoundTbl_OnCollide = {"physics/metal/soda_can_impact_hard1.wav",
			"physics/metal/soda_can_impact_hard2.wav",
			"physics/metal/soda_can_impact_hard3.wav"}
			self.SoundTbl_OnRemove = {"physics/metal/metal_solid_impact_soft1.wav",
			"physics/metal/metal_solid_impact_soft2.wav",
			"physics/metal/metal_solid_impact_soft2.wav"}
			self.DirectDamage = math.random(2,5)
			
		elseif Type == 25 then
			self.Model = {"models/Gibs/HGIBS.mdl"}
			self.SoundTbl_OnCollide = {"physics/body/body_medium_impact_hard1.wav",
			"physics/body/body_medium_impact_hard2.wav",
			"physics/body/body_medium_impact_hard3.wav",
			"physics/body/body_medium_impact_hard4.wav",
			"physics/body/body_medium_impact_hard5.wav",
			"physics/body/body_medium_impact_hard6.wav"}
			self.SoundTbl_OnRemove = {"physics/flesh/flesh_bloody_break.wav"}
			self.DirectDamage = math.random(2,5)
			
		elseif Type == 26 then
			self.Model = {"models/Gibs/Antlion_gib_Large_2.mdl"}
			self.SoundTbl_OnCollide = {"physics/body/body_medium_impact_hard1.wav",
			"physics/body/body_medium_impact_hard2.wav",
			"physics/body/body_medium_impact_hard3.wav",
			"physics/body/body_medium_impact_hard4.wav",
			"physics/body/body_medium_impact_hard5.wav",
			"physics/body/body_medium_impact_hard6.wav"}
			self.SoundTbl_OnRemove = {"physics/flesh/flesh_bloody_break.wav"}
			self.DirectDamage = math.random(4,10)
			
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