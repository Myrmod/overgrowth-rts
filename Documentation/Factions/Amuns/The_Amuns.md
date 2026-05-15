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
- projected construction through airborne anchor relays rather than conventional worker lines
- fortified anchor systems use precise walls, gates, defense beams, and utility pylons rather than improvised fortifications
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

The Amuns use a **field-modification plus cargo-return** economy.
They reclaim Vine fields as damaged infrastructure, improve the field with precision support structures, then extract value through specialized gatherers.

- Build a **Resource Siphon** as the local drop-off and gathering anchor.
- A Resource Siphon deploys a flying **Siphon Drone** to gather and return cargo.
- Build a **Field Purifier** directly above a ResourceSpawner.
- Field Purifier increases vine capacity for the linked spawner field.
- The **Architect** is the Amuns' ground engineer and backup cargo gatherer.
- Idle harvesters can use the shared auto-harvest toggle to retarget nearby resources automatically.

| Stat | Value |
|---|---|
| Harvest model | Siphon Drone and Architect cargo return |
| Field modifier | Field Purifier increases linked vine capacity |
| Drop-off | Resource Siphon |
| Depletion | Depletes and destroys ResourceVines |

---

## Tech Tree — Tier 1 Build Order

```
Command Anchor
├── Resource Siphon
│   └── Field Purifier
├── Infantry Gate
│   ├── Sentinel
│   ├── Prism Lancer
│   ├── Ankh Guard
│   ├── Calibration Adept
│   └── unlocks Vehicle Foundry / Harbor Gate pairing
├── Sky Dock
│   ├── Sky Cutter
│   ├── Veil Probe
│   ├── Relay Drone
│   ├── Pulse Interceptor
│   ├── Dawn Prism
│   └── unlocks Vehicle Foundry / Harbor Gate pairing
├── Vehicle Foundry
│   ├── Architect
│   ├── Tank
│   ├── Scarab Skimmer
│   ├── Resonance Chariot
│   ├── Obelisk Walker
│   └── Judicator Colossus
├── Harbor Gate
│   └── Aquatic Drone
├── Obelisk
│   └── Veil Pylon
└── Defences
    ├── Wall Pillar
    ├── Plasma Turret
    ├── Laser Turret
    ├── Pulse Turret
    └── Sensor Spire
```

---

## Buildings

| Building | Cost | Build time | Notes |
|---|---|---|---|
| Command Anchor | 2500 | 25 s | Main structure. Produces structures and defences. Current anchor for the Amun construction tree. |
| Resource Siphon | 1200 | 10 s | Resource drop-off that deploys a flying Siphon Drone. |
| Field Purifier | 1500 | 15 s | Must be placed above a ResourceSpawner; increases linked vine capacity. Requires Resource Siphon. |
| Infantry Gate | 4 | 6 s | Infantry production structure. Requires 5 energy. |
| Sky Dock | 2000 | 20 s | Aircraft production structure. |
| Vehicle Foundry | 2000 | 20 s | Ground vehicle production structure. Requires Command Anchor plus Infantry Gate or Sky Dock. |
| Harbor Gate | 1500 | 15 s | Naval production structure. Requires Command Anchor plus Infantry Gate or Sky Dock. |
| Obelisk | 800 | 14 s | Tech and upgrade structure; reactivates dormant systems. |
| Wall Pillar | 50 | 5 s | Heavy defensive wall segment for precise fortification lines. |
| Plasma Turret | 500 | 12 s | Anti-infantry turret. Rapid plasma fire for light ground pressure. |
| Laser Turret | 2 | 5 s | Anti-vehicle turret. Heavy cannon-style defence against armored ground targets. |
| Pulse Turret | 2 | 5 s | Anti-air turret. Rocket-based point defence versus aircraft. |
| Sensor Spire | 500 | 10 s | Static detector. Reveals stealth, mines, burrowed, and hidden threats. |
| Veil Pylon | 600 | 12 s | Utility defence. Projects invisibility to nearby allied structures. Requires Obelisk. |

Construction rules:
- Command Anchor currently handles structure and defence production through the shared queue systems.
- Vehicle Foundry and Harbor Gate are mid-tier structures gated behind the initial production network.
- Field Purifier is tied to resource infrastructure rather than general base expansion.
- Amun defences already cover anti-infantry, anti-vehicle, anti-air, walling, and detection / concealment utility.
- Relay Drone exists in the roster as the forward-deployment support craft for the faction's anchor theme.

---

## Units

### Infantry

| Unit | Cost | Build time | Role |
|---|---|---|---|
| Sentinel | 2 | 3 s | Core light infantry armed with a laser rifle. |
| Prism Lancer | 110 | 12 s | Anti-armor infantry with a slow, heavy prism beam. |
| Ankh Guard | 160 | 14 s | Heavy shield infantry for frontline protection. |
| Calibration Adept | 130 | 12 s | Support / utility infantry for cleanse, slow, reveal, and stabilization effects. |

### Vehicles

| Unit | Cost | Build time | Role |
|---|---|---|---|
| Architect | 2 | 3 s | Engineer and gatherer. Builds, repairs, and harvests. |
| Tank | 3 | 6 s | Basic armored vehicle with autocannon fire. |
| Scarab Skimmer | 200 | 14 s | Fast hover harassment vehicle for map control and raids. |
| Resonance Chariot | 400 | 18 s | Mobile anti-swarm vehicle with pulse / slow area pressure. |
| Obelisk Walker | 700 | 22 s | Siege walker for anti-structure pressure and long-range beam fire. |
| Judicator Colossus | 900 | 28 s | Superheavy late-game walker with broad threat coverage. |

### Air Units

| Unit | Cost | Build time | Role |
|---|---|---|---|
| Sky Cutter | 1 | 6 s | Versatile attack aircraft armed with rockets. |
| Siphon Drone | 2 | 5 s | Flying gatherer used by Resource Siphon structures. |
| Veil Probe | 250 | 14 s | Fast scout and detector aircraft. |
| Relay Drone | 450 | 18 s | Forward-deployment support craft for anchor-linked construction themes. |
| Pulse Interceptor | 450 | 18 s | Anti-air escort craft for hunting light aircraft. |
| Dawn Prism | 800 | 22 s | Bomber for anti-swarm and anti-structure splash pressure. |
| Sun Barge | 1100 | 30 s | Capital air finisher and late-game spectacle unit. |

### Naval Units

| Unit | Cost | Build time | Role |
|---|---|---|---|
| Aquatic Drone | 2 | 3 s | Light aquatic scout drone. |

### Support Units

#### Siphon Drone

- deployed by Resource Siphon structures
- role: flying resource gatherer
- uses the standard gather, carry, and return loop
- returns cargo to the Resource Siphon that supports the field
- not trained directly from the standard production grid
- part of the Amuns economy line rather than the main combat roster

#### Relay Drone

- support unit for structure deployment rather than harvesting
- flying unit that establishes a build radius for Amun structures
- intended to let the Amuns teleport or project structures into a precise forward area
- separate from the Siphon Drone economy role

#### Architect

- current support role for repair, construction, and cargo harvesting
- uses the shared harvester auto-harvest toggle when left idle near resources
- remains the faction's ground engineer while Relay Drone represents the forward anchor theme
