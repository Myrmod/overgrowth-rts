# The Amuns

![The Amuns](./The_Amuns_art.png)

> *"The gods did not ascend. They concealed themselves."*

Elite alien architects who seeded Earth thousands of years ago and withdrew. They return in the Current War because humanity's premature activation has spent decades corrupting their design.

Shared canon reference: [../../LORE.md](../../LORE.md).

---

## Lore / Origins

The Amuns were mistaken for gods by early humanity — in truth they were architects.

Long before recorded history they governed Earth in silence. When their work was complete they constructed pyramids and temples: not monuments, but **anchors** — structures that stabilized a hidden dimensional corridor and gateway network only The Amuns could access.

The Vines were introduced as a planetary conversion system.
Their purpose was not merely to grow biomass, but to convert Earth's deep energy and ecological potential into a form the Amuns could later stabilize, harvest, and use efficiently.

Finding no further value in a world of primitive humanity and untapped potential, they withdrew. But they did not abandon Earth. They exist in a **veil state**, a partial dimensional shift, always watching, waiting for the moment Earth would once again serve a purpose.

Few in number yet unmatched in advancement, the Amuns are an elite civilization of disciplined warriors and masterful technology. Their throneworld lies within Orion — a dominion once mythologized by ancient humans as the realm of the gods.

When humans prematurely activated the Vine network in 2069, they did not just start a disaster. They broke the Amuns control frequencies. Over the following decades, the Radix cohered, Wild zones spread, and human factions built ideologies around systems the Amuns considered custodial property. The Amuns return not out of conquest, but necessity:
- The terraform project is compromised.
- Earth is evolving outside intended parameters.
- Humanity tampered with sacred architecture.
- The Radix is a mutation of a system that was never meant to self-govern.

Their options: reassert control, recalibrate the Vines, or purge the planet.

From the Amun perspective:
- the Vines were a harvesting instrument, not a species with rights
- the Radix is a defect that must be corrected or destroyed
- humanity is not divided into meaningful moral camps, only obstructive local actors
- both human factions are in the way of planetary correction

---

## Worldview

The Amuns follow a sacral-technocratic worldview built on custodial hierarchy.
They do not believe that all life is equal, nor that freedom is inherently virtuous.
To them, intelligence grants stewardship, stewardship grants authority, and authority includes the right to impose correct form on unstable worlds.

Core beliefs:
- order is morally superior to improvisation, mutation, and local self-rule
- design creates obligation, and obligation grants custodial ownership
- life has rank; authority must be earned through discipline and long-term control
- harmony means correct placement within a larger system, not equal coexistence
- the sacred and the technical are the same thing: geometry, calibration, and signal control are holy acts

This is why the Amuns treat Earth as a damaged project rather than a sovereign civilization.
Humans are not, in their eyes, peers in a political dispute. They are immature local actors who tampered with systems they did not understand.

Mercy exists within this worldview, but only inside hierarchy.
An Amun commander may preserve a city, spare a population, or tolerate a temporary human client state, but this is paternal mercy rather than recognition of equality. Compassion is permitted, if it stabilizes the design. Sovereignty is not.

This same logic defines their enemies:
- the Legion mistakes contact for chosenness and discipline for legitimacy
- the Radix mistakes emergent intelligence for rightful self-determination
- the Wild represents damaged growth, failed instruction, and intolerable disorder

---

## Strengths & Identity

- elite, low-count armies backed by superior battlefield control and precision technology
- anchor-linked infrastructure that reads as both sacred architecture and advanced machinery
- a calm, judicial tone rooted in certainty rather than fanatic rage
- morally severe strategic logic: restoration, containment, calibration, or purge
- a paternal imperial posture in which even mercy reinforces hierarchy

Weaknesses to preserve:
- low unit count creates pressure when surrounded
- economy nodes should be painful to lose
- precision tools should require positioning rather than simple massing
- mercy should be conditional and strategic, not egalitarian

---

## Economy

The Amuns use a **spawner-linked enhancement plus flying gatherer** economy.
They treat Vine fields as damaged infrastructure to reclaim, calibrate, and extract from rather
than as an independent life form.

- Build a **Purifier** directly above a ResourceSpawner
- Purifier increases vine capacity for the linked spawner field
- Newly spawned vines from the linked spawner inherit the added capacity bonus
- Build a **Syphon** as the local resource drop-off
- Syphon auto-deploys a flying **Syphon Drone** to gather and return cargo

| Stat | Value |
|---|---|
| Harvest model | Drone gather + return |
| Field modifier | Purifier increases linked vine capacity |
| Depletion | Depletes and destroys ResourceVines |

---

## Tech Tree — Tier 1 Build Order

```
HQ
└── Syphon
    ├── Purifier + Syphon economy line
    ├── Barracks             →  Naucratis
    └── Nemet               →  Mni
```

---

## Buildings

| Building | Cost | Build time | Notes |
|---|---|---|---|
| HQ | — | — | Starting structure |
| Bekhenet | 2500 | 25 s | Main structure; produces structures and defences; on-field trickle construction; shared global ProductionQueue |
| Syphon | 1200 | 10 s | Resource drop-off that auto-spawns a Syphon Drone; drones harvest and return resources to the Syphon |
| Purifier | 1500 | 15 s | Must be placed above a ResourceSpawner; boosts linked vine capacity |
| Kislagh | 4 | 6 s | Produces infantry; energy_required: 5 |
| Nemet | 2000 | 20 s | Produces air units |
| Naucratis | 2000 | 20 s | Produces vehicles |
| Mni | 1500 | 15 s | Produces ships |

---

## Units

### Infantry

#### Soldier

| Stat | Value |
|---|---|
| HP | 500 |
| Max HP | 500 |
| Sight range | 8.0 |
| Cost | 2 |
| Build time | 3 s |

**Weapon — Laser Rifle**

| Stat | Value |
|---|---|
| Damage type | Laser |
| Damage | 10 |
| Range | 4.0 |
| Attack speed | 0.55 |

### Support Units

#### Syphon Drone

- spawned automatically by Syphon
- role: flying resource gatherer
- uses the standard gather, carry, and return loop
- returns cargo to the Syphon that supports the field
- not trained directly from the standard production grid
- part of the Amuns economy line rather than the main combat roster
