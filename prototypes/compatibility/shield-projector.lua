local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")
local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")
local generator_api = require("__OCs_base_assets__.prototypes.utils.api")

-- use generator_api
local casting_dict = {
    ["shield-projector"] = "electromagnetics",
}
generator_api.batch_generator(casting_dict)

-- add recipe category
local recipe_mapping = {
  ["shield-projector"] = "electromagnetics",
}
oc_recipe.add_crafting_categories(recipe_mapping)

-- add recipes to technology
local recipe_unlock_mapping = {
  ["oc-pulse-shield-projector"] = "shield-projector",
}
oc_tech.add_recipe_unlocks(recipe_unlock_mapping)
