AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2018 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/items/healthkit.mdl"}
ENT.PhysicsInitType = SOLID_VPHYSICS
ENT.MoveType = MOVETYPE_VPHYSICS -- Move type, recommended to keep it as it is
ENT.MoveCollideType = MOVECOLLIDE_FLY_BOUNCE -- Move type | Some examples: MOVECOLLIDE_FLY_BOUNCE, MOVECOLLIDE_FLY_SLIDE
ENT.CollisionGroupType = COLLISION_GROUP_PROJECTILE -- Collision type, recommended to keep it as it is
ENT.SolidType = SOLID_CUSTOM -- Solid type, recommended to keep it as it is
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ Collision / Damage Variables ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ENT.RemoveOnHit = false -- Should it remove itself when it touches something? | It will run the hit sound, place a decal, etc.
ENT.PaintDecalOnCollide = true -- Should it paint decals when it collides with something? | Use this only when using a projectile that doesn't get removed when it collides with something
ENT.DecalTbl_OnCollideDecals = {"BeerSplash"}
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
ENT.DirectDamage = math.random(1,1) -- How much damage should it do when it hits something
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
ENT.SoundTbl_Startup = {}
ENT.SoundTbl_Idle = {"therock/cinderblock_flying.mp3"}
ENT.SoundTbl_OnCollide = {}
ENT.SoundTbl_OnRemove = {}
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
ENT.IdleSoundLevel = 70
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
function ENT:CustomOnPreInitialize() 

			self.Model = {"models/props_junk/Shoe001a.mdl"}
			self.SoundTbl_OnCollide = {"splat.mp3"}
			self.SoundTbl_OnRemove = {"hobo/voice1/death_2.mp3",
			"hobo/voice1/pain_1.mp3",
			"hobo/voice1/pain_2.mp3",
			"hobo/voice1/pain_3.mp3",
			"hobo/voice1/pain_4.mp3",
			"hobo/voice2/pain_10.mp3",
			"hobo/voice2/pain_7.mp3",
			"hobo/voice2/pain_8.mp3",
			"hobo/voice2/pain_9.mp3"}
			self.DirectDamage = math.random(95,100)
	self:SetKeyValue("rendercolor","147 216 162 255")
			
		end

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnInitialize() 
	timer.Simple(2,function() if IsValid(self) then
	self:Remove()
	end
	end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomPhysicsObjectOnInitialize(phys)
	phys:Wake()
	phys:SetMass(1)
	phys:SetBuoyancyRatio(0)
	phys:EnableDrag(false)
	-- phys:EnableGravity(false)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnCollideWithoutRemove(data, phys) 
	self.HasIdleSounds = false
	VJ_STOPSOUND(self.CurrentIdleSound)
	self.DoesDirectDamage = false
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