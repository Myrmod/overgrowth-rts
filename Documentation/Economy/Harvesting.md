# Harvesting Mechanics

## Scope

This file defines shared harvesting vocabulary and constraints. Exact faction units, structures,
drop-off rules, depletion behavior, and lore framing live in the faction overview files.

## Shared Rules

- Base resource per vine tile starts at 500.
- ResourceTiles hold the resource amount used by all economy models.
- ResourceSpawners define the center of a resource field.
- A resource tile can be claimed by only one active economy interaction at a time.
- Cargo-based gatherers lose carried resources if they are destroyed before delivery.
- Economy actions that retarget after a tile disappears should do so through deterministic command execution.
- Faction docs define whether a model uses cargo delivery, passive linking, direct conversion, field modification, or another specialized loop.

## Faction Implementations

- [The Amuns](../Factions/Amuns/The_Amuns.md#economy)
- [The Radix](../Factions/Radix/The_Radix.md#economy)
- [The Legion](../Factions/The_Legion/The_Legion.md#economy)
- [The Remnants](../Factions/Remnants/The_Remnants.md#economy)

