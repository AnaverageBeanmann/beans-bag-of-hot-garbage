AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/Humans/Group01/male_09.mdl"} 
ENT.StartHealth = 3000
ENT.HasHealthRegeneration = true
ENT.HealthRegenerationAmount = math.Rand(15,25)
ENT.HealthRegenerationDelay = VJ_Set(1,2)
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
ENT.VJ_NPC_Class = {"CLASS_TOSSER"} 
ENT.BloodColor = "Green"
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
ENT.HasRangeAttack = true -- Should the SNPC have a range attack?
ENT.RangeAttackEntityToSpawn = "obj_vj_bbohg_medvial" -- The entity that is spawned when range attacking
	-- ====== Animation Variables ====== --
ENT.AnimTbl_RangeAttack = {"luggageidle"} -- Range Attack Animations
ENT.RangeAttackAnimationDelay = 0 -- It will wait certain amount of time before playing the animation
ENT.RangeAttackAnimationFaceEnemy = true -- Should it face the enemy while playing the range attack animation?
ENT.RangeAttackAnimationDecreaseLengthAmount = 0 -- This will decrease the time until starts chasing again. Use it to fix animation pauses until it chases the enemy.
ENT.RangeAttackAnimationStopMovement = true -- Should it stop moving when performing a range attack?
	-- ====== Distance Variables ====== --
ENT.RangeDistance = 2000 -- This is how far away it can shoot
ENT.RangeToMeleeDistance = 200 -- How close does it have to be until it uses melee?
ENT.RangeAttackAngleRadius = 100 -- What is the attack angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
	-- ====== Timer Variables ====== --
	-- To use event-based attacks, set this to false:
ENT.TimeUntilRangeAttackProjectileRelease = 0.95 -- How much time until the projectile code is ran?
ENT.NextRangeAttackTime = 10 -- How much time until it can use a range attack?
ENT.NextRangeAttackTime_DoRand = false -- False = Don't use random time | Number = Picks a random number between the regular timer and this timer
	-- To let the base automatically detect the attack duration, set this to false:
ENT.NextAnyAttackTime_Range = false -- How much time until it can use any attack again? | Counted in Seconds
ENT.NextAnyAttackTime_Range_DoRand = false -- False = Don't use random time | Number = Picks a random number between the regular timer and this timer
ENT.RangeAttackReps = 1 -- How many times does it run the projectile code?
ENT.RangeAttackExtraTimers = {0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1,1.1,1.2,1.3,1.4,1.5,1.6,1.7,1.8,1.9,2,2.1,2.2,2.3,2.4,2.5,2.6,2.7,2.8,2.9,3,3.1,3.2,3.3,3.4,3.5,3.6,3.7,3.8,3.9,4,4.1,4.2,4.3,4.4,4.5,4.6,4.7,4.8,4.9,5} -- Extra range attack timers, EX: {1, 1.4} | it will run the projectile code after the given amount of seconds
	-- ====== Projectile Spawn Position Variables ====== --
ENT.RangeUseAttachmentForPos = false -- Should the projectile spawn on a attachment?
ENT.RangeUseAttachmentForPosID = "anim_attachment_RH" -- The attachment used on the range attack if RangeUseAttachmentForPos is set to true
ENT.RangeAttackPos_Up = 50 -- Up/Down spawning position for range attack
ENT.RangeAttackPos_Forward = 0 -- Forward/Backward spawning position for range attack
ENT.RangeAttackPos_Right = 0 -- Right/Left spawning position for range attack
	-- ====== Control Variables ====== --
ENT.DisableRangeAttackAnimation = false -- if true, it will disable the animation code
ENT.DisableDefaultRangeAttackCode = false -- When true, it won't spawn the range attack entity, allowing you to make your own

ENT.NoChaseAfterCertainRange = true -- Should the SNPC not be able to chase when it's between number x and y?
ENT.NoChaseAfterCertainRange_FarDistance = 400 -- How far until it can chase again? | "UseRangeDistance" = Use the number provided by the range attack instead
ENT.NoChaseAfterCertainRange_CloseDistance = 300 -- How near until it can chase again? | "UseRangeDistance" = Use the number provided by the range attack instead
ENT.NoChaseAfterCertainRange_Type = "Regular"
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.IsMedicSNPC = true
ENT.AnimTbl_Medic_GiveHealth = {"ThrowItem"}
ENT.Medic_TimeUntilHeal = 1
ENT.Medic_HealthAmount = math.Rand(25,35)
ENT.Medic_NextHealTime = VJ_Set(3,5)
ENT.Medic_SpawnPropOnHeal = true
ENT.Medic_SpawnPropOnHealModel = "models/items/healthkit.mdl"
ENT.Medic_SpawnPropOnHealAttachment = "anim_attachment_LH"
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasDeathAnimation = false
ENT.FootStepSoundLevel = 70
ENT.MeleeAttackSoundLevel = 75
ENT.GeneralSoundPitch1 = 100
ENT.GeneralSoundPitch2 = 95
ENT.IdleSoundChance = 5
ENT.CombatIdleSoundChance = 4
ENT.IdleSoundLevel = 45
ENT.CombatIdleSoundLevel = 60
ENT.FootStepTimeRun = 0.25
ENT.FootStepTimeWalk = 0.5
ENT.IdleDialogueDistance = 175
ENT.NoChaseAfterCertainRange = true
ENT.NoChaseAfterCertainRange_FarDistance = 500 
ENT.NoChaseAfterCertainRange_CloseDistance = 200 
ENT.NoChaseAfterCertainRange_Type = "Regular"


ENT.CanAnnounceGuardStatus = true
ENT.CanDoDeathSound = true
ENT.move = false
ENT.move2 = false
ENT.move3 = false
ENT.infect = true
ENT.infect2 = false
ENT.MoveToCorpose = false
ENT.HasEnemy = false
ENT.NextZombieSpawnT = 0
ENT.AlreadySpawned = false
---------------------------------------------------------------------------------------------------------------------------------------------
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_FootStep = {"player/footsteps/concrete1.wav",
	"player/footsteps/concrete2.wav",
	"player/footsteps/concrete3.wav",
	"player/footsteps/concrete4.wav",}
ENT.SoundTbl_Idle = {}
ENT.SoundTbl_IdleDialogue = {"vo/npc/male01/vquestion02.wav",
	"vo/npc/male01/doingsomething.wav",
	"vo/npc/male01/getgoingsoon.wav",
	"vo/npc/male01/gordead_ans01.wav",
	"vo/npc/male01/gordead_ques16.wav",
	"vo/npc/male01/question01.wav",
	"vo/npc/male01/question02.wav",
	"vo/npc/male01/question03.wav",
	"vo/npc/male01/question04.wav",
	"vo/npc/male01/question05.wav",
	"vo/npc/male01/question06.wav",
	"vo/npc/male01/question07.wav",
	"vo/npc/male01/question09.wav",
	"vo/npc/male01/question10.wav",
	"vo/npc/male01/question11.wav",
	"vo/npc/male01/question12.wav",
	"vo/npc/male01/question13.wav",
	"vo/npc/male01/question15.wav",
	"vo/npc/male01/question16.wav",
	"vo/npc/male01/question17.wav",
	"vo/npc/male01/question18.wav",
	"vo/npc/male01/question19.wav",
	"vo/npc/male01/question20.wav",
	"vo/npc/male01/question21.wav",
	"vo/npc/male01/question22.wav",
	"vo/npc/male01/question23.wav",
	"vo/npc/male01/question24.wav",
	"vo/npc/male01/question25.wav",
	"vo/npc/male01/question26.wav",
	"vo/npc/male01/question27.wav",
	"vo/npc/male01/question28.wav",
	"vo/npc/male01/question29.wav",
	"vo/npc/male01/question30.wav",
	"vo/npc/male01/question31.wav"}
ENT.SoundTbl_IdleDialogueAnswer = {"vo/npc/male01/answer01.wav",
	"vo/npc/male01/answer02.wav",
	"vo/npc/male01/answer03.wav",
	"vo/npc/male01/answer04.wav",
	"vo/npc/male01/answer05.wav",
	"vo/npc/male01/answer06.wav",
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
	"vo/npc/male01/answer32.wav",
	"vo/npc/male01/answer33.wav",
	"vo/npc/male01/answer34.wav",
	"vo/npc/male01/answer35.wav",
	"vo/npc/male01/answer36.wav",
	"vo/npc/male01/answer37.wav",
	"vo/npc/male01/answer38.wav",
	"vo/npc/male01/answer39.wav",
	"vo/npc/male01/answer40.wav",
	"vo/npc/male01/vanswer01.wav",
	"vo/npc/male01/vanswer03.wav",
	"vo/npc/male01/vanswer04.wav",
	"vo/npc/male01/vanswer05.wav",
	"vo/npc/male01/vanswer06.wav",
	"vo/npc/male01/vanswer07.wav",
	"vo/npc/male01/vanswer08.wav",
	"vo/npc/male01/vanswer09.wav",
	"vo/npc/male01/vanswer10.wav",
	"vo/npc/male01/vanswer14.wav",
	"vo/npc/male01/vquestion04.wav",
	"vo/npc/male01/question14.wav",
	"vo/npc/male01/yeah02.wav"}
--ENT.SoundTbl_CombatIdle = {}
ENT.SoundTbl_OnReceiveOrder = {"vo/npc/male01/ok01.wav",
	"vo/npc/male01/ok02.wav",
	"vo/npc/male01/okimready01.wav",
	"vo/npc/male01/okimready02.wav",
	"vo/npc/male01/okimready03.wav",
	"vo/npc/male01/readywhenyouare01.wav",
	"vo/npc/male01/readywhenyouare02.wav"}
ENT.SoundTbl_FollowPlayer = {"vo/npc/male01/leadtheway01.wav",
	"vo/npc/male01/leadtheway02.wav",
	"vo/npc/male01/readywhenyouare01.wav",
	"vo/npc/male01/readywhenyouare02.wav"}
ENT.SoundTbl_UnFollowPlayer = {}
ENT.SoundTbl_MoveOutOfPlayersWay = {"vo/npc/male01/outofyourway02.wav",
	"vo/npc/male01/pardonme01.wav",
	"vo/npc/male01/pardonme02.wav",
	"vo/npc/male01/excuseme01.wav",
	"vo/npc/male01/excuseme02.wav",
	"vo/npc/male01/sorry01.wav",
	"vo/npc/male01/sorry02.wav",
	"vo/npc/male01/sorry03.wav",
	"vo/npc/male01/whoops01.wav"}
ENT.SoundTbl_MedicBeforeHeal = {"vo/npc/male01/health01.wav",
	"vo/npc/male01/health02.wav",
	"vo/npc/male01/health03.wav",
	"vo/npc/male01/health04.wav",
	"vo/npc/male01/health05.wav"}
--ENT.SoundTbl_MedicAfterHeal = {}
--ENT.SoundTbl_MedicReceiveHeal = {}
ENT.SoundTbl_Investigate = {"vo/npc/male01/startle01.wav",
	"vo/npc/male01/startle02.wav"}
ENT.SoundTbl_LostEnemy = {}
ENT.SoundTbl_Alert = {"vo/npc/male01/cit_dropper01.wav",
	"vo/npc/male01/evenodds.wav",
	"vo/npc/male01/gethellout.wav",
	"vo/npc/male01/overthere01.wav",
	"vo/npc/male01/overthere02.wav",
	"vo/npc/male01/overhere01.wav",
	}
ENT.SoundTbl_CallForHelp = {"vo/npc/male01/help01.wav",
	"vo/npc/male01/letsgo01.wav",
	"vo/npc/male01/letsgo02.wav"}
ENT.SoundTbl_BecomeEnemyToPlayer = {"vo/npc/male01/heretohelp01.wav",
	"vo/npc/male01/heretohelp02.wav",
	"vo/npc/male01/notthemanithought01.wav",
	"vo/npc/male01/notthemanithought02.wav",
	"vo/npc/male01/wetrustedyou01.wav",
	"vo/npc/male01/wetrustedyou02.wav"}
--ENT.SoundTbl_BeforeMeleeAttack = {}
ENT.SoundTbl_MeleeAttack = {"physics/body/body_medium_impact_hard1.wav",
"physics/body/body_medium_impact_hard2.wav",
"physics/body/body_medium_impact_hard3.wav",
"physics/body/body_medium_impact_hard4.wav",
"physics/body/body_medium_impact_hard5.wav"}
ENT.SoundTbl_MeleeAttackExtra = {}
ENT.SoundTbl_MeleeAttackMiss = {"npc/zombie/claw_miss2.wav",
	"npc/zombie/claw_miss1.wav"}
ENT.SoundTbl_MeleeAttackSlowPlayer = {"vj_player/heartbeat.wav"}
ENT.SoundTbl_BeforeRangeAttack = {"ambient/energy/whiteflash.wav"}
ENT.SoundTbl_RangeAttack = {"npc/zombie/claw_miss2.wav",
	"npc/zombie/claw_miss1.wav"}
ENT.SoundTbl_OnKilledEnemy = {"vo/npc/male01/fantastic01.wav",
	"vo/npc/male01/fantastic02.wav",
	"vo/npc/male01/finally.wav",
	"vo/npc/male01/goodgod.wav",
	"vo/npc/male01/gordead_ques01.wav",
	"vo/npc/male01/gotone01.wav",
	"vo/npc/male01/gotone02.wav",
	"vo/npc/male01/likethat.wav",
	"vo/npc/male01/nice.wav",
	"vo/npc/male01/oneforme.wav"}
ENT.SoundTbl_Pain = {"vo/npc/male01/imhurt01.wav",
	"vo/npc/male01/imhurt02.wav",
	"vo/npc/male01/ow01.wav",
	"vo/npc/male01/ow02.wav",
	"vo/npc/male01/pain01.wav",
	"vo/npc/male01/pain02.wav",
	"vo/npc/male01/pain03.wav",
	"vo/npc/male01/pain04.wav",
	"vo/npc/male01/pain05.wav",
	"vo/npc/male01/pain06.wav",
	"vo/npc/male01/pain07.wav",
	"vo/npc/male01/pain08.wav",
	"vo/npc/male01/pain09.wav"}
ENT.SoundTbl_DamageByPlayer = {"vo/npc/male01/stopitfm.wav",
	"vo/npc/male01/watchwhat.wav"}
ENT.SoundTbl_Death = {"vo/npc/male01/pain01.wav",
	"vo/npc/male01/pain02.wav",
	"vo/npc/male01/pain03.wav",
	"vo/npc/male01/pain04.wav",
	"vo/npc/male01/pain05.wav",
	"vo/npc/male01/pain06.wav",
	"vo/npc/male01/pain07.wav",
	"vo/npc/male01/pain08.wav",
	"vo/npc/male01/pain09.wav"}
ENT.HasSoundTrack = true 
ENT.SoundTbl_SoundTrack = {"music/Old_Friends_Old_Rivals.mp3"}
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
-----------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetSightDirection()
	return self:GetAttachment(self:LookupAttachment("eyes")).Ang:Forward()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAllyDeath(ent) 
	if math.random(1,4) == 1 then
		VJ_EmitSound(self,{"vo/npc/male01/fantastic01.wav",
	"vo/npc/male01/gordead_ans02.wav",
	"vo/npc/male01/gordead_ans03.wav",
	"vo/npc/male01/gordead_ans04.wav",
	"vo/npc/male01/gordead_ans05.wav",
	"vo/npc/male01/gordead_ans06.wav",
	"vo/npc/male01/gordead_ans07.wav",
	"vo/npc/male01/gordead_ans08.wav",
	"vo/npc/male01/gordead_ans18.wav",
	"vo/npc/male01/gordead_ans19.wav",
	"vo/npc/male01/gordead_ques02.wav",
	"vo/npc/male01/gordead_ques07.wav",
	"vo/npc/male01/no01.wav",
	"vo/npc/male01/no02.wav",
	"vo/npc/male01/ohno.wav",
	"vo/npc/male01/uhoh.wav"},70,math.random(100,100))
		self.CanDoDeathSound = false
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
	if IsValid(self:GetEnemy()) then
		self.HasIdleDialogueSounds = false
		self.HasIdleDialogueAnswerSounds = false
		self.HasEnemy = true
	else
		self.HasIdleDialogueSounds = true
		self.HasIdleDialogueAnswerSounds = true
		self.HasEnemy = false
	end
	if self.IsGuard == true then
		self.SoundTbl_OnPlayerSight = {"vo/npc/male01/busy02.wav",
			"vo/npc/male01/excuseme01.wav",
			"vo/npc/male01/excuseme02.wav",
			"vo/npc/male01/waitingsomebody.wav"}
	    else
			self.SoundTbl_OnPlayerSight = {"vo/npc/male01/hi01.wav",
			"vo/npc/male01/hi02.wav"}
	end
		if self.IsGuard == true then
			if self.CanAnnounceGuardStatus == true then
				VJ_EmitSound(self,{"vo/npc/male01/holddownspot01.wav",
									"vo/npc/male01/holddownspot02.wav",
									"vo/npc/male01/illstayhere01.wav",
									"vo/npc/male01/imstickinghere01.wav",
									"vo/npc/male01/littlecorner01.wav"},70,math.random(100,100))
				self.CanAnnounceGuardStatus = false
		elseif self.IsGuard == false then
			self.CanAnnounceGuardStatus = true
				end
	end
	
	if self.HasEnemy == false then
	
for _,v in ipairs(ents.FindInSphere(self:GetPos(),2600)) do
if self.infect == true && self.MoveToCorpose == false && self.MeleeAttacking == false then
if IsValid(v) && v:GetClass() == "prop_ragdoll" && v:GetClass() != "prop_physics" && v:GetModel() !="models/player/skeleton.mdl" && v:GetModel() != "models/combine_strider.mdl" && v:GetModel() != "models/lamarr.mdl" && v:GetModel() != "models/combine_scanner.mdl" && v:GetModel() != "models/manhack.mdl" && v:GetModel() != "models/antlion.mdl" && v:GetModel() != "models/antlion_guard.mdl" && v:GetModel() != "models/headcrabclassic.mdl" && v:GetModel() != "models/headcrab.mdl" && v:GetModel() != "models/headcrabblack.mdl" && v:GetModel() != "models/gibs/fast_zombie_legs.mdl" && v:GetModel() != "models/gibs/fast_zombie_torso.mdl" && v:GetModel() != "models/zombie/classic_legs.mdl" && v:GetModel() != "models/zombie/classic_torso.mdl" && v:GetModel() != "models/humans/charple03.mdl" && v:GetModel() != "models/combine_dropship.mdl" && v:GetModel() != "models/props_vehicles/car001a_phy.mdl" && v:GetModel() != "models/props_vehicles/wagon001a_phy.mdl" && v:GetModel() != "models/shield_scanner.mdl" && v:GetModel() != "models/gunship.mdl" && v:GetModel() != "models/hunter.mdl" && v:GetModel() != "models/Humans/Charple02.mdl"  && v:GetModel() != "models/Humans/Charple01.mdl" && v:GetModel() != "models/Humans/Charple04.mdl" && v:GetModel() != "models/props_c17/furnituremattress001a.mdl" && v:GetModel() != "models/dog.mdl" then
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
if IsValid(v) && v:GetClass() == "prop_ragdoll" && v:GetClass() != "prop_physics" && v:GetModel() !="models/player/skeleton.mdl" && v:GetModel() != "models/combine_strider.mdl" && v:GetModel() != "models/lamarr.mdl" && v:GetModel() != "models/combine_scanner.mdl" && v:GetModel() != "models/manhack.mdl" && v:GetModel() != "models/antlion.mdl" && v:GetModel() != "models/antlion_guard.mdl" && v:GetModel() != "models/headcrabclassic.mdl" && v:GetModel() != "models/headcrab.mdl" && v:GetModel() != "models/headcrabblack.mdl" && v:GetModel() != "models/gibs/fast_zombie_legs.mdl" && v:GetModel() != "models/gibs/fast_zombie_torso.mdl" && v:GetModel() != "models/zombie/classic_legs.mdl" && v:GetModel() != "models/zombie/classic_torso.mdl" && v:GetModel() != "models/humans/charple03.mdl" && v:GetModel() != "models/combine_dropship.mdl" && v:GetModel() != "models/props_vehicles/car001a_phy.mdl" && v:GetModel() != "models/props_vehicles/wagon001a_phy.mdl" && v:GetModel() != "models/shield_scanner.mdl" && v:GetModel() != "models/gunship.mdl" && v:GetModel() != "models/hunter.mdl" && v:GetModel() != "models/Humans/Charple02.mdl"  && v:GetModel() != "models/Humans/Charple01.mdl" && v:GetModel() != "models/Humans/Charple04.mdl" && v:GetModel() != "models/props_c17/furnituremattress001a.mdl" && v:GetModel() != "models/dog.mdl" then
self:VJ_ACT_PLAYACTIVITY("roofidle1",true,4.6999999019504,false)
timer.Simple(1.9,function() if IsValid(self) then
 end end)
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
if IsValid(v) && v:GetClass() == "prop_ragdoll" && v:GetClass() != "prop_physics" && v:GetModel() !="models/player/skeleton.mdl" && v:GetModel() != "models/combine_strider.mdl" && v:GetModel() != "models/lamarr.mdl" && v:GetModel() != "models/combine_scanner.mdl" && v:GetModel() != "models/manhack.mdl" && v:GetModel() != "models/antlion.mdl" && v:GetModel() != "models/antlion_guard.mdl" && v:GetModel() != "models/headcrabclassic.mdl" && v:GetModel() != "models/headcrab.mdl" && v:GetModel() != "models/headcrabblack.mdl" && v:GetModel() != "models/gibs/fast_zombie_legs.mdl" && v:GetModel() != "models/gibs/fast_zombie_torso.mdl" && v:GetModel() != "models/zombie/classic_legs.mdl" && v:GetModel() != "models/zombie/classic_torso.mdl" && v:GetModel() != "models/humans/charple03.mdl" && v:GetModel() != "models/combine_dropship.mdl" && v:GetModel() != "models/props_vehicles/car001a_phy.mdl" && v:GetModel() != "models/props_vehicles/wagon001a_phy.mdl" && v:GetModel() != "models/shield_scanner.mdl" && v:GetModel() != "models/gunship.mdl" && v:GetModel() != "models/hunter.mdl" && v:GetModel() != "models/Humans/Charple02.mdl"  && v:GetModel() != "models/Humans/Charple01.mdl" && v:GetModel() != "models/Humans/Charple04.mdl" && v:GetModel() != "models/props_c17/furnituremattress001a.mdl" && v:GetModel() != "models/dog.mdl" then
v:Remove()


local spawn = math.random(1,6)
if spawn == 1 then
self.sworm13 = ents.Create("npc_vj_bbohg_medkit")
self.sworm13:SetPos(v:GetPos() + self:GetUp()*10)
self.sworm13:SetAngles(self:GetAngles())
self.sworm13:Spawn()
timer.Simple(0.15,function() if IsValid(self) && IsValid(self.sworm13) then
VJ_EmitSound(self,"items/medshot4.wav",70,100) 
 end end)
self.sworm13:VJ_ACT_PLAYACTIVITY("Sit_Ground_to_Idle",true,2.5,false)
self.sworm13:Activate()
end

if spawn == 2 then
self.sworm13 = ents.Create("npc_vj_bbohg_medkit")
self.sworm13:SetPos(v:GetPos() + self:GetUp()*10)
self.sworm13:SetAngles(self:GetAngles())
self.sworm13:Spawn()
timer.Simple(0.15,function() if IsValid(self) && IsValid(self.sworm13) then
VJ_EmitSound(self,"items/medshot4.wav",70,100) 
 end end)
self.sworm13:VJ_ACT_PLAYACTIVITY("Sit_Ground_to_Idle",true,2.5,false)
self.sworm13:Activate()
end

if spawn == 3 then
self.sworm13 = ents.Create("npc_vj_bbohg_medvial")
self.sworm13:SetPos(v:GetPos() + self:GetUp()*10)
self.sworm13:SetAngles(self:GetAngles())
self.sworm13:Spawn()
timer.Simple(0.15,function() if IsValid(self) && IsValid(self.sworm13) then
VJ_EmitSound(self,"items/medshot4.wav",70,100) 
 end end)
self.sworm13:VJ_ACT_PLAYACTIVITY("Sit_Ground_to_Idle",true,2.5,false)
self.sworm13:Activate()
end

if spawn == 4 then
self.sworm13 = ents.Create("npc_vj_bbohg_ammo")
self.sworm13:SetPos(v:GetPos() + self:GetUp()*10)
self.sworm13:SetAngles(self:GetAngles())
self.sworm13:Spawn()
timer.Simple(0.15,function() if IsValid(self) && IsValid(self.sworm13) then
VJ_EmitSound(self,"items/medshot4.wav",70,100) 
 end end)
self.sworm13:VJ_ACT_PLAYACTIVITY("Sit_Ground_to_Idle",true,2.5,false)
self.sworm13:Activate()
end

if spawn == 5 then
self.sworm13 = ents.Create("npc_vj_bbohg_cheese")
self.sworm13:SetPos(v:GetPos() + self:GetUp()*10)
self.sworm13:SetAngles(self:GetAngles())
self.sworm13:Spawn()
timer.Simple(0.15,function() if IsValid(self) && IsValid(self.sworm13) then
VJ_EmitSound(self,"items/medshot4.wav",70,100) 
 end end)
self.sworm13:VJ_ACT_PLAYACTIVITY("Sit_Ground_to_Idle",true,2.5,false)
self.sworm13:Activate()
end

if spawn == 6 then
self.sworm13 = ents.Create("npc_vj_bbohg_barnyot")
self.sworm13:SetPos(v:GetPos() + self:GetUp()*10)
self.sworm13:SetAngles(self:GetAngles())
self.sworm13:Spawn()
timer.Simple(0.15,function() if IsValid(self) && IsValid(self.sworm13) then
VJ_EmitSound(self,"items/medshot4.wav",70,100) 
 end end)
self.sworm13:VJ_ACT_PLAYACTIVITY("Sit_Ground_to_Idle",true,2.5,false)
self.sworm13:Activate()
end
end
  end end)
timer.Simple(7,function() if IsValid(self) then self.infect = true
self.DisableChasingEnemy = false
self.DisableFindEnemy = false
self.MovementType = VJ_MOVETYPE_GROUND
 end end)
end
end
end

end


	if IsValid(self:GetEnemy()) && CurTime() > self.NextZombieSpawnT then
		if !IsValid(self.Zombie1) && !IsValid(self.Zombie2) && !IsValid(self.Zombie3) && !IsValid(self.Zombie4) && self.AlreadySpawned ==  false then
			self.AlreadySpawned = true
			self:VJ_ACT_PLAYACTIVITY("preSkewer",true,0.65,false,0,{SequenceDuration=0.65})
			VJ_EmitSound(self,{"ambient/energy/weld1.wav","ambient/energy/weld2.wav"},100,math.random(100,95))
			effects.BeamRingPoint(self:GetPos(), 0.3, 2, 400, 16, 0, Color(240, 255, 255, 255), {material="sprites/bluelight1", framerate=20})
	        effects.BeamRingPoint(self:GetPos(), 0.3, 2, 200, 16, 0, Color(240, 255, 255, 255), {material="sprites/bluelight1", framerate=20})
			
			self.Zombie1 = ents.Create("npc_vj_bbohg_ammo")
			self.Zombie1:SetPos(self:GetPos() +self:GetRight()*50 +self:GetUp()*5)
			self.Zombie1:SetAngles(self:GetAngles())
			self.Zombie1:Spawn()
			self.Zombie1:SetNoDraw(true)
			timer.Simple(0.3,function() if IsValid(self.Zombie1) then self.Zombie1:SetNoDraw(false) end end)
			self.Zombie1:VJ_ACT_PLAYACTIVITY("Sit_Ground_to_Idle",true,2.5,true,0,{SequenceDuration=2.5})
			
			self.Zombie2 = ents.Create("npc_vj_bbohg_ammo")
			self.Zombie2:SetPos(self:GetPos() +self:GetRight()*-50 +self:GetUp()*5)
			self.Zombie2:SetAngles(self:GetAngles())
			self.Zombie2:Spawn()
			self.Zombie2:SetNoDraw(true)
			timer.Simple(0.3,function() if IsValid(self.Zombie2) then self.Zombie2:SetNoDraw(false) end end)
			self.Zombie2:VJ_ACT_PLAYACTIVITY("Sit_Ground_to_Idle",true,2.5,true,0,{SequenceDuration=2.5})
			
			self.Zombie3 = ents.Create("npc_vj_bbohg_medkit")
			self.Zombie3:SetPos(self:GetPos() +self:GetForward()*50 +self:GetUp()*5)
			self.Zombie3:SetAngles(self:GetAngles())
			self.Zombie3:Spawn()
			self.Zombie3:SetNoDraw(true)
			timer.Simple(0.3,function() if IsValid(self.Zombie3) then self.Zombie3:SetNoDraw(false) end end)
			self.Zombie3:VJ_ACT_PLAYACTIVITY("Sit_Ground_to_Idle",true,2.5,true,0,{SequenceDuration=2.5})
			
			self.Zombie4 = ents.Create("npc_vj_bbohg_medkit")
			self.Zombie4:SetPos(self:GetPos() +self:GetForward()*-50 +self:GetUp()*5)
			self.Zombie4:SetAngles(self:GetAngles())
			self.Zombie4:Spawn()
			self.Zombie4:SetNoDraw(true)
			timer.Simple(0.3,function() if IsValid(self.Zombie4) then self.Zombie4:SetNoDraw(false) end end)
			self.Zombie4:VJ_ACT_PLAYACTIVITY("Sit_Ground_to_Idle",true,2.5,true,0,{SequenceDuration=2.5})
						
			self.AlreadySpawned = false
			self.NextZombieSpawnT = CurTime() + 20
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAlert(argent)
	if math.random(1,1) == 1 && argent:IsNPC() then
		if argent:GetClass() == "npc_zombie"
				or argent:GetClass() == "npc_zombie_torso"
				or argent:GetClass() == "npc_fastzombie"
				or argent:GetClass() == "npc_fastzombie"
				or argent:GetClass() == "npc_poisonzombie"
				or argent:GetClass() == "npc_zombine"
				or argent:GetClass() == "npc_vj_hlr1_zombie"
				or argent:GetClass() == "npc_vj_hlrof_zombie_sec"
				or argent:GetClass() == "npc_vj_hlrof_zombie_soldier"
				or argent:GetClass() == "npc_vj_hlrof_gonome"
				or argent:GetClass() == "npc_vj_cofraom_twitcher"
				or argent:GetClass() == "npc_vj_cofraom_twitcher_da"
				or argent:GetClass() == "npc_vj_cofr_faceless"
				or argent:GetClass() == "npc_vj_cofr_faceless_crawler"
				or argent:GetClass() == "npc_vj_cofr_faceless_faced"
				or argent:GetClass() == "npc_vj_cofr_faceless_twisterv"
				or argent:GetClass() == "npc_vj_cofr_faceless_twister"
				or argent:GetClass() == "npc_vj_cofrc_faceless_boss"
				or argent:GetClass() == "npc_vj_cofrc_faceless_mummycrawl"
				or argent:GetClass() == "npc_vj_cofrc_faceless_mummytwister"
				or argent:GetClass() == "npc_vj_cofrc_faceless_mummy"
				or argent:GetClass() == "npc_vj_cofrc_faceless_stone"
				or argent:GetClass() == "npc_vj_cofrc_slower_mummy"
				or argent:GetClass() == "npc_vj_cofrc_crazyrunner_mummy"
				or argent:GetClass() == "npc_vj_cofrc_shaimoon"
				or argent:GetClass() == "npc_vj_cofrc_mummy"
				or argent:GetClass() == "npc_vj_zombie"
				or argent:GetClass() == "npc_vj_zombiescientist"
				or argent:GetClass() == "npc_vj_zombiehell"
				or argent:GetClass() == "npc_vj_mechazombie"
			then
				self:PlaySoundSystem("Alert", {"vo/npc/male01/zombies01.wav", 
												"vo/npc/male01/zombies02.wav"})
		return
		elseif argent:GetClass() == "npc_headcrab"
				or argent:GetClass() == "npc_headcrab_fast"
				or argent:GetClass() == "npc_headcrab_black"
				or argent:GetClass() == "npc_vj_hlr1_headcrab"
				or argent:GetClass() == "npc_vj_hlr1_headcrab_baby"
				or argent:GetClass() == "npc_vj_cofraom_handcrab"
			then
				self:PlaySoundSystem("Alert", {"vo/npc/male01/headcrabs01.wav", 
												"vo/npc/male01/headcrabs02.wav"})
		return
		elseif argent:GetClass() == "npc_metropolice"
				or argent:GetClass() == "npc_vj_hlr2_com_civilp"
				or argent:GetClass() == "npc_vj_hlr2_com_civilp_elite"
			then
				self:PlaySoundSystem("Alert", {"vo/npc/male01/civilprotection01.wav", 
												"vo/npc/male01/civilprotection02.wav", 
												"vo/npc/male01/cps01.wav", 
												"vo/npc/male01/cps02.wav"})
		return
		elseif argent:GetClass() == "npc_cscanner"
				or argent:GetClass() == "npc_clawscanner"
			then
				self:PlaySoundSystem("Alert", {"vo/npc/male01/scanners01.wav", 
												"vo/npc/male01/scanners02.wav"})
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
				self:PlaySoundSystem("Alert", {"vo/npc/male01/combine01.wav", 
												"vo/npc/male01/combine02.wav"})
		return		
		elseif argent:GetClass() == "npc_combinegunship"
				or argent:GetClass() == "npc_vj_hlr1_apache"
				or argent:GetClass() == "npc_vj_hlrof_assassin_apache"
			then
				self:PlaySoundSystem("Alert", {"vo/npc/male01/gunship02.wav"})
		return		
		elseif argent:GetClass() == "npc_strider"
			then
				self:PlaySoundSystem("Alert", {"vo/npc/male01/strider.wav"})
		return		
		elseif argent:GetClass() == "npc_manhack"
			then
				self:PlaySoundSystem("Alert", {"vo/npc/male01/hacks01.wav",
												"vo/npc/male01/hacks02.wav",
												"vo/npc/male01/herecomehacks01.wav",
												"vo/npc/male01/herecomehacks02.wav",
												"vo/npc/male01/itsamanhack01.wav",
												"vo/npc/male01/itsamanhack02.wav",
												"vo/npc/male01/thehacks01.wav",
												"vo/npc/male01/thehacks02.wav"})
		return
		else
			for _,v in ipairs(argent.VJ_NPC_Class or {1}) do
				if v == "CLASS_COMBINE" or argent:Classify() == CLASS_COMBINE then
					self:PlaySoundSystem("Alert", {"vo/npc/male01/combine01.wav", 
												"vo/npc/male01/combine02.wav"})
					return
				elseif v == "CLASS_ZOMBIE" or argent:Classify() == CLASS_ZOMBIE then
					self:PlaySoundSystem("Alert", {"vo/npc/male01/zombies01.wav", 
												"vo/npc/male01/zombies02.wav"})
					return
				end
			end
		end
		if  argent.IsVJBaseSNPC_Creature == true then
			self:PlaySoundSystem("Alert", {"vo/npc/male01/cit_dropper01.wav",
	"vo/npc/male01/evenodds.wav",
	"vo/npc/male01/gethellout.wav",
	"vo/npc/male01/overthere01.wav",
	"vo/npc/male01/overthere02.wav",
	"vo/npc/male01/overhere01.wav",
	"vo/npc/male01/headsup01.wav",
	"vo/npc/male01/headsup02.wav",
	"vo/npc/male01/heretheycome01.wav",
	"vo/npc/male01/incoming02.wav",
	"vo/npc/male01/overhere01.wav",
	"vo/npc/male01/overthere01.wav",
	"vo/npc/male01/overthere02.wav",
	"vo/npc/male01/squad_away02.wav",
	"vo/npc/male01/upthere01.wav",
	"vo/npc/male01/upthere02.wav",
	"vo/canals/male01/stn6_incoming.wav"})
			return
		elseif argent.IsVJBaseSNPC_Human == true then
			self:PlaySoundSystem("Alert", {"vo/npc/male01/cit_dropper01.wav",
	"vo/npc/male01/evenodds.wav",
	"vo/npc/male01/gethellout.wav",
	"vo/npc/male01/overthere01.wav",
	"vo/npc/male01/overthere02.wav",
	"vo/npc/male01/overhere01.wav",
	"vo/npc/male01/headsup01.wav",
	"vo/npc/male01/headsup02.wav",
	"vo/npc/male01/heretheycome01.wav",
	"vo/npc/male01/incoming02.wav",
	"vo/npc/male01/overhere01.wav",
	"vo/npc/male01/overthere01.wav",
	"vo/npc/male01/overthere02.wav",
	"vo/npc/male01/squad_away02.wav",
	"vo/npc/male01/upthere01.wav",
	"vo/npc/male01/upthere02.wav",
	"vo/canals/male01/stn6_incoming.wav"})
			return
		end
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
function ENT:RangeAttackCode_GetShootPos(projectile)
	local ene = self:GetEnemy()
		return self:CalculateProjectile("Curve", projectile:GetPos(), ene:GetPos() + ene:OBBCenter(), 1500)
end
-------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnChangeMovementType(movType)	
	if VJ_AnimationExists(self,ACT_JUMP) == true then self:CapabilitiesRemove(bit.bor(CAP_MOVE_JUMP)) end
	if VJ_AnimationExists(self,ACT_CLIMB_UP) == true then self:CapabilitiesRemove(bit.bor(CAP_MOVE_CLIMB)) end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialKilled(dmginfo, hitgroup)
    self:AddFlags(FL_NOTARGET)
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2019 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/