if (!file.Exists("autorun/vj_base_autorun.lua","LUA")) then return end
SWEP.IsVJBaseWeapon = true
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "ALYX Gun"
SWEP.Author = "Bean"
SWEP.Category = "Bean's Bag of Hot Garbage"
SWEP.MadeForNPCsOnly = true
SWEP.HoldType = "pistol"
SWEP.Spawnable = false
SWEP.AdminSpawnable = false
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SWEP.WorldModel = "models/weapons/w_alyx_gun.mdl"
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_NextPrimaryFire = 0.95
SWEP.NPC_TimeUntilFireExtraTimers = {0.08, 0.16, 0.24, 0.32, 0.4}
SWEP.NPC_CanBePickedUp = false
SWEP.NPC_ReloadSound = {}
SWEP.NPC_ReloadSoundLevel = 60

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
SWEP.Primary.DisableBulletCode = true
SWEP.Primary.AllowFireInWater = true
SWEP.Primary.ClipSize = 30
SWEP.Primary.Delay = 0.1
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "Pistol"

	-- ====== Sound Variables ====== --
SWEP.Primary.Sound = {"weapons/crossbow/fire1.wav"}
-- SWEP.Primary.DistantSound = {}
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
	if CLIENT then return end
	local bolt = ents.Create("obj_vj_bbohg_alyx")
	local spawnpos = self:GetNW2Vector("VJ_CurBulletPos")
	bolt:SetPos(spawnpos)
	bolt:SetAngles(self:GetOwner():GetAngles())
	bolt:SetOwner(self:GetOwner())
	bolt:Activate()
	bolt:Spawn()
	
	local phys = bolt:GetPhysicsObject()
	if IsValid(phys) then
		phys:ApplyForceCenter(bolt:CalculateProjectile("Line", spawnpos, self:GetOwner():GetEnemy():GetPos() + self:GetOwner():GetEnemy():OBBCenter(), 1250) + Vector(math.Rand(-30,30), math.Rand(-30,30), math.Rand(-30,30)))
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------