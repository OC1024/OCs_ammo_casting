--  load api
local generator_api = require("__OCs_base_assets__.prototypes.utils.api")

-- -- adding items to the base item list
-- if casting_materials then
--   local additions = {
--     ["lead-plate"] = { fluid = "molten-lead", ratio = 10, energy_required = 1.6 }, -- originally 3.2 for 2lead-plate but normalized to one plate
--   }
--   for name, props in pairs(additions) do
--     casting_materials[name] = props
--   end
--   -- log the new version of the casting_materials table
--   local keys = {}
--   for k in pairs(casting_materials) do table.insert(keys, k) end
--   table.sort(keys)
--   debug_log("Current casting_materials: " .. table.concat(keys, ", "),"generator")
-- end


-- Add/Change order of Alternative Receptes
local alternatives = {
  ["molten-lead"] = {"molten-lead","molten-lead-from-lava"},
  ["lead-plate"] = {"casting-lead","lead-plate",},
  ["lead-expansion-bolt"] = {"casting-lead-expansion-bolt","lead-expansion-bolt"},
  ["firearm-magazine"] = {"firearm-magazine-iron-only","firearm-magazine-iron-lead","firearm-magazine-copper-lead","firearm-magazine","casting-firearm-magazine"},
  -- ["shotgun-shell"] = {"shotgun-shell"},
}
generator_api.register_category_alt_recipes("metallurgy", alternatives)


local casting_dict = {
  -- ["lead-plate"] = "metallurgy", -- base material, should be stay the same or be rejected
  -- ["lead-expansion-bolt"] = "metallurgy", -- testing consistency: already exist. expect 50:50 molten-lead:molten-iron for 10 bolts
  ["lead-chest"] = "metallurgy",
  ["lithium-lead-eutectic"]= "metallurgy",
  -- recalculate the iron-based bullets, they are now made from lead instead.
  ["firearm-magazine"] = "metallurgy",
  ["piercing-rounds-magazine" ]= "metallurgy",
  ["shotgun-shell"] = "metallurgy",
  ["piercing-shotgun-shell"] = "metallurgy",
  ["uranium-shotgun-shell"] = "metallurgy",
  ["tungsten-shotgun-shell"] = "metallurgy",
  ["tungsten-rounds-magazine"] = "metallurgy",
}
generator_api.batch_generator(casting_dict)

local mapping = { -- it seems that lead is a early game material so casting shall be ASAP.
  -- ["lead-plate"] = {"foundry"},
  ["casting-lead-expansion-bolt"] = {"foundry"}, -- to be sure it is there as the mod wants it.
  ["casting-lead-chest"] = {"foundry"}, -- base item instantly craftable but casting still needs the foundry to be useful. avoid cluttering
  ["casting-lithium-lead-eutectic"] = {"fusion-reactor"}, -- this should be moved to another mod, not the ammo mod but eh, who cares?
}
add_recipe_unlocks(mapping)