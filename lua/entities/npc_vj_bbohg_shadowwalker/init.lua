AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/monster/subject.mdl"} 
ENT.StartHealth = 150
ENT.HullType = HULL_HUMAN
ENT.CanFlinch = 0
ENT.FlinchChance = 5
ENT.NextFlinchTime = 1.5
ENT.AnimTbl_Flinch = {"cower"}
ENT.VJC_Data = {
	CameraMode = 1,
	ThirdP_Offset = Vector(40, 20, -50),
	FirstP_Bone = "ValveBiped.Bip01_Spine4",
	FirstP_Offset = Vector(0, 0, 5),
}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_SHADOW_WALKERS"} 
ENT.BloodColor = "Oil"
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasMeleeAttack = true 
ENT.MeleeAttackDamage = math.Rand(1,1)
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.AnimTbl_MeleeAttack = {"swing"}
ENT.MeleeAttackDistance = 28
ENT.MeleeAttackDamageDistance = 60
ENT.MeleeAttackAngleRadius = 70
ENT.MeleeAttackDamageAngleRadius = 70
ENT.TimeUntilMeleeAttackDamage = 0.6
ENT.HasOnKilledEnemySound = false
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasDeathAnimation = false
ENT.FootStepSoundLevel = 70
ENT.MeleeAttackSoundLevel = 75
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 95
ENT.IdleSoundChance = 5
ENT.CombatIdleSoundChance = 4
ENT.FootStepTimeRun = 0.25
ENT.FootStepTimeWalk = 0.5
ENT.IdleDialogueDistance = 175

ENT.AnimTbl_IdleStand = {ACT_IDLE_ANGRY}
ENT.HasDeathRagdoll = true
ENT.DeathCorpseEntityClass = "UseDefaultBehavior"
ENT.DeathCorpseModel = {"models/Humans/corpse1.mdl"}

ENT.Crowbar = false
ENT.move = false
ENT.move2 = false
ENT.move3 = false
ENT.infect = true
ENT.infect2 = false
ENT.MoveToCorpose = false
ENT.HasEnemy = false
---------------------------------------------------------------------------------------------------------------------------------------------
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"player/footsteps/concrete1.wav",
	"player/footsteps/concrete2.wav",
	"player/footsteps/concrete3.wav",
	"player/footsteps/concrete4.wav",}
ENT.SoundTbl_MeleeAttack = {"physics/body/body_medium_impact_hard1.wav",
"physics/body/body_medium_impact_hard2.wav",
"physics/body/body_medium_impact_hard3.wav",
"physics/body/body_medium_impact_hard4.wav",
"physics/body/body_medium_impact_hard5.wav"}
ENT.SoundTbl_MeleeAttackExtra = {}
ENT.SoundTbl_MeleeAttackMiss = {"npc/zombie/claw_miss2.wav",
	"npc/zombie/claw_miss1.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()
	if GetConVarNumber("vj_BBOHG_FriendlyTossers") == 1 then
		self.VJ_NPC_Class = {"CLASS_PLAYER_ALLY"}
		self.FriendsWithAllPlayerAllies = true
		self.HasOnPlayerSight = true
		self.OnPlayerSightOnlyOnce = false
		self.OnPlayerSightNextTime = VJ_Set(30, 40)
	end
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()

	self.CombatIdleSoundPitch = VJ_Set(80, 90)
	self.PainSoundPitch = VJ_Set(65, 70)
	self.AlertSoundPitch = VJ_Set(80, 90)
	self.LostEnemySoundPitch = VJ_Set(80, 90)
	self.DeathSoundPitch = VJ_Set(60, 65)

	self.SoundTbl_CombatIdle = {"shadowwalk/npc/stalker/stalker_scream1.wav",
		"shadowwalk/npc/stalker/stalker_scream2.wav",
		"shadowwalk/npc/stalker/stalker_scream3.wav",	
		"shadowwalk/npc/stalker/stalker_scream4.wav"}
	self.SoundTbl_Alert = {"shadowwalk/npc/stalker/stalker_alert1b.wav",	
		"shadowwalk/npc/stalker/stalker_alert2b.wav",
		"shadowwalk/npc/stalker/stalker_alert3b.wav"}
	self.SoundTbl_LostEnemy = {"npc/zombie_poison/pz_alert2.wav",
		"shadowwalk/npc/stalker/stalker_die2.wav",
		"shadowwalk/npc/stalker/stalker_scream4.wav"}
	self.SoundTbl_Pain = {"shadowwalk/npc/stalker/stalker_pain1.wav",
		"shadowwalk/npc/stalker/stalker_pain2.wav",
		"shadowwalk/npc/stalker/stalker_pain3.wav"}
	self.SoundTbl_Death = {"ambient/creatures/town_child_scream1.wav"}

	if math.random (1,20) == 1 then
		self.CombatIdleSoundPitch = VJ_Set(62, 62)
		self.AlertSoundPitch = VJ_Set(62, 62)
		self.LostEnemySoundPitch = VJ_Set(62, 62)

	self.SoundTbl_CombatIdle = {"shadowwalk/vo/episode_1/citadel/al_stalk_pleasestopscreaming01.wav",
		"shadowwalk/vo/episode_1/citadel/al_stalk_pleasestopscreaming02.wav",
		"shadowwalk/vo/episode_1/citadel/al_stalk_pleasestopscreaming03.wav",
		"shadowwalk/vo/episode_1/citadel/al_stalk_pleasestopscreaming04.wav",
		"shadowwalk/vo/episode_1/citadel/al_stalk_pleasestopscreaming05.wav",
		"vo/k_lab2/al_optimism.wav",
		"shadowwalk/vo/episode_1/c17/al_elev_whereselev.wav",
		"shadowwalk/vo/episode_1/intro/al_wheredoeshethink.wav",
		"shadowwalk/vo/outland_02/griggs_everywhere.wav",
		"shadowwalk/vo/outland_11a/silo/kl_silo_wheredata01.wav",
		"shadowwalk/vo/episode_1/intro/al_cantbelieveit.wav",
		"shadowwalk/vo/episode_1/npc/alyx/al_deaf_canthearanything.wav",
		"shadowwalk/vo/episode_1/npc/alyx/al_deaf_canthearyou.wav",
		"vo/k_lab/ba_cantlook.wav"}
	self.SoundTbl_Alert = {"vo/citadel/al_bitofit.wav",
		"shadowwalk/vo/outland_01/intro/al_rbed_notalone.wav"}
	self.SoundTbl_LostEnemy = {"vo/citadel/al_notagain02.wav",	
		"shadowwalk/vo/episode_1/npc/alyx/al_light_lost05.wav",
		"shadowwalk/vo/episode_1/npc/alyx/al_light_lost11.wav",
		"vo/citadel/al_wonderwhere.wav",	
		"shadowwalk/vo/outland_12a/launch/al_launch_damnit.wav",	
		"vo/streetwar/alyx_gate/al_no.wav",	
		"vo/k_lab/kl_thenwhere.wav"}
	end

self.AnimTbl_MeleeAttack = {"swing"}

	local Weapon = math.random(1,3)
	if Weapon == 1 then
			self.Weapon = ents.Create("prop_physics")
			self.Weapon:SetModel("models/weapons/w_crowbar.mdl")
			self.Weapon:SetLocalPos(self:GetPos())
			//self.Weapon:SetPos(self:GetPos())
			self.Weapon:SetOwner(self)
			self.Weapon:SetParent(self)
			self.Weapon:SetLocalAngles(Angle(-120,45,90))
			self.Weapon:Fire("SetParentAttachmentMaintainOffset","anim_attachment_LH")
			self.Weapon:Fire("SetParentAttachment","anim_attachment_RH")
			self.Weapon:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
			self.Weapon:Spawn()
			self.Weapon:Activate()
			self.Weapon:SetSolid(SOLID_NONE)
			self.Weapon:AddEffects(EF_BONEMERGE)
			
self.MeleeAttackDamage = math.Rand(5,10)
self.SoundTbl_MeleeAttack = {"physics/flesh/flesh_impact_bullet1.wav",
	"physics/flesh/flesh_impact_bullet2.wav",
	"physics/flesh/flesh_impact_bullet3.wav",
	"physics/flesh/flesh_impact_bullet4.wav",
	"physics/flesh/flesh_impact_bullet5.wav"}
self.SoundTbl_MeleeAttackExtra = {}
self.SoundTbl_MeleeAttackMiss = {"weapons/iceaxe/iceaxe_swing1.wav"}
self.Crowbar = true

	elseif Weapon == 2 then
			self.Weapon = ents.Create("prop_physics")
			self.Weapon:SetModel("models/props_canal/mattpipe.mdl")
			self.Weapon:SetLocalPos(self:GetPos())
			//self.Weapon:SetPos(self:GetPos())
			self.Weapon:SetOwner(self)
			self.Weapon:SetParent(self)
			self.Weapon:SetLocalAngles(Angle(-120,45,90))
			self.Weapon:Fire("SetParentAttachmentMaintainOffset","anim_attachment_LH")
			self.Weapon:Fire("SetParentAttachment","anim_attachment_RH")
			self.Weapon:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
			self.Weapon:Spawn()
			self.Weapon:Activate()
			self.Weapon:SetSolid(SOLID_NONE)
			self.Weapon:AddEffects(EF_BONEMERGE)

self.MeleeAttackDamage = math.Rand(10,15)
self.SoundTbl_MeleeAttack = {"physics/metal/metal_canister_impact_hard1.wav",
	"physics/metal/metal_canister_impact_hard2.wav",
	"physics/metal/metal_canister_impact_hard3.wav"}
self.SoundTbl_MeleeAttackExtra = {"physics/flesh/flesh_impact_hard1.wav",
	"physics/flesh/flesh_impact_hard2.wav",
	"physics/flesh/flesh_impact_hard3.wav",
	"physics/flesh/flesh_impact_hard4.wav",
	"physics/flesh/flesh_impact_hard5.wav",
	"physics/flesh/flesh_impact_hard6.wav"}
self.SoundTbl_MeleeAttackMiss = {"npc/zombie/claw_miss1.wav",
	"npc/zombie/claw_miss2.wav"}
self.Crowbar = false

	elseif Weapon == 3 then
			self.Weapon = ents.Create("prop_physics")
			self.Weapon:SetModel("models/props_canal/mattpipe.mdl")
			self.Weapon:SetLocalPos(self:GetPos())
			//self.Weapon:SetPos(self:GetPos())
			self.Weapon:SetOwner(self)
			self.Weapon:SetParent(self)
			self.Weapon:SetLocalAngles(Angle(-120,45,90))
			self.Weapon:Fire("SetParentAttachmentMaintainOffset","anim_attachment_LH")
			self.Weapon:Fire("SetParentAttachment","anim_attachment_RH")
			self.Weapon:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
			self.Weapon:Spawn()
			self.Weapon:Activate()
			self.Weapon:SetSolid(SOLID_NONE)
			self.Weapon:AddEffects(EF_BONEMERGE)

self.MeleeAttackDamage = math.Rand(10,15)
self.SoundTbl_MeleeAttack = {"physics/metal/metal_canister_impact_hard1.wav",
	"physics/metal/metal_canister_impact_hard2.wav",
	"physics/metal/metal_canister_impact_hard3.wav"}
self.SoundTbl_MeleeAttackExtra = {"physics/flesh/flesh_impact_hard1.wav",
	"physics/flesh/flesh_impact_hard2.wav",
	"physics/flesh/flesh_impact_hard3.wav",
	"physics/flesh/flesh_impact_hard4.wav",
	"physics/flesh/flesh_impact_hard5.wav",
	"physics/flesh/flesh_impact_hard6.wav"}
self.SoundTbl_MeleeAttackMiss = {"npc/zombie/claw_miss1.wav",
	"npc/zombie/claw_miss2.wav"}
self.Crowbar = false
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
	if IsValid(self:GetEnemy()) then
		self.HasEnemy = true
	else
		self.HasEnemy = false
	end
	
	if self.HasEnemy == false then



	for _,v in ipairs(ents.FindInSphere(self:GetPos(),2600)) do
		if self.infect == true && self.MoveToCorpose == false && self.MeleeAttacking == false then
			if IsValid(v) && v:GetClass() == "prop_ragdoll" &&
			v:GetClass() != "prop_physics" &&
			v:GetModel() !="models/player/skeleton.mdl" &&
			v:GetModel() != "models/combine_strider.mdl" &&
			v:GetModel() != "models/lamarr.mdl" &&
			v:GetModel() != "models/combine_scanner.mdl" &&
			v:GetModel() != "models/manhack.mdl" &&
			v:GetModel() != "models/antlion.mdl" &&
			v:GetModel() != "models/antlion_guard.mdl" &&
			v:GetModel() != "models/headcrabclassic.mdl" &&
			v:GetModel() != "models/headcrab.mdl" &&
			v:GetModel() != "models/headcrabblack.mdl" &&
			v:GetModel() != "models/gibs/fast_zombie_legs.mdl" &&
			v:GetModel() != "models/gibs/fast_zombie_torso.mdl" &&
			v:GetModel() != "models/zombie/classic_legs.mdl" &&
			v:GetModel() != "models/zombie/classic_torso.mdl" &&
			v:GetModel() != "models/humans/charple03.mdl" &&
			v:GetModel() != "models/combine_dropship.mdl" &&
			v:GetModel() != "models/props_vehicles/car001a_phy.mdl" &&
			v:GetModel() != "models/props_vehicles/wagon001a_phy.mdl" &&
			v:GetModel() != "models/shield_scanner.mdl" &&
			v:GetModel() != "models/gunship.mdl" &&
			v:GetModel() != "models/hunter.mdl" &&
			v:GetModel() != "models/Humans/Charple02.mdl"  &&
			v:GetModel() != "models/Humans/Charple01.mdl" &&
			v:GetModel() != "models/Humans/Charple04.mdl" &&
			v:GetModel() != "models/props_c17/furnituremattress001a.mdl" &&
			v:GetModel() != "models/dog.mdl" then
			
				self.infect2 = true
				self.MoveToCorpose = true
				self:SetTarget(v)
				self:VJ_TASK_GOTO_TARGET("TASK_RUN_PATH")
				timer.Simple(math.random(1.2,2.5),function() if IsValid(self) then self.MoveToCorpose = false end end)
			end
		end
	end
	if self.infect2 == true && self.MeleeAttacking == false then 
		for _,v in ipairs(ents.FindInSphere(self:GetPos(),20)) do
			if IsValid(v) &&
			v:GetClass() == "prop_ragdoll" &&
			v:GetClass() != "prop_physics" &&
			v:GetModel() !="models/player/skeleton.mdl" &&
			v:GetModel() != "models/combine_strider.mdl" &&
			v:GetModel() != "models/lamarr.mdl" &&
			v:GetModel() != "models/combine_scanner.mdl" &&
			v:GetModel() != "models/manhack.mdl" &&
			v:GetModel() != "models/antlion.mdl" &&
			v:GetModel() != "models/antlion_guard.mdl" &&
			v:GetModel() != "models/headcrabclassic.mdl" &&
			v:GetModel() != "models/headcrab.mdl" &&
			v:GetModel() != "models/headcrabblack.mdl" &&
			v:GetModel() != "models/gibs/fast_zombie_legs.mdl" &&
			v:GetModel() != "models/gibs/fast_zombie_torso.mdl" &&
			v:GetModel() != "models/zombie/classic_legs.mdl" &&
			v:GetModel() != "models/zombie/classic_torso.mdl" &&
			v:GetModel() != "models/humans/charple03.mdl" &&
			v:GetModel() != "models/combine_dropship.mdl" &&
			v:GetModel() != "models/props_vehicles/car001a_phy.mdl" &&
			v:GetModel() != "models/props_vehicles/wagon001a_phy.mdl" &&
			v:GetModel() != "models/shield_scanner.mdl" &&
			v:GetModel() != "models/gunship.mdl" &&
			v:GetModel() != "models/hunter.mdl" &&
			v:GetModel() != "models/Humans/Charple02.mdl"  &&
			v:GetModel() != "models/Humans/Charple01.mdl" &&
			v:GetModel() != "models/Humans/Charple04.mdl" &&
			v:GetModel() != "models/props_c17/furnituremattress001a.mdl" &&
			v:GetModel() != "models/dog.mdl" then
			
			self:VJ_ACT_PLAYACTIVITY("roofidle1",true,4.6999999019504,false)
				
			timer.Simple(0.5,function() if IsValid(self) && IsValid(v) then
				VJ_EmitSound(self,"physics/body/body_medium_break4.wav",75,65)end end)
			timer.Simple(1,function() if IsValid(self) && IsValid(v) then
				VJ_EmitSound(self,"physics/flesh/flesh_bloody_impact_hard1.wav",75,65) end end)
				
			timer.Simple(1.9,function() if IsValid(self) then
				VJ_EmitSound(self,"physics/flesh/flesh_bloody_impact_hard1.wav",75,65)
				VJ_EmitSound(self,"physics/flesh/flesh_bloody_break.wav",75,80) end end)
			
			timer.Simple(0.2,function() if IsValid(self) && IsValid(v) then
			self:FaceCertainEntity(v) end end)
			v:SetPersistent(true) 
			v:SetCollisionGroup(COLLISION_GROUP_DEBRIS)

	self.MovementType = VJ_MOVETYPE_STATIONARY
	self.CanTurnWhileStationary = false
	self.infect = false
	self.DisableChasingEnemy = true
	self.DisableFindEnemy = true
	self.infect2 = false
	
	timer.Simple(3.8,function()
		if IsValid(self) && IsValid(v) then
			if IsValid(v) && v:GetClass() == "prop_ragdoll" &&
			v:GetClass() != "prop_physics" &&
			v:GetModel() !="models/player/skeleton.mdl" &&
			v:GetModel() != "models/combine_strider.mdl" &&
			v:GetModel() != "models/lamarr.mdl" &&
			v:GetModel() != "models/combine_scanner.mdl" &&
			v:GetModel() != "models/manhack.mdl" &&
			v:GetModel() != "models/antlion.mdl" &&
			v:GetModel() != "models/antlion_guard.mdl" &&
			v:GetModel() != "models/headcrabclassic.mdl" &&
			v:GetModel() != "models/headcrab.mdl" &&
			v:GetModel() != "models/headcrabblack.mdl" &&
			v:GetModel() != "models/gibs/fast_zombie_legs.mdl" &&
			v:GetModel() != "models/gibs/fast_zombie_torso.mdl" &&
			v:GetModel() != "models/zombie/classic_legs.mdl" &&
			v:GetModel() != "models/zombie/classic_torso.mdl" &&
			v:GetModel() != "models/humans/charple03.mdl" &&
			v:GetModel() != "models/combine_dropship.mdl" &&
			v:GetModel() != "models/props_vehicles/car001a_phy.mdl" &&
			v:GetModel() != "models/props_vehicles/wagon001a_phy.mdl" &&
			v:GetModel() != "models/shield_scanner.mdl" &&
			v:GetModel() != "models/gunship.mdl" &&
			v:GetModel() != "models/hunter.mdl" &&
			v:GetModel() != "models/Humans/Charple02.mdl" &&
			v:GetModel() != "models/Humans/Charple01.mdl" &&
			v:GetModel() != "models/Humans/Charple04.mdl" &&
			v:GetModel() != "models/props_c17/furnituremattress001a.mdl" &&
			v:GetModel() != "models/dog.mdl" then
				v:Remove()

		local spawn = math.random(1,1)
			if spawn == 1 then
				self.sworm13 = ents.Create("npc_vj_bbohg_shadowwalker")
				self.sworm13:SetPos(v:GetPos() + self:GetUp()*10)
				self.sworm13:SetAngles(self:GetAngles())
				self.sworm13:Spawn()
			timer.Simple(0.15,function() if IsValid(self) && IsValid(self.sworm13) then
				VJ_EmitSound(self,"physics/flesh/flesh_bloody_impact_hard1.wav",35,88) end end)
				self.sworm13:VJ_ACT_PLAYACTIVITY("Sit_Ground_to_Idle",true,2.5,false)
				self.sworm13:Activate()
				self.sworm13:SetOwner(self)
				-- self.sworm13:HasEntitiesToNoCollide = true
				-- self.sworm13:EntitiesToNoCollide = {"npc_vj_bbohg_shadowwalker"}
			end
	end
end end)

	timer.Simple(4.6999999019504,function() if IsValid(self) then 
		self.infect = true
		self.DisableChasingEnemy = false
		self.DisableFindEnemy = false
	end end)
		timer.Simple(6,function() if IsValid(self) then 
		self.MovementType = VJ_MOVETYPE_GROUND
	end end)
	end
end
end
end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetSightDirection()
	return self:GetAttachment(self:LookupAttachment("eyes")).Ang:Forward()
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnChangeMovementType(movType)	
	if VJ_AnimationExists(self,ACT_JUMP) == true then self:CapabilitiesRemove(bit.bor(CAP_MOVE_JUMP)) end
	if VJ_AnimationExists(self,ACT_CLIMB_UP) == true then self:CapabilitiesRemove(bit.bor(CAP_MOVE_CLIMB)) end
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDeath_AfterCorpseSpawned(dmginfo,hitgroup,GetCorpse)
	if self.Crowbar == true then
		self:CreateGibEntity("prop_physics","models/weapons/w_crowbar.mdl",{Pos=self:LocalToWorld(Vector(0,-10,35)),Ang=self:GetAngles()+Angle(0,0,0),Vel=self:GetRight()*math.Rand(-5,5)+self:GetForward()*math.Rand(-5,5)+self:GetUp()*math.Rand(-5,5)})
	else
		self:CreateGibEntity("prop_physics","models/props_canal/mattpipe.mdl",{Pos=self:LocalToWorld(Vector(0,-10,35)),Ang=self:GetAngles()+Angle(0,0,0),Vel=self:GetRight()*math.Rand(-5,5)+self:GetForward()*math.Rand(-5,5)+self:GetUp()*math.Rand(-5,5)})
	end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/