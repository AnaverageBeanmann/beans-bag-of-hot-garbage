AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/Zombie/Classic.mdl"} 
ENT.StartHealth = 150
ENT.HullType = HULL_HUMAN
ENT.CanFlinch = 1
ENT.FlinchChance = 3
ENT.NextFlinchTime = 1.5
ENT.AnimTbl_Flinch = {ACT_FLINCH_PHYSICS}
ENT.ImmuneDamagesTable = {DMG_RADIATION}
ENT.VJC_Data = {
	CameraMode = 1,
	ThirdP_Offset = Vector(40, 20, -50),
	FirstP_Bone = "ValveBiped.Bip01_Spine4",
	FirstP_Offset = Vector(0, 0, 5),
}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"} 
ENT.BloodColor = "Red"
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasMeleeAttack = true 
ENT.MeleeAttackDamage = math.Rand(15,20)
ENT.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1}
ENT.MeleeAttackDistance = 28
ENT.MeleeAttackDamageDistance = 60
ENT.TimeUntilMeleeAttackDamage = 0.6
ENT.HasOnKilledEnemySound = false
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.InvestigateSoundDistance = 10
ENT.AnimTbl_Run = {ACT_WALK}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasDeathAnimation = false
ENT.HasDeathRagdoll = true

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 95
ENT.IdleSoundChance = 5
ENT.CombatIdleSoundChance = 4
ENT.IdleSoundLevel = 45
ENT.CombatIdleSoundLevel = 60
ENT.FootStepTimeRun = 0.60
ENT.FootStepTimeWalk = 0.60
---------------------------------------------------------------------------------------------------------------------------------------------
--custom
ENT.LNR_VirusInfection = true
ENT.LNR_IsWalker = true
ENT.LN_NextStumble = CurTime()

	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"npc/zombie/foot1.wav","npc/zombie/foot2.wav","npc/zombie/foot3.wav"}
ENT.SoundTbl_Idle = {"zombies/weaponized/carcass/idle_1.mp3","zombies/weaponized/carcass/idle_2.mp3","zombies/weaponized/carcass/idle_3.mp3","zombies/weaponized/carcass/idle_4.mp3"}
ENT.SoundTbl_Alert = {"zombies/weaponized/carcass/alert_1.mp3","zombies/weaponized/carcass/alert_2.mp3","zombies/weaponized/carcass/alert_3.mp3","zombies/weaponized/carcass/alert_4.mp3"}
ENT.SoundTbl_CombatIdle = {"zombies/weaponized/carcass/idle_1.mp3","zombies/weaponized/carcass/idle_2.mp3","zombies/weaponized/carcass/idle_3.mp3","zombies/weaponized/carcass/idle_4.mp3"}
ENT.SoundTbl_BeforeMeleeAttack = {"zombies/weaponized/carcass/attack_1.mp3","zombies/weaponized/carcass/attack_2.mp3","zombies/weaponized/carcass/attack_3.mp3","zombies/weaponized/carcass/attack_4.mp3","zombies/weaponized/carcass/attack_5.mp3","zombies/weaponized/carcass/attack_6.mp3"}
ENT.SoundTbl_MeleeAttack = {"zombies/shared/claw_hit_flesh_1.wav","zombies/shared/claw_hit_flesh_2.wav","zombies/shared/claw_hit_flesh_3.wav","zombies/shared/claw_hit_flesh_4.wav","zombies/shared/zombie_slice_1.wav","zombies/shared/zombie_slice_2.wav","zombies/shared/zombie_slice_3.wav","zombies/shared/zombie_slice_4.wav","zombies/shared/zombie_slice_5.wav","zombies/shared/zombie_slice_6.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"npc/zombie/claw_miss2.wav","npc/zombie/claw_miss1.wav"}
ENT.SoundTbl_MeleeAttackSlowPlayer = {"vj_lnrhl2/losthope.mp3"}
ENT.SoundTbl_Pain = {}
ENT.SoundTbl_Death = {"zombies/weaponized/carcass/death_1.mp3","zombies/weaponized/carcass/death_2.mp3","zombies/weaponized/carcass/death_3.mp3","zombies/weaponized/carcass/death_4.mp3","zombies/weaponized/carcass/death_5.mp3"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetSightDirection()
	return self:GetAttachment(self:LookupAttachment("eyes")).Ang:Forward() -- Attachment example
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "step" then
		self:FootStepSoundCode()
	end
	
	if key == "attack" then
		self:MeleeAttackCode() 
    end	
	
	if key == "attack_leap" then
		self:LeapDamageCode() 
    end	
	
	if key == "death" then
		VJ_EmitSound(self, "physics/flesh/flesh_impact_hard"..math.random(1,5)..".wav", 85, math.random(100,100))
	end		
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize() 
self.StartHealth = self.StartHealth * GetConVarNumber("VJ_LNR_Walker_HealthModifier")	
self:SetHealth(self.StartHealth)
self.MeleeAttackDamage = self.MeleeAttackDamage * GetConVarNumber("VJ_LNR_Walker_DamageModifier")

if GetConVarNumber("vj_LNR_Infection") == 0 then 
		self.LNR_VirusInfection = false 
end	
if GetConVarNumber("vj_LNR_DeathAnimations") == 0 then 
		self.HasDeathAnimation = false	
end

if GetConVarNumber("vj_LNR_Leap") == 0 then 
		self.HasLeapAttack = false 
end
if GetConVarNumber("vj_LNR_Alert") == 0 then 
		self.CallForHelp = false
end

if GetConVarNumber("vj_LNR_TOTU_RealismMode") == 1 then
	self.StartHealth = 30
end

end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	self:SetKeyValue("rendercolor","104 129 74 255")
	self.ExplodeDeath = false
		if math.random(1,4) == 1 then
			self.ExplodeDeath = true
			self.HasDeathAnimation = true
			self.DeathAnimationTime = 1.0
			self.DeathAnimationChance = 1
			self.AnimTbl_Death = {"releasecrab"}
			self.HasDeathRagdoll = true
			self.DeathCorpseModel = {"models/Zombie/Classic_legs.mdl"} 
		end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_BleedEnemy(TheHitEntity) 
if GetConVarNumber("vj_LNR_InfectionDamage") == 1 then 
self.MeleeAttackBleedEnemyTime = GetConVarNumber("vj_LNR_BleedTime")
timer.Simple(GetConVarNumber("vj_LNR_BleedTime"),function()
end)
end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMeleeAttack_SlowPlayer(TheHitEntity) 
self.SlowPlayerOnMeleeAttackTime = self.SlowPlayerOnMeleeAttackTime * GetConVarNumber("vj_LNR_SlowTime")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnIsJumpLegal(startPos,apex,endPos) return false 
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnChangeMovementType(movType)	
	if VJ_AnimationExists(self,ACT_JUMP) == true then self:CapabilitiesRemove(bit.bor(CAP_MOVE_JUMP)) end
	if VJ_AnimationExists(self,ACT_CLIMB_UP) == true then self:CapabilitiesRemove(bit.bor(CAP_MOVE_CLIMB)) end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleMeleeAttacks()
	local randattack_stand = math.random(6,11)
	local randattack_moving = math.random(1,2)

	if randattack_moving == 1 && self:IsMoving() then
		self.AnimTbl_MeleeAttack = {"vjges_swatleftlow"}
		self.MeleeAttackDamage = math.Rand(15,20)
		self.NextAnyAttackTime_Melee = 1
		self.TimeUntilMeleeAttackDamage = 0.6
		
	elseif randattack_moving == 2 && self:IsMoving() then
		self.AnimTbl_MeleeAttack = {"vjges_swatrightlow"}
		self.MeleeAttackDamage = math.Rand(15,20)
		self.NextAnyAttackTime_Melee = 1
		self.TimeUntilMeleeAttackDamage = 0.6
		
	elseif randattack_stand == 6 then
		self.AnimTbl_MeleeAttack = {"vjseq_attackB"}
		self.MeleeAttackDamage = math.Rand(15,20)
		self.NextAnyAttackTime_Melee = 1
		self.TimeUntilMeleeAttackDamage = 0.9

	elseif randattack_stand == 7 then
		self.AnimTbl_MeleeAttack = {"vjseq_attackD"}
		self.MeleeAttackDamage = math.Rand(15,20)
		self.NextAnyAttackTime_Melee = 1
		self.TimeUntilMeleeAttackDamage = 0.9

	elseif randattack_stand == 8 then
		self.AnimTbl_MeleeAttack = {"vjseq_attackE"}
		self.MeleeAttackDamage = math.Rand(20,25)
		self.NextAnyAttackTime_Melee = 1
		self.TimeUntilMeleeAttackDamage = 0.9
		
    elseif randattack_stand == 9 then
		self.AnimTbl_MeleeAttack = {"vjseq_attackF"}
		self.MeleeAttackDamage = math.Rand(20,25)
		self.NextAnyAttackTime_Melee = 1
		self.TimeUntilMeleeAttackDamage = 0.9
	
	elseif randattack_stand == 10 then
		self.AnimTbl_MeleeAttack = {"vjseq_swatrightmid"}
		self.MeleeAttackDamage = math.Rand(15,20)
		self.NextAnyAttackTime_Melee = 0.8
		self.TimeUntilMeleeAttackDamage = 0.4
	
	elseif randattack_stand == 11 then
		self.AnimTbl_MeleeAttack = {"vjseq_swatleftmid"}
		self.MeleeAttackDamage = math.Rand(15,20)
		self.NextAnyAttackTime_Melee = 0.8
		self.TimeUntilMeleeAttackDamage = 0.4
	
	end
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPriorToKilled(dmginfo,hitgroup)
	if self.ExplodeDeath == true then
	timer.Simple(0.25,function() if IsValid(self) then
		VJ_EmitSound(self,{"physics/body/body_medium_break2.wav","physics/body/body_medium_break3.wav","physics/body/body_medium_break4.wav"},100,math.random(100,100))
		VJ_EmitSound(self,{"npc/barnacle/barnacle_tongue_pull2.wav"},100,math.random(100,100))
	timer.Simple(0.70,function() if IsValid(self) then
		VJ_EmitSound(self,{"zombies/residential/exploder/explode_ (1).wav", "zombies/residential/exploder/explode_ (2).wav", "zombies/residential/exploder/explode_ (3).wav"},100,math.random(100,100))
		VJ_EmitSound(self,{"zombies/residential/exploder/explode_ (1).wav", "zombies/residential/exploder/explode_ (2).wav", "zombies/residential/exploder/explode_ (3).wav"},100,math.random(100,100))
        local bloodeffect = EffectData()
		bloodeffect:SetOrigin(self:GetPos()+ self:GetUp()*80)
		bloodeffect:SetColor(VJ_Color2Byte(Color(127,0,0,255)))
		bloodeffect:SetScale(250)
		util.Effect("VJ_Blood1",bloodeffect)
		
		local bloodspray = EffectData()
			bloodspray:SetOrigin(self:GetPos() +self:OBBCenter())
			bloodspray:SetColor(VJ_Color2Byte(Color(127,0,0,255)))
			bloodspray:SetScale(1)
			bloodspray:SetFlags(3)
			bloodspray:SetColor(1)
			util.Effect("bloodspray",bloodspray)
			util.Effect("bloodspray",bloodspray)
	if GetConVarNumber("vj_LNR_TOTU_CarcassGibbing") == 1 then
		if GetConVarNumber("vj_LNR_Gib") == 1 then 		
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS.mdl",{Pos=self:LocalToWorld(Vector(0,0,50)),Ang=self:GetAngles()+Angle(0,-90,0),Vel=self:GetRight()*math.Rand(-20,20)+self:GetForward()*math.Rand(-20,20)+self:GetUp()*math.Rand(-20,400)})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_scapula.mdl",{Pos=self:LocalToWorld(Vector(0,0,50)),Ang=self:GetAngles()+Angle(0,-90,0),Vel=self:GetRight()*math.Rand(-20,20)+self:GetForward()*math.Rand(-20,20)+self:GetUp()*math.Rand(-20,400)})
    self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_spine.mdl",{Pos=self:LocalToWorld(Vector(0,0,50)),Ang=self:GetAngles()+Angle(0,-90,0),Vel=self:GetRight()*math.Rand(-20,20)+self:GetForward()*math.Rand(-20,20)+self:GetUp()*math.Rand(-20,200)})
    self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(0,0,50)),Ang=self:GetAngles()+Angle(0,-90,0),Vel=self:GetRight()*math.Rand(-20,20)+self:GetForward()*math.Rand(-20,20)+self:GetUp()*math.Rand(-20,200)})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(0,0,50)),Ang=self:GetAngles()+Angle(0,-90,0),Vel=self:GetRight()*math.Rand(-20,20)+self:GetForward()*math.Rand(-20,20)+self:GetUp()*math.Rand(-20,500)})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_rib.mdl",{Pos=self:LocalToWorld(Vector(0,0,50)),Ang=self:GetAngles()+Angle(0,-90,0),Vel=self:GetRight()*math.Rand(-20,20)+self:GetForward()*math.Rand(-20,20)+self:GetUp()*math.Rand(-20,500)})
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/mgib_06.mdl",{Pos=self:LocalToWorld(Vector(0,0,50)),Ang=self:GetAngles()+Angle(0,-90,0),Vel=self:GetRight()*math.Rand(-20,20)+self:GetForward()*math.Rand(-20,20)+self:GetUp()*math.Rand(-20,500)})
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/mgib_05.mdl",{Pos=self:LocalToWorld(Vector(0,0,50)),Ang=self:GetAngles()+Angle(0,-90,0),Vel=self:GetRight()*math.Rand(-20,20)+self:GetForward()*math.Rand(-20,20)+self:GetUp()*math.Rand(-20,500)})
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/mgib_04.mdl",{Pos=self:LocalToWorld(Vector(0,0,50)),Ang=self:GetAngles()+Angle(0,-90,0),Vel=self:GetRight()*math.Rand(-20,20)+self:GetForward()*math.Rand(-20,20)+self:GetUp()*math.Rand(-20,500)})
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/mgib_04.mdl",{Pos=self:LocalToWorld(Vector(0,0,50)),Ang=self:GetAngles()+Angle(0,-90,0),Vel=self:GetRight()*math.Rand(-20,20)+self:GetForward()*math.Rand(-20,20)+self:GetUp()*math.Rand(-20,500)})
	self:CreateGibEntity("obj_vj_gib","models/gibs/humans/heart_gib.mdl",{Pos=self:LocalToWorld(Vector(0,0,50)),Ang=self:GetAngles()+Angle(0,-90,0),Vel=self:GetRight()*math.Rand(-20,20)+self:GetForward()*math.Rand(-20,20)+self:GetUp()*math.Rand(-20,500)})
end
end
end
end)
end
end)
end
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnKilled(dmginfo,hitgroup)
	if self.ExplodeDeath == true then
		util.VJ_SphereDamage(self,self,self:GetPos(),150,math.random(0,0),DMG_BLAST,true,true,{Force=20})
	for k,v in ipairs(ents.FindInSphere(self:GetPos(),150)) do
		v:TakeDamage(math.random(25,30))
	end
		util.ScreenShake(self:GetPos(),44,600,1.5,2000)
end
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomDeathAnimationCode(dmginfo,hitgroup)	
    if dmginfo:IsDamageType(DMG_BURN) then
		self.SetCorpseOnFire = true
		if GetConVarNumber("vj_npc_noidleparticle") == 0 then 
			ParticleEffectAttach("fire_small_01",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("Blood_Right"))
			ParticleEffectAttach("fire_small_01",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("Blood_Left"))
			ParticleEffectAttach("fire_small_01",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("maw"))
			ParticleEffectAttach("fire_small_01",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("chest"))
			ParticleEffectAttach("fire_small_01",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("head"))
			ParticleEffectAttach("fire_small_01",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("eyes"))
			VJ_EmitSound(self,{"ambient/fire/gascan_ignite1.wav","ambient/fire/ignite.wav"},100,math.random(100,95))
		end
end	   
    if dmginfo:IsDamageType(DMG_SHOCK) then -- When killed by shock damage
		if GetConVarNumber("vj_npc_noidleparticle") == 0 then
			VJ_EmitSound(self,{"ambient/energy/zap1.wav","ambient/energy/zap2.wav","ambient/energy/zap3.wav","ambient/energy/zap5.wav","ambient/energy/zap6.wav","ambient/energy/zap7.wav","ambient/energy/zap8.wav","ambient/energy/zap9.wav"},100,math.random(100,95))
			ParticleEffectAttach("electrical_arc_01_parent",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("Blood_Right"))
			ParticleEffectAttach("electrical_arc_01_parent",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("Blood_Left"))
			ParticleEffectAttach("electrical_arc_01_parent",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("maw"))
			ParticleEffectAttach("electrical_arc_01_parent",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("chest"))
			ParticleEffectAttach("electrical_arc_01_parent",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("head"))
			ParticleEffectAttach("electrical_arc_01_parent",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("eyes"))
		timer.Simple(0.15,function() if IsValid(self) then
			ParticleEffectAttach("electrical_arc_01_parent",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("Blood_Right"))
			ParticleEffectAttach("electrical_arc_01_parent",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("Blood_Left"))
			ParticleEffectAttach("electrical_arc_01_parent",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("maw"))
			ParticleEffectAttach("electrical_arc_01_parent",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("chest"))
			ParticleEffectAttach("electrical_arc_01_parent",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("head"))
			ParticleEffectAttach("electrical_arc_01_parent",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("eyes"))
			VJ_EmitSound(self,{"ambient/energy/zap1.wav","ambient/energy/zap2.wav","ambient/energy/zap3.wav","ambient/energy/zap5.wav","ambient/energy/zap6.wav","ambient/energy/zap7.wav","ambient/energy/zap8.wav","ambient/energy/zap9.wav"},100,math.random(100,95))
			self:SetKeyValue("rendercolor","100 117 82 255")
		timer.Simple(0.30,function() if IsValid(self) then
			ParticleEffectAttach("electrical_arc_01_parent",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("Blood_Right"))
			ParticleEffectAttach("electrical_arc_01_parent",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("Blood_Left"))
			ParticleEffectAttach("electrical_arc_01_parent",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("maw"))
			ParticleEffectAttach("electrical_arc_01_parent",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("chest"))
			ParticleEffectAttach("electrical_arc_01_parent",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("head"))
			ParticleEffectAttach("electrical_arc_01_parent",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("eyes"))
			ParticleEffectAttach("smoke_gib_01",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("Blood_Right"))
			ParticleEffectAttach("smoke_gib_01",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("Blood_Left"))
			ParticleEffectAttach("smoke_gib_01",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("maw"))
			ParticleEffectAttach("smoke_gib_01",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("chest"))
			ParticleEffectAttach("smoke_gib_01",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("head"))
			ParticleEffectAttach("smoke_gib_01",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("eyes"))
			VJ_EmitSound(self,{"ambient/energy/zap1.wav","ambient/energy/zap2.wav","ambient/energy/zap3.wav","ambient/energy/zap5.wav","ambient/energy/zap6.wav","ambient/energy/zap7.wav","ambient/energy/zap8.wav","ambient/energy/zap9.wav"},100,math.random(100,95))
			self:SetKeyValue("rendercolor","62 74 51 255")
		timer.Simple(0.45,function() if IsValid(self) then
			ParticleEffectAttach("electrical_arc_01_parent",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("Blood_Right"))
			ParticleEffectAttach("electrical_arc_01_parent",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("Blood_Left"))
			ParticleEffectAttach("electrical_arc_01_parent",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("maw"))
			ParticleEffectAttach("electrical_arc_01_parent",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("chest"))
			ParticleEffectAttach("electrical_arc_01_parent",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("head"))
			ParticleEffectAttach("electrical_arc_01_parent",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("eyes"))
			VJ_EmitSound(self,{"ambient/energy/zap1.wav","ambient/energy/zap2.wav","ambient/energy/zap3.wav","ambient/energy/zap5.wav","ambient/energy/zap6.wav","ambient/energy/zap7.wav","ambient/energy/zap8.wav","ambient/energy/zap9.wav"},100,math.random(100,95))
		timer.Simple(0.55,function() if IsValid(self) then
			VJ_EmitSound(self,{"ambient/energy/weld1.wav","ambient/energy/weld2.wav"},100,math.random(100,95))
			self:SetKeyValue("rendercolor","28 33 23 255")
			end
			end)
		end
		end)
	end
	end)
end
end)
end
end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if self.ExplodeDeath == false && math.random(1,30) == 1 && self:Health() <= (self:GetMaxHealth() / 1.75) then
	self.HasDeathRagdoll = true
	self.DeathCorpseModel = {"models/Zombie/Classic_legs.mdl"}
	self.HasDeathSounds = false
	VJ_EmitSound(self,{"physics/body/body_medium_break2.wav","physics/body/body_medium_break3.wav","physics/body/body_medium_break4.wav"},100,math.random(100,100))
		self.Zombie1 = ents.Create("npc_vj_lnr_carcass_torso")
		self.Zombie1:SetPos(self:GetPos())
		self.Zombie1:SetAngles(self:GetAngles())
		self.Zombie1:Spawn()
		self.Zombie1:VJ_ACT_PLAYACTIVITY("vjseq_fall",true,0.8,true,0,{SequenceDuration=0.8})
		self.Zombie1:SetOwner(self)
	self:TakeDamage(9999999999999999999999999999)
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/