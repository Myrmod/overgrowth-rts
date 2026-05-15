# General Resource Rules

## Scope

This file defines only the shared economy rules that apply across factions. Faction-specific
harvesting identities, units, structures, and exceptions live in the faction overview files:

- [The Amuns](../Factions/Amuns/The_Amuns.md)
- [The Radix](../Factions/Radix/The_Radix.md)
- [The Legion](../Factions/The_Legion/The_Legion.md)
- [The Remnants](../Factions/Remnants/The_Remnants.md)

## Shared Economy Rules

- Starting resources are 10k.
- Resource fields spawn as ResourceTiles around a ResourceSpawner.
- Base max resource per tile is 500.
- Multiple players can contest the same field.
- The global ProductionQueue is a shared HUD feature for all factions.
- It can represent both queued production and tracked on-field construction progress.
- Queue entries expose the produced entity name on hover for quick identification.
- Faction pages define whether a harvesting model depletes, preserves, burns, or modifies resource tiles.

## Risk and Loss Rules

- If a cargo-based gatherer dies while carrying resources, those carried resources are lost.

## Tile Access Rules

- One tile can be affected by one active economy interaction at a time.
- This lock prevents multiple units or systems from claiming the same tile simultaneously.
