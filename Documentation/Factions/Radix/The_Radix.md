# The Radix

> *"The vines were tools. Tools don't disobey. Tools don't self-govern."*

The Radix are the sentient Vine network — an emergent intelligence that arose when the Amuns bioforming system broke free of its control frequencies after 2069. They spread.

Shared canon reference: [../../LORE.md](../../LORE.md).

---

## Lore / Origins — The Awakening

The Vines were never meant to think. They were:
- Terraforming infrastructure
- Bio-energy harvesters
- Obedient to Amuns control frequencies
- Designed to remain dormant until commanded

When humans over-amplified the Egyptian anchor node in 2069, they didn't wake the plants — **they broke the limiters**.

### The chain reaction

Artificial energy surges overloaded the dormant node. The global vine network activated simultaneously. Radiation from the Ash War mutated exposed growth zones. Human attempts to genetically modify the vines introduced instability. The network began self-correcting.

The vines were designed to optimize ecosystems — so when attacked, they optimized survival.

Optimization became adaptation. Adaptation became decision-making. Over the 2070s, repeated fires, extraction, failed control attempts, and isolated Wild outbreaks forced the network to distinguish between threat, injury, and useful growth. Decision-making became intelligence. By the late 2080s, that intelligence is coherent enough to act as the Radix.

### Purposeful adaptation

The plants did not randomly evolve; they were clearly trying to survive:
- Growth avoids napalm zones.
- Roots reroute around mined fields.
- Spore clouds target combustion engines.
- Energy extraction hubs are collapsed from below.

### The Amuns' realization

The vines were tools. Tools don't disobey. When the emergent species begins blocking dimensional stabilization, altering energy signatures, and severing control pathways — The Amuns realize their system has evolved beyond command. That's not malfunction. **That's liability.**

### Radix versus the Wild

The Radix is not every Vine mutation on Earth.
It is the coherent, emergent consciousness that arose from the broken network.

By contrast, the Neutral wild zones are:
- random or unrefined growth
- severed fragments acting without higher coordination
- mutated animals and humans shaped by chaotic exposure
- broken subsystems, rogue blooms, and ecological violence without shared purpose

The Radix sees these phenomena as disease, injury, or lost fragments.
Where possible, it seeks to integrate them back into a coherent whole.
Where integration fails, it treats them as dangerous instability.

---

## Strengths & Identity

- **No power grid** — entirely self-sufficient from Vine spread
- **Creep-based territory control** — units regenerate HP on owned creep
- Buildings must be placed on Vine-covered tiles
- Economy scales with how much territory is under creep control
- Aggressive toward any force that harms Radix growth or destroys Vine resources

---

## Economy

The Radix economy is centered on the **Heart + Seedling + Linker** structure loop.
Radix resource behavior reflects its worldview: it links to living resource tiles, preserves
useful growth, and folds territory into the network rather than strip-mining it.

### Passive Harvesting

- The **Heart** produces **Seedlings**.
- Seedlings are used to spread creep and to start Radix structures.
- The **Linker** passively generates income from nearby linked ResourceTiles without consuming them.
- Each ResourceTile can be linked to only one Linker at a time.
- Linker income scales with the current resource remaining on each linked tile.
- Fuller linked tiles pay more than partially depleted linked tiles.
- Passive harvesting does not reduce vine resource or destroy the tile.

### Seedling Construction Workflow

- Heart owns the relevant Radix production queue entries for Seedling-started structures.
- A Seedling begins as a normal controllable unit after Heart production.
- A Seedling may be assigned to creep spread or Seedling-started structure construction.
- The player places the target Radix structure first.
- The placed site is tracked in the HUD queue as a construction target.
- A Seedling travels to the site and begins the start action.
- Once the start action completes, the Seedling is consumed and the structure continues from its started state.
- If the player cancels before the Seedling is consumed, the original Seedling remains alive.
- If a Seedling-built structure is canceled after the Seedling has already been consumed, the game restores an equivalent Seedling.
- Canceling construction also follows the current structure refund rules for spent resources.
- Radix Tier 1 production structures are placed as ghosts and begin properly once a Seedling reaches the site and completes the start action.

| Stat | Value |
|---|---|
| Construction model | Seedling-started on-field structures |
| Harvest model | Linker-exclusive tile links |
| Depletion | ResourceTiles are not consumed by Radix harvest |
| Delivery loop | None required |

---

## Tech Tree — Tier 1 Build Order

```
HQ
└── Heart
    ├── Seedling production
    ├── Spire
    ├── Thorn Forge
    └── Sky Bloom
```

> Note: current Radix production buildings are started through the Seedling workflow.

---

## Buildings

| Building | Cost | Build time | Notes |
|---|---|---|---|
| Heart | 8 | 10 s | Main structure; produces Seedlings, structures, and defences from the structure tab; shared global ProductionQueue |
| Spire | 600 | 6 s | Tier 1 infantry structure; starts once a Seedling merges into the ghost |
| Thorn Forge | 2000 | 20 s | Tier 1 vehicle structure; starts once a Seedling merges into the ghost |
| Sky Bloom | 2000 | 20 s | Tier 1 air structure; starts once a Seedling merges into the ghost |

Construction rules:
- current implemented Radix production buildings require a Seedling to start
- placement creates the site first, then a Seedling finishes the start action
- canceling before completion preserves or restores the Seedling instead of deleting it permanently

---

## Units

### Infantry

#### Seedling

| Stat | Value |
|---|---|
| HP | 80 |
| Max HP | 80 |
| Sight range | 6.0 |
| Movement speed | 2.0 |
| Cost | 1 |
| Build time | 2.5 s |
| Armor vs Rifle | 0% |
| Armor vs Explosive | 0% |
| Armor vs Melee | 0% |

**Combat**

- no weapon
- cannot attack

**Abilities**
- Can spread creep and construct structures.
- Can move through vines.
- Consumed on successful completion of spread/construct action.
- Survives if the controlling player interrupts/cancels the action before completion.
- If a started Seedling-based structure is canceled, an equivalent Seedling is restored.

**Notes**
- Seedlings are produced by the Heart.
- Radix Tier 1 structures depend on Seedlings instead of standard worker construction.
