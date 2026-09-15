local generator_api = require("__OCs_base_assets__.prototypes.utils.api")
local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")
local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")

-- ===  adding casting/bio recipes to the productivity-tech (also a K2SO patch inclusive) ===

local OC_ammo = {
  "tungsten-cannon-shell",
  "tungsten-railgun-ammo",
  "heavy-artillery-shell",
  "heavy-artillery-shell-upgrading", --no casting but *shrug*
}

local heavy_ammo = {}
for _, r in ipairs(OC_ammo) do
  table.insert(heavy_ammo, r) -- standard recipe
  table.insert(heavy_ammo, "oc-casting-" .. r)
end

-- building the all_bullets table
local rockets = {
  "oc-bio-explosive-rocket",
  "oc-bio-rocket",
  "oc-bio-grenade", -- not a rocket
  "oc-bio-cluster-grenade",
}

-- now iterate and add all these to the tech
local tech_recipe_boni = {
  ["research_heavy_ammo"] = heavy_ammo,
  ["research_rockets"] = rockets,
}

for tech_name, _ in pairs(tech_recipe_boni) do
  for _, recipe_name in ipairs(heavy_ammo) do
    oc_tech.add_productivity_bonus(tech_name, recipe_name, 0.1)
  end
end
