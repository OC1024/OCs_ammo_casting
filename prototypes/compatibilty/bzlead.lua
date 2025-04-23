-- adding items to the base item list
if casting_materials then
  local additions = {
    ["lead-plate"] = { fluid = "lava", ratio = 10, energy_required = 3.2 }, -- correct ratio but needs copper as byproduct just to be evil
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
    ["lead-plate"] = {"lead-from-liquid-lead","lead-plate",},
    ["firearm-magazine"] = {"firearm-magazine-iron-only","firearm-magazine-iron-lead","firearm-magazine-copper-lead","firearm-magazine"},
    ["shotgun-shell"] = {"shotgun-shell"},
  }
  for name, alt_list in pairs(alternatives) do
      alternative_recipes[name] = alt_list
  end
end

local casting_list = {
  -- "lead-plate", -- base material, should be stay the same or be rejected
  "lead-expansion-bolt", -- testing: iron and lead
  "firearm-magazine-iron-lead",
  "firearm-magazine-iron-only", -- since this exist, maybe the standard one should be removed?
  "firearm-magazine-copper-lead",
}
batch_generate_castings(casting_list)

local mapping = { -- it seems that lead is a early game material so casting shall be ASAP
  -- ["lead-plate"] = {"foundry"},
  ["casting-lead-expansion-bolt"] = {"foundry"},
  ["casting-firearm-magazine-iron-lead"] = {"casting-light-ammo-tech"},
  ["casting-firearm-magazine-iron-only"] = {"casting-light-ammo-tech"},
  ["casting-firearm-magazine-copper-lead"] = {"casting-light-ammo-tech"},
}
add_recipe_unlocks(mapping)