# The Remnants

> *"They clearly see that they never mattered."*

The Remnants are the survivors and outcasts of the Ash War and the Awakening — the common people who were never consulted, never protected, and never believed. Through the 2070s, scattered refugees, deserters, engineers, and settlement militias became a movement built around one hard promise: no authority, human or alien, gets to decide what a body must become.

Shared canon reference: [../../LORE.md](../../LORE.md).

---

## Lore / Origins

*Shared collapse timeline: [../../LORE.md](../../LORE.md#human-collapse-and-awakening)*

The Remnants emerged from the **common people** who witnessed the horrors of the Vine awakening first-hand — millions dead, cities swallowed, governments suppressing the truth to protect their energy supply. They sided with the scientist who was imprisoned for warning against activating the Vines, because they were never consulted and they clearly saw that they never mattered to those in power.

In the early 2070s, they were not yet a faction. They were refugee corridors, burn-clearing crews, deserted military units, isolated settlements, and engineers trying to keep machines running without surrendering their communities to Vine authorities. As Legion doctrine hardened, those scattered groups found a shared language of refusal: no forced mutation, no sacred emergency rule, no sacrifice without consent.

Where the Legion became a pro-Vine crusade of control and transformation, the Remnants represent those who survived outside it: refugees, militia, former soldiers who deserted, and communities that built their own tech from whatever remained.

By the late 2080s, the Remnants are not just survivors of the Awakening. They are a political and military culture shaped by two decades of evacuation, salvage, settlement defense, and anti-conversion resistance.

They are not merely anti-government. They are anti-conversion. To them, the Legion is proof that humanity can lose itself long before it loses a war.

Remnant politics are practical, but not empty. Consent is uncompromisable, because it was denied. A machine that can be repaired by hand is trusted more than a miracle that demands obedience. A settlement choosing its own risks matters more than any doctrine promising humanity's next stage.

What the Remnants are fighting for is not only survival.
They stand for:
- human autonomy
- unmodified human life
- mechanical, improvised, understandable technology
- local communities making their own decisions
- the right to remain human without forced transformation

Their missions should make survival feel concrete: evacuation routes, burn-clearing, salvage operations, settlement defense, and raids where victory means buying people time.

---

## Strengths & Identity

- **Refusal doctrine**: rejects forced mutation, centralized revelation, and alien ownership
- Destructive harvest doctrine: burns ResourceVines because uncontrolled growth is treated as a threat to human settlements
- Mechanical transparency: weapons, vehicles, and infrastructure should feel repairable, improvised, and understandable
- Local resilience: squads, convoys, and workshops should read as communities defending themselves rather than a formal empire expanding
- Factory-forward tech tree: practical vehicle access comes early because survival depends on mobility, salvage, and hard tools
- Pioneer-style construction: mobile workers can establish basic footholds before heavier infrastructure is formalized
- Scrap economy: enemy vehicles and aircraft drop scrap that Remnants can collect for field upgrades
- Fortified survival: bunkers, walls, gates, mines, and utility turrets turn temporary positions into stubborn footholds
- Chemical denial weapons are acceptable for Remnants when framed as desperate, practical survival tools
- Strong visual identity around mechanical, salvaged, non-organic wargear

Design constraints to preserve:
- define them through refusal, consent, and local survival before balance comparisons
- their limitations should come from scarcity, exposure, and field improvisation rather than lack of conviction
- improvised tools should be readable and repairable
- survival themes work best when resources, time, and safety are limited

---

## Economy

The Remnants do not use a refinery return loop. They harvest by **burning** resources in place.

- Gather units are the **Incinerator** (infantry) and **Flame Tank** (vehicle).
- Burn animation is the harvest action.
- Gather rate is measured by destroyed resources per tick.
- Units do not carry cargo and do not return to a refinery.
- Remnants harvesting depletes and destroys ResourceVines.
- On depletion, Remnants gatherers automatically continue to the next available resource tile.
- Retargeting is issued through the deterministic command path: CommandBus -> Match command execution.
- If a target vine is removed before execution, command execution selects the next valid resource target.

| Stat | Value |
|---|---|
| Harvest model | Burn in place |
| Carry capacity | None |
| Delivery loop | None |
| Depletion | Depletes and destroys ResourceVines |

### Scrap And Field Upgrades

- Planned feature: destroyed enemy vehicles and air units drop scrap.
- Planned feature: Salvage Vans gather dropped scrap from the battlefield.
- Scrap is used to upgrade Remnant units directly in the field.
- Units being upgraded are disabled until the retrofit completes.
- The Salvage Yard repairs through drones and can dismantle friendly units sent into it, refunding part of their value as credits and scrap.

---

## Tech Tree — Tier 1 Build Order

```
HQ
└── Power Plant
    ├── Casern     ─┐
    └── Factory  ──┘           →  T2 structure
                               →  Naval Yard
                               →  Drone Tower
```

> Factory is unlocked directly from Power Plant, emphasizing practical vehicle access.

---

## Buildings

| Building | Cost | Build time | Power | Notes |
|---|---|---|---|---|
| Command Center | — | — | — | Main structure; produces structures and defences; off-field trickle construction; shared global ProductionQueue |
| Power Plant | 600 | 6 s | — | Provides 150 power |
| Casern | 600 | 6 s | 25 | Produces infantry |
| Drone Tower | 2000 | 20 s | 50 | Produces air units |
| Factory | 2000 | 20 s | 50 | Produces tanks |
| Naval Yard | 1500 | 15 s | 50 | Produces ships |
| Command Post | TBD | TBD | TBD | Planned forward structure required for complex construction |
| Salvage Yard | TBD | TBD | TBD | Planned repair-drone, unit-dismantling, and scrap-upgrade structure |
| Bunker | TBD | TBD | TBD | Planned garrison defense; requires shared garrison functionality |
| Wall/Gate | TBD | TBD | TBD | Planned faction-flavored wall and gate set |
| Chemical/Flame Turret | TBD | TBD | TBD | Planned anti-infantry and anti-swarm defense |
| Gauss/Rocket Turret | TBD | TBD | TBD | Planned anti-vehicle defense |
| Flak/Rocket Nest | TBD | TBD | TBD | Planned anti-air defense |
| Repair Turret | TBD | TBD | TBD | Planned utility tower that sends repair drones to nearby mechanical units and structures |
| Detection Turret | TBD | TBD | TBD | Planned utility tower that reveals stealth, mines, burrowed threats, and hidden growth |

> Economy unit production: Casern produces Incinerator squads, Factory produces Flame Tanks.

Construction rules:
- planned feature: Remnant worker units can construct simple structures anywhere that terrain and collision rules allow
- planned feature: complex structures require a local Command Post or equivalent forward base structure before placement becomes valid
- planned feature: Remnant expansion should feel improvised and mobile at low tech, but staged and deliberate for heavier infrastructure

---

## Units

### Infantry

#### Basic Infantry

| Stat | Value |
|---|---|
| HP | 80 |
| Max HP | 80 |
| Movement speed | 1.25 |
| Turn rate | TBD |
| Cost | 150 |
| Armor vs Rifle | 0% |
| Armor vs Explosive | 0% |
| Armor vs Melee | 0% |

**Weapon — Rifle**

| Stat | Value |
|---|---|
| Damage type | Rifle |
| Damage | 6×5 (burst) |
| AoE | 0 |
| Range | 2.5 |
| Attack speed | 2.0 |

**Abilities**
- **Sprint** — gain +0.25 m/s for 10 seconds

### Support Units

#### Constructor

- planned worker unit used for Remnant building and field setup
- intended to construct simple structures without requiring normal shared build radius support
- expected to work alongside Command Posts for advanced or complex structures
- should also function as the Remnant engineer-type unit for capturing neutral or enemy structures unless a separate Engineer unit is added

#### Mechanic

- planned support infantry for repairs and field maintenance
- can place mines as a low-tech area-control tool
- should not replace the Constructor's building role

#### Salvage Van

- planned vehicle that gathers scrap dropped by destroyed enemy vehicles and air units
- enables the Remnant scrap economy and field-upgrade loop
- should be vulnerable enough that holding the battlefield after a fight matters

#### Sniper

- planned precision infantry for long-range target removal
- fragile and sight-dependent, with weak performance into swarms

#### Commander

- planned infantry support leader
- buffs nearby units with damage and speed
- aura should be readable, capped, and non-stacking

#### Chemical Team

- planned infantry or support weapon team for area denial
- effective against clustered infantry and growth-heavy positions
- should not replace rockets, snipers, or conventional line infantry

#### Firing-Port APC

- planned transport vehicle for infantry
- passengers can shoot from inside using shared garrison/firing-port logic

#### Suicide Drone

- planned air unit for telegraphed explosive attacks
- should be fragile and countered by detection, spacing, and anti-air
