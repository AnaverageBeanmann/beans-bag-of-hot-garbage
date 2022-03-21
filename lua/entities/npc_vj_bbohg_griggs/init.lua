AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/monk.mdl"}
ENT.StartHealth = 10000
ENT.HullType = HULL_HUMAN
ENT.CanFlinch = 0
ENT.VJC_Data = {
	CameraMode = 1,
	ThirdP_Offset = Vector(40, 20, -50),
	FirstP_Bone = "ValveBiped.Bip01_Spine4",
	FirstP_Offset = Vector(0, 0, 5),
}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_GRIEFER","CLASS_HOBO"} 
ENT.BloodColor = "Red"
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasMeleeAttack = true 
ENT.MeleeAttackDamage = math.Rand(5,10)
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.AnimTbl_MeleeAttack = {"vjseq_MeleeAttack01"}
ENT.TimeUntilMeleeAttackDamage = 0.7
ENT.MeleeAttackDistance = 28
ENT.MeleeAttackDamageDistance = 60
ENT.MeleeAttackAngleRadius = 70
ENT.MeleeAttackDamageAngleRadius = 70
ENT.TimeUntilMeleeAttackDamage = 0.6
ENT.HasOnKilledEnemySound = true
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasGrenadeAttack = true -- Should the SNPC have a grenade attack?
ENT.GrenadeAttackEntity = "obj_vj_tank_shell" -- The entity that the SNPC throws | Half Life 2 Grenade: "npc_grenade_frag"
ENT.GrenadeAttackModel = {} -- Picks a random model from this table to override the model of the grenade
ENT.GrenadeAttackAttachment = "anim_attachment_RH" -- The attachment that the grenade will spawn at | false = Custom position
	-- ====== Animation Variables ====== --
ENT.AnimTbl_GrenadeAttack = {"throw1"} -- Grenade Attack Animations
ENT.GrenadeAttackAnimationDelay = 0 -- It will wait certain amount of time before playing the animation
ENT.GrenadeAttackAnimationFaceEnemy = true -- Should it face the enemy while playing the grenade attack animation?
	-- ====== Distance & Chance Variables ====== --
ENT.NextThrowGrenadeTime = VJ_Set(5, 10) -- Time until it can throw a grenade again
ENT.ThrowGrenadeChance = 1 -- Chance that it will throw the grenade | Set to 1 to throw all the time
ENT.GrenadeAttackThrowDistance = 1500 -- How far it can throw grenades
ENT.GrenadeAttackThrowDistanceClose = 1 -- How close until it stops throwing grenades
	-- ====== Timer Variables ====== --
ENT.TimeUntilGrenadeIsReleased = 0.98 -- Time until the grenade is released
ENT.GrenadeAttackAnimationStopAttacks = true -- Should it stop attacks for a certain amount of time?
	-- To let the base automatically detect the attack duration, set this to false:
ENT.GrenadeAttackAnimationStopAttacksTime = false -- How long should it stop attacks?
ENT.GrenadeAttackFussTime = 3 -- Time until the grenade explodes
	-- ====== Grenade Detection & Throwing Back Variables ====== --
ENT.CanDetectGrenades = true -- Set to false to disable the SNPC from running away from grenades
ENT.RunFromGrenadeDistance = 400 -- If the entity is this close to the it, then run!
	-- NOTE: The ability to throw grenades back only work if the SNPC can detect grenades AND has a grenade attack!
ENT.CanThrowBackDetectedGrenades = true -- Should it try to pick up the detected grenade and throw it back to the enemy?
	-- ====== Control Variables ====== --
ENT.DisableGrenadeAttackAnimation = false -- if true, it will disable the animation code when doing grenade attack
---------------------------------------------------------------------------------------------------------------------------------------------

ENT.SoundTbl_Idle = {
	"vo/ravenholm/firetrap_vigil.wav",
	"vo/ravenholm/monk_rant01.wav",
	"vo/ravenholm/monk_rant02.wav",
	"vo/ravenholm/monk_rant03.wav",
	"vo/ravenholm/monk_rant04.wav",
	"vo/ravenholm/monk_rant05.wav",
	"vo/ravenholm/monk_rant06.wav",
	"vo/ravenholm/monk_rant07.wav",
	"vo/ravenholm/monk_rant08.wav",
	"vo/ravenholm/monk_rant09.wav",
	"vo/ravenholm/monk_rant10.wav",
	"vo/ravenholm/monk_rant11.wav",
	"vo/ravenholm/monk_rant12.wav",
	"vo/ravenholm/monk_rant13.wav",
	"vo/ravenholm/monk_rant14.wav",
	"vo/ravenholm/monk_rant15.wav",
	"vo/ravenholm/monk_rant16.wav",
	"vo/ravenholm/monk_rant17.wav",
	"vo/ravenholm/monk_rant18.wav",
	"vo/ravenholm/monk_rant19.wav",
	"vo/ravenholm/monk_rant20.wav",
	"vo/ravenholm/monk_rant21.wav",
	"vo/ravenholm/monk_rant22.wav",
}
ENT.SoundTbl_OnPlayerSight = {
	"vo/ravenholm/grave_follow.wav",
	"vo/ravenholm/grave_stayclose.wav",
	"vo/ravenholm/monk_overhere.wav",
	"vo/ravenholm/monk_stayclosebro.wav",
	"vo/ravenholm/pyre_anotherlife.wav",
	"vo/ravenholm/yard_greetings.wav",
}
ENT.SoundTbl_Alert = {
	"vo/ravenholm/aimforhead.wav",
	"vo/ravenholm/bucket_guardwell.wav",
	"vo/ravenholm/engage01.wav",
	"vo/ravenholm/engage02.wav",
	"vo/ravenholm/engage03.wav",
	"vo/ravenholm/engage04.wav",
	"vo/ravenholm/engage05.wav",
	"vo/ravenholm/engage06.wav",
	"vo/ravenholm/engage07.wav",
	"vo/ravenholm/engage08.wav",
	"vo/ravenholm/engage09.wav",
	"vo/ravenholm/shotgun_hush.wav",
	"vo/ravenholm/shotgun_theycome.wav",
}
ENT.SoundTbl_BecomeEnemyToPlayer = {
	"vo/ravenholm/engage01.wav",
	"vo/ravenholm/engage02.wav",
	"vo/ravenholm/engage03.wav",
	"vo/ravenholm/engage04.wav",
	"vo/ravenholm/engage05.wav",
	"vo/ravenholm/engage06.wav",
	"vo/ravenholm/engage07.wav",
	"vo/ravenholm/engage08.wav",
	"vo/ravenholm/engage09.wav",
}
ENT.SoundTbl_CallForHelp = {
	"vo/ravenholm/monk_coverme02.wav",
	"vo/ravenholm/monk_coverme03.wav",
	"vo/ravenholm/monk_coverme04.wav",
	"vo/ravenholm/monk_coverme05.wav",
	"vo/ravenholm/monk_coverme07.wav",
	"vo/ravenholm/monk_helpme01.wav",
	"vo/ravenholm/monk_helpme02.wav",
	"vo/ravenholm/monk_helpme03.wav",
	"vo/ravenholm/monk_helpme04.wav",
	"vo/ravenholm/monk_helpme05.wav",
}
ENT.SoundTbl_AllyDeath = {
	"vo/ravenholm/monk_mourn01.wav",
	"vo/ravenholm/monk_mourn02.wav",
	"vo/ravenholm/monk_mourn03.wav",
	"vo/ravenholm/monk_mourn04.wav",
	"vo/ravenholm/monk_mourn05.wav",
	"vo/ravenholm/monk_mourn06.wav",
	"vo/ravenholm/monk_mourn07.wav",
}
ENT.SoundTbl_OnGrenadeSight = {"vo/ravenholm/monk_danger01.wav",
	"vo/ravenholm/monk_danger02.wav",
	"vo/ravenholm/monk_danger03.wav",
	"vo/ravenholm/monk_blocked02.wav"}
ENT.SoundTbl_OnKilledEnemy = {"vo/ravenholm/madlaugh01.wav",
	"vo/ravenholm/madlaugh02.wav",
	"vo/ravenholm/madlaugh03.wav",
	"vo/ravenholm/madlaugh04.wav",
	"vo/ravenholm/monk_kill01.wav",
	"vo/ravenholm/monk_kill02.wav",
	"vo/ravenholm/monk_kill03.wav",
	"vo/ravenholm/monk_kill04.wav",
	"vo/ravenholm/monk_kill05.wav",
	"vo/ravenholm/monk_kill06.wav",
	"vo/ravenholm/monk_kill07.wav",
	"vo/ravenholm/monk_kill08.wav",
	"vo/ravenholm/monk_kill09.wav",
	"vo/ravenholm/monk_kill10.wav",
	"vo/ravenholm/monk_kill11.wav"}
ENT.SoundTbl_Pain = {"vo/ravenholm/monk_pain01.wav",
	"vo/ravenholm/monk_pain02.wav",
	"vo/ravenholm/monk_pain03.wav",
	"vo/ravenholm/monk_pain04.wav",
	"vo/ravenholm/monk_pain05.wav",
	"vo/ravenholm/monk_pain06.wav",
	"vo/ravenholm/monk_pain07.wav",
	"vo/ravenholm/monk_pain08.wav",
	"vo/ravenholm/monk_pain09.wav",
	"vo/ravenholm/monk_pain10.wav",
	"vo/ravenholm/monk_pain12.wav"}
ENT.SoundTbl_Death = {"vo/ravenholm/monk_death07.wav"}





ENT.HasDeathAnimation = true
ENT.DeathAnimationTime = false
ENT.DeathAnimationChance = 1
ENT.AnimTbl_Death = {"throwshotgun"}
ENT.HasDeathRagdoll = false
ENT.FootStepSoundLevel = 70
ENT.MeleeAttackSoundLevel = 75
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 95
ENT.IdleSoundChance = 5
ENT.CombatIdleSoundChance = 4
ENT.FootStepTimeRun = 0.25
ENT.FootStepTimeWalk = 0.5
ENT.IdleDialogueDistance = 175
	ENT.HasSoundTrack = true
	ENT.SoundTbl_SoundTrack = {"music/Supermassive_Big_Dick.mp3"}

ENT.Weapon_NoSpawnMenu = true
ENT.AnimTbl_IdleStand = {ACT_IDLE_ANGRY}

ENT.Crowbar = false
ENT.move = false
ENT.move2 = false
ENT.move3 = false
ENT.infect = true
ENT.infect2 = false
ENT.MoveToCorpose = false
ENT.HasEnemy = false
ENT.Suck = false
ENT.HasWeapon = false
ENT.HatType = 0
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
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
				self.Hat = ents.Create("prop_physics")
				self.Hat:SetModel("models/player/items/humans/top_hat.mdl")
				self.Hat:SetLocalPos(self:GetPos())
				//self.Hat:SetPos(self:GetPos())
				self.Hat:SetOwner(self)
				self.Hat:SetParent(self)
				self.Hat:SetLocalAngles(Angle(-120,45,90))
				self.Hat:Fire("SetParentAttachmentMaintainOffset","anim_attachment_head")
					self.Hat:Fire("SetParentAttachment","anim_attachment_head")
				self.Hat:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
				self.Hat:Spawn()
				self.Hat:Activate()
				self.Hat:SetSolid(SOLID_NONE)
				self.Hat:AddEffects(EF_BONEMERGE)
				self.Hat:SetKeyValue("rendercolor","191 127 255 255")
	self:SetSubMaterial( 0, "models/props_combine/tprings_globe" )
	self:SetSubMaterial( 1, "models/charple/charple1_sheet" )
	self:SetSubMaterial( 2, "models/props_combine/tprings_globe" )
	self:SetSubMaterial( 3, "models/props_combine/tprings_globe" )
				
			self:Give("weapon_vj_bbohg_ggg")
end
-- end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnSetupWeaponHoldTypeAnims(hType)
	if hType == "crossbow" or hType == "shotgun" then
		self.WeaponAnimTranslations[ACT_RANGE_ATTACK1] 					= ACT_RANGE_ATTACK_SHOTGUN
		self.WeaponAnimTranslations[ACT_GESTURE_RANGE_ATTACK1] 			= ACT_GESTURE_RANGE_ATTACK_SHOTGUN
		self.WeaponAnimTranslations[ACT_RANGE_ATTACK1_LOW] 				= ACT_RANGE_ATTACK_SMG1_LOW
		self.WeaponAnimTranslations[ACT_RELOAD] 						= ACT_RELOAD_SMG1
		self.WeaponAnimTranslations[ACT_RELOAD_LOW] 					= ACT_RELOAD_SMG1_LOW
		
		self.WeaponAnimTranslations[ACT_IDLE] 							= ACT_IDLE
		self.WeaponAnimTranslations[ACT_IDLE_ANGRY] 					= ACT_IDLE_ANGRY
		
		self.WeaponAnimTranslations[ACT_WALK] 							= ACT_WALK_RIFLE
		self.WeaponAnimTranslations[ACT_WALK_AIM] 						= ACT_WALK_AIM_RIFLE
		self.WeaponAnimTranslations[ACT_WALK_CROUCH] 					= ACT_WALK_CROUCH_RPG
		self.WeaponAnimTranslations[ACT_WALK_CROUCH_AIM] 				= ACT_WALK_CROUCH_AIM_RIFLE
		
		self.WeaponAnimTranslations[ACT_RUN] 							= ACT_RUN_RIFLE
		self.WeaponAnimTranslations[ACT_RUN_AIM] 						= ACT_RUN_AIM_RIFLE
		self.WeaponAnimTranslations[ACT_RUN_CROUCH] 					= ACT_RUN_CROUCH_RPG
		self.WeaponAnimTranslations[ACT_RUN_CROUCH_AIM] 				= ACT_RUN_CROUCH_AIM_RIFLE
		self.CanCrouchOnWeaponAttack = false
		return true
	else
		self.CanCrouchOnWeaponAttack = true
		return false
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetSightDirection()
	return self:GetAttachment(self:LookupAttachment("eyes")).Ang:Forward()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAlert(ent)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleMeleeAttacks()
	if !self.HasWeapon == true then
	local randattack_stand = math.random(1,8)

	if randattack_stand == 1 then
		self.AnimTbl_MeleeAttack = {"swing"}
		self.TimeUntilMeleeAttackDamage = 0.4
		self.MeleeAttackDamage = math.Rand(5,10)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 2 then
		self.AnimTbl_MeleeAttack = {"swing"}
		self.TimeUntilMeleeAttackDamage = 0.4
		self.MeleeAttackDamage = math.Rand(5,10)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 3 then
		self.AnimTbl_MeleeAttack = {"swing"}
		self.TimeUntilMeleeAttackDamage = 0.4
		self.MeleeAttackDamage = math.Rand(5,10)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 4 then
		self.AnimTbl_MeleeAttack = {"swing"}
		self.TimeUntilMeleeAttackDamage = 0.4
		self.MeleeAttackDamage = math.Rand(5,10)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 5 then
		self.AnimTbl_MeleeAttack = {"throw1"}
		self.TimeUntilMeleeAttackDamage = 1
		self.MeleeAttackDamage = math.Rand(10,15)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 6 then
		self.AnimTbl_MeleeAttack = {"ThrowItem"}
		self.TimeUntilMeleeAttackDamage = 1
		self.MeleeAttackDamage = math.Rand(5,10)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = true
		self.MeleeAttackKnockBack_Forward1 = 55
		self.MeleeAttackKnockBack_Forward2 = 60
		self.MeleeAttackKnockBack_Up1 = 100
		self.MeleeAttackKnockBack_Up2 = 100
		
	elseif randattack_stand == 7 then
		self.AnimTbl_MeleeAttack = {"MeleeAttack01"}
		self.TimeUntilMeleeAttackDamage = 0.5
		self.MeleeAttackDamage = math.Rand(5,10)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = true
		self.MeleeAttackKnockBack_Forward1 = 55
		self.MeleeAttackKnockBack_Forward2 = 60
		self.MeleeAttackKnockBack_Up1 = 35
		self.MeleeAttackKnockBack_Up2 = 45

		
	elseif randattack_stand == 8 then
		self.AnimTbl_MeleeAttack = {"MeleeAttack01"}
		self.TimeUntilMeleeAttackDamage = 0.5
		self.MeleeAttackDamage = math.Rand(5,10)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = true
		self.MeleeAttackKnockBack_Forward1 = 55
		self.MeleeAttackKnockBack_Forward2 = 60
		self.MeleeAttackKnockBack_Up1 = 35
		self.MeleeAttackKnockBack_Up2 = 45
		
	end
end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnGrenadeAttack_ThrowVelocity(grEnt, grTargetPos) 
	local ene = self:GetEnemy()
		if IsValid(ene) then
		return self:CalculateProjectile("Curve", grEnt:GetPos(), ene:GetPos() + ene:OBBCenter(), 1500)
		else return end
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnChangeMovementType(movType)	
	if VJ_AnimationExists(self,ACT_JUMP) == true then self:CapabilitiesRemove(bit.bor(CAP_MOVE_JUMP)) end
	if VJ_AnimationExists(self,ACT_CLIMB_UP) == true then self:CapabilitiesRemove(bit.bor(CAP_MOVE_CLIMB)) end
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnResetEnemy()
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_AfterDamage(dmginfo, hitgroup)
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialKilled(dmginfo, hitgroup)
	timer.Simple(0.0001,function()
	if IsValid(self) then
    self:AddFlags(FL_NOTARGET)
	self:SetRenderFX( kRenderFxDistort )
		if GetConVarNumber("vj_npc_noidleparticle") == 0 then
			ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
			ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("chest"))
			ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_RH"))
			ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_LH"))
			ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("eyes"))
			ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
			ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("chest"))
			ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_RH"))
			ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("anim_attachment_LH"))
			ParticleEffectAttach("generic_smoke",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("eyes"))
		end	
	end end)
	timer.Simple(0.1,function()
	if IsValid(self) then
	local STabb = math.random(1,2)
		if STabb == 1 then
			VJ_EmitSound(self,"boner/bigdeath1.mp3",100,100)
		else
			VJ_EmitSound(self,"boner/bigdeath2.mp3",100,100)
		end
		VJ_EmitSound(self,"boner/bigdeathextra.mp3",100,100)
		VJ_EmitSound(self,"boner/bigdeathextra.mp3",100,100)
	
	
	-- self:SetKeyValue("rendercolor","255 255 255 250")
		timer.Simple(0.5,function()
		self:SetKeyValue("rendercolor","209 209 209 215") end)
		timer.Simple(1,function()
		self:SetKeyValue("rendercolor","177 177 177 175") end)
		timer.Simple(1.5,function()
		self:SetKeyValue("rendercolor","96 96 96 95") end)
		timer.Simple(2,function()
		self:SetKeyValue("rendercolor","0 0 0 1") end)
		end
	end)
		-- self:SetKeyValue("ColorAlpha","255 255 255 88")
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/