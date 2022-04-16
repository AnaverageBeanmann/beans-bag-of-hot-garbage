AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/Barney.mdl"} 
ENT.StartHealth = 150
ENT.VJC_Data = {
	CameraMode = 1, 
	ThirdP_Offset = Vector(45, 15, -50), -- The offset for the controller when the camera is in third person
	FirstP_Bone = "ValveBiped.Bip01_Head1", -- If left empty, the base will attempt to calculate a position for first person
	FirstP_Offset = Vector(0, 0, 5), -- The offset for the controller when the camera is in first person
}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_TOSSER"}
ENT.FriendsWithAllPlayerAllies = false
ENT.BecomeEnemyToPlayer = true
ENT.BecomeEnemyToPlayerLevel = 3
ENT.HasOnPlayerSight = true
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.IsMedicSNPC = true
ENT.AnimTbl_Medic_GiveHealth = {"ThrowItem"}
ENT.Medic_TimeUntilHeal = 1
ENT.Medic_HealthAmount = math.random(5,10)
ENT.Medic_SpawnPropOnHealModel = "models/props_junk/garbage_glassbottle003a.mdl"
ENT.Medic_SpawnPropOnHealAttachment = "anim_attachment_LH"
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.BloodColor = "Orange"
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = {"cower"}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasItemDropsOnDeath = false
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.MeleeAttackDamage = math.Rand(1,1)
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.AnimTbl_MeleeAttack = {"swing"}
ENT.MeleeAttackDistance = 35
ENT.MeleeAttackDamageDistance = 50
ENT.MeleeAttackAngleRadius = 70
ENT.MeleeAttackDamageAngleRadius = 70
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasRangeAttack = true
ENT.RangeAttackEntityToSpawn = "obj_vj_bbohg_thatbeerheowesyou"
ENT.AnimTbl_RangeAttack = {"swing"}
ENT.RangeToMeleeDistance = 50
ENT.TimeUntilRangeAttackProjectileRelease = 0.4
ENT.NextRangeAttackTime = 0.1
ENT.NextRangeAttackTime_DoRand = nil
ENT.RangeUseAttachmentForPos = true
ENT.RangeUseAttachmentForPosID = "anim_attachment_RH"
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.FootStepTimeRun = 0.25
ENT.FootStepTimeWalk = 0.5

ENT.IdleSoundChance = 15
ENT.CombatIdleSoundChance = 15

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 95

ENT.IdleDialogueDistance = 175

ENT.Gender = 0
---------------------------------------------------------------------------------------------------------------------------------------------
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"npc/footsteps/hardboot_generic1.wav",
	"npc/footsteps/hardboot_generic2.wav",
	"npc/footsteps/hardboot_generic3.wav",
	"npc/footsteps/hardboot_generic4.wav",
	"npc/footsteps/hardboot_generic5.wav",
	"npc/footsteps/hardboot_generic6.wav",
	"npc/footsteps/hardboot_generic8.wav"}
ENT.SoundTbl_Idle = {"ambient/voices/cough1.wav",
	"ambient/voices/cough2.wav",
	"ambient/voices/cough3.wav",
	"ambient/voices/cough4.wav"}
ENT.SoundTbl_IdleDialogue = {"vo/k_lab/ba_ishehere.wav",
	"vo/k_lab/ba_itsworking04.wav",
	"vo/streetwar/sniper/ba_hearcat.wav",
	"vo/npc/barney/ba_danger02.wav",
	"npc/tossers/barnyot/biggermess.mp3"}
ENT.SoundTbl_IdleDialogueAnswer = {"vo/k_lab/ba_dontblameyou.wav",
	"vo/k_lab/ba_forgetthatthing.wav",
	"vo/k_lab/ba_geethanks.wav",
	"vo/k_lab/ba_itsworking01.wav",
	"vo/k_lab/ba_itsworking02.wav",
	"vo/k_lab/ba_saidlasttime.wav",
	"vo/k_lab2/ba_goodnews.wav",
	"vo/trainyard/ba_thinking01.wav",
	"vo/streetwar/sniper/ba_hauntsme.wav",}
ENT.SoundTbl_CombatIdle = {}
ENT.SoundTbl_OnReceiveOrder = {"vo/k_lab/ba_thingaway01.wav"}
ENT.SoundTbl_FollowPlayer = {"vo/k_lab2/ba_goodnews_c.wav",
	"vo/streetwar/sniper/ba_letsclearout.wav",
	"vo/npc/barney/ba_imwithyou.wav",
	"vo/npc/barney/ba_letsdoit.wav",
	"npc/tossers/barnyot/myshift.mp3"}
ENT.SoundTbl_UnFollowPlayer = {"vo/k_lab/ba_goodluck02.wav",
	"vo/trainyard/ba_goodluck01.wav",
	"vo/trainyard/ba_meetyoulater01.wav",
	"vo/streetwar/sniper/ba_cantmove.wav",
	"vo/streetwar/rubble/ba_nag_wall02.wav"}
ENT.SoundTbl_MoveOutOfPlayersWay = {}
ENT.SoundTbl_MedicBeforeHeal = {"vo/trainyard/ba_thatbeer02.wav"}
ENT.SoundTbl_MedicAfterHeal = {"npc/barnacle/barnacle_gulp1.wav",
	"npc/barnacle/barnacle_gulp2.wav"}
ENT.SoundTbl_OnPlayerSight = {"vo/trainyard/ba_heygordon.wav",
	"vo/trainyard/ba_rememberme.wav",
	"vo/streetwar/sniper/ba_goodtohavehelp.wav",
	"vo/streetwar/sniper/ba_returnhero.wav",
	"vo/streetwar/rubble/ba_gordon.wav"}
ENT.SoundTbl_Investigate = {"vo/k_lab/ba_careful01.wav",
	"vo/k_lab/ba_getoutofsight02.wav",
	"vo/k_lab/ba_whatthehell.wav"}
ENT.SoundTbl_LostEnemy = {"vo/streetwar/nexus/ba_alldown.wav",
	"vo/streetwar/nexus/ba_done.wav"}
ENT.SoundTbl_Alert = {"vo/k_lab/ba_thereyouare.wav",
	"vo/k_lab2/ba_incoming.wav",
	"vo/streetwar/sniper/ba_overhere.wav",
	"vo/npc/barney/ba_bringiton.wav",
	"vo/npc/barney/ba_goingdown.wav",
	"vo/npc/barney/ba_hereitcomes.wav",
	"vo/npc/barney/ba_heretheycome01.wav",
	"vo/npc/barney/ba_heretheycome02.wav",
	"vo/npc/barney/ba_lookout.wav",
	"vo/npc/barney/ba_uhohheretheycome.wav",
	"npc/tossers/barnyot/dolphin.mp3"}
ENT.SoundTbl_CallForHelp = {"vo/k_lab2/ba_getgoing.wav",
	"vo/trainyard/ba_exitnag02.wav",
	"vo/trainyard/ba_exitnag03.wav",
	"vo/trainyard/ba_exitnag04.wav",
	"vo/trainyard/ba_exitnag05.wav",
	"vo/trainyard/ba_exitnag07.wav",
	"vo/streetwar/sniper/ba_heycomeon.wav",
	"vo/streetwar/sniper/ba_letsgetgoing.wav",
	"vo/streetwar/sniper/ba_overhere.wav",
	"vo/streetwar/rubble/ba_helpmeout.wav",
	"vo/streetwar/rubble/ba_nag_wall04.wav",
	"vo/streetwar/rubble/ba_nag_wall05.wav",
	"vo/streetwar/nexus/ba_surrounded.wav",
	"vo/npc/barney/ba_followme02.wav",
	"vo/npc/barney/ba_followme05.wav",
	"vo/npc/barney/ba_hurryup.wav",
	"vo/npc/barney/ba_letsgo.wav",
	"vo/npc/barney/ba_littlehelphere.wav"}
ENT.SoundTbl_BecomeEnemyToPlayer = {"vo/trainyard/ba_crowbar01.wav",
	"vo/trainyard/ba_crowbar02.wav"}
ENT.SoundTbl_MeleeAttack = {"physics/body/body_medium_impact_hard1.wav",
	"physics/body/body_medium_impact_hard2.wav",
	"physics/body/body_medium_impact_hard3.wav",
	"physics/body/body_medium_impact_hard4.wav",
	"physics/body/body_medium_impact_hard5.wav",
	"physics/body/body_medium_impact_hard6.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"weapons/iceaxe/iceaxe_swing1.wav"}
ENT.SoundTbl_BeforeRangeAttack = {"npc/tossers/barnyot/dolphin.mp3",
	"npc/tossers/barnyot/fu.mp3"}
ENT.SoundTbl_OnKilledEnemy = {"vo/k_lab/ba_sarcastic03.wav",
	"vo/k_lab/ba_whoops.wav",
	"vo/trainyard/ba_sorryscare.wav",
	"vo/streetwar/sniper/ba_onedownonetogo.wav",
	"vo/streetwar/rubble/ba_tellbreen.wav",
	"vo/npc/barney/ba_downyougo.wav",
	"vo/npc/barney/ba_gotone.wav",
	"vo/npc/barney/ba_laugh01.wav",
	"vo/npc/barney/ba_laugh02.wav",
	"vo/npc/barney/ba_laugh03.wav",
	"vo/npc/barney/ba_laugh04.wav",
	"vo/npc/barney/ba_losttouch.wav",
	"vo/npc/barney/ba_ohyeah.wav",
	"vo/npc/barney/ba_oldtimes.wav",
	"npc/tossers/barnyot/dolphin.mp3",
	"npc/tossers/barnyot/fu.mp3"}
ENT.SoundTbl_AllyDeath = {"vo/k_lab/ba_cantlook.wav",
	"vo/k_lab/ba_geethanks.wav",
	"vo/k_lab/ba_guh.wav",
	"vo/k_lab/ba_sarcastic03.wav",
	"vo/k_lab/ba_thingaway02.wav",
	"vo/streetwar/rubble/ba_damnitall.wav",
	"vo/npc/barney/ba_damnit.wav",
	"vo/npc/barney/ba_no01.wav",
	"vo/npc/barney/ba_no02.wav",
	"vo/npc/barney/ba_yell.wav",
	"npc/tossers/barnyot/biggermess.mp3"}
ENT.SoundTbl_Pain = {"vo/npc/barney/ba_pain01.wav",
	"vo/npc/barney/ba_pain02.wav",
	"vo/npc/barney/ba_pain03.wav",
	"vo/npc/barney/ba_pain04.wav",
	"vo/npc/barney/ba_pain05.wav",
	"vo/npc/barney/ba_pain06.wav",
	"vo/npc/barney/ba_pain07.wav",
	"vo/npc/barney/ba_pain08.wav",
	"vo/npc/barney/ba_pain09.wav",
	"vo/npc/barney/ba_pain10.wav",
	"vo/npc/barney/ba_pain01.wav",
	"vo/npc/barney/ba_pain01.wav",
	"vo/npc/barney/ba_wounded01.wav",
	"vo/npc/barney/ba_wounded02.wav",
	"vo/npc/barney/ba_wounded03.wav"}
ENT.SoundTbl_DamageByPlayer = {"vo/k_lab/ba_careful01.wav",
	"vo/k_lab/ba_careful02.wav",
	"vo/k_lab/ba_geethanks.wav",
	"vo/k_lab/ba_getamoveon.wav",
	"vo/k_lab/ba_getitoff01.wav",
	"vo/k_lab/ba_notime.wav",
	"vo/k_lab/ba_notimetofool01.wav",
	"vo/k_lab/ba_pissinmeoff.wav",
	"vo/k_lab/ba_pushinit.wav",
	"vo/k_lab/ba_sarcastic01.wav",
	"vo/k_lab/ba_sarcastic03.wav",
	"vo/k_lab/ba_thingaway03.wav",
	"vo/k_lab/ba_whatthehell.wav"}
ENT.SoundTbl_Death = {"vo/npc/barney/ba_ohshit03.wav",
	"npc/tossers/barnyot/barneydies.mp3"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize()
	if GetConVarNumber("vj_BBOHG_Gibs") == 0 then
		self.AllowedToGib = false
	end
	if GetConVarNumber("vj_BBOHG_FriendlyTossers") == 1 then
		self.VJ_NPC_Class = {"CLASS_TOSSER","CLASS_PLAYER_ALLY"}
		self.FriendsWithAllPlayerAllies = true
	end
	if GetConVarNumber("vj_BBOHG_NoGodsNoMasters") == 1 then
		self.VJ_NPC_Class = {"CLASS_BBOHG"}
		self.FriendsWithAllPlayerAllies = false
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetSightDirection()
	return self:GetAttachment(self:LookupAttachment("eyes")).Ang:Forward()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAlert(argent)
	if argent:IsNPC() then
	if argent:GetClass() == "npc_headcrab"
			or argent:GetClass() == "npc_headcrab_fast"
			or argent:GetClass() == "npc_headcrab_black"
			or argent:GetClass() == "npc_vj_hlr1_headcrab"
			or argent:GetClass() == "npc_vj_hlr1_headcrab_baby"
			or argent:GetClass() == "npc_vj_hlrcl_gentlecrab"
		then
			self:PlaySoundSystem("Alert", {"vo/k_lab/ba_thatpest.wav", 
			"vo/k_lab/ba_thingaway03.wav",
			"vo/npc/barney/ba_headhumpers.wav"})
		return
	elseif argent:GetClass() == "npc_combine_s"
			or argent:GetClass() == "npc_vj_hlr2_com_soldier"
			or argent:GetClass() == "npc_vj_hlr2b_com_soldier"
			or argent:GetClass() == "npc_vj_hlr2_com_shotgunner"
			or argent:GetClass() == "npc_vj_hlr2_com_prospekt"
			or argent:GetClass() == "npc_vj_hlr2_com_prospekt_sg"
			or argent:GetClass() == "npc_vj_hlr2_com_sniper"
			or argent:GetClass() == "npc_vj_hlr2_com_engineer"
			or argent:GetClass() == "npc_vj_hlr2_com_elite"
			or argent:GetClass() == "npc_vj_hlr2_com_sentry"
		then
			if self.Gender == 1 then
				self:PlaySoundSystem("Alert", {"vo/npc/barney/ba_soldiers.wav"})
		return		
	elseif argent:GetClass() == "npc_combinedropship"
		then
			self:PlaySoundSystem("Alert", {"vo/streetwar/nexus/ba_uhohdropships.wav"})
		return		
	elseif argent:GetClass() == "npc_turret_ceiling"
			or argent:GetClass() == "npc_turret_floor"
			or argent:GetClass() == "npc_vj_hlr1_cturret"
			or argent:GetClass() == "npc_vj_hlr1_cturret_mini"
			or argent:GetClass() == "npc_vj_hlr1_gturret"
			or argent:GetClass() == "npc_vj_hlr1_gturret_mini"
			or argent:GetClass() == "npc_vj_hlr1_sentry"
			or argent:GetClass() == "npc_vj_hlrdc_sentry"
			or argent:GetClass() == "npc_vj_hlr1_xen_cannon"
			or argent:GetClass() == "npc_vj_hlr1_xen_turretc"
			or argent:GetClass() == "npc_vj_hlr2_com_sentry"
			or argent:GetClass() == "npc_vj_hlr2_res_sentry"
		then
			self:PlaySoundSystem("Alert", {"vo/npc/barney/ba_turret.wav"})
		return
			end
		end
	end
	if argent:IsPlayer() then
			self:PlaySoundSystem("Alert", {"vo/k_lab/ba_hesback01.wav",
			"vo/k_lab/ba_thereheis.wav",
			"vo/k_lab/ba_thereyouare.wav",
			"vo/streetwar/rubble/ba_illbedamned.wav"})
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
		self.TimeUntilMeleeAttackDamage = 0.95
		self.MeleeAttackDamage = math.Rand(10,15)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 6 then
		self.AnimTbl_MeleeAttack = {"ThrowItem"}
		self.TimeUntilMeleeAttackDamage = 1
		self.MeleeAttackDamage = math.Rand(10,15)
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
function ENT:CustomOnRangeAttack_BeforeStartTimer(seed)
	if math.random(1,15) == 1 then
		self.HasBeforeRangeAttackSound = true
		self.RangeAttackEntityToSpawn = "obj_vj_bbohg_filing_cabinet"
	else
		self.HasBeforeRangeAttackSound = false
		self.RangeAttackEntityToSpawn = "obj_vj_bbohg_thatbeerheowesyou"
	end

	if math.random(1,155) == 1 then
		local TheFunny = math.random(1,3)
		if TheFunny == 1 then
			self.RangeAttackEntityToSpawn = "obj_vj_bbohg_cola"
		elseif TheFunny == 2 then
			self.RangeAttackEntityToSpawn = "obj_vj_bbohg_pepsi"
		elseif TheFunny == 3 then
			self.RangeAttackEntityToSpawn = "obj_vj_bbohg_arbys_sandwich"
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackCode_GetShootPos(projectile)
	return self:CalculateProjectile("Curve", self:GetAttachment(self:LookupAttachment(self.RangeUseAttachmentForPosID)).Pos, self:GetEnemy():GetPos() + self:GetEnemy():OBBCenter(), 1500)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetUpGibesOnDeath(dmginfo, hitgroup)
	self.HasDeathSounds = false
	if self.HasGibDeathParticles == true then
		local effectBlood = EffectData()
		effectBlood:SetOrigin(self:GetPos() + self:OBBCenter())
		effectBlood:SetColor(VJ_Color2Byte(Color(204,129,0)))
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
	self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/mgib_01.mdl",{BloodDecal="VJ_Blood_Orange",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/mgib_02.mdl",{BloodDecal="VJ_Blood_Orange",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/mgib_03.mdl",{BloodDecal="VJ_Blood_Orange",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/mgib_04.mdl",{BloodDecal="VJ_Blood_Orange",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,50))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_rib.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_rib.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_scapula.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_spine.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/props_junk/glassjug01.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/props_junk/GlassBottle01a.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,45))})
	self:CreateGibEntity("obj_vj_gib","models/props_junk/garbage_glassbottle003a.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,45))})
	self:CreateGibEntity("obj_vj_gib","models/props_junk/garbage_glassbottle001a.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,60))})
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