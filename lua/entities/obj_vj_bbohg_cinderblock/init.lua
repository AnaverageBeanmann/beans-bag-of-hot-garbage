AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/props_junk/CinderBlock01a.mdl"}
ENT.PhysicsInitType = SOLID_VPHYSICS
ENT.MoveType = MOVETYPE_VPHYSICS -- Move type, recommended to keep it as it is
ENT.MoveCollideType = MOVECOLLIDE_FLY_BOUNCE -- Move type | Some examples: MOVECOLLIDE_FLY_BOUNCE, MOVECOLLIDE_FLY_SLIDE
ENT.CollisionGroupType = COLLISION_GROUP_PROJECTILE -- Collision type, recommended to keep it as it is
ENT.SolidType = SOLID_CUSTOM -- Solid type, recommended to keep it as it is
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ Collision / Damage Variables ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ENT.RemoveOnHit = false -- Should it remove itself when it touches something? | It will run the hit sound, place a decal, etc.
ENT.PaintDecalOnCollide = false -- Should it paint decals when it collides with something? | Use this only when using a projectile that doesn't get removed when it collides with something
ENT.DecalTbl_OnCollideDecals = {} -- Decals that paint when the projectile collides with something | It picks a random one from this table
ENT.CollideCodeWithoutRemoving = true -- If RemoveOnHit is set to false, you can still make the projectile deal damage, place a decal, etc.
ENT.NextCollideWithoutRemove = VJ_Set(1,1) -- Time until it can run the code again
	-- ====== Shake World On Death Variables ====== --
ENT.ShakeWorldOnDeath = true -- Should the world shake when the projectile hits something?
ENT.ShakeWorldOnDeathAmplitude = 1 -- How much the screen will shake | From 1 to 16, 1 = really low 16 = really high
ENT.ShakeWorldOnDeathRadius = 3000 -- How far the screen shake goes, in world units
ENT.ShakeWorldOnDeathDuration = 1 -- How long the screen shake will last, in seconds
ENT.ShakeWorldOnDeathFrequency = 200 -- The frequency
	-- ====== Direct Damage Variables ====== --
ENT.DoesDirectDamage = true -- Should it do a direct damage when it hits something?
ENT.DirectDamage = math.random(45,55) -- How much damage should it do when it hits something
ENT.DirectDamageType = DMG_CLUB -- Damage type
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ Killed / Remove Variables ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ENT.PaintDecalOnDeath = true -- Should it paint a decal when it hits something?
ENT.DecalTbl_DeathDecals = {} -- Decals that paint when the projectile dies | It picks a random one from this table
ENT.DelayedRemove = 0 -- Change this to a number greater than 0 to delay the removal of the entity
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ Sound Variables ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasStartupSounds = true -- Does it make a sound when the projectile is created?
ENT.HasIdleSounds = true -- Does it have idle sounds?
ENT.HasOnCollideSounds = true -- Should it play a sound when it collides something?
ENT.HasOnRemoveSounds = true -- Should it play a sound when it gets removed?
	-- ====== File Path Variables ====== --
	-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_Startup = {"vo/npc/male01/watchout.wav",
"vo/npc/male01/uhoh.wav",
"vo/npc/male01/squad_approach04.wav",
"vo/npc/male01/likethat.wav",
"vo/npc/male01/finally.wav",
"vo/npc/male01/goodgod.wav",
"vo/npc/male01/gethellout.wav",
"vo/npc/male01/gordead_ans19.wav",
"vo/npc/male01/incoming02.wav",
"vo/npc/male01/overhere01.wav",
"vo/npc/male01/freeman.wav",
"vo/npc/male01/headsup01.wav",
"vo/npc/male01/headsup02.wav",
"vo/npc/male01/ohno.wav",
"vo/trainyard/cit_drunk.wav",
"vo/npc/male01/question06.wav",
"vo/npc/male01/pardonme01.wav",
"vo/npc/male01/pardonme02.wav",
"vo/npc/male01/whoops01.wav",
"vo/npc/male01/hellodrfm01.wav",
"vo/npc/male01/hellodrfm02.wav",
"vo/npc/male01/cit_dropper04.wav",
"vo/npc/male01/behindyou01.wav",
"vo/npc/male01/behindyou02.wav",
"vo/npc/male01/docfreeman01.wav",
"vo/npc/male01/docfreeman02.wav",
"vo/npc/male01/excuseme01.wav",
"vo/npc/male01/excuseme02.wav",
"vo/npc/male01/evenodds.wav",
"pissed.mp3",
"vo/ravenholm/engage02.wav",
"vo/ravenholm/engage03.wav",
"vo/ravenholm/engage06.wav",
"vo/ravenholm/exit_nag01.wav",
"vo/ravenholm/madlaugh04.wav",
"vo/ravenholm/monk_blocked02.wav",
"vo/ravenholm/monk_blocked03.wav",
"vo/ravenholm/monk_kill05.wav",
"vo/ravenholm/monk_kill10.wav",
"vo/ravenholm/monk_pain01.wav",
"vo/ravenholm/shotgun_closer.wav",
"vo/ravenholm/shotgun_overhere.wav",
"vo/npc/barney/ba_ohyeah.wav",
"vo/npc/barney/ba_yell.wav",
"vo/k_lab/kl_islamarr.wav",
"vo/k_lab/kl_ohdear.wav"}
ENT.SoundTbl_Idle = {"therock/cinderblock_flying.mp3"}
ENT.SoundTbl_OnCollide = {"physics/concrete/concrete_block_impact_hard1.wav",
	"physics/concrete/concrete_block_impact_hard2.wav",
	"physics/concrete/concrete_block_impact_hard3.wav"}
ENT.SoundTbl_OnRemove = {"vo/npc/male01/pain01.wav",
"vo/npc/male01/pain02.wav",
"vo/npc/male01/pain03.wav",
"vo/npc/male01/pain04.wav",
"vo/npc/male01/pain05.wav",
"vo/npc/male01/pain06.wav",
"vo/npc/male01/pain07.wav",
"vo/npc/male01/pain08.wav",
"vo/npc/male01/pain09.wav",
"vo/ravenholm/monk_pain01.wav",
"vo/ravenholm/monk_pain02.wav",
"vo/ravenholm/monk_pain03.wav",
"vo/ravenholm/monk_pain04.wav",
"vo/ravenholm/monk_pain05.wav",
"vo/ravenholm/monk_pain06.wav",
"vo/ravenholm/monk_pain07.wav",
"vo/ravenholm/monk_pain08.wav",
"vo/ravenholm/monk_pain09.wav",
"vo/ravenholm/monk_pain10.wav",
"vo/ravenholm/monk_pain11.wav",
"vo/ravenholm/monk_pain12.wav",
"vo/npc/barney/ba_damnit.wav",
"vo/npc/barney/ba_ohshit03.wav",
"vo/npc/barney/ba_wounded01.wav",
"vo/k_lab/ba_guh.wav",
"vo/k_lab/ba_thingaway02.wav",
"vo/k_lab/kl_ahhhh.wav",
"vo/k_lab/kl_fiddlesticks.wav",}
	-- ====== Sound Chance Variables ====== --
	-- Higher number = less chance of playing | 1 = Always play
ENT.StartupSoundChance = 1
ENT.IdleSoundChance = 1
ENT.OnCollideSoundChance = 1
ENT.OnRemoveSoundChance = 1
	-- ====== Timer Variables ====== --
ENT.NextSoundTime_Idle = VJ_Set(0.001,0.001)
	-- ====== Sound Level Variables ====== --
	-- The proper number are usually range from 0 to 180, though it can go as high as 511
	-- More Information: https://developer.valvesoftware.com/wiki/Soundscripts#SoundLevel_Flags
ENT.StartupSoundLevel = 80
ENT.IdleSoundLevel = 80
ENT.OnCollideSoundLevel = 80
ENT.OnRemoveSoundLevel = 75
	-- ====== Sound Pitch Variables ====== --
ENT.StartupSoundPitch = VJ_Set(125, 150)
ENT.IdleSoundPitch = VJ_Set(90, 100)
ENT.OnCollideSoundPitch = VJ_Set(90, 100)
ENT.OnRemoveSoundPitch = VJ_Set(125, 150)
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomPhysicsObjectOnInitialize(phys)
	phys:Wake()
	phys:EnableGravity(true)
	phys:EnableDrag(false)
	phys:SetBuoyancyRatio(0)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize() 
	timer.Simple(5,function() if IsValid(self) then
	self:Remove()
	end
	end)
end

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnCollideWithoutRemove(data, phys) 
	self.HasIdleSounds = false
	VJ_STOPSOUND(self.CurrentIdleSound)
	self.DoesDirectDamage = false
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove() 
	VJ_EmitSound(self,{"physics/concrete/concrete_break2.wav",
	"physics/concrete/concrete_break3.wav"},75,math.random(100,100))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnDoDamage_Direct(data, phys, hitEnt)
	self.HasIdleSounds = false
	VJ_STOPSOUND(self.CurrentIdleSound)
	self.DoesDirectDamage = false
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/