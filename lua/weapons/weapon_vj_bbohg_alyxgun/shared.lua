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
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SWEP.NPC_HasSecondaryFire = true
SWEP.NPC_SecondaryFireEnt = "obj_vj_bbohg_alyx_funky" -- The entity to fire, this only applies if self:NPC_SecondaryFire() has NOT been overridden!
SWEP.NPC_SecondaryFireChance = 3
SWEP.NPC_SecondaryFireNext = VJ_Set(1, 10)
SWEP.NPC_SecondaryFireDistance = 10000
SWEP.NPC_SecondaryFireSound = {"weapons/physcannon/superphys_launch1.wav",
	"weapons/physcannon/superphys_launch2.wav",
	"weapons/physcannon/superphys_launch3.wav",
	"weapons/physcannon/superphys_launch4.wav"}
SWEP.NPC_SecondaryFireSoundLevel = 75
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SWEP.Primary.DisableBulletCode = true
SWEP.Primary.AllowFireInWater = true
SWEP.Primary.ClipSize = 30
SWEP.Primary.Delay = 0.1
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "Pistol"

	-- ====== Sound Variables ====== --
-- SWEP.Primary.Sound = {"weapons/crossbow/fire1.wav"}
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
function SWEP:NPC_SecondaryFire_BeforeTimer(eneEnt, fireTime)
	VJ_EmitSound(self, "weapons/physgun_off.wav", 70)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:NPC_SecondaryFire()
	local owner = self:GetOwner()
	local pos = self:GetNW2Vector("VJ_CurBulletPos")
	local proj = ents.Create(self.NPC_SecondaryFireEnt)
	proj:SetPos(pos)
	proj:SetAngles(owner:GetAngles())
	proj:SetOwner(owner)
	proj:Spawn()
	proj:Activate()
	local phys = proj:GetPhysicsObject()
	if IsValid(phys) then
		phys:Wake()
		phys:SetVelocity(owner:CalculateProjectile("Line", pos, owner.LatestVisibleEnemyPosition, 200))
	end
end