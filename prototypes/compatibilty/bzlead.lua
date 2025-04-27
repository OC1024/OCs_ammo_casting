-- adding items to the base item list
if casting_materials then
  local additions = {
    ["lead-plate"] = { fluid = "molten-lead", ratio = 10, energy_required = 1.6 }, -- originally 3.2 for 2lead-plate but normalized to one plate
  }
  for name, props in pairs(additions) do
    casting_materials[name] = props
  end
  -- log the new version of the casting_materials table
  local keys = {}
  for k in pairs(casting_materials) do table.insert(keys, k) end
  table.sort(keys)
  debug_log("Current casting_materials: " .. table.concat(keys, ", "),"generator")
end

if alternative_recipes then
  -- Add/Change order of Alternative Receptes
  local alternatives = {
    ["molten-lead"] = {"molten-lead","molten-lead-from-lava"},
    ["lead-plate"] = {"casting-lead","lead-plate",},
    ["lead-expansion-bolt"] = {"casting-lead-expansion-bolt","lead-expansion-bolt"}, -- luckily it is already there
    ["firearm-magazine"] = {"firearm-magazine-iron-only","firearm-magazine-iron-lead","firearm-magazine-copper-lead","firearm-magazine","casting-firearm-magazine"},
    ["shotgun-shell"] = {"shotgun-shell"},
  }
  for name, alt_list in pairs(alternatives) do
      alternative_recipes[name] = alt_list
  end
end

local casting_list = {
  -- "lead-plate", -- base material, should be stay the same or be rejected
  -- "lead-expansion-bolt", -- testing consistency: already exist. expect 50:50 molten-lead:molten-iron for 10 bolts
  "lead-chest",
  "lithium-lead-eutectic",
  -- recalculate the iron-based bullets, they are now made from lead instead.
  "firearm-magazine",
  "piercing-rounds-magazine",
  "shotgun-shell",
  "piercing-shotgun-shell",
  "uranium-shotgun-shell",
  "tungsten-shotgun-shell",
  "tungsten-rounds-magazine",
}
batch_generate_castings(casting_list)

local mapping = { -- it seems that lead is a early game material so casting shall be ASAP.
  -- ["lead-plate"] = {"foundry"},
  ["casting-lead-expansion-bolt"] = {"foundry"}, -- to be sure it is there as the mod wants it.
  ["casting-lead-chest"] = {"foundry"}, -- base item instantly craftable but casting still needs the foundry to be useful. avoid cluttering
  ["casting-lithium-lead-eutectic"] = {"fusion-reactor"}, -- this should be moved to another mod, not the ammo mod but eh, who cares?
}
add_recipe_unlocks(mapping)