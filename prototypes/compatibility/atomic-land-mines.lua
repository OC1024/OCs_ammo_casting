
local generator_api = require("__OCs_base_assets__.prototypes.utils.api")
local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")
local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")

if settings.startup["nuclear-ammo"].value then
  local casting_dict = {
      ["atomic-land-mine"] = "cryogenics",
  }
  generator_api.batch_generator(casting_dict)
  oc_tech.add_prerequisites({ ["nuclear-ammo-tech"] = { "atomic-land-mine" } })
end

local mapping = {
    ["oc-cryo-atomic-land-mine"] = "alternative-ammo",
}
oc_recipe.change_recipes_subgroup(mapping)
