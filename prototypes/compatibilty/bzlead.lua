-- adding items to the base item list
if casting_materials then
  local additions = {
    ["lead-plate"] = { liquid = "lava", ratio = 10, energy_required = 3.2 }, -- correct ratio but needs copper as byproduct just to be evil
  }
  for name, props in pairs(additions) do
    casting_materials[name] = props
  end
end

local casting_list = {
  "lead-plate", -- testing
  "lead-expansion-bolt", -- testing: iron and lead
  "firearm-magazine-iron-lead",
  "firearm-magazine-iron-only", -- since this exist, maybe the standard one shoudl be removed?
  "firearm-magazine-copper-lead",
}
batch_generate_castings(casting_list)