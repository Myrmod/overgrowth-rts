# The Legion

> *"This is not salvation. This is an invasion."*

The Vine-embracing human theocracy. The Legion began as an emergency power structure after the 2069 Awakening. Through the 2070s, it evolved into a militant doctrine that believes humanity must merge with the Vines, sanctify mutation, and force the world into a new order before chaos consumes it.

Shared canon reference: [../../LORE.md](../../LORE.md).

---

## Lore / Origins — The Human Conflict

*Shared collapse timeline: [../../LORE.md](../../LORE.md#human-collapse-and-awakening)*

The Legion represents what happened when emergency command structures fused with revelation. It formed from the ministries, officers, researchers, corporate authorities, and emergency coalitions that used Vine energy to keep surviving cities alive after the Awakening. At first, their argument was practical: without controlled Vine power, the world would fall back into the Long Blackout.

During the 2070s, that emergency logic became doctrine, then liturgy, then war creed. Reactor security became shrine defense. Rationing became obedience. Medical stabilization became controlled hybridization. By the late 2080s, the Legion is no longer an improvised regime. It is a mature pro-Vine order with clergy, commanders, hybrid programs, sacred infrastructure, and a theory of human destiny.

To the Legion, the Vines are not an invasion to be burned away. They are a dangerous miracle that must be disciplined, sanctified, and made human through command. The deaths and mutations of the Awakening are treated as proof that uncontrolled contact is catastrophic, not proof that the Vines should be rejected.

The Legion now believes:
- the Vines are humanity's ordained evolution
- controlled hybridization is holy discipline
- Anchors are sacred instruments, not merely alien machinery
- humanity must be unified through conversion, obedience, and managed transformation
- all Vine life must ultimately be brought under disciplined human control
- harvested Vine energy should be used to drive the next stage of human evolution

They still field organized armies, but those armies are no longer merely conventional military forces. They are crusade columns, purification cadres, hybrid battalions, and ritual engineers.

### The Amuns as rivals

The Legion does not accept that The Amuns have rightful claim over the Vines. To Legion doctrine, any alien creators are at best false prophets and at worst jealous rivals trying to deny humanity its destined transformation.

The Legion position is:
- creation does not grant ownership
- the Vines awakened on Earth and now belong to humanity's future
- the Amuns are liars if they claim the Vines were only tools
- any alien return is an attempt to steal a revelation meant for humankind

---

## Strengths & Identity

- **Militant hybrid doctrine** — disciplined human formations reinforced by controlled Vine mutation
- Ritual infrastructure layered onto a familiar power-grid backbone
- Strong air capability once airfield is established
- Mid-game transformation and doctrine upgrades create elite pressure
- Mature institutions: shrine networks, reactor authorities, hybrid programs, and doctrinal command structures

---

## Economy

The Legion uses **sanctified refineries** with harvesters that cut and process Vines, through doctrinal infrastructure. Mechanically this is still a gather-carry-return economy, but conceptually the faction sees harvesting as controlled communion rather than simple extraction.

Legion doctrine does not revere all Vine growth equally.
It distinguishes between:
- sanctified Vine power, which is refined, harvested, weaponized, and integrated into doctrine
- wild or uncontrolled growth, which is heresy, waste, or dangerous impurity

This is why the Legion can worship ascension through Vine power while still cutting down uncontrolled Vine life and hostile growth zones.

- Refinery deploys a Harvester and serves as a valid drop-off structure.
- Harvester gathers from the nearest field, carries cargo, and returns resources to the nearest valid drop-off structure.
- Legion command centers are not resource drop-off structures.
- Legion harvesting depletes and destroys ResourceVines.
- If a Harvester is destroyed while carrying resources, the carried load is lost.

| Stat | Value |
|---|---|
| Capacity | 500 |
| Harvest rate | 250 |
| Delivery loop | Nearest valid drop-off |

---

## Tech Tree — Tier 1 Build Order

```
HQ
└── Power Plant
    ├── Barracks
    ├── Refinery
    ├── Assembly
    └── Airfield
```

Conceptually, these structures should read as doctrinal institutions, rather than purely secular military installations.

---

## Buildings

| Building | Cost | Build time | Power | Notes |
|---|---|---|---|---|
| Command Center | 8 | 10 s | 0 | Main structure; produces structures and defences; off-field trickle construction; shared global ProductionQueue |
| Power Plant | 4 | 5 s | +5 | Provides Legion energy; often framed as ritualized bio-reactor infrastructure |
| Refinery | 2000 | 20 s | 50 | Deploys a Harvester; Harvester cargo is delivered to the nearest valid drop-off structure |
| Barracks | 4 | 6 s | 5 | Produces infantry |
| Airfield | 2000 | 20 s | 50 | Produces air units |
| Assembly | 2000 | 20 s | 50 | Produces tanks |

Visual direction:
- armored clergy and sanctified officers
- respirators, reliquaries, grafted Vine tissue, and sealed ceremonial armor
- industrial buildings fused with roots, growth vats, and controlled bio-reactors
- symbols of doctrine, unity, purification, and ascension

---

## Units

### Infantry

#### Basic Infantry

| Stat | Value |
|---|---|
| Role | Light line infantry |
| HP | 5 |
| Max HP | 5 |
| Sight range | 8.0 |
| Cost | 2 |
| Build time | 3 s |
| Armor vs Rifle | 0% |
| Armor vs Explosive | 0% |
| Armor vs Melee | 0% |

**Weapon — Laser Rifle**

| Stat | Value |
|---|---|
| Damage type | Laser |
| Damage | 1 |
| Range | 4.0 |
| Attack speed | 0.55 |

### Vehicles

#### Harvester

| Stat | Value |
|---|---|
| HP | 600 |
| Max HP | 600 |
| Capacity | 500 |
| Gather rate | 250 |
| Cost | 2 |
| Build time | 3 s |

**Behavior**
- deployed by the Refinery economy line
- gathers from the nearest resource field
- returns cargo to the nearest valid drop-off structure
- Legion command centers are not drop-off structures
