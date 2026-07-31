local generator_api = require("__OCs_base_assets__.prototypes.utils.api")
local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")
local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")


-- creating new recipes
local casting_dict = {
  ["chemical-rocket"] = "organic",
  ["incendiary-rocket"] = "organic",
}
generator_api.batch_generator(casting_dict)

-- add recipes to technology
local recipe_unlock_mapping = {
  ["oc-bio-incendiary-rocket"] = { "bio-rocketry-tech" },
  ["oc-bio-chemical-rocket"] = { "bio-rocketry-tech" },
}
oc_tech.add_recipe_unlocks(recipe_unlock_mapping)
