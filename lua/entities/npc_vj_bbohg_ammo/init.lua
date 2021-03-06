AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/Humans/Group03/male_09.mdl"} 
ENT.StartHealth = 200
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
ENT.AnimTbl_Medic_GiveHealth = {"swing"}
ENT.Medic_TimeUntilHeal = 0.4
ENT.Medic_HealthAmount = 15
ENT.Medic_SpawnPropOnHealModel = "models/items/battery.mdl"
ENT.Medic_SpawnPropOnHealAttachment = "anim_attachment_RH"
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.BloodColor = "Blue"
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.CanFlinch = 1
ENT.AnimTbl_Flinch = {"cower"}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasItemDropsOnDeath = true
ENT.ItemDropsOnDeathChance = 3
ENT.ItemDropsOnDeath_EntityList = {"item_ammo_357",
	"item_ammo_ar2",
	"item_ammo_ar2_altfire",
	"item_ammo_crossbow",
	"item_ammo_pistol",
	"item_box_buckshot",
	"item_ammo_smg1",
	"item_ammo_smg1_grenade",
	"item_battery",
	"weapon_frag"}
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
ENT.RangeAttackEntityToSpawn = "obj_vj_bbohg_ammo"
ENT.AnimTbl_RangeAttack = {"throw1"}
ENT.RangeToMeleeDistance = 200
ENT.TimeUntilRangeAttackProjectileRelease = 0.9
ENT.NextRangeAttackTime = 5
ENT.NextRangeAttackTime_DoRand = 15
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
ENT.SoundTbl_IdleDialogue = {"vo/npc/male01/question01.wav",
	"vo/npc/male01/question02.wav",
	"vo/npc/male01/question03.wav",
	"vo/npc/male01/question04.wav",
	"vo/npc/male01/question05.wav",
	"vo/npc/male01/question06.wav",
	"vo/npc/male01/question07.wav",
	"vo/npc/male01/question08.wav",
	"vo/npc/male01/question09.wav",
	"vo/npc/male01/question10.wav",
	"vo/npc/male01/question11.wav",
	"vo/npc/male01/question12.wav",
	"vo/npc/male01/question13.wav",
	"vo/npc/male01/question14.wav",
	"vo/npc/male01/question15.wav",
	"vo/npc/male01/question16.wav",
	"vo/npc/male01/question17.wav",
	"vo/npc/male01/question18.wav",
	"vo/npc/male01/question19.wav",
	"vo/npc/male01/question20.wav",
	"vo/npc/male01/question21.wav",
	"vo/npc/male01/question22.wav",
	"vo/npc/male01/question23.wav",
	"vo/npc/male01/question25.wav",
	"vo/npc/male01/question26.wav",
	"vo/npc/male01/question27.wav",
	"vo/npc/male01/question28.wav",
	"vo/npc/male01/question29.wav",
	"vo/npc/male01/question30.wav",
	"vo/npc/male01/question31.wav",
	"vo/npc/male01/hi01.wav",
	"vo/npc/male01/hi02.wav",
	"vo/npc/male01/getgoingsoon.wav",
	"vo/npc/male01/doingsomething.wav",
	"vo/npc/male01/vquestion01.wav",
	"vo/npc/male01/vquestion02.wav",
	"vo/npc/male01/gordead_ans01.wav"}
ENT.SoundTbl_IdleDialogueAnswer = {"vo/npc/male01/answer01.wav",
	"vo/npc/male01/answer02.wav",
	"vo/npc/male01/answer03.wav",
	"vo/npc/male01/answer04.wav",
	"vo/npc/male01/answer05.wav",
	"vo/npc/male01/answer07.wav",
	"vo/npc/male01/answer08.wav",
	"vo/npc/male01/answer09.wav",
	"vo/npc/male01/answer10.wav",
	"vo/npc/male01/answer11.wav",
	"vo/npc/male01/answer12.wav",
	"vo/npc/male01/answer13.wav",
	"vo/npc/male01/answer14.wav",
	"vo/npc/male01/answer15.wav",
	"vo/npc/male01/answer16.wav",
	"vo/npc/male01/answer17.wav",
	"vo/npc/male01/answer18.wav",
	"vo/npc/male01/answer19.wav",
	"vo/npc/male01/answer20.wav",
	"vo/npc/male01/answer21.wav",
	"vo/npc/male01/answer22.wav",
	"vo/npc/male01/answer23.wav",
	"vo/npc/male01/answer24.wav",
	"vo/npc/male01/answer25.wav",
	"vo/npc/male01/answer26.wav",
	"vo/npc/male01/answer27.wav",
	"vo/npc/male01/answer28.wav",
	"vo/npc/male01/answer29.wav",
	"vo/npc/male01/answer30.wav",
	"vo/npc/male01/answer31.wav",
	"vo/npc/male01/answer32.wav",
	"vo/npc/male01/answer33.wav",
	"vo/npc/male01/answer34.wav",
	"vo/npc/male01/answer35.wav",
	"vo/npc/male01/answer36.wav",
	"vo/npc/male01/answer37.wav",
	"vo/npc/male01/answer38.wav",
	"vo/npc/male01/answer39.wav",
	"vo/npc/male01/answer40.wav",
	"vo/npc/male01/sorry01.wav",
	"vo/npc/male01/sorry02.wav",
	"vo/npc/male01/sorry03.wav",
	"vo/npc/male01/busy02.wav",
	"vo/npc/male01/vanswer01.wav",
	"vo/npc/male01/vanswer03.wav",
	"vo/npc/male01/vanswer05.wav",
	"vo/npc/male01/vanswer07.wav",
	"vo/npc/male01/vanswer08.wav",
	"vo/npc/male01/vanswer09.wav",
	"vo/npc/male01/vanswer10.wav",
	"vo/npc/male01/vanswer13.wav",
	"vo/npc/male01/vanswer14.wav",
	"vo/npc/male01/vquestion04.wav"}
ENT.SoundTbl_CombatIdle = {}
ENT.SoundTbl_OnReceiveOrder = {"vo/npc/male01/yougotit02.wav",
	"vo/npc/male01/squad_reinforce_single04.wav",
	"vo/npc/male01/squad_reinforce_group04.wav",
	"vo/npc/male01/squad_follow03.wav",
	"vo/npc/male01/squad_approach04.wav",
	"vo/npc/male01/squad_approach03.wav",
	"vo/npc/male01/squad_approach02.wav",
	"vo/npc/male01/squad_affirm06.wav",
	"vo/npc/male01/squad_affirm05.wav",
	"vo/npc/male01/squad_affirm04.wav",
	"vo/npc/male01/squad_affirm03.wav",
	"vo/npc/male01/readywhenyouare01.wav",
	"vo/npc/male01/readywhenyouare02.wav",
	"vo/npc/male01/ok01.wav",
	"vo/npc/male01/ok02.wav",
	"vo/npc/male01/okimready01.wav",
	"vo/npc/male01/okimready02.wav",
	"vo/npc/male01/okimready03.wav",
	"vo/npc/male01/letsgo01.wav",
	"vo/npc/male01/letsgo02.wav",
	"vo/npc/male01/leadtheway01.wav",
	"vo/npc/male01/leadtheway02.wav"}
ENT.SoundTbl_FollowPlayer = {"vo/npc/male01/squad_affirm01.wav",
	"vo/npc/male01/squad_affirm02.wav",
	"vo/npc/male01/squad_affirm03.wav",
	"vo/npc/male01/squad_affirm04.wav",
	"vo/npc/male01/squad_affirm05.wav",
	"vo/npc/male01/squad_affirm06.wav",
	"vo/npc/male01/squad_affirm07.wav",
	"vo/npc/male01/squad_affirm08.wav",
	"vo/npc/male01/squad_affirm09.wav",
	"vo/npc/male01/squad_train01.wav",
	"vo/npc/male01/squad_train02.wav",
	"vo/npc/male01/squad_train03.wav",
	"vo/npc/male01/squad_train04.wav"}
ENT.SoundTbl_UnFollowPlayer = {"vo/npc/male01/littlecorner01.wav",
	"vo/npc/male01/imstickinghere01.wav",
	"vo/npc/male01/illstayhere01.wav",
	"vo/npc/male01/holddownspot01.wav",
	"vo/npc/male01/holddownspot02.wav",
	"vo/npc/male01/doingsomething.wav"}
ENT.SoundTbl_MoveOutOfPlayersWay = {"vo/npc/male01/excuseme01.wav",
	"vo/npc/male01/excuseme02.wav",
	"vo/npc/male01/pardonme01.wav",
	"vo/npc/male01/pardonme02.wav",
	"vo/npc/male01/sorry01.wav",
	"vo/npc/male01/sorry02.wav",
	"vo/npc/male01/sorry03.wav",
	"vo/npc/male01/sorrydoc01.wav",
	"vo/npc/male01/sorrydoc02.wav",
	"vo/npc/male01/sorrydoc04.wav",
	"vo/npc/male01/sorryfm01.wav",
	"vo/npc/male01/sorryfm02.wav",
	"vo/npc/male01/outofyourway02.wav"}
ENT.SoundTbl_MedicAfterHeal = {"items/battery_pickup.wav"}
ENT.SoundTbl_OnPlayerSight = {"vo/npc/male01/abouttime01.wav",
	"vo/npc/male01/abouttime02.wav",
	"vo/npc/male01/ahgordon01.wav",
	"vo/npc/male01/ahgordon02.wav",
	"vo/npc/male01/docfreeman01.wav",
	"vo/npc/male01/docfreeman02.wav",
	"vo/npc/male01/freeman.wav",
	"vo/npc/male01/hellodrfm01.wav",
	"vo/npc/male01/hellodrfm02.wav",
	"vo/npc/male01/heydoc01.wav",
	"vo/npc/male01/heydoc02.wav",
	"vo/npc/male01/hi01.wav",
	"vo/npc/male01/hi02.wav",
	"vo/npc/male01/squad_greet01.wav",
	"vo/npc/male01/squad_greet02.wav",
	"vo/npc/male01/squad_greet04.wav"}
ENT.SoundTbl_Investigate = {"vo/npc/male01/startle01.wav",
	"vo/npc/male01/startle02.wav"}
ENT.SoundTbl_LostEnemy = {"vo/npc/male01/uhoh.wav",
	"vo/npc/male01/ohno.wav"}
ENT.SoundTbl_Alert = {"vo/npc/male01/squad_affirm06.wav",
	"vo/npc/male01/squad_affirm05.wav",
	"vo/npc/male01/overthere01.wav",
	"vo/npc/male01/overthere02.wav",
	"vo/npc/male01/letsgo01.wav",
	"vo/npc/male01/letsgo02.wav",
	"vo/npc/male01/incoming02.wav",
	"vo/npc/male01/upthere01.wav",
	"vo/npc/male01/upthere02.wav",
	"vo/npc/male01/heretheycome01.wav",
	"vo/npc/male01/headsup01.wav",
	"vo/npc/male01/headsup02.wav",
	"vo/npc/male01/gethellout.wav",
	"vo/npc/male01/evenodds.wav"}
ENT.SoundTbl_CallForHelp = {"vo/npc/male01/help01.wav",
	"vo/npc/male01/squad_follow03.wav",
	"vo/npc/male01/squad_follow02.wav",
	"vo/npc/male01/squad_away03.wav",
	"vo/npc/male01/squad_away02.wav",
	"vo/npc/male01/squad_away01.wav",
	"vo/npc/male01/overhere01.wav",
	"vo/npc/male01/overthere01.wav",
	"vo/npc/male01/overthere02.wav",
	"vo/npc/male01/letsgo01.wav",
	"vo/npc/male01/letsgo02.wav",
	"vo/npc/male01/upthere01.wav",
	"vo/npc/male01/upthere02.wav",
	"vo/npc/male01/headsup01.wav",
	"vo/npc/male01/headsup02.wav"}
ENT.SoundTbl_BecomeEnemyToPlayer = {"vo/npc/male01/wetrustedyou01.wav",
	"vo/npc/male01/wetrustedyou02.wav",
	"vo/npc/male01/notthemanithought01.wav",
	"vo/npc/male01/notthemanithought02.wav",
	"vo/npc/male01/gethellout.wav",
	"vo/npc/male01/answer03.wav",
	"vo/npc/male01/gordead_ans02.wav",
	"vo/npc/male01/gordead_ans17.wav",
	"vo/npc/male01/gordead_ques12.wav",
	"vo/npc/male01/gordead_ques17.wav"}
ENT.SoundTbl_MeleeAttack = {"physics/body/body_medium_impact_hard1.wav",
	"physics/body/body_medium_impact_hard2.wav",
	"physics/body/body_medium_impact_hard3.wav",
	"physics/body/body_medium_impact_hard4.wav",
	"physics/body/body_medium_impact_hard5.wav",
	"physics/body/body_medium_impact_hard6.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"weapons/iceaxe/iceaxe_swing1.wav"}
ENT.SoundTbl_BeforeRangeAttack = {"vo/npc/male01/overhere01.wav",
	"vo/npc/male01/cit_dropper01.wav",
	"vo/npc/male01/cit_dropper04.wav",
	"vo/npc/male01/behindyou01.wav",
	"vo/npc/male01/behindyou02.wav",
	"vo/npc/male01/ammo03.wav",
	"vo/npc/male01/ammo04.wav",
	"vo/npc/male01/ammo05.wav"}
ENT.SoundTbl_OnKilledEnemy = {"vo/npc/male01/pardonme01.wav",
	"vo/npc/male01/pardonme02.wav",
	"vo/npc/male01/likethat.wav",
	"vo/npc/male01/gotone01.wav",
	"vo/npc/male01/gotone02.wav",
	"vo/npc/male01/gordead_ques01.wav",
	"vo/npc/male01/goodgod.wav",
	"vo/npc/male01/gethellout.wav",
	"vo/npc/male01/finally.wav",
	"vo/npc/male01/fantastic01.wav",
	"vo/npc/male01/fantastic02.wav",
	"vo/npc/male01/excuseme01.wav",
	"vo/npc/male01/excuseme02.wav",
	"vo/npc/male01/sorry01.wav",
	"vo/npc/male01/sorry02.wav",
	"vo/npc/male01/sorry03.wav",
	"vo/npc/male01/whoops01.wav",
	"vo/npc/male01/yeah02.wav",
	"vo/npc/male01/oneforme.wav",
	"vo/npc/male01/nice.wav",
	"vo/npc/male01/answer17.wav",
	"vo/npc/male01/answer25.wav",
	"vo/npc/male01/answer32.wav",
	"vo/npc/male01/answer39.wav",
	"vo/npc/male01/answer40.wav",
	"vo/npc/male01/vanswer01.wav",
	"vo/npc/male01/vquestion03.wav"}
ENT.SoundTbl_AllyDeath = {"vo/npc/male01/ohno.wav",
	"vo/npc/male01/uhoh.wav",
	"vo/npc/male01/goodgod.wav",
	"vo/npc/male01/fantastic01.wav",
	"vo/npc/male01/answer03.wav",
	"vo/npc/male01/no01.wav",
	"vo/npc/male01/no02.wav",
	"vo/npc/male01/answer29.wav",
	"vo/npc/male01/question14.wav",
	"vo/npc/male01/question25.wav",
	"vo/npc/male01/question26.wav",
	"vo/npc/male01/question30.wav",
	"vo/npc/male01/gordead_ans02.wav",
	"vo/npc/male01/gordead_ans03.wav",
	"vo/npc/male01/gordead_ans04.wav",
	"vo/npc/male01/gordead_ans05.wav",
	"vo/npc/male01/gordead_ans06.wav",
	"vo/npc/male01/gordead_ans07.wav",
	"vo/npc/male01/gordead_ans08.wav",
	"vo/npc/male01/gordead_ans14.wav",
	"vo/npc/male01/gordead_ans15.wav",
	"vo/npc/male01/gordead_ans18.wav",
	"vo/npc/male01/gordead_ans19.wav",
	"vo/npc/male01/gordead_ques01.wav",
	"vo/npc/male01/gordead_ques02.wav",
	"vo/npc/male01/gordead_ques06.wav",
	"vo/npc/male01/gordead_ques07.wav",
	"vo/npc/male01/gordead_ques10.wav"}
ENT.SoundTbl_Pain = {"vo/npc/male01/pain01.wav",
	"vo/npc/male01/pain02.wav",
	"vo/npc/male01/pain03.wav",
	"vo/npc/male01/pain04.wav",
	"vo/npc/male01/pain05.wav",
	"vo/npc/male01/pain06.wav",
	"vo/npc/male01/pain07.wav",
	"vo/npc/male01/pain08.wav",
	"vo/npc/male01/pain09.wav",
	"vo/npc/male01/ow01.wav",
	"vo/npc/male01/ow02.wav",
	"vo/npc/male01/imhurt01.wav",
	"vo/npc/male01/imhurt02.wav"}
ENT.SoundTbl_DamageByPlayer = {"vo/npc/male01/watchwhat.wav",
	"vo/npc/male01/watchwhat.wav",
	"vo/npc/male01/stopitfm.wav",
	"vo/npc/male01/onyourside.wav",
	"vo/npc/male01/lookoutfm01.wav",
	"vo/npc/male01/lookoutfm02.wav",
	"vo/npc/male01/freeman.wav",
	"vo/npc/male01/vanswer03.wav",
	"vo/npc/male01/vanswer04.wav"}
ENT.SoundTbl_Death = {"vo/npc/male01/pain01.wav",
	"vo/npc/male01/pain02.wav",
	"vo/npc/male01/pain03.wav",
	"vo/npc/male01/pain04.wav",
	"vo/npc/male01/pain05.wav",
	"vo/npc/male01/pain06.wav",
	"vo/npc/male01/pain07.wav",
	"vo/npc/male01/pain08.wav",
	"vo/npc/male01/pain09.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnPreInitialize()
self.Model = {"models/Humans/Group03/Male_01.mdl",
	"models/Humans/Group03/Male_04.mdl",
	"models/Humans/Group03/male_06.mdl",
	"models/Humans/Group03/male_08.mdl",
	"models/Humans/Group03/male_09.mdl"} 
	if math.random(1,3) == 1 then
		self.Gender = 1
		self.Model = {"models/Humans/Group03/Female_01.mdl",
	"models/Humans/Group03/Female_03.mdl",
	"models/Humans/Group03/Female_03.mdl",
	"models/Humans/Group03/Female_07.mdl"} 
	end
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
	if math.random(1,4) == 1 then
		self.AnimTbl_Run = {ACT_RUN_CROUCH}
	end
	if self.Gender == 1 then
		self.Medic_TimeUntilHeal = 0.7
		self.IdleSoundPitch = VJ_Set(115, 130)
		self.SoundTbl_IdleDialogue = {"vo/npc/female01/question01.wav",
			"vo/npc/female01/question02.wav",
			"vo/npc/female01/question03.wav",
			"vo/npc/female01/question04.wav",
			"vo/npc/female01/question05.wav",
			"vo/npc/female01/question06.wav",
			"vo/npc/female01/question07.wav",
			"vo/npc/female01/question08.wav",
			"vo/npc/female01/question09.wav",
			"vo/npc/female01/question10.wav",
			"vo/npc/female01/question11.wav",
			"vo/npc/female01/question12.wav",
			"vo/npc/female01/question13.wav",
			"vo/npc/female01/question14.wav",
			"vo/npc/female01/question15.wav",
			"vo/npc/female01/question16.wav",
			"vo/npc/female01/question17.wav",
			"vo/npc/female01/question18.wav",
			"vo/npc/female01/question19.wav",
			"vo/npc/female01/question20.wav",
			"vo/npc/female01/question21.wav",
			"vo/npc/female01/question22.wav",
			"vo/npc/female01/question23.wav",
			"vo/npc/female01/question25.wav",
			"vo/npc/female01/question26.wav",
			"vo/npc/female01/question27.wav",
			"vo/npc/female01/question28.wav",
			"vo/npc/female01/question29.wav",
			"vo/npc/female01/question30.wav",
			"vo/npc/female01/question31.wav",
			"vo/npc/female01/hi01.wav",
			"vo/npc/female01/hi02.wav",
			"vo/npc/female01/getgoingsoon.wav",
			"vo/npc/female01/doingsomething.wav",
			"vo/npc/female01/vquestion01.wav",
			"vo/npc/female01/vquestion02.wav",
			"vo/npc/female01/gordead_ans01.wav"}
		self.SoundTbl_IdleDialogueAnswer = {"vo/npc/female01/answer01.wav",
			"vo/npc/female01/answer02.wav",
			"vo/npc/female01/answer03.wav",
			"vo/npc/female01/answer04.wav",
			"vo/npc/female01/answer05.wav",
			"vo/npc/female01/answer07.wav",
			"vo/npc/female01/answer08.wav",
			"vo/npc/female01/answer09.wav",
			"vo/npc/female01/answer10.wav",
			"vo/npc/female01/answer11.wav",
			"vo/npc/female01/answer12.wav",
			"vo/npc/female01/answer13.wav",
			"vo/npc/female01/answer14.wav",
			"vo/npc/female01/answer15.wav",
			"vo/npc/female01/answer16.wav",
			"vo/npc/female01/answer17.wav",
			"vo/npc/female01/answer18.wav",
			"vo/npc/female01/answer19.wav",
			"vo/npc/female01/answer20.wav",
			"vo/npc/female01/answer21.wav",
			"vo/npc/female01/answer22.wav",
			"vo/npc/female01/answer23.wav",
			"vo/npc/female01/answer24.wav",
			"vo/npc/female01/answer25.wav",
			"vo/npc/female01/answer26.wav",
			"vo/npc/female01/answer27.wav",
			"vo/npc/female01/answer28.wav",
			"vo/npc/female01/answer29.wav",
			"vo/npc/female01/answer30.wav",
			"vo/npc/female01/answer31.wav",
			"vo/npc/female01/answer32.wav",
			"vo/npc/female01/answer33.wav",
			"vo/npc/female01/answer34.wav",
			"vo/npc/female01/answer35.wav",
			"vo/npc/female01/answer36.wav",
			"vo/npc/female01/answer37.wav",
			"vo/npc/female01/answer38.wav",
			"vo/npc/female01/answer39.wav",
			"vo/npc/female01/answer40.wav",
			"vo/npc/female01/sorry01.wav",
			"vo/npc/female01/sorry02.wav",
			"vo/npc/female01/sorry03.wav",
			"vo/npc/female01/busy02.wav",
			"vo/npc/female01/vanswer01.wav",
			"vo/npc/female01/vanswer03.wav",
			"vo/npc/female01/vanswer05.wav",
			"vo/npc/female01/vanswer07.wav",
			"vo/npc/female01/vanswer08.wav",
			"vo/npc/female01/vanswer09.wav",
			"vo/npc/female01/vanswer10.wav",
			"vo/npc/female01/vanswer13.wav",
			"vo/npc/female01/vanswer14.wav",
			"vo/npc/female01/vquestion04.wav"}
		self.SoundTbl_CombatIdle = {}
		self.SoundTbl_OnReceiveOrder = {"vo/npc/female01/yougotit02.wav",
			"vo/npc/female01/squad_reinforce_single04.wav",
			"vo/npc/female01/squad_reinforce_group04.wav",
			"vo/npc/female01/squad_follow03.wav",
			"vo/npc/female01/squad_approach04.wav",
			"vo/npc/female01/squad_approach03.wav",
			"vo/npc/female01/squad_approach02.wav",
			"vo/npc/female01/squad_affirm06.wav",
			"vo/npc/female01/squad_affirm05.wav",
			"vo/npc/female01/squad_affirm04.wav",
			"vo/npc/female01/squad_affirm03.wav",
			"vo/npc/female01/readywhenyouare01.wav",
			"vo/npc/female01/readywhenyouare02.wav",
			"vo/npc/female01/ok01.wav",
			"vo/npc/female01/ok02.wav",
			"vo/npc/female01/okimready01.wav",
			"vo/npc/female01/okimready02.wav",
			"vo/npc/female01/okimready03.wav",
			"vo/npc/female01/letsgo01.wav",
			"vo/npc/female01/letsgo02.wav",
			"vo/npc/female01/leadtheway01.wav",
			"vo/npc/female01/leadtheway02.wav"}
		self.SoundTbl_FollowPlayer = {"vo/npc/female01/squad_affirm01.wav",
			"vo/npc/female01/squad_affirm02.wav",
			"vo/npc/female01/squad_affirm03.wav",
			"vo/npc/female01/squad_affirm04.wav",
			"vo/npc/female01/squad_affirm05.wav",
			"vo/npc/female01/squad_affirm06.wav",
			"vo/npc/female01/squad_affirm07.wav",
			"vo/npc/female01/squad_affirm08.wav",
			"vo/npc/female01/squad_affirm09.wav",
			"vo/npc/female01/squad_train01.wav",
			"vo/npc/female01/squad_train02.wav",
			"vo/npc/female01/squad_train03.wav",
			"vo/npc/female01/squad_train04.wav"}
		self.SoundTbl_UnFollowPlayer = {"vo/npc/female01/littlecorner01.wav",
			"vo/npc/female01/imstickinghere01.wav",
			"vo/npc/female01/illstayhere01.wav",
			"vo/npc/female01/holddownspot01.wav",
			"vo/npc/female01/holddownspot02.wav",
			"vo/npc/female01/doingsomething.wav"}
		self.SoundTbl_MoveOutOfPlayersWay = {"vo/npc/female01/excuseme01.wav",
			"vo/npc/female01/excuseme02.wav",
			"vo/npc/female01/pardonme01.wav",
			"vo/npc/female01/pardonme02.wav",
			"vo/npc/female01/sorry01.wav",
			"vo/npc/female01/sorry02.wav",
			"vo/npc/female01/sorry03.wav",
			"vo/npc/female01/sorrydoc01.wav",
			"vo/npc/female01/sorrydoc02.wav",
			"vo/npc/female01/sorrydoc04.wav",
			"vo/npc/female01/sorryfm01.wav",
			"vo/npc/female01/sorryfm02.wav",
			"vo/npc/female01/outofyourway02.wav"}
		self.SoundTbl_OnPlayerSight = {"vo/npc/female01/abouttime01.wav",
			"vo/npc/female01/abouttime02.wav",
			"vo/npc/female01/ahgordon01.wav",
			"vo/npc/female01/ahgordon02.wav",
			"vo/npc/female01/docfreeman01.wav",
			"vo/npc/female01/docfreeman02.wav",
			"vo/npc/female01/freeman.wav",
			"vo/npc/female01/hellodrfm01.wav",
			"vo/npc/female01/hellodrfm02.wav",
			"vo/npc/female01/heydoc01.wav",
			"vo/npc/female01/heydoc02.wav",
			"vo/npc/female01/hi01.wav",
			"vo/npc/female01/hi02.wav",
			"vo/npc/female01/squad_greet01.wav",
			"vo/npc/female01/squad_greet02.wav",
			"vo/npc/female01/squad_greet04.wav"}
		self.SoundTbl_Investigate = {"vo/npc/female01/startle01.wav",
			"vo/npc/female01/startle02.wav"}
		self.SoundTbl_LostEnemy = {"vo/npc/female01/uhoh.wav",
			"vo/npc/female01/ohno.wav"}
		self.SoundTbl_Alert = {"vo/npc/female01/squad_affirm06.wav",
			"vo/npc/female01/squad_affirm05.wav",
			"vo/npc/female01/overthere01.wav",
			"vo/npc/female01/overthere02.wav",
			"vo/npc/female01/letsgo01.wav",
			"vo/npc/female01/letsgo02.wav",
			"vo/npc/female01/incoming02.wav",
			"vo/npc/female01/upthere01.wav",
			"vo/npc/female01/upthere02.wav",
			"vo/npc/female01/heretheycome01.wav",
			"vo/npc/female01/headsup01.wav",
			"vo/npc/female01/headsup02.wav",
			"vo/npc/female01/gethellout.wav"}
		self.SoundTbl_CallForHelp = {"vo/npc/female01/help01.wav",
			"vo/npc/female01/squad_follow03.wav",
			"vo/npc/female01/squad_follow02.wav",
			"vo/npc/female01/squad_away03.wav",
			"vo/npc/female01/squad_away02.wav",
			"vo/npc/female01/squad_away01.wav",
			"vo/npc/female01/overhere01.wav",
			"vo/npc/female01/overthere01.wav",
			"vo/npc/female01/overthere02.wav",
			"vo/npc/female01/letsgo01.wav",
			"vo/npc/female01/letsgo02.wav",
			"vo/npc/female01/upthere01.wav",
			"vo/npc/female01/upthere02.wav",
			"vo/npc/female01/headsup01.wav",
			"vo/npc/female01/headsup02.wav"}
		self.SoundTbl_BecomeEnemyToPlayer = {"vo/npc/female01/wetrustedyou01.wav",
			"vo/npc/female01/wetrustedyou02.wav",
			"vo/npc/female01/notthemanithought01.wav",
			"vo/npc/female01/notthemanithought02.wav",
			"vo/npc/female01/gethellout.wav",
			"vo/npc/female01/answer03.wav",
			"vo/npc/female01/gordead_ans02.wav",
			"vo/npc/female01/gordead_ans17.wav",
			"vo/npc/female01/gordead_ques12.wav",
			"vo/npc/female01/gordead_ques17.wav"}
		self.SoundTbl_BeforeRangeAttack = {"vo/npc/female01/overhere01.wav",
			"vo/npc/female01/cit_dropper01.wav",
			"vo/npc/female01/cit_dropper04.wav",
			"vo/npc/female01/behindyou01.wav",
			"vo/npc/female01/behindyou02.wav",
			"vo/npc/female01/ammo03.wav",
			"vo/npc/female01/ammo04.wav",
			"vo/npc/female01/ammo05.wav"}
		self.SoundTbl_OnKilledEnemy = {"vo/npc/female01/pardonme01.wav",
			"vo/npc/female01/pardonme02.wav",
			"vo/npc/female01/likethat.wav",
			"vo/npc/female01/gotone01.wav",
			"vo/npc/female01/gotone02.wav",
			"vo/npc/female01/gordead_ques01.wav",
			"vo/npc/female01/goodgod.wav",
			"vo/npc/female01/gethellout.wav",
			"vo/npc/female01/finally.wav",
			"vo/npc/female01/fantastic01.wav",
			"vo/npc/female01/fantastic02.wav",
			"vo/npc/female01/excuseme01.wav",
			"vo/npc/female01/excuseme02.wav",
			"vo/npc/female01/sorry01.wav",
			"vo/npc/female01/sorry02.wav",
			"vo/npc/female01/sorry03.wav",
			"vo/npc/female01/whoops01.wav",
			"vo/npc/female01/yeah02.wav",
			"vo/npc/female01/oneforme.wav",
			"vo/npc/female01/answer17.wav",
			"vo/npc/female01/answer25.wav",
			"vo/npc/female01/answer32.wav",
			"vo/npc/female01/answer39.wav",
			"vo/npc/female01/answer40.wav",
			"vo/npc/female01/vanswer01.wav",
			"vo/npc/female01/vquestion03.wav"}
		self.SoundTbl_AllyDeath = {"vo/npc/female01/ohno.wav",
			"vo/npc/female01/uhoh.wav",
			"vo/npc/female01/goodgod.wav",
			"vo/npc/female01/fantastic01.wav",
			"vo/npc/female01/answer03.wav",
			"vo/npc/female01/no01.wav",
			"vo/npc/female01/no02.wav",
			"vo/npc/female01/answer29.wav",
			"vo/npc/female01/question14.wav",
			"vo/npc/female01/question25.wav",
			"vo/npc/female01/question26.wav",
			"vo/npc/female01/question30.wav",
			"vo/npc/female01/gordead_ans02.wav",
			"vo/npc/female01/gordead_ans03.wav",
			"vo/npc/female01/gordead_ans04.wav",
			"vo/npc/female01/gordead_ans05.wav",
			"vo/npc/female01/gordead_ans06.wav",
			"vo/npc/female01/gordead_ans07.wav",
			"vo/npc/female01/gordead_ans08.wav",
			"vo/npc/female01/gordead_ans14.wav",
			"vo/npc/female01/gordead_ans15.wav",
			"vo/npc/female01/gordead_ans18.wav",
			"vo/npc/female01/gordead_ans19.wav",
			"vo/npc/female01/gordead_ques01.wav",
			"vo/npc/female01/gordead_ques02.wav",
			"vo/npc/female01/gordead_ques06.wav",
			"vo/npc/female01/gordead_ques07.wav",
			"vo/npc/female01/gordead_ques10.wav"}
		self.SoundTbl_Pain = {"vo/npc/female01/pain01.wav",
			"vo/npc/female01/pain02.wav",
			"vo/npc/female01/pain03.wav",
			"vo/npc/female01/pain04.wav",
			"vo/npc/female01/pain05.wav",
			"vo/npc/female01/pain06.wav",
			"vo/npc/female01/pain07.wav",
			"vo/npc/female01/pain08.wav",
			"vo/npc/female01/pain09.wav",
			"vo/npc/female01/ow01.wav",
			"vo/npc/female01/ow02.wav",
			"vo/npc/female01/imhurt01.wav",
			"vo/npc/female01/imhurt02.wav"}
		self.SoundTbl_DamageByPlayer = {"vo/npc/female01/watchwhat.wav",
			"vo/npc/female01/watchwhat.wav",
			"vo/npc/female01/stopitfm.wav",
			"vo/npc/female01/onyourside.wav",
			"vo/npc/female01/lookoutfm01.wav",
			"vo/npc/female01/lookoutfm02.wav",
			"vo/npc/female01/freeman.wav",
			"vo/npc/female01/vanswer03.wav",
			"vo/npc/female01/vanswer04.wav"}
		self.SoundTbl_Death = {"vo/npc/female01/pain01.wav",
			"vo/npc/female01/pain02.wav",
			"vo/npc/female01/pain03.wav",
			"vo/npc/female01/pain04.wav",
			"vo/npc/female01/pain05.wav",
			"vo/npc/female01/pain06.wav",
			"vo/npc/female01/pain07.wav",
			"vo/npc/female01/pain08.wav",
			"vo/npc/female01/pain09.wav"}
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetSightDirection()
	return self:GetAttachment(self:LookupAttachment("eyes")).Ang:Forward()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnMedic_OnHeal(ent)
	if ent:IsPlayer() then
		if ent:Armor() != 100 then
			self.Medic_HealthAmount = 0
		else
			self.Medic_HealthAmount = 15
		end
		if ent:Armor() == 86 then
			ent:SetArmor(ent:Armor() +14)
		elseif ent:Armor() == 87 then
			ent:SetArmor(ent:Armor() +13)
		elseif ent:Armor() == 88 then
			ent:SetArmor(ent:Armor() +12)
		elseif ent:Armor() == 89 then
			ent:SetArmor(ent:Armor() +11)
		elseif ent:Armor() == 90 then
			ent:SetArmor(ent:Armor() +10)
		elseif ent:Armor() == 91 then
			ent:SetArmor(ent:Armor() +9)
		elseif ent:Armor() == 92 then
			ent:SetArmor(ent:Armor() +8)
		elseif ent:Armor() == 93 then
			ent:SetArmor(ent:Armor() +7)
		elseif ent:Armor() == 94 then
			ent:SetArmor(ent:Armor() +6)
		elseif ent:Armor() == 95 then
			ent:SetArmor(ent:Armor() +5)
		elseif ent:Armor() == 96 then
			ent:SetArmor(ent:Armor() +4)
		elseif ent:Armor() == 97 then
			ent:SetArmor(ent:Armor() +3)
		elseif ent:Armor() == 98 then
			ent:SetArmor(ent:Armor() +2)
		elseif ent:Armor() == 99 then
			ent:SetArmor(ent:Armor() +1)
		elseif ent:Armor() == 100 then
			-- ent:SetArmor(ent:Armor() +10)
		else
			ent:SetArmor(ent:Armor() +15)
		end
	else
		self.Medic_HealthAmount = 15
	end
return true end
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
			if self.Gender == 1 then
				self:PlaySoundSystem("Alert", {"vo/npc/female01/headcrabs01.wav", 
				"vo/npc/female01/headcrabs02.wav"})
			else
				self:PlaySoundSystem("Alert", {"vo/npc/male01/headcrabs01.wav", 
				"vo/npc/male01/headcrabs02.wav"})
			end
		return
	elseif argent:GetClass() == "npc_metropolice"
			or argent:GetClass() == "npc_vj_hlr2_com_civilp"
			or argent:GetClass() == "npc_vj_hlr2_com_civilp_elite"
		then
			if self.Gender == 1 then
				self:PlaySoundSystem("Alert", {"vo/npc/female01/civilprotection01.wav", 
				"vo/npc/female01/civilprotection02.wav", 
				"vo/npc/female01/cps01.wav", 
				"vo/npc/female01/cps02.wav"})
			else
				self:PlaySoundSystem("Alert", {"vo/npc/male01/civilprotection01.wav", 
				"vo/npc/male01/civilprotection02.wav", 
				"vo/npc/male01/cps01.wav", 
				"vo/npc/male01/cps02.wav"})
			end
		return
	elseif argent:GetClass() == "npc_cscanner"
			or argent:GetClass() == "npc_clawscanner"
		then
			if self.Gender == 1 then
				self:PlaySoundSystem("Alert", {"vo/npc/female01/scanners01.wav", 
				"vo/npc/female01/scanners02.wav"})
			else
				self:PlaySoundSystem("Alert", {"vo/npc/male01/scanners01.wav", 
				"vo/npc/male01/scanners02.wav"})
			end
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
				self:PlaySoundSystem("Alert", {"vo/npc/female01/combine01.wav", 
				"vo/npc/female01/combine02.wav"})
			else
				self:PlaySoundSystem("Alert", {"vo/npc/male01/combine01.wav", 
				"vo/npc/male01/combine02.wav"})
			end
		return		
	elseif argent:GetClass() == "npc_combinegunship"
			or argent:GetClass() == "npc_vj_hlr1_apache"
			or argent:GetClass() == "npc_vj_hlrof_assassin_apache"
		then
			if self.Gender == 1 then
				self:PlaySoundSystem("Alert", {"vo/npc/female01/gunship02.wav"})
			else
				self:PlaySoundSystem("Alert", {"vo/npc/male01/gunship02.wav"})
			end
		return		
	elseif argent:GetClass() == "npc_strider"
		then
			if self.Gender == 1 then
				self:PlaySoundSystem("Alert", {"vo/npc/female01/strider.wav"})
			else
				self:PlaySoundSystem("Alert", {"vo/npc/male01/strider.wav"})
			end
		return		
	elseif argent:GetClass() == "npc_manhack"
		then
			if self.Gender == 1 then
				self:PlaySoundSystem("Alert", {"vo/npc/female01/hacks01.wav",
				"vo/npc/female01/hacks02.wav",
				"vo/npc/female01/herecomehacks01.wav",
				"vo/npc/female01/herecomehacks02.wav",
				"vo/npc/female01/itsamanhack01.wav",
				"vo/npc/female01/itsamanhack02.wav",
				"vo/npc/female01/thehacks01.wav",
				"vo/npc/female01/thehacks02.wav"})
			else
				self:PlaySoundSystem("Alert", {"vo/npc/male01/hacks01.wav",
				"vo/npc/male01/hacks02.wav",
				"vo/npc/male01/herecomehacks01.wav",
				"vo/npc/male01/herecomehacks02.wav",
				"vo/npc/male01/itsamanhack01.wav",
				"vo/npc/male01/itsamanhack02.wav",
				"vo/npc/male01/thehacks01.wav",
				"vo/npc/male01/thehacks02.wav"})
			end
		return
	else
		for _,v in ipairs(argent.VJ_NPC_Class or {1}) do
			if v == "CLASS_COMBINE" or argent:Classify() == CLASS_COMBINE then
				if self.Gender == 1 then
					self:PlaySoundSystem("Alert", {"vo/npc/female01/combine01.wav", 
					"vo/npc/female01/combine02.wav"})
				else
					self:PlaySoundSystem("Alert", {"vo/npc/male01/combine01.wav", 
					"vo/npc/male01/combine02.wav"})
				end
				return
			elseif v == "CLASS_ZOMBIE" or argent:Classify() == CLASS_ZOMBIE then
			
			if self.Gender == 1 then
				self:PlaySoundSystem("Alert", {"vo/npc/female01/zombies01.wav", 
				"vo/npc/female01/zombies02.wav"})
			else
				self:PlaySoundSystem("Alert", {"vo/npc/male01/zombies01.wav", 
				"vo/npc/male01/zombies02.wav"})
			end
				return
				end
			end
		end
	end
	if argent:IsPlayer() then
		if self.Gender == 1 then
			self:PlaySoundSystem("Alert", {"vo/npc/female01/gordead_ques05.wav", 
			"vo/npc/female01/gordead_ques12.wav",
			"vo/npc/female01/gordead_ques13.wav",
			"vo/npc/female01/gordead_ques17.wav"})
		else
			self:PlaySoundSystem("Alert", {"vo/npc/male01/gordead_ques03a.wav", 
			"vo/npc/male01/gordead_ques03b.wav",
			"vo/npc/male01/gordead_ques05.wav",
			"vo/npc/male01/gordead_ques12.wav",
			"vo/npc/male01/gordead_ques13.wav",
			"vo/npc/male01/gordead_ques17.wav"})
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MultipleMeleeAttacks()
	local randattack_stand = math.random(1,8)

	if randattack_stand == 1 then
		self.AnimTbl_MeleeAttack = {"swing"}
		if self.Gender == 1 then
			self.TimeUntilMeleeAttackDamage = 0.69
		else
			self.TimeUntilMeleeAttackDamage = 0.4
		end
		self.MeleeAttackDamage = math.Rand(5,10)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 2 then
		self.AnimTbl_MeleeAttack = {"swing"}
		if self.Gender == 1 then
			self.TimeUntilMeleeAttackDamage = 0.69
		else
			self.TimeUntilMeleeAttackDamage = 0.4
		end
		self.MeleeAttackDamage = math.Rand(5,10)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 3 then
		self.AnimTbl_MeleeAttack = {"swing"}
		if self.Gender == 1 then
			self.TimeUntilMeleeAttackDamage = 0.69
		else
			self.TimeUntilMeleeAttackDamage = 0.4
		end
		self.MeleeAttackDamage = math.Rand(5,10)
		self.MeleeAttackDamageType = DMG_CLUB
		self.HasMeleeAttackKnockBack = false
		
	elseif randattack_stand == 4 then
		self.AnimTbl_MeleeAttack = {"swing"}
		if self.Gender == 1 then
			self.TimeUntilMeleeAttackDamage = 0.69
		else
			self.TimeUntilMeleeAttackDamage = 0.4
		end
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
	if math.random(1,5) == 1 then
		self.RangeAttackEntityToSpawn = "obj_vj_bbohg_box"
	else
		self.RangeAttackEntityToSpawn = "obj_vj_bbohg_ammo"
	end
	if math.random(1,150) == 1 then
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
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo, hitgroup)
	if math.random(1,3) == 1 && hitgroup == HITGROUP_STOMACH then
		if self.Gender == 1 then
		self:PlaySoundSystem("Pain", {"vo/npc/female01/hitingut01.wav","vo/npc/female01/hitingut02.wav","vo/npc/female01/mygut02.wav"})
		else
		self:PlaySoundSystem("Pain", {"vo/npc/male01/hitingut01.wav","vo/npc/male01/hitingut02.wav","vo/npc/male01/mygut02.wav"})
		end
	end
	if math.random(1,3) == 1 then 
		if hitgroup == HITGROUP_LEFTARM || hitgroup == HITGROUP_RIGHTARM then
		if self.Gender == 1 then
		self:PlaySoundSystem("Pain", {"vo/npc/female01/myarm01.wav","vo/npc/female01/myarm02.wav"})
		else
		self:PlaySoundSystem("Pain", {"vo/npc/male01/myarm01.wav","vo/npc/male01/myarm02.wav"})
		end
		end
	end
	if math.random(1,3) == 1 then
		if hitgroup == HITGROUP_LEFTLEG || hitgroup == HITGROUP_RIGHTLEG then
		if self.Gender == 1 then
		self:PlaySoundSystem("Pain", {"vo/npc/female01/myleg01.wav","vo/npc/female01/myleg02.wav"})
		else
		self:PlaySoundSystem("Pain", {"vo/npc/male01/myleg01.wav","vo/npc/male01/myleg02.wav"})
		end
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetUpGibesOnDeath(dmginfo, hitgroup)
	self.HasDeathSounds = false
	if self.HasGibDeathParticles == true then
		local effectBlood = EffectData()
		effectBlood:SetOrigin(self:GetPos() + self:OBBCenter())
		effectBlood:SetColor(VJ_Color2Byte(Color(42,110,198)))
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
	self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/mgib_01.mdl",{BloodDecal="VJ_Blood_Blue",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/mgib_02.mdl",{BloodDecal="VJ_Blood_Blue",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/mgib_03.mdl",{BloodDecal="VJ_Blood_Blue",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/gibs/xenians/mgib_04.mdl",{BloodDecal="VJ_Blood_Blue",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,50))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_rib.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_rib.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_scapula.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/Gibs/HGIBS_spine.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/items/357ammobox.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,40))})
	self:CreateGibEntity("obj_vj_gib","models/items/boxsrounds.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,45))})
	self:CreateGibEntity("obj_vj_gib","models/items/combine_rifle_cartridge01.mdl",{BloodDecal="VJ_Blood_Oil",Pos=self:LocalToWorld(Vector(0,0,45))})
	self:CreateGibEntity("obj_vj_gib","models/items/battery.mdl",{BloodDecal="VJ_Blood_Blue",Pos=self:LocalToWorld(Vector(0,0,60))})
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