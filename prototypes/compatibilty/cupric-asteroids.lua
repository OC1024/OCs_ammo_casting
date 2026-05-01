-- cupric-asteroids
local generator_api = require("__OCs_base_assets__.prototypes.utils.api")
local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")
local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")

local casting_dict = {
  ["smart-rounds-magazine"] = "metallurgy"-- could be electromagnetics, too
}
generator_api.batch_generator(casting_dict)

local recipe_unlock_mapping = {
  ["oc-casting-smart-rounds-magazine"] = "casting-light-ammo-tech"
}
oc_tech.add_recipe_unlocks(recipe_unlock_mapping)