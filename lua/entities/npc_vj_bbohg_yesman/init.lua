AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/Humans/Group03m/male_09.mdl"} 
ENT.StartHealth = 100
ENT.HullType = HULL_HUMAN
ENT.CanFlinch = 1
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
ENT.VJ_NPC_Class = {"CLASS_YES"} 
ENT.BloodColor = "Purple"
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasMeleeAttack = true 
ENT.MeleeAttackDamage = math.Rand(1,1)
ENT.MeleeAttackDamageType = DMG_ALWAYSGIB
ENT.AnimTbl_MeleeAttack = {"swing"}
ENT.MeleeAttackDistance = 28
ENT.MeleeAttackDamageDistance = 60
ENT.MeleeAttackAngleRadius = 70
ENT.MeleeAttackDamageAngleRadius = 70
ENT.TimeUntilMeleeAttackDamage = 0.6
ENT.HasOnKilledEnemySound = false
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.IsMedicSNPC = true
ENT.AnimTbl_Medic_GiveHealth = {"cheer1","cheer2"}
ENT.Medic_TimeUntilHeal = 3
ENT.Medic_HealthAmount = math.Rand(75,100)
ENT.Medic_NextHealTime = VJ_Set(5, 10)
ENT.Medic_SpawnPropOnHeal = false
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.NextSoundTime_Idle = VJ_Set(4, 11)
ENT.BreathSoundLevel = 60
ENT.FootStepSoundLevel = 70
ENT.MeleeAttackSoundLevel = 75
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 100
ENT.IdleSoundChance = 5
ENT.CombatIdleSoundChance = 4
ENT.IdleSoundLevel = 75
ENT.CombatIdleSoundLevel = 80
ENT.FootStepTimeRun = 0.25
ENT.FootStepTimeWalk = 0.5

ENT.CanDoDeathSound = true
---------------------------------------------------------------------------------------------------------------------------------------------
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_Breath = {"yesman/ding.mp3",
	"yesman/dingco.mp3",
	"yesman/disco.mp3",
	"yesman/disco2.mp3"}
ENT.SoundTbl_FootStep = {"player/footsteps/concrete1.wav",
	"player/footsteps/concrete2.wav",
	"player/footsteps/concrete3.wav",
	"player/footsteps/concrete4.wav",}
ENT.SoundTbl_Idle = {"yesman/work_beats_fierce_sound.mp3",
	"yesman/yes.mp3"}
ENT.SoundTbl_Alert = {"yesman/fork.mp3",
	"yesman/yes_with_me.mp3",
	"yesman/do_you_believe2.mp3",
	"yesman/do_you_believe.mp3",
	"yesman/found_it.mp3"}
ENT.SoundTbl_CallForHelp = {"yesman/all_my_bitches.mp3",
	"yesman/need_you_right_now.mp3"}
ENT.SoundTbl_CombatIdle = {"yesman/yes_with_me.mp3",
	"yesman/yes_yes_yes.mp3",
	"yesman/work_beats_fierce_sound_2.mp3",
	"yesman/do_you_believe2.mp3",
	"yesman/do_you_believe.mp3"}
ENT.SoundTbl_BeforeMeleeAttack = {}
ENT.SoundTbl_MeleeAttack = {"physics/body/body_medium_impact_hard1.wav",
	"physics/body/body_medium_impact_hard2.wav",
	"physics/body/body_medium_impact_hard3.wav",
	"physics/body/body_medium_impact_hard4.wav",
	"physics/body/body_medium_impact_hard5.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"npc/zombie/claw_miss2.wav","npc/zombie/claw_miss1.wav"}
ENT.SoundTbl_MeleeAttackSlowPlayer = {}
ENT.SoundTbl_MedicBeforeHeal = {"yesman/yes_cures_everything.mp3",
	"yesman/need_you_right_now.mp3",
	"yesman/believe_in_the_yes.mp3"}
ENT.SoundTbl_Pain = {"vo/npc/male01/moan01.wav",
	"vo/npc/male01/moan02.wav",
	"vo/npc/male01/moan03.wav",
	"vo/npc/male01/moan04.wav",
	"vo/npc/male01/moan05.wav",
	"yesman/i_don't_know_what_to_call_this.mp3",
	"yesman/STOP.mp3"}
ENT.SoundTbl_Death = {"vo/npc/male01/moan01.wav",
	"vo/npc/male01/moan02.wav",
	"vo/npc/male01/moan03.wav",
	"vo/npc/male01/moan04.wav",
	"vo/npc/male01/moan05.wav",
	"yesman/i_don't_know_what_to_call_this.mp3"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetSightDirection()
	return self:GetAttachment(self:LookupAttachment("eyes")).Ang:Forward()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	self.NextSoundTime_Breath =  VJ_Set(6.4, 6.4)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAllyDeath(ent) 
	if math.random(1,4) == 1 then
		VJ_EmitSound(self,{"yesman/death_from_yes.mp3","yesman/have_to_believe_in_the_yes.mp3"},70,math.random(100,100))
		self.CanDoDeathSound = false
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleMeleeAttacks()
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
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()	
	if IsValid(self:GetEnemy()) then
		self.BreathSoundLevel = 70
	else
		self.BreathSoundLevel = 60
	end	
	if self.CanDoDeathSound == false then
		timer.Simple(5,function() if IsValid(self) then
			self.CanDoDeathSound = true
			end
		end)
	end
	if IsValid(self:GetEnemy()) then
		self.SoundTbl_LostEnemy = {"yesman/i_lost_my_contact.mp3"}
		self.SoundTbl_Alert = {"yesman/found_it.mp3"}
			timer.Simple(60, function() if IsValid(self) then
				self.SoundTbl_Alert = {"yesman/fork.mp3","yesman/yes_with_me.mp3","yesman/do_you_believe2.mp3","yesman/do_you_believe.mp3","yesman/found_it.mp3"}
				end
			end)
		end
	end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnChangeMovementType(movType)	
	if VJ_AnimationExists(self,ACT_JUMP) == true then self:CapabilitiesRemove(bit.bor(CAP_MOVE_JUMP)) end
	if VJ_AnimationExists(self,ACT_CLIMB_UP) == true then self:CapabilitiesRemove(bit.bor(CAP_MOVE_CLIMB)) end
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/