if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "Griefer Grigoris' Gun"
SWEP.Author = "Bean"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Purpose = "Griefer Grigoris' Gun; A gift for managing to defeat him."
SWEP.Instructions = "Controls are like a regular weapon."
	-- Main Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.ViewModel = "models/weapons/c_shotgun.mdl"
SWEP.WorldModel = "models/weapons/w_annabelle.mdl"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.HoldType = "shotgun"
SWEP.MadeForNPCsOnly = false -- Is this weapon meant to be for NPCs only?

	-- NPC Settings ---------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire = 0.3 -- Next time it can use primary fire
SWEP.NPC_CustomSpread = 0.2 -- This is added on top of the custom spread that's set inside the SNPC! | Starting from 1: Closer to 0 = better accuracy, Farther than 1 = worse accuracy
SWEP.NPC_BulletSpawnAttachment = "0" -- The attachment that the bullet spawns on, leave empty for base to decide!
	-- Primary Fire ---------------------------------------------------------------------------------------------------------------------------------------------
-- SWEP.Primary.Damage = 50 -- Damage
-- //SWEP.Primary.Force = 100 -- Force applied on the object the bullet hits
-- SWEP.Primary.ClipSize = 125 -- Max amount of bullets per clip
-- SWEP.Primary.Ammo = "Buckshot" -- Ammo type
-- SWEP.Primary.Sound = {"Weapon_Shotgun.NPC_Single"}
-- SWEP.Primary.DistantSound = {"vj_hlr/hl2_weapon/annabelle/shotgun_fire6_distant.wav"}
-- SWEP.Primary.DistantSoundVolume	= 0.7 -- Distant sound volume
-- SWEP.PrimaryEffects_MuzzleAttachment = "0"
-- SWEP.PrimaryEffects_ShellAttachment = "1"
-- SWEP.PrimaryEffects_ShellType = "VJ_Weapon_ShotgunShell1"



SWEP.Primary.Damage = 10 -- Damage
SWEP.Primary.PlayerDamage = "Same" -- Only applies for players | "Same" = Same as self.Primary.Damage, "Double" = Double the self.Primary.Damage OR put a number to be different from self.Primary.Damage
SWEP.Primary.Force = 100 -- Force applied on the object the bullet hits
SWEP.Primary.NumberOfShots = 10 -- How many shots per attack?
SWEP.Primary.ClipSize = 10 -- Max amount of bullets per clip
SWEP.Primary.Cone = 10 -- How accurate is the bullet? (Players)
SWEP.Primary.Delay = 0.3 -- Time until it can shoot again
SWEP.Primary.Automatic = true -- Is it automatic?
SWEP.Primary.Ammo = "Buckshot" -- Ammo type
SWEP.Primary.Sound = {"vj_weapons/hl2_shotgun/shotgun_single1.wav"}
SWEP.Primary.DistantSound = {"vj_weapons/hl2_shotgun/shotgun_single_dist.wav"}
SWEP.PrimaryEffects_MuzzleAttachment = 1
SWEP.PrimaryEffects_ShellAttachment = 2
SWEP.PrimaryEffects_ShellType = "VJ_Weapon_ShotgunShell1"
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:CustomOnInitialize()

	self:SetMaterial("models/XQM/LightLinesRed_tool")
end
---------------------------------------------------------------------------------------------------------------------------------------------