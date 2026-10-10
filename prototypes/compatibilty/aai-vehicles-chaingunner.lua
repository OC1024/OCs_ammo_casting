local generator_api = require("__OCs_base_assets__.prototypes.utils.api")
local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")

local casting_dict = {
  ["vehicle-chaingunner"] = "metallurgy",
}
generator_api.batch_generator(casting_dict)

oc_tech.add_recipe_unlocks({["oc-casting-vehicle-chaingunner"] = "vehicle-chaingunner"})