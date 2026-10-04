local generator_api = require("__OCs_base_assets__.prototypes.utils.api")
local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")
local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")

-- Add/Change order of Alternative Receptes
local alternatives = {
  ["firearm-magazine"] = {
    [100] = "firearm-magazine-iron-only",
    [80]  = "firearm-magazine-iron-lead",
    [60]  = "firearm-magazine-copper-lead",
    [40]  = "firearm-magazine",
    [20]  = "oc-casting-firearm-magazine"
  },
  -- ["shotgun-shell"] = {"shotgun-shell"},
}
generator_api.register_category_alt_recipes("metallurgy", alternatives)


local casting_dict = {
  -- adding new recipes
  ["firearm-magazine-iron-only"]  = "metallurgy",
  ["firearm-magazine-iron-lead"]  = "metallurgy",
  ["firearm-magazine-copper-lead"]  = "metallurgy",
  -- recalculate the iron-based bullets, they are now made from lead instead.
  ["firearm-magazine"] = "metallurgy",
  ["piercing-rounds-magazine"] = "metallurgy",
  ["shotgun-shell"] = "metallurgy",
  ["piercing-shotgun-shell"] = "metallurgy",
  ["uranium-shotgun-shell"] = "metallurgy",
  ["tungsten-shotgun-shell"] = "metallurgy",
  ["tungsten-rounds-magazine"] = "metallurgy",
}
generator_api.batch_generator(casting_dict)

local mapping = {
  ["oc-casting-firearm-magazine-iron-only"]  = "foundry",
  ["oc-casting-firearm-magazine-iron-lead"]  = "foundry",
  ["oc-casting-firearm-magazine-copper-lead"]  = "foundry",
}
oc_tech.add_recipe_unlocks(mapping)
