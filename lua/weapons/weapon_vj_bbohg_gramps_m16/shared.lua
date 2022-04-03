if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
SWEP.IsVJBaseWeapon = true
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "Grampa's M16"
SWEP.Author = "Bean"
SWEP.Category = "Bean's Bag of Hot Garbage"
SWEP.MadeForNPCsOnly = true
SWEP.HoldType = "ar2"
SWEP.Spawnable = false
SWEP.AdminSpawnable = false
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel = "models/vj_weapons/w_csgo_m4a1_s.mdl"
SWEP.WorldModel_UseCustomPosition = true -- Should the gun use custom position? This can be used to fix guns that are in the crotch
SWEP.WorldModel_CustomPositionAngle = Vector(0, 90, 180)
SWEP.WorldModel_CustomPositionOrigin = Vector(-3.4, -1, 0)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire = 0.75
SWEP.NPC_TimeUntilFireExtraTimers = {0.08, 0.20}
SWEP.NPC_CanBePickedUp = false
SWEP.NPC_ReloadSound = {}
SWEP.NPC_ReloadSoundLevel = 60

SWEP.Primary.Damage				= 5 -- Damage
SWEP.Primary.PlayerDamage		= "Double" -- Only applies for players | "Same" = Same as self.Primary.Damage, "Double" = Double the self.Primary.Damage OR put a number to be different from self.Primary.Damage
SWEP.Primary.Force				= 5 -- Force applied on the object the bullet hits
SWEP.Primary.ClipSize			= 30 -- Max amount of bullets per clip
SWEP.Primary.Recoil				= 0.3 -- How much recoil does the player get?
SWEP.Primary.Delay				= 0.1 -- Time until it can shoot again
SWEP.Primary.Automatic			= true -- Is it automatic?

	-- ====== Secondary Fire Variables ====== --
-- SWEP.NPC_HasSecondaryFire = false -- Can the weapon have a secondary fire?
-- SWEP.NPC_SecondaryFireEnt = "obj_vj_grenade_rifle" -- The entity to fire, this only applies if self:NPC_SecondaryFire() has NOT been overridden!
-- SWEP.NPC_SecondaryFireChance = 3 -- Chance that the secondary fire is used | 1 = always
-- SWEP.NPC_SecondaryFireNext = VJ_Set(12, 15) -- How much time until the secondary fire can be used again?
-- SWEP.NPC_SecondaryFireDistance = 1000 -- How close does the owner's enemy have to be for it to fire?
-- SWEP.NPC_HasSecondaryFireSound = true -- Can the secondary fire sound be played?
-- SWEP.NPC_SecondaryFireSound = {} -- The sound it plays when the secondary fire is used
-- SWEP.NPC_SecondaryFireSoundLevel = 90 -- The sound level to use for the secondary firing sound

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SWEP.Primary.DisableBulletCode = true
-- SWEP.Primary.AllowFireInWater = true
SWEP.Primary.ClipSize = 20
SWEP.Primary.Delay = 0.1
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "AR2"

	-- ====== Sound Variables ====== --
SWEP.Primary.Sound = {"vj_weapons/m16a1/m16a1_single.wav"}
SWEP.Primary.DistantSound = {"vj_weapons/m16a1/m16a1_single_dist.wav"}
-- SWEP.Primary.HasDistantSound = true -- Does it have a distant sound when the gun is shot?
-- SWEP.Primary.DistantSoundLevel = 140 -- Distant sound level
-- SWEP.Primary.DistantSoundPitch	= VJ_Set(90, 110) -- Distant sound pitch
-- SWEP.Primary.DistantSoundVolume	= 1 -- Distant sound volume
	-- ====== Effect Variables ====== --
SWEP.PrimaryEffects_MuzzleFlash = false
SWEP.PrimaryEffects_SpawnShells = false
SWEP.PrimaryEffects_SpawnDynamicLight = false
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnPrimaryAttack_BeforeShoot()
end
---------------------------------------------------------------------------------------------------------------------------------------------