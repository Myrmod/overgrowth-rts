class_name AmunsConstants

const SOUND_ROCKET_START = preload("res://assets/sound_effects/rocket1_start.mp3")
const SOUND_ROCKET_END = preload("res://assets/sound_effects/rocket1_end.mp3")

const STRUCTURES = {
	Enums.SceneId.AMUNS_COMMAND_ANCHOR:
	{
		"scene": "res://source/factions/the_amuns/structures/CommandAnchor.tscn",
		"unit_name": "Command Anchor",
		"description": "Central command hub. Builds structures and defences",
		"faction": Enums.Faction.AMUNS,
		"production_tab_type": Enums.ProductionTabType.STRUCTURE,
		"production_tab_grid_slot": Enums.ProductionTabGridSlots.F6,
		"produces": [Enums.ProductionTabType.STRUCTURE, Enums.ProductionTabType.DEFENCES],
		"structure_production_type": Enums.StructureProductionType.CONSTRUCT_ON_FIELD_AND_TRICKLE,
		"max_concurrent_structures": 1,
		"sight_range": 10.0,
		"hp": 2000,
		"hp_max": 2000,
		"armor":
		{
			Enums.DamageTypes.CANNON: 0.5,
			Enums.DamageTypes.CORROSIVE: 0.0,
			Enums.DamageTypes.CRUSH: 0.75,
			Enums.DamageTypes.EXPLOSIVE: 0.0,
			Enums.DamageTypes.FIRE: 0.0,
			Enums.DamageTypes.LASER: 0.5,
			Enums.DamageTypes.MELEE: 0.75,
			Enums.DamageTypes.PLASMA: 0.25,
			Enums.DamageTypes.PRISM: 0.5,
			Enums.DamageTypes.RIFLE: 0.75,
			Enums.DamageTypes.ROCKET: 0.25,
			Enums.DamageTypes.TESLA: 0.25,
		},
		"costs": {"credits": 2500},
		"build_time": 25.0,
	},
	Enums.SceneId.AMUNS_VEHICLE_FOUNDRY:
	{
		"scene": "res://source/factions/the_amuns/structures/VehicleFoundry.tscn",
		"unit_name": "Vehicle Foundry",
		"description": "Produces ground vehicles",
		"faction": Enums.Faction.AMUNS,
		"production_tab_type": Enums.ProductionTabType.STRUCTURE,
		"production_tab_grid_slot": Enums.ProductionTabGridSlots.F4,
		"produces": [Enums.ProductionTabType.VEHICLE],
		"sight_range": 8.0,
		"hp": 1600,
		"hp_max": 1600,
		"armor":
		{
			Enums.DamageTypes.CANNON: 0.5,
			Enums.DamageTypes.CORROSIVE: 0.0,
			Enums.DamageTypes.CRUSH: 0.75,
			Enums.DamageTypes.EXPLOSIVE: 0.0,
			Enums.DamageTypes.FIRE: 0.0,
			Enums.DamageTypes.LASER: 0.5,
			Enums.DamageTypes.MELEE: 0.75,
			Enums.DamageTypes.PLASMA: 0.25,
			Enums.DamageTypes.PRISM: 0.5,
			Enums.DamageTypes.RIFLE: 0.75,
			Enums.DamageTypes.ROCKET: 0.25,
			Enums.DamageTypes.TESLA: 0.25,
		},
		"costs": {"credits": 2000},
		"build_time": 20.0,
		"structure_requirements":
		[
			Enums.SceneId.AMUNS_COMMAND_ANCHOR,
			Enums.SceneId.AMUNS_INFANTRY_GATE,  # or Sky Dock
			Enums.SceneId.AMUNS_SKY_DOCK,  # or Infantry Gate
		],
	},
	Enums.SceneId.AMUNS_SKY_DOCK:
	{
		"scene": "res://source/factions/the_amuns/structures/SkyDock.tscn",
		"unit_name": "Sky Dock",
		"description": "Produces aircraft",
		"faction": Enums.Faction.AMUNS,
		"production_tab_type": Enums.ProductionTabType.STRUCTURE,
		"production_tab_grid_slot": Enums.ProductionTabGridSlots.F3,
		"produces": [Enums.ProductionTabType.AIR],
		"sight_range": 8.0,
		"hp": 1600,
		"hp_max": 1600,
		"armor":
		{
			Enums.DamageTypes.CANNON: 0.5,
			Enums.DamageTypes.CORROSIVE: 0.0,
			Enums.DamageTypes.CRUSH: 0.75,
			Enums.DamageTypes.EXPLOSIVE: 0.0,
			Enums.DamageTypes.FIRE: 0.0,
			Enums.DamageTypes.LASER: 0.5,
			Enums.DamageTypes.MELEE: 0.75,
			Enums.DamageTypes.PLASMA: 0.25,
			Enums.DamageTypes.PRISM: 0.5,
			Enums.DamageTypes.RIFLE: 0.75,
			Enums.DamageTypes.ROCKET: 0.25,
			Enums.DamageTypes.TESLA: 0.25,
		},
		"costs": {"credits": 2000},
		"build_time": 20.0,
		"structure_requirements":
		[
			Enums.SceneId.AMUNS_COMMAND_ANCHOR,
		],
	},
	Enums.SceneId.AMUNS_HARBOR_GATE:
	{
		"scene": "res://source/factions/the_amuns/structures/HarborGate.tscn",
		"unit_name": "Harbor Gate",
		"description": "Produces naval units",
		"faction": Enums.Faction.AMUNS,
		"production_tab_type": Enums.ProductionTabType.STRUCTURE,
		"production_tab_grid_slot": Enums.ProductionTabGridSlots.F5,
		"produces": [Enums.ProductionTabType.WATER],
		"sight_range": 8.0,
		"hp": 1600,
		"hp_max": 1600,
		"armor":
		{
			Enums.DamageTypes.CANNON: 0.5,
			Enums.DamageTypes.CORROSIVE: 0.0,
			Enums.DamageTypes.CRUSH: 0.75,
			Enums.DamageTypes.EXPLOSIVE: 0.0,
			Enums.DamageTypes.FIRE: 0.0,
			Enums.DamageTypes.LASER: 0.5,
			Enums.DamageTypes.MELEE: 0.75,
			Enums.DamageTypes.PLASMA: 0.25,
			Enums.DamageTypes.PRISM: 0.5,
			Enums.DamageTypes.RIFLE: 0.75,
			Enums.DamageTypes.ROCKET: 0.25,
			Enums.DamageTypes.TESLA: 0.25,
		},
		"costs": {"credits": 1500},
		"build_time": 15.0,
		"structure_requirements":
		[
			Enums.SceneId.AMUNS_COMMAND_ANCHOR,
			Enums.SceneId.AMUNS_INFANTRY_GATE,  # or Sky Dock
			Enums.SceneId.AMUNS_SKY_DOCK,  # or Infantry Gate
		],
	},
	Enums.SceneId.AMUNS_INFANTRY_GATE:
	{
		"scene": "res://source/factions/the_amuns/structures/InfantryGate.tscn",
		"unit_name": "Infantry Gate",
		"description": "Trains infantry units",
		"faction": Enums.Faction.AMUNS,
		"production_tab_type": Enums.ProductionTabType.STRUCTURE,
		"production_tab_grid_slot": Enums.ProductionTabGridSlots.F2,
		"sight_range": 8.0,
		"hp": 1000,
		"hp_max": 1000,
		"armor":
		{
			Enums.DamageTypes.CANNON: 0.5,
			Enums.DamageTypes.CORROSIVE: 0.0,
			Enums.DamageTypes.CRUSH: 0.75,
			Enums.DamageTypes.EXPLOSIVE: 0.0,
			Enums.DamageTypes.FIRE: 0.0,
			Enums.DamageTypes.LASER: 0.5,
			Enums.DamageTypes.MELEE: 0.75,
			Enums.DamageTypes.PLASMA: 0.25,
			Enums.DamageTypes.PRISM: 0.5,
			Enums.DamageTypes.RIFLE: 0.75,
			Enums.DamageTypes.ROCKET: 0.25,
			Enums.DamageTypes.TESLA: 0.25,
		},
		"costs": {"credits": 4},
		"energy_required": 5,
		"structure_requirements":
		[
			Enums.SceneId.AMUNS_COMMAND_ANCHOR,
		],
		"produces": [Enums.ProductionTabType.INFANTRY],
		"build_time": 6.0,
	},
	Enums.SceneId.AMUNS_RESOURCE_SIPHON:
	{
		"scene": "res://source/factions/the_amuns/structures/ResourceSiphon.tscn",
		"unit_name": "Resource Siphon",
		"description": "Resource drop-off that deploys a flying Siphon Drone.",
		"faction": Enums.Faction.AMUNS,
		"production_tab_type": Enums.ProductionTabType.STRUCTURE,
		"production_tab_grid_slot": Enums.ProductionTabGridSlots.F1,
		"sight_range": 8.0,
		"hp": 1000,
		"hp_max": 1000,
		"armor":
		{
			Enums.DamageTypes.CANNON: 0.5,
			Enums.DamageTypes.CORROSIVE: 0.0,
			Enums.DamageTypes.CRUSH: 0.75,
			Enums.DamageTypes.EXPLOSIVE: 0.0,
			Enums.DamageTypes.FIRE: 0.0,
			Enums.DamageTypes.LASER: 0.5,
			Enums.DamageTypes.MELEE: 0.75,
			Enums.DamageTypes.PLASMA: 0.25,
			Enums.DamageTypes.PRISM: 0.5,
			Enums.DamageTypes.RIFLE: 0.75,
			Enums.DamageTypes.ROCKET: 0.25,
			Enums.DamageTypes.TESLA: 0.25,
		},
		"costs": {"credits": 1200},
		"energy_required": 0,
		"structure_requirements":
		[
			Enums.SceneId.AMUNS_COMMAND_ANCHOR,
		],
		"build_time": 10.0,
	},
	Enums.SceneId.AMUNS_FIELD_PURIFIER:
	{
		"scene": "res://source/factions/the_amuns/structures/FieldPurifier.tscn",
		"unit_name": "Field Purifier",
		"description": "Floats over a Resource Spawner and increases nearby vine capacity.",
		"faction": Enums.Faction.AMUNS,
		"production_tab_type": Enums.ProductionTabType.STRUCTURE,
		"production_tab_grid_slot": Enums.ProductionTabGridSlots.F7,
		"sight_range": 8.0,
		"hp": 900,
		"hp_max": 900,
		"armor":
		{
			Enums.DamageTypes.CANNON: 0.5,
			Enums.DamageTypes.CORROSIVE: 0.0,
			Enums.DamageTypes.CRUSH: 0.75,
			Enums.DamageTypes.EXPLOSIVE: 0.0,
			Enums.DamageTypes.FIRE: 0.0,
			Enums.DamageTypes.LASER: 0.5,
			Enums.DamageTypes.MELEE: 0.75,
			Enums.DamageTypes.PLASMA: 0.25,
			Enums.DamageTypes.PRISM: 0.5,
			Enums.DamageTypes.RIFLE: 0.75,
			Enums.DamageTypes.ROCKET: 0.25,
			Enums.DamageTypes.TESLA: 0.25,
		},
		"costs": {"credits": 1500},
		"energy_required": 0,
		"structure_requirements":
		[
			Enums.SceneId.AMUNS_COMMAND_ANCHOR,
			Enums.SceneId.AMUNS_RESOURCE_SIPHON,
		],
		"build_time": 15.0,
	},
	Enums.SceneId.AMUNS_OBELISK:
	{
		"scene": "res://source/factions/the_amuns/structures/Obelisk.tscn",
		"unit_name": "Obelisk",
		"description": "Tech and upgrade structure. Reactivates dormant systems.",
		"faction": Enums.Faction.AMUNS,
		"production_tab_type": Enums.ProductionTabType.STRUCTURE,
		"production_tab_grid_slot": Enums.ProductionTabGridSlots.F8,
		"sight_range": 9.0,
		"hp": 900,
		"hp_max": 900,
		"armor":
		{
			Enums.DamageTypes.CANNON: 0.5,
			Enums.DamageTypes.CORROSIVE: 0.0,
			Enums.DamageTypes.CRUSH: 0.75,
			Enums.DamageTypes.EXPLOSIVE: 0.0,
			Enums.DamageTypes.FIRE: 0.0,
			Enums.DamageTypes.LASER: 0.5,
			Enums.DamageTypes.MELEE: 0.75,
			Enums.DamageTypes.PLASMA: 0.25,
			Enums.DamageTypes.PRISM: 0.5,
			Enums.DamageTypes.RIFLE: 0.75,
			Enums.DamageTypes.ROCKET: 0.25,
			Enums.DamageTypes.TESLA: 0.25,
		},
		"costs": {"credits": 800},
		"build_time": 14.0,
		"structure_requirements":
		[
			Enums.SceneId.AMUNS_COMMAND_ANCHOR,
		],
	},
}

const DEFENCES = {
	Enums.SceneId.AMUNS_WALL_PILLAR:
	{
		"scene": "res://source/factions/the_amuns/structures/WallPillar.tscn",
		"unit_name": "Wall Pillar",
		"description": "Defensive wall",
		"faction": Enums.Faction.AMUNS,
		"production_tab_type": Enums.ProductionTabType.DEFENCES,
		"production_tab_grid_slot": Enums.ProductionTabGridSlots.F1,
		"sight_range": 4.0,
		"hp": 10000,
		"hp_max": 10000,
		"armor":
		{
			Enums.DamageTypes.CANNON: 0.5,
			Enums.DamageTypes.CORROSIVE: 0.5,
			Enums.DamageTypes.CRUSH: 0.5,
			Enums.DamageTypes.EXPLOSIVE: 0.5,
			Enums.DamageTypes.FIRE: 0.0,
			Enums.DamageTypes.LASER: 0.5,
			Enums.DamageTypes.MELEE: 0.5,
			Enums.DamageTypes.PLASMA: 0.5,
			Enums.DamageTypes.PRISM: 0.5,
			Enums.DamageTypes.RIFLE: 0.5,
			Enums.DamageTypes.ROCKET: 0.5,
			Enums.DamageTypes.TESLA: 0.5,
		},
		"costs": {"credits": 50},
		"build_time": 5.0,
		"structure_requirements":
		[
			Enums.SceneId.AMUNS_COMMAND_ANCHOR,
		],
		## wall specific settings
		"connection_length": 5,
	},
	Enums.SceneId.AMUNS_ANTI_GROUND_TURRET:
	{
		"scene": "res://source/factions/the_amuns/structures/AntiGroundTurret.tscn",
		"unit_name": "Laser Turret",
		"description": "Anti-vehicle defensive turret",
		"faction": Enums.Faction.AMUNS,
		"production_tab_type": Enums.ProductionTabType.DEFENCES,
		"production_tab_grid_slot": Enums.ProductionTabGridSlots.F3,
		"sight_range": 8.0,
		"hp": 800,
		"hp_max": 800,
		"attack_damage": 20,
		"attack_type": "cannon",
		"attack_interval": 1.0,
		"attack_range": 8.0,
		"can_attack_vines": true,
		"projectile_type": Enums.Projectile.CANNON,
		"projectile_config":
		{
			"sound_start": SOUND_ROCKET_START,
			"sound_end": SOUND_ROCKET_END,
		},
		"attack_domains":
		[
			Enums.MovementTypes.LAND,
		],
		"armor":
		{
			Enums.DamageTypes.CANNON: 0.5,
			Enums.DamageTypes.CORROSIVE: 0.0,
			Enums.DamageTypes.CRUSH: 0.75,
			Enums.DamageTypes.EXPLOSIVE: 0.0,
			Enums.DamageTypes.FIRE: 0.0,
			Enums.DamageTypes.LASER: 0.5,
			Enums.DamageTypes.MELEE: 0.75,
			Enums.DamageTypes.PLASMA: 0.25,
			Enums.DamageTypes.PRISM: 0.5,
			Enums.DamageTypes.RIFLE: 0.75,
			Enums.DamageTypes.ROCKET: 0.25,
			Enums.DamageTypes.TESLA: 0.25,
		},
		"costs": {"credits": 2},
		"build_time": 5.0,
		"structure_requirements":
		[
			Enums.SceneId.AMUNS_COMMAND_ANCHOR,
		],
	},
	Enums.SceneId.AMUNS_ANTI_AIR_TURRET:
	{
		"scene": "res://source/factions/the_amuns/structures/AntiAirTurret.tscn",
		"unit_name": "Pulse Turret",
		"description": "Anti-air defensive turret",
		"faction": Enums.Faction.AMUNS,
		"production_tab_type": Enums.ProductionTabType.DEFENCES,
		"production_tab_grid_slot": Enums.ProductionTabGridSlots.F4,
		"sight_range": 8.0,
		"hp": 800,
		"hp_max": 800,
		"attack_damage": 20,
		"attack_type": "rocket",
		"attack_interval": 0.75,
		"attack_range": 8.0,
		"can_attack_vines": true,
		"projectile_type": Enums.Projectile.ROCKET,
		"projectile_config":
		{
			"sound_start": SOUND_ROCKET_START,
			"sound_end": SOUND_ROCKET_END,
		},
		"attack_domains":
		[
			Enums.MovementTypes.AIR,
		],
		"armor":
		{
			Enums.DamageTypes.CANNON: 0.5,
			Enums.DamageTypes.CORROSIVE: 0.0,
			Enums.DamageTypes.CRUSH: 0.75,
			Enums.DamageTypes.EXPLOSIVE: 0.0,
			Enums.DamageTypes.FIRE: 0.0,
			Enums.DamageTypes.LASER: 0.5,
			Enums.DamageTypes.MELEE: 0.75,
			Enums.DamageTypes.PLASMA: 0.25,
			Enums.DamageTypes.PRISM: 0.5,
			Enums.DamageTypes.RIFLE: 0.75,
			Enums.DamageTypes.ROCKET: 0.25,
			Enums.DamageTypes.TESLA: 0.25,
		},
		"costs": {"credits": 2},
		"build_time": 5.0,
		"structure_requirements":
		[
			Enums.SceneId.AMUNS_COMMAND_ANCHOR,
		],
	},
	Enums.SceneId.AMUNS_PLASMA_TURRET:
	{
		"scene": "res://source/factions/the_amuns/structures/PlasmaTurret.tscn",
		"unit_name": "Plasma Turret",
		"description": "Anti-infantry defensive turret",
		"faction": Enums.Faction.AMUNS,
		"production_tab_type": Enums.ProductionTabType.DEFENCES,
		"production_tab_grid_slot": Enums.ProductionTabGridSlots.F2,
		"sight_range": 7.0,
		"hp": 700,
		"hp_max": 700,
		"attack_damage": 12,
		"attack_type": "plasma",
		"attack_interval": 0.5,
		"attack_range": 6.0,
		"can_attack_vines": true,
		"projectile_type": Enums.Projectile.LASER,
		"projectile_config":
		{
			"color": Color("ff66ccff"),
			"laser_count": 1,
			"laser_width": 0.06,
			"laser_duration": 0.18,
		},
		"attack_domains":
		[
			Enums.MovementTypes.LAND,
		],
		"armor":
		{
			Enums.DamageTypes.CANNON: 0.5,
			Enums.DamageTypes.CORROSIVE: 0.0,
			Enums.DamageTypes.CRUSH: 0.75,
			Enums.DamageTypes.EXPLOSIVE: 0.0,
			Enums.DamageTypes.FIRE: 0.0,
			Enums.DamageTypes.LASER: 0.5,
			Enums.DamageTypes.MELEE: 0.75,
			Enums.DamageTypes.PLASMA: 0.25,
			Enums.DamageTypes.PRISM: 0.5,
			Enums.DamageTypes.RIFLE: 0.75,
			Enums.DamageTypes.ROCKET: 0.25,
			Enums.DamageTypes.TESLA: 0.25,
		},
		"costs": {"credits": 500},
		"build_time": 12.0,
		"structure_requirements":
		[
			Enums.SceneId.AMUNS_COMMAND_ANCHOR,
		],
	},
	Enums.SceneId.AMUNS_SENSOR_SPIRE:
	{
		"scene": "res://source/factions/the_amuns/structures/SensorSpire.tscn",
		"unit_name": "Sensor Spire",
		"description": "Static detector. Reveals stealth, mines, burrowed and hidden threats.",
		"faction": Enums.Faction.AMUNS,
		"production_tab_type": Enums.ProductionTabType.DEFENCES,
		"production_tab_grid_slot": Enums.ProductionTabGridSlots.F5,
		"sight_range": 12.0,
		"hp": 600,
		"hp_max": 600,
		"armor":
		{
			Enums.DamageTypes.CANNON: 0.25,
			Enums.DamageTypes.CORROSIVE: 0.0,
			Enums.DamageTypes.CRUSH: 0.5,
			Enums.DamageTypes.EXPLOSIVE: 0.0,
			Enums.DamageTypes.FIRE: 0.0,
			Enums.DamageTypes.LASER: 0.25,
			Enums.DamageTypes.MELEE: 0.5,
			Enums.DamageTypes.PLASMA: 0.0,
			Enums.DamageTypes.PRISM: 0.25,
			Enums.DamageTypes.RIFLE: 0.5,
			Enums.DamageTypes.ROCKET: 0.0,
			Enums.DamageTypes.TESLA: 0.0,
		},
		"costs": {"credits": 500},
		"build_time": 10.0,
		"structure_requirements":
		[
			Enums.SceneId.AMUNS_COMMAND_ANCHOR,
		],
	},
	Enums.SceneId.AMUNS_VEIL_PYLON:
	{
		"scene": "res://source/factions/the_amuns/structures/VeilPylon.tscn",
		"unit_name": "Veil Pylon",
		"description": "Utility defence. Projects invisibility to nearby allied structures.",
		"faction": Enums.Faction.AMUNS,
		"production_tab_type": Enums.ProductionTabType.DEFENCES,
		"production_tab_grid_slot": Enums.ProductionTabGridSlots.F6,
		"sight_range": 6.0,
		"hp": 700,
		"hp_max": 700,
		"armor":
		{
			Enums.DamageTypes.CANNON: 0.25,
			Enums.DamageTypes.CORROSIVE: 0.0,
			Enums.DamageTypes.CRUSH: 0.5,
			Enums.DamageTypes.EXPLOSIVE: 0.0,
			Enums.DamageTypes.FIRE: 0.0,
			Enums.DamageTypes.LASER: 0.25,
			Enums.DamageTypes.MELEE: 0.5,
			Enums.DamageTypes.PLASMA: 0.0,
			Enums.DamageTypes.PRISM: 0.25,
			Enums.DamageTypes.RIFLE: 0.5,
			Enums.DamageTypes.ROCKET: 0.0,
			Enums.DamageTypes.TESLA: 0.0,
		},
		"costs": {"credits": 600},
		"build_time": 12.0,
		"structure_requirements":
		[
			Enums.SceneId.AMUNS_COMMAND_ANCHOR,
			Enums.SceneId.AMUNS_OBELISK,
		],
	},
}

const INFANTRY = {
	Enums.SceneId.AMUNS_SENTINEL:
	{
		"scene": "res://source/factions/the_amuns/units/Sentinel.tscn",
		"unit_name": "Sentinel",
		"description": "Light infantry armed with a laser rifle",
		"faction": Enums.Faction.AMUNS,
		"production_tab_type": Enums.ProductionTabType.INFANTRY,
		"production_tab_grid_slot": Enums.ProductionTabGridSlots.F1,
		"sight_range": 8.0,
		"hp": 500,
		"hp_max": 500,
		"can_move_through_vines": true,
		"attack_damage": 10,
		"attack_type": "laser",
		"attack_interval": 0.55,
		"attack_range": 4.0,
		"can_attack_vines": true,
		"projectile_type": Enums.Projectile.LASER,
		"projectile_origin": Vector3(-0.22, 0.3, -0.1),
		"projectile_config":
		{
			"color": Color("1034a6ff"),
			"laser_count": 2,
			"laser_width": 0.03,
			"laser_duration": 0.25,
			"sound_start": preload("res://assets/sound_effects/laser-shot.mp3"),
		},
		"rotation_speed": 1,
		"attack_domains":
		[
			Enums.MovementTypes.LAND,
		],
		"armor":
		{
			Enums.DamageTypes.LASER: 0.5,
		},
		"costs": {"credits": 2},
		"build_time": 3.0,
	},
	Enums.SceneId.AMUNS_PRISM_LANCER:
	{
		"scene": "res://source/factions/the_amuns/units/PrismLancer.tscn",
		"unit_name": "Prism Lancer",
		"description": "Anti-armor infantry. Slow-firing prism beam vs heavy targets.",
		"faction": Enums.Faction.AMUNS,
		"production_tab_type": Enums.ProductionTabType.INFANTRY,
		"production_tab_grid_slot": Enums.ProductionTabGridSlots.F2,
		"sight_range": 9.0,
		"hp": 140,
		"hp_max": 140,
		"can_move_through_vines": true,
		"attack_damage": 18,
		"attack_type": "prism",
		"attack_interval": 1.4,
		"attack_range": 5.5,
		"can_attack_vines": true,
		"projectile_type": Enums.Projectile.LASER,
		"projectile_origin": Vector3(-0.22, 0.3, -0.1),
		"projectile_config":
		{
			"color": Color("d066ffff"),
			"laser_count": 1,
			"laser_width": 0.06,
			"laser_duration": 0.35,
		},
		"rotation_speed": 1,
		"attack_domains":
		[
			Enums.MovementTypes.LAND,
		],
		"armor":
		{
			Enums.DamageTypes.LASER: 0.25,
		},
		"costs": {"credits": 110},
		"build_time": 12.0,
	},
	Enums.SceneId.AMUNS_ANKH_GUARD:
	{
		"scene": "res://source/factions/the_amuns/units/AnkhGuard.tscn",
		"unit_name": "Ankh Guard",
		"description": "Heavy shield infantry. Frontline protectorate enforcement.",
		"faction": Enums.Faction.AMUNS,
		"production_tab_type": Enums.ProductionTabType.INFANTRY,
		"production_tab_grid_slot": Enums.ProductionTabGridSlots.F3,
		"sight_range": 7.0,
		"hp": 200,
		"hp_max": 200,
		"can_move_through_vines": true,
		"attack_damage": 14,
		"attack_type": "melee",
		"attack_interval": 0.9,
		"attack_range": 1.5,
		"can_attack_vines": true,
		"rotation_speed": 1,
		"attack_domains":
		[
			Enums.MovementTypes.LAND,
		],
		"armor":
		{
			Enums.DamageTypes.CANNON: 0.5,
			Enums.DamageTypes.LASER: 0.5,
			Enums.DamageTypes.PLASMA: 0.5,
			Enums.DamageTypes.PRISM: 0.25,
			Enums.DamageTypes.RIFLE: 0.5,
			Enums.DamageTypes.ROCKET: 0.25,
			Enums.DamageTypes.MELEE: 0.5,
		},
		"costs": {"credits": 160},
		"build_time": 14.0,
	},
	Enums.SceneId.AMUNS_CALIBRATION_ADEPT:
	{
		"scene": "res://source/factions/the_amuns/units/CalibrationAdept.tscn",
		"unit_name": "Calibration Adept",
		"description": "Caster-lite support: cleanse, slow, reveal, stabilize.",
		"faction": Enums.Faction.AMUNS,
		"production_tab_type": Enums.ProductionTabType.INFANTRY,
		"production_tab_grid_slot": Enums.ProductionTabGridSlots.F4,
		"sight_range": 12.0,
		"hp": 140,
		"hp_max": 140,
		"can_move_through_vines": true,
		"armor":
		{
			Enums.DamageTypes.LASER: 0.25,
		},
		"costs": {"credits": 130},
		"build_time": 12.0,
	},
}

const VEHICLES = {
	Enums.SceneId.AMUNS_ARCHITECT:
	{
		"scene": "res://source/factions/the_amuns/units/Architect.tscn",
		"unit_name": "Architect",
		"description": "Faction engineer. Builds, repairs, and gathers resources.",
		"faction": Enums.Faction.AMUNS,
		"production_tab_type": Enums.ProductionTabType.VEHICLE,
		"production_tab_grid_slot": Enums.ProductionTabGridSlots.F1,
		"sight_range": 5.0,
		"hp": 600,
		"hp_max": 600,
		"resources_max": 500,
		"resources_gather_rate": 250,
		"can_move_through_vines": true,
		"armor":
		{
			Enums.DamageTypes.CANNON: 0.0,
			Enums.DamageTypes.CORROSIVE: 0.0,
			Enums.DamageTypes.CRUSH: 0.0,
			Enums.DamageTypes.EXPLOSIVE: 0.0,
			Enums.DamageTypes.FIRE: 0.0,
			Enums.DamageTypes.LASER: 0.0,
			Enums.DamageTypes.MELEE: 0.0,
			Enums.DamageTypes.PLASMA: 0.0,
			Enums.DamageTypes.PRISM: 0.0,
			Enums.DamageTypes.RIFLE: 0.0,
			Enums.DamageTypes.ROCKET: 0.0,
			Enums.DamageTypes.TESLA: 0.0,
		},
		"costs": {"credits": 2},
		"build_time": 3.0,
	},
	Enums.SceneId.AMUNS_TANK:
	{
		"scene": "res://source/factions/the_amuns/units/Tank.tscn",
		"unit_name": "Tank",
		"description": "Heavy armored ground vehicle with an autocannon",
		"faction": Enums.Faction.AMUNS,
		"production_tab_type": Enums.ProductionTabType.VEHICLE,
		"production_tab_grid_slot": Enums.ProductionTabGridSlots.F2,
		"sight_range": 8.0,
		"hp": 1000,
		"hp_max": 1000,
		"attack_damage": 20,
		"attack_type": "cannon",
		"attack_interval": 0.75,
		"attack_range": 5.0,
		"can_attack_vines": true,
		"projectile_type": Enums.Projectile.CANNON,
		"projectile_config":
		{
			"sound_start": preload("res://assets/sound_effects/autocannon-20mm.mp3"),
		},
		"can_reverse_move": true,
		"rotation_speed": 1,
		"attack_domains":
		[
			Enums.MovementTypes.LAND,
		],
		"armor":
		{
			Enums.DamageTypes.LASER: 0.5,
			Enums.DamageTypes.CANNON: 0.5,
			Enums.DamageTypes.CORROSIVE: 0.5,
			Enums.DamageTypes.CRUSH: 0.5,
			Enums.DamageTypes.EXPLOSIVE: 0.5,
			Enums.DamageTypes.FIRE: 0.5,
			Enums.DamageTypes.MELEE: 0.5,
			Enums.DamageTypes.PLASMA: 0.5,
			Enums.DamageTypes.PRISM: 0.5,
			Enums.DamageTypes.RIFLE: 0.5,
			Enums.DamageTypes.ROCKET: 0.5,
			Enums.DamageTypes.TESLA: 0.5,
		},
		"costs": {"credits": 3},
		"build_time": 6.0,
	},
	Enums.SceneId.AMUNS_SCARAB_SKIMMER:
	{
		"scene": "res://source/factions/the_amuns/units/ScarabSkimmer.tscn",
		"unit_name": "Scarab Skimmer",
		"description": "Fast hover harassment vehicle. Map control and nest raids.",
		"faction": Enums.Faction.AMUNS,
		"production_tab_type": Enums.ProductionTabType.VEHICLE,
		"production_tab_grid_slot": Enums.ProductionTabGridSlots.F3,
		"sight_range": 9.0,
		"hp": 250,
		"hp_max": 250,
		"attack_damage": 14,
		"attack_type": "rifle",
		"attack_interval": 0.5,
		"attack_range": 5.0,
		"can_attack_vines": true,
		"projectile_type": Enums.Projectile.BULLETS,
		"rotation_speed": 2,
		"attack_domains":
		[
			Enums.MovementTypes.LAND,
		],
		"armor":
		{
			Enums.DamageTypes.RIFLE: 0.25,
			Enums.DamageTypes.LASER: 0.25,
		},
		"costs": {"credits": 200},
		"build_time": 14.0,
	},
	Enums.SceneId.AMUNS_RESONANCE_CHARIOT:
	{
		"scene": "res://source/factions/the_amuns/units/ResonanceChariot.tscn",
		"unit_name": "Resonance Chariot",
		"description": "Mobile anti-swarm. Pulse-slow area control.",
		"faction": Enums.Faction.AMUNS,
		"production_tab_type": Enums.ProductionTabType.VEHICLE,
		"production_tab_grid_slot": Enums.ProductionTabGridSlots.F4,
		"sight_range": 8.0,
		"hp": 450,
		"hp_max": 450,
		"attack_damage": 20,
		"attack_type": "plasma",
		"attack_interval": 0.9,
		"attack_range": 6.0,
		"can_attack_vines": true,
		"projectile_type": Enums.Projectile.LASER,
		"projectile_config":
		{
			"color": Color("66ccffff"),
			"laser_count": 1,
			"laser_width": 0.08,
			"laser_duration": 0.2,
		},
		"rotation_speed": 1,
		"attack_domains":
		[
			Enums.MovementTypes.LAND,
		],
		"armor":
		{
			Enums.DamageTypes.LASER: 0.5,
			Enums.DamageTypes.RIFLE: 0.5,
			Enums.DamageTypes.MELEE: 0.5,
		},
		"costs": {"credits": 400},
		"build_time": 18.0,
	},
	Enums.SceneId.AMUNS_OBELISK_WALKER:
	{
		"scene": "res://source/factions/the_amuns/units/ObeliskWalker.tscn",
		"unit_name": "Obelisk Walker",
		"description": "Siege walker. Anti-structure, anchor reactivation/purge.",
		"faction": Enums.Faction.AMUNS,
		"production_tab_type": Enums.ProductionTabType.VEHICLE,
		"production_tab_grid_slot": Enums.ProductionTabGridSlots.F5,
		"sight_range": 10.0,
		"hp": 700,
		"hp_max": 700,
		"attack_damage": 50,
		"attack_type": "prism",
		"attack_interval": 1.8,
		"attack_range": 9.0,
		"can_attack_vines": true,
		"projectile_type": Enums.Projectile.LASER,
		"projectile_config":
		{
			"color": Color("ffaa44ff"),
			"laser_count": 1,
			"laser_width": 0.12,
			"laser_duration": 0.4,
		},
		"rotation_speed": 1,
		"attack_domains":
		[
			Enums.MovementTypes.LAND,
		],
		"armor":
		{
			Enums.DamageTypes.LASER: 0.5,
			Enums.DamageTypes.CANNON: 0.5,
			Enums.DamageTypes.RIFLE: 0.5,
			Enums.DamageTypes.ROCKET: 0.25,
			Enums.DamageTypes.MELEE: 0.75,
		},
		"costs": {"credits": 700},
		"build_time": 22.0,
	},
	Enums.SceneId.AMUNS_JUDICATOR_COLOSSUS:
	{
		"scene": "res://source/factions/the_amuns/units/JudicatorColossus.tscn",
		"unit_name": "Judicator Colossus",
		"description": "T3 superheavy walker. Boss-scale reclamation tool.",
		"faction": Enums.Faction.AMUNS,
		"production_tab_type": Enums.ProductionTabType.VEHICLE,
		"production_tab_grid_slot": Enums.ProductionTabGridSlots.F6,
		"sight_range": 11.0,
		"hp": 900,
		"hp_max": 900,
		"attack_damage": 70,
		"attack_type": "laser",
		"attack_interval": 1.2,
		"attack_range": 7.5,
		"can_attack_vines": true,
		"projectile_type": Enums.Projectile.LASER,
		"projectile_config":
		{
			"color": Color("ffd28aff"),
			"laser_count": 2,
			"laser_width": 0.1,
			"laser_duration": 0.3,
		},
		"rotation_speed": 1,
		"attack_domains":
		[
			Enums.MovementTypes.LAND,
			Enums.MovementTypes.AIR,
		],
		"armor":
		{
			Enums.DamageTypes.LASER: 0.5,
			Enums.DamageTypes.CANNON: 0.5,
			Enums.DamageTypes.RIFLE: 0.75,
			Enums.DamageTypes.ROCKET: 0.5,
			Enums.DamageTypes.PLASMA: 0.5,
			Enums.DamageTypes.PRISM: 0.5,
			Enums.DamageTypes.MELEE: 0.75,
		},
		"costs": {"credits": 900},
		"build_time": 28.0,
	},
}

const AIR = {
	Enums.SceneId.AMUNS_SKY_CUTTER:
	{
		"scene": "res://source/factions/the_amuns/units/SkyCutter.tscn",
		"unit_name": "Sky Cutter",
		"description": "Versatile attack aircraft armed with rockets",
		"faction": Enums.Faction.AMUNS,
		"production_tab_type": Enums.ProductionTabType.AIR,
		"production_tab_grid_slot": Enums.ProductionTabGridSlots.F1,
		"sight_range": 8.0,
		"hp": 1000,
		"hp_max": 1000,
		"attack_damage": 10,
		"attack_type": "rocket",
		"attack_interval": 1.0,
		"attack_range": 5.0,
		"can_attack_vines": true,
		"projectile_type": Enums.Projectile.ROCKET,
		"projectile_config":
		{
			"sound_start": SOUND_ROCKET_START,
			"sound_end": SOUND_ROCKET_END,
		},
		"attack_domains":
		[
			Enums.MovementTypes.LAND,
			Enums.MovementTypes.AIR,
		],
		"armor":
		{
			Enums.DamageTypes.RIFLE: 0.25,
		},
		"costs": {"credits": 1},
		"build_time": 6.0,
	},
	Enums.SceneId.AMUNS_SIPHON_DRONE:
	{
		"scene": "res://source/factions/the_amuns/units/SiphonDrone.tscn",
		"unit_name": "Siphon Drone",
		"description": "Flying resource gatherer for Resource Siphon structures.",
		"faction": Enums.Faction.AMUNS,
		"production_tab_type": Enums.ProductionTabType.AIR,
		"production_tab_grid_slot": Enums.ProductionTabGridSlots.F2,
		"sight_range": 8.0,
		"hp": 350,
		"hp_max": 350,
		"movement_domains": [Enums.MovementTypes.AIR],
		"resources_max": 250,
		"resources_gather_rate": 125,
		"armor":
		{
			Enums.DamageTypes.CANNON: 0.0,
			Enums.DamageTypes.CORROSIVE: 0.0,
			Enums.DamageTypes.CRUSH: 0.0,
			Enums.DamageTypes.EXPLOSIVE: 0.0,
			Enums.DamageTypes.FIRE: 0.0,
			Enums.DamageTypes.LASER: 0.0,
			Enums.DamageTypes.MELEE: 0.0,
			Enums.DamageTypes.PLASMA: 0.0,
			Enums.DamageTypes.PRISM: 0.0,
			Enums.DamageTypes.RIFLE: 0.0,
			Enums.DamageTypes.ROCKET: 0.0,
			Enums.DamageTypes.TESLA: 0.0,
		},
		"costs": {"credits": 2},
		"build_time": 5.0,
	},
	Enums.SceneId.AMUNS_VEIL_PROBE:
	{
		"scene": "res://source/factions/the_amuns/units/VeilProbe.tscn",
		"unit_name": "Veil Probe",
		"description": "Air scout and detector. Reveal pulse and anchor survey.",
		"faction": Enums.Faction.AMUNS,
		"production_tab_type": Enums.ProductionTabType.AIR,
		"production_tab_grid_slot": Enums.ProductionTabGridSlots.F3,
		"sight_range": 14.0,
		"hp": 180,
		"hp_max": 180,
		"movement_domains": [Enums.MovementTypes.AIR],
		"armor":
		{
			Enums.DamageTypes.LASER: 0.0,
		},
		"costs": {"credits": 250},
		"build_time": 14.0,
	},
	Enums.SceneId.AMUNS_RELAY_DRONE:
	{
		"scene": "res://source/factions/the_amuns/units/RelayDrone.tscn",
		"unit_name": "Relay Drone",
		"description": "Projects Amun structure deployment radius from forward positions.",
		"faction": Enums.Faction.AMUNS,
		"production_tab_type": Enums.ProductionTabType.AIR,
		"production_tab_grid_slot": Enums.ProductionTabGridSlots.F4,
		"sight_range": 8.0,
		"hp": 350,
		"hp_max": 350,
		"movement_domains": [Enums.MovementTypes.AIR],
		"armor":
		{
			Enums.DamageTypes.LASER: 0.0,
		},
		"costs": {"credits": 450},
		"build_time": 18.0,
	},
	Enums.SceneId.AMUNS_PULSE_INTERCEPTOR:
	{
		"scene": "res://source/factions/the_amuns/units/PulseInterceptor.tscn",
		"unit_name": "Pulse Interceptor",
		"description": "Mobile anti-air escort. Hunter-killer vs light aircraft.",
		"faction": Enums.Faction.AMUNS,
		"production_tab_type": Enums.ProductionTabType.AIR,
		"production_tab_grid_slot": Enums.ProductionTabGridSlots.F5,
		"sight_range": 9.0,
		"hp": 350,
		"hp_max": 350,
		"movement_domains": [Enums.MovementTypes.AIR],
		"attack_damage": 30,
		"attack_type": "rocket",
		"attack_interval": 0.8,
		"attack_range": 6.0,
		"can_attack_vines": false,
		"projectile_type": Enums.Projectile.ROCKET,
		"projectile_config":
		{
			"sound_start": SOUND_ROCKET_START,
			"sound_end": SOUND_ROCKET_END,
		},
		"attack_domains":
		[
			Enums.MovementTypes.AIR,
		],
		"armor":
		{
			Enums.DamageTypes.RIFLE: 0.25,
		},
		"costs": {"credits": 450},
		"build_time": 18.0,
	},
	Enums.SceneId.AMUNS_DAWN_PRISM:
	{
		"scene": "res://source/factions/the_amuns/units/DawnPrism.tscn",
		"unit_name": "Dawn Prism",
		"description": "Air bomber. Splash anti-swarm and anti-structure pressure.",
		"faction": Enums.Faction.AMUNS,
		"production_tab_type": Enums.ProductionTabType.AIR,
		"production_tab_grid_slot": Enums.ProductionTabGridSlots.F6,
		"sight_range": 9.0,
		"hp": 600,
		"hp_max": 600,
		"movement_domains": [Enums.MovementTypes.AIR],
		"attack_damage": 35,
		"attack_type": "explosive",
		"attack_interval": 1.5,
		"attack_range": 5.0,
		"can_attack_vines": true,
		"projectile_type": Enums.Projectile.ROCKET,
		"projectile_config":
		{
			"sound_start": SOUND_ROCKET_START,
			"sound_end": SOUND_ROCKET_END,
		},
		"attack_domains":
		[
			Enums.MovementTypes.LAND,
		],
		"armor":
		{
			Enums.DamageTypes.RIFLE: 0.25,
			Enums.DamageTypes.LASER: 0.25,
		},
		"costs": {"credits": 800},
		"build_time": 22.0,
	},
	Enums.SceneId.AMUNS_SUN_BARGE:
	{
		"scene": "res://source/factions/the_amuns/units/SunBarge.tscn",
		"unit_name": "Sun Barge",
		"description": "Capital air finisher. Late-game judgment sweep and spectacle unit.",
		"faction": Enums.Faction.AMUNS,
		"production_tab_type": Enums.ProductionTabType.AIR,
		"production_tab_grid_slot": Enums.ProductionTabGridSlots.F7,
		"sight_range": 12.0,
		"hp": 800,
		"hp_max": 800,
		"movement_domains": [Enums.MovementTypes.AIR],
		"attack_damage": 65,
		"attack_type": "laser",
		"attack_interval": 1.5,
		"attack_range": 8.0,
		"can_attack_vines": true,
		"projectile_type": Enums.Projectile.LASER,
		"projectile_config":
		{
			"color": Color("ffd060ff"),
			"laser_count": 2,
			"laser_width": 0.1,
			"laser_duration": 0.4,
		},
		"attack_domains":
		[
			Enums.MovementTypes.LAND,
			Enums.MovementTypes.AIR,
		],
		"armor":
		{
			Enums.DamageTypes.RIFLE: 0.5,
			Enums.DamageTypes.LASER: 0.5,
			Enums.DamageTypes.ROCKET: 0.25,
		},
		"costs": {"credits": 1100},
		"build_time": 30.0,
	},
}

const NAVY = {
	Enums.SceneId.AMUNS_DRONE:
	{
		"scene": "res://source/factions/the_amuns/units/Drone.tscn",
		"unit_name": "Aquatic Drone",
		"description": "Light aquatic scout drone",
		"faction": Enums.Faction.AMUNS,
		"production_tab_type": Enums.ProductionTabType.WATER,
		"production_tab_grid_slot": Enums.ProductionTabGridSlots.F1,
		"sight_range": 10.0,
		"hp": 600,
		"hp_max": 600,
		"movement_domains": [Enums.MovementTypes.WATER],
		"armor":
		{
			Enums.DamageTypes.CANNON: 0.0,
			Enums.DamageTypes.CORROSIVE: 0.0,
			Enums.DamageTypes.CRUSH: 0.0,
			Enums.DamageTypes.EXPLOSIVE: 0.0,
			Enums.DamageTypes.FIRE: 0.0,
			Enums.DamageTypes.LASER: 0.0,
			Enums.DamageTypes.MELEE: 0.0,
			Enums.DamageTypes.PLASMA: 0.0,
			Enums.DamageTypes.PRISM: 0.0,
			Enums.DamageTypes.RIFLE: 0.0,
			Enums.DamageTypes.ROCKET: 0.0,
			Enums.DamageTypes.TESLA: 0.0,
		},
		"costs": {"credits": 2},
		"build_time": 3.0,
	},
}
