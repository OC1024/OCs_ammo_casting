
local mapping = {
-- base ammo
    ["casting-firearm-magazine"] = "ammo",
    ["casting-piercing-rounds-magazine"] = "ammo",
    ["casting-uranium-rounds-magazine"] = "ammo",
    ["casting-tungsten-rounds-magazine"] = "ammo",
    ["casting-shotgun-shell"] = "ammo",
    ["casting-piercing-shotgun-shell"] = "ammo",
    ["casting-cannon-shell"] = "ammo",
    ["casting-uranium-cannon-shell"] = "ammo",
    ["casting-tungsten-cannon-shell"] = "ammo",
    ["casting-tungsten-shotgun-shell"] = "ammo",
    ["casting-railgun-ammo"] = "ammo",
    ["casting-tungsten-railgun-ammo"] = "ammo",
-- explosive ammo
    ["casting-explosive-cannon-shell"] = "ammo",
    ["casting-explosive-uranium-cannon-shell"] = "ammo",
    ["casting-artillery-shell"] = "ammo",
    ["casting-medium-artillery-shell"] = "ammo",
    ["casting-heavy-artillery-shell"] = "ammo",
-- bio rockets
    ["bio-rocket"] = "ammo",
    ["bio-explosive-rocket"] = "ammo",
-- scattergun turret aka modular turret mod
    ["casting-uranium-shotgun-shell"] = "ammo",
    ["casting-fragmentation-shell"] = "ammo",
-- vtk cannon turret mod
    ["casting-cannon-turret"] = "ammo",
    ["casting-cannon-turret-heavy"] = "ammo",
    ["casting-cannon-shell-magazine"] = "ammo",
    ["casting-uranium-cannon-shell-magazine"] = "ammo",
    ["casting-tungsten-cannon-shell-magazine"] = "ammo",
    ["tungsten-cannon-shell-magazine"] = "ammo",
}

local function set_recipes_subgroup_mapped(recipe_subgroup_map)
    for name, subgroup in pairs(recipe_subgroup_map) do
      local recipe = data.raw.recipe[name]
      if recipe then
        recipe.subgroup = subgroup
      else
        log("Warning: Recipe not found - " .. name)
      end
    end
  end

set_recipes_subgroup_mapped(mapping)