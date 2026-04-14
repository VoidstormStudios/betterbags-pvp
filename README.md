# BetterBags - PvP Gear

A plugin for [BetterBags](https://www.curseforge.com/wow/addons/betterbags) that adds a dedicated
**PvP Gear** category, allowing you to easily distinguish your PvP items from PvE gear at a glance.

## Requirements

- [BetterBags](https://www.curseforge.com/wow/addons/betterbags)

## How It Works

Items are categorized by matching their name against a list of known PvP gear name prefixes for the current season. This plugin should be very lightweight because of this.

## Seasonal Updates

PvP gear naming conventions change each season. To update for a new season, open `filter.lua` and
add the new season's honor and conquest gear prefixes to the `PVP_NAME_PATTERNS` table:

```lua
local PVP_NAME_PATTERNS = {
    "Galactic Aspirant's",   -- Season 1 Honor (12.0)
    "Galactic Gladiator's",  -- Season 1 Conquest (12.0)
    "New Season Prefix",     -- Season 2 Honor (12.x)
}
```

## Current Season Patterns (Midnight Season 1 - 12.0)

| Tier     | Prefix                |
|----------|-----------------------|
| Honor    | Galactic Aspirant's   |
| Conquest | Galactic Gladiator's  |
| Warmode  | Galactic Warmonger's  |

## Installation

### CurseForge / Wago
Install and update automatically via the CurseForge or Wago app.

### Manual
1. Download the latest release zip
2. Extract the `BetterBags_PVP` folder into:
   `World of Warcraft/_retail_/Interface/AddOns/`
3. Reload in game

## Attribution

- Plugin architecture and BetterBags API usage informed by
  [BetterBags - BoE, WuE & BoA](https://www.curseforge.com/wow/addons/betterbags-boe-wue-boa)
  by [Avyiel](https://github.com/Avyiel), licensed under MIT.
- Developed with the assistance of [Claude](https://claude.ai) by Anthropic.

## License

MIT — see [LICENSE](LICENSE)