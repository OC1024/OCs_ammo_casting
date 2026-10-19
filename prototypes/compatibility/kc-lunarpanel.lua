local generator_api = require("__OCs_base_assets__.prototypes.utils.api")
local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")
local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")

-- add crafting category
local adding_cat = {
  ["kc-lunar-panel-equipment"] = "electromagnetics", -- kc-lunarpanel mod
}
oc_recipe.add_crafting_categories(adding_cat)