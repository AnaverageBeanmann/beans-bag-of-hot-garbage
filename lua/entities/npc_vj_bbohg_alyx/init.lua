AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/alyx.mdl"} 
ENT.StartHealth = 100
ENT.VJC_Data = {
	CameraMode = 1,
	ThirdP_Offset = Vector(40, 20, -50),
	FirstP_Bone = "ValveBiped.Bip01_Spine4",
	FirstP_Offset = Vector(0, 0, 5),
}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_TOSSER"}
ENT.FriendsWithAllPlayerAllies = false
ENT.BecomeEnemyToPlayer = true
ENT.BecomeEnemyToPlayerLevel = 3
ENT.HasOnPlayerSight = true
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.BloodColor = "Purple"
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = {"cower"}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasItemDropsOnDeath = false
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.MeleeAttackDamage = math.Rand(10,15)
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.AnimTbl_MeleeAttack = {"swing"}
ENT.MeleeAttackDistance = 40
ENT.MeleeAttackDamageDistance = 60
ENT.MeleeAttackAngleRadius = 70
ENT.MeleeAttackDamageAngleRadius = 70
ENT.TimeUntilMeleeAttackDamage = 0.7
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.FootStepTimeRun = 0.25
ENT.FootStepTimeWalk = 0.5

ENT.IdleSoundChance = 15
ENT.CombatIdleSoundChance = 15

ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 95
ENT.DeathSoundPitch = VJ_Set(135, 150)

ENT.IdleDialogueDistance = 175

ENT.Gender = 0
ENT.LNR_HealerHeal = true
ENT.LNR_HealerNextT = CurTime()
ENT.LNR_Heal = true
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
ENT.SoundTbl_Idle = {"vo/eli_lab/al_hums.wav",
	"vo/eli_lab/al_hums_b.wav"}
ENT.SoundTbl_IdleDialogue = {"vo/citadel/al_chancelikethis.wav",
	"vo/k_lab/al_aboutthecat.wav",
	"vo/k_lab/al_moveon01.wav",
	"vo/k_lab/al_whatcat01.wav",
	"vo/k_lab/al_whatcat02.wav",
	"vo/novaprospekt/al_readings01.wav",
	"vo/trainyard/al_imalyx.wav"}
ENT.SoundTbl_IdleDialogueAnswer = {"vo/citadel/al_noclue.wav",
	"vo/citadel/al_yes_nr.wav",
	"vo/eli_lab/al_allright01.wav",
	"vo/eli_lab/al_awesome.wav",
	"vo/eli_lab/al_blamingme.wav",
	"vo/eli_lab/al_gravgun.wav",
	"vo/eli_lab/al_minefield.wav",
	"vo/eli_lab/al_sweet.wav",
	"vo/k_lab2/al_andmyfather.wav",
	"vo/k_lab2/al_anotherpet.wav",
	"vo/k_lab2/al_whatdoyoumean.wav",
	"vo/novaprospekt/al_mutter.wav",
	"vo/novaprospekt/al_notexactly.wav",
	"vo/novaprospekt/al_shutupandbeglad01.wav",
	"vo/novaprospekt/al_warmeditup.wav",
	"vo/novaprospekt/al_youput01.wav"}
ENT.SoundTbl_CombatIdle = {}
ENT.SoundTbl_OnReceiveOrder = {"vo/k_lab/al_letsdoit.wav",
	"vo/novaprospekt/al_letsgetgoing.wav",
	"vo/streetwar/alyx_gate/al_readywhenyou.wav"}
ENT.SoundTbl_FollowPlayer = {"vo/citadel/al_betterhurry.wav",
	"vo/citadel/al_comegordon.wav",
	"vo/eli_lab/al_havefun.wav",
	"vo/eli_lab/al_ugh.wav",
	"vo/k_lab/al_moveon02.wav",
	"vo/k_lab2/al_klab2_exitnag02.wav",
	"vo/novaprospekt/al_letsgetgoing.wav",
	"vo/novaprospekt/al_letsgetout01.wav",
	"vo/streetwar/alyx_gate/al_letsgo01.wav",
	"vo/streetwar/alyx_gate/al_readywhenyou.wav",
	"vo/streetwar/alyx_gate/al_watchmyback.wav"}
ENT.SoundTbl_UnFollowPlayer = {"vo/eli_lab/al_thyristor02.wav",
	"vo/k_lab/al_buyyoudrink01.wav",
	"vo/k_lab/al_takeiteasy.wav",
	"vo/k_lab2/al_catchup_b.wav",
	"vo/k_lab2/al_gordontakecare_b.wav",
	"vo/novaprospekt/al_careofyourself.wav",
	"vo/novaprospekt/al_elevator02.wav"}
ENT.SoundTbl_MoveOutOfPlayersWay = {"vo/npc/alyx/al_excuse01.wav",
	"vo/npc/alyx/al_excuse02.wav",
	"vo/npc/alyx/al_excuse03.wav"}
ENT.SoundTbl_OnPlayerSight = {"vo/eli_lab/al_soquickly01.wav",
	"vo/eli_lab/al_soquickly02.wav",
	"vo/k_lab/al_heydoc.wav",
	"vo/novaprospekt/al_gladtoseeyou.wav",
	"vo/novaprospekt/al_gladtoseeyoureok.wav",
	"vo/novaprospekt/al_onepiece.wav",
	"vo/streetwar/alyx_gate/al_hadfeeling.wav"}
ENT.SoundTbl_Investigate = {"vo/citadel/al_heylisten.wav",
	"vo/eli_lab/al_dadwhatsup.wav",
	"vo/eli_lab/al_scanners02.wav",
	"vo/k_lab/al_uhoh01.wav",
	"vo/k_lab/al_whatsgoingon.wav",
	"vo/k_lab2/al_notime.wav",
	"vo/novaprospekt/al_sheupto01.wav",
	"vo/novaprospekt/al_uhoh_np.wav",
	"vo/streetwar/alyx_gate/al_hey.wav"}
ENT.SoundTbl_LostEnemy = {"vo/citadel/al_wonderwhere.wav"}
ENT.SoundTbl_Alert = {"vo/citadel/al_comeon.wav",
	"vo/novaprospekt/al_comeon01.wav",
	"vo/novaprospekt/al_elevator03.wav",
	"vo/novaprospekt/al_holdit.wav",
	"vo/novaprospekt/al_illtakecare.wav",
	"vo/novaprospekt/al_there.wav",
	"vo/streetwar/alyx_gate/al_heregoes.wav",
	"vo/streetwar/alyx_gate/al_letsgo.wav"}
ENT.SoundTbl_CallForHelp = {"vo/citadel/al_hurrymossman02.wav",
	"vo/eli_lab/al_cmongord02.wav",
	"vo/eli_lab/al_getitopen01.wav",
	"vo/eli_lab/al_intoairlock02.wav",
	"vo/eli_lab/al_intoairlock04.wav",
	"vo/k_lab/al_youcoming.wav",
	"vo/novaprospekt/al_overhere.wav",
	"vo/streetwar/alyx_gate/al_hurry.wav",
	"vo/streetwar/alyx_gate/al_theysawus.wav",
	"vo/trainyard/al_overhere.wav"}
ENT.SoundTbl_BecomeEnemyToPlayer = {"vo/citadel/al_bitofit.wav",
	"vo/eli_lab/al_somethingelse.wav",
	"vo/k_lab/al_thatsit.wav",
	"vo/novaprospekt/al_enoughbs01.wav",
	"vo/streetwar/alyx_gate/al_cmoncmon.wav"}
ENT.SoundTbl_Suppressing = {"vo/eli_lab/al_cmongord02.wav",
	"vo/novaprospekt/al_takingforever.wav",
	"vo/trainyard/al_overhere.wav"}
ENT.SoundTbl_WeaponReload = {"vo/npc/alyx/coverme01.wav",
	"vo/npc/alyx/coverme02.wav",
	"vo/npc/alyx/coverme03.wav",
	"vo/novaprospekt/al_holdon.wav"}
ENT.SoundTbl_MeleeAttack = {"physics/body/body_medium_impact_hard1.wav",
	"physics/body/body_medium_impact_hard2.wav",
	"physics/body/body_medium_impact_hard3.wav",
	"physics/body/body_medium_impact_hard4.wav",
	"physics/body/body_medium_impact_hard5.wav",
	"physics/body/body_medium_impact_hard6.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"weapons/iceaxe/iceaxe_swing1.wav"}
ENT.SoundTbl_OnGrenadeSight = {"vo/npc/alyx/getback01.wav",
	"vo/npc/alyx/getback02.wav",
	"vo/npc/alyx/lookout01.wav",
	"vo/npc/alyx/lookout03.wav",
	"vo/npc/alyx/watchout01.wav",
	"vo/npc/alyx/watchout02.wav"}
ENT.SoundTbl_OnKilledEnemy = {"vo/npc/alyx/brutal02.wav",
	"vo/citadel/al_noclue.wav",
	"vo/citadel/al_wonderwhere.wav",
	"vo/citadel/al_yes_nr.wav",
	"vo/eli_lab/al_allright01.wav",
	"vo/eli_lab/al_awesome.wav",
	"vo/eli_lab/al_earnedit01.wav",
	"vo/eli_lab/al_excellent01.wav",
	"vo/eli_lab/al_laugh01.wav",
	"vo/eli_lab/al_laugh02.wav",
	"vo/eli_lab/al_noboydown.wav",
	"vo/eli_lab/al_sweet.wav",
	"vo/eli_lab/al_takeit.wav",
	"vo/k_lab/al_buyyoudrink01.wav",
	"vo/k_lab/al_hmm.wav",
	"vo/k_lab/al_thatsit.wav",
	"vo/k_lab2/al_whee_b.wav",
	"vo/novaprospekt/al_enoughbs01.wav",
	"vo/novaprospekt/al_horrible01.wav",
	"vo/novaprospekt/al_shutupandbeglad01.wav",
	"vo/streetwar/alyx_gate/al_thatsit.wav",
	"vo/trainyard/al_noyoudont.wav"}
ENT.SoundTbl_AllyDeath = {"vo/npc/alyx/brutal02.wav",
	"vo/npc/alyx/gasp02.wav",
	"vo/npc/alyx/gasp03.wav",
	"vo/npc/alyx/no01.wav",
	"vo/npc/alyx/no02.wav",
	"vo/npc/alyx/no03.wav",
	"vo/npc/alyx/ohgod01.wav",
	"vo/npc/alyx/ohno_startle01.wav",
	"vo/npc/alyx/ohno_startle03.wav",
	"vo/citadel/al_notagain02.wav",
	"vo/eli_lab/al_dogairlock01.wav",
	"vo/novaprospekt/al_combinespy01.wav",
	"vo/novaprospekt/al_gasp01.wav",
	"vo/novaprospekt/al_gotyounow01.wav",
	"vo/novaprospekt/al_ohmygod.wav",
	"vo/streetwar/alyx_gate/al_ahno.wav",
	"vo/streetwar/alyx_gate/al_no.wav"}
ENT.SoundTbl_Pain = {"vo/npc/alyx/hurt04.wav",
	"vo/npc/alyx/hurt05.wav",
	"vo/npc/alyx/hurt06.wav",
	"vo/npc/alyx/hurt08.wav",
	"vo/npc/alyx/uggh01.wav",
	"vo/npc/alyx/uggh02.wav"}
ENT.SoundTbl_DamageByPlayer = {"vo/npc/alyx/gordon_dist01.wav",
	"vo/npc/alyx/watchout02.wav",
	"vo/eli_lab/al_blamingme.wav",
	"vo/k_lab/al_careful.wav",
	"vo/novaprospekt/al_gordon01.wav",
	"vo/novaprospekt/al_nostop.wav",
	"vo/novaprospekt/al_shutupandbeglad01.wav"}
ENT.SoundTbl_Death = {"npc/zombie/zombie_die1.wav",
	"npc/zombie/zombie_die2.wav",
	"npc/zombie/zombie_die3.wav"}
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
	self.Weapon_FiringDistanceFar = 1500
	self:Give("weapon_vj_bbohg_alyxgun")
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetSightDirection()
	return self:GetAttachment(self:LookupAttachment("eyes")).Ang:Forward()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnSetupWeaponHoldTypeAnims(hType)
	timer.Simple(0.1, function() -- Make sure the base functions have ran!
		if IsValid(self) && hType == "pistol" or hType == "revolver" then
			self.WeaponAnimTranslations[ACT_IDLE] = {ACT_IDLE_STIMULATED} -- This animation set is used more often in HL2, not to mention there are multiple idle animations tied to this so it gives more variety + this syncs up with the rest of Alyx's animations better
			self.WeaponAnimTranslations[ACT_WALK] = {ACT_WALK_STIMULATED}
			self.WeaponAnimTranslations[ACT_RUN] = {ACT_RUN_STIMULATED}

			self.WeaponAnimTranslations[ACT_COVER_LOW] = {ACT_CROUCHIDLE_STIMULATED, ACT_RANGE_AIM_PISTOL_LOW, "vjseq_crouchidlehide", "vjseq_blindfire_low_entry", "vjseq_crouchhide_01"}

			self.WeaponAnimTranslations[ACT_WALK_AIM] = ACT_WALK_AIM_PISTOL

			self.WeaponAnimTranslations[ACT_RUN_AIM] = ACT_RUN_AIM_PISTOL
		end
	end)
	return false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAlert(argent)
	if argent:IsNPC() then
	if argent:GetClass() == "npc_cscanner"
			or argent:GetClass() == "npc_clawscanner"
		then
				self:PlaySoundSystem("Alert", {"vo/eli_lab/al_scanners03.wav"})
		return
	else
		for _,v in ipairs(argent.VJ_NPC_Class or {1}) do
			if v == "CLASS_COMBINE" or argent:Classify() == CLASS_COMBINE then
					self:PlaySoundSystem("Alert", {"vo/eli_lab/al_scanners06.wav"})
				return
				end
			end
		end
	end
	if argent:IsPlayer() then
		self:PlaySoundSystem("Alert", {"vo/citadel/al_thatshim.wav", 
		"vo/npc/alyx/gordon_dist01.wav",
		"vo/citadel/al_thereheis.wav",
		"vo/eli_lab/al_heshere.wav",
		"vo/k_lab/al_thereheis.wav",
		"vo/novaprospekt/al_gordon01.wav",
		"vo/novaprospekt/al_thereheis01.wav"})
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetUpGibesOnDeath(dmginfo, hitgroup)
	self.HasDeathSounds = false
	if self.HasGibDeathParticles == true then
		local effectBlood = EffectData()
		effectBlood:SetOrigin(self:GetPos() + self:OBBCenter())
		effectBlood:SetColor(VJ_Color2Byte(Color(165,55,203)))
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
	self:CreateGibEntity("obj_vj_gib","models/alyx.mdl",{BloodDecal="VJ_Blood_Purple",Pos=self:LocalToWorld(Vector(0,0,50))})
	self:CreateGibEntity("obj_vj_gib","models/alyx.mdl",{BloodDecal="VJ_Blood_Purple",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/alyx.mdl",{BloodDecal="VJ_Blood_Purple",Pos=self:LocalToWorld(Vector(0,0,45))})
	self:CreateGibEntity("obj_vj_gib","models/alyx.mdl",{BloodDecal="VJ_Blood_Purple",Pos=self:LocalToWorld(Vector(0,0,45))})
	self:CreateGibEntity("obj_vj_gib","models/alyx.mdl",{BloodDecal="VJ_Blood_Purple",Pos=self:LocalToWorld(Vector(0,0,60))})
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