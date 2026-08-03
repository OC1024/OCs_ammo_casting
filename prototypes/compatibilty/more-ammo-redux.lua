local generator_api = require("__OCs_base_assets__.prototypes.utils.api")
local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")
local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")

-- these will only be created if the base-recipe exists
local casting_ammo = {
  ["empty-magazine"] = "metallurgy",
  ["hp-rounds-magazine"] = "metallurgy",  -- hollow point
  ["fmj-rounds-magazine"] = "metallurgy", -- full metal jacket
  ["sp-rounds-magazine"] = "metallurgy",  -- soft point
  ["acid-rounds-magazine"] = "organic",
  ["fire-rounds-magazine"] = "organic",
  ["he-rounds-magazine"] = "organic", -- high explosives

  ["high-capacity-empty-magazine"] = "metallurgy",
  ["high-capacity-firearm-magazine"] = "metallurgy",
  ["high-capacity-piercing-rounds-magazine"] = "metallurgy",
  ["high-capacity-uranium-rounds-magazine"] = "metallurgy",

  ["high-capacity-hp-rounds-magazine"] = "metallurgy",
  ["high-capacity-fmj-rounds-magazine"] = "metallurgy",
  ["high-capacity-sp-rounds-magazine"] = "metallurgy",
  ["high-capacity-acid-rounds-magazine"] = "organic",
  ["high-capacity-fire-rounds-magazine"] = "organic",
  ["high-capacity-he-rounds-magazine"] = "organic",

  ["empty-shotgun-shell"] = "metallurgy",
  ["uranium-shotgun-shell"] = "metallurgy", -- overwrite

  ["high-capacity-empty-shotgun-shell"] = "metallurgy",
  ["high-capacity-shotgun-shell"] = "metallurgy",
  ["high-capacity-piercing-shotgun-shell"] = "metallurgy",
  ["high-capacity-uranium-shotgun-shell"] = "metallurgy",
}

local ammo_unlock_tech = {
  ["oc-casting-empty-magazine"] = "casting-light-ammo-tech",
  ["oc-casting-hp-rounds-magazine"] = "casting-light-ammo-tech",  -- hollow point
  ["oc-casting-fmj-rounds-magazine"] = "casting-light-ammo-tech", -- full metal jacket
  ["oc-casting-sp-rounds-magazine"] = "casting-light-ammo-tech",  -- soft point
  ["oc-bio-acid-rounds-magazine"] = "bio-grenades-tech",
  ["oc-bio-fire-rounds-magazine"] = "bio-grenades-tech",
  ["oc-bio-he-rounds-magazine"] = "bio-grenades-tech", -- high explosives

  ["oc-casting-high-capacity-empty-magazine"] = "casting-heavy-ammo-tech",
  ["oc-casting-high-capacity-firearm-magazine"] = "casting-heavy-ammo-tech",
  ["oc-casting-high-capacity-piercing-rounds-magazine"] = "casting-heavy-ammo-tech",
  ["oc-casting-high-capacity-uranium-rounds-magazine"] = "casting-heavy-ammo-tech",

  ["oc-casting-high-capacity-hp-rounds-magazine"] = "casting-heavy-ammo-tech",
  ["oc-casting-high-capacity-fmj-rounds-magazine"] = "casting-heavy-ammo-tech",
  ["oc-casting-high-capacity-sp-rounds-magazine"] = "casting-heavy-ammo-tech",
  ["oc-bio-high-capacity-acid-rounds-magazine"] = "bio-grenades-tech",
  ["oc-bio-high-capacity-fire-rounds-magazine"] = "bio-grenades-tech",
  ["oc-bio-high-capacity-he-rounds-magazine"] = "bio-grenades-tech",

  ["oc-casting-empty-shotgun-shell"] = "casting-heavy-ammo-tech",
  -- ["uranium-shotgun-shell"] = "metallurgy", -- overwrite

  ["oc-casting-high-capacity-empty-shotgun-shell"] = "casting-heavy-ammo-tech",
  ["oc-casting-high-capacity-shotgun-shell"] = "casting-heavy-ammo-tech",
  ["oc-casting-high-capacity-piercing-shotgun-shell"] = "casting-heavy-ammo-tech",
  ["oc-casting-high-capacity-uranium-shotgun-shell"] = "casting-heavy-ammo-tech",
}

-- these will only be added if the base tech exists
local extra_prereq = {
  ["casting-light-ammo-tech"] = "advanced-ammo",
  ["casting-heavy-ammo-tech"] = { "high-capacity-advanced-ammo", "high-capacity-shotgun-shells", },
  ["bio-grenades-tech"] = { "chemical-ammo", "high-capacity-chemical-ammo" }
}

if settings.startup["u238-slug-shell"].value and not settings.startup["uranium-shotgun-shell"].value then
  casting_ammo["uranium-shotgun-shell"] = "metallurgy"
  ammo_unlock_tech["oc-casting-uranium-shotgun-shell"] = "casting-heavy-ammo-tech"
end

generator_api.batch_generator(casting_ammo)
oc_tech.add_recipe_unlocks(ammo_unlock_tech)
oc_tech.add_prerequisites(extra_prereq)
