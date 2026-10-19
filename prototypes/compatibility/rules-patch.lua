-- 0. Load generator API
local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")
local generator_api = require("__OCs_base_assets__.prototypes.utils.api")

-- register alt recipes for generator API to save a bit of compuation power.
local new_alt_recipes = {
  ["organic"] = {
    alternative_recipes = {
      ["explosives"] = {
        [80] = "oc-bio-explosives",
        [60] = "explosives",
        [40] = "oc-bio-explosives-space",
        [20] = "oc-bio-explosives-gleba",
      },
      ["rocket"] = {
        [40] = "oc-bio-rocket",
        [20] = "rocket",
      },
      ["explosive-rocket"] = {
        [40] = "oc-bio-explosive-rocket",
        [20] = "explosive-rocket",
      },
      ["grenade"] = {
        [40] = "grenate",
        [20] = "oc-bio-grenade",
      },
    }
  },
  ["metallurgy"] = {
    alternative_recipes = {
      -- personal ammo
      ["firearm-magazine"] = {
        [40] = "oc-casting-firearm-magazine",
        [20] = "firearm-magazine"
      },
      ["piercing-rounds-magazine"] = {
        [40] = "oc-casting-piercing-rounds-magazine",
        [20] = "piercing-rounds-magazine"
      },
      ["uranium-rounds-magazine"] = {
        [40] = "oc-casting-uranium-rounds-magazine",
        [20] = "uranium-rounds-magazine"
      },
      ["tungsten-rounds-magazine"] = {
        [40] = "oc-casting-tungsten-rounds-magazine",
        [20] = "tungsten-rounds-magazine"
      },
      ["shotgun-shell"] = {
        [40] = "oc-casting-shotgun-shell",
        [20] = "shotgun-shell"
      },
      ["piercing-shotgun-shell"] = {
        [40] = "oc-casting-piercing-shotgun-shell",
        [20] = "piercing-shotgun-shell"
      },
      ["uranium-shotgun-shell"] = { -- if existent
        [40] = "oc-casting-uranium-shotgun-shell",
        [20] = "uranium-shotgun-shell"
      },
      ["tungsten-shotgun-shell"] = {
        [40] = "oc-casting-tungsten-shotgun-shell",
        [20] = "tungsten-shotgun-shell"
      },
      -- heavy ammo
      ["cannon-shell"] = {
        [40] = "oc-casting-cannon-shell",
        [20] = "cannon-shell"
      },
      ["uranium-cannon-shell"] = {
        [40] = "oc-casting-uranium-cannon-shell",
        [20] = "uranium-cannon-shell"
      },
      ["tungsten-cannon-shell"] = {
        [40] = "oc-casting-tungsten-cannon-shell",
        [20] = "tungsten-cannon-shell"
      },
      ["railgun-ammo"] = {
        [40] = "oc-casting-railgun-ammo",
        [20] = "railgun-ammo"
      },
      ["tungsten-railgun-ammo"] = {
        [40] = "oc-casting-tungsten-railgun-ammo",
        [20] = "tungsten-railgun-ammo"
      },
      ["artillery-shell"] = {
        [40] = "oc-casting-artillery-shell",
        [20] = "artillery-shell"
      },
      ["heavy-artillery-shell"] = {
        [60] = "oc-casting-heavy-artillery-shell",
        [40] = "heavy-artillery-shell",
        [20] = "heavy-artillery-shell-upgrading"
      },
      -- armour plating
      ["light-armour-plating"] = {
        [40] = "oc-casting-light-armour-plating",
        [20] = "light-armour-plating"
      },
      ["heavy-armour-plating"] = {
        [40] = "oc-casting-heavy-armour-plating",
        [20] = "heavy-armour-plating"
      },
      -- buildings
      ["gun-turret"] = {
        [40] = "oc-casting-gun-turret",
        [20] = "gun-turret"
      },
    }
  }
}
generator_api.register_multi_category_alt_recipes(new_alt_recipes)

-- register blacklist of items and categories
local blacklist_item = {
  "defender-capsule",
  "distractor-capsule",
  "destroyer-capsule",
}
generator_api.register_all_item_blacklist(blacklist_item)

generator_api.register_item_blacklist("organic", "explosives") -- for convenience. Now this must be an intermediate step
