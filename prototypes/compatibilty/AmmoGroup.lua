local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")

--[[ try of automatically move all ammo recipes into the ammo group and their respective subgroups
local ammo_category_subgroups  = {
  ["bullet"] = "ammo-row-bullet",
  ["shotgun-shell"] = "ammo-row-shotgun-shell",
  ["rocket"] = "ammo-row-rockets",
  ["grenade"] = "ammo-row-grenade",
  ["cannon-shell"] = "ammo-row-cannon-shell-magazine",
  ["artillery-shell"] = "ammo-row-artillery-shell",
  ["railgun"] = "ammo-row-railgun-ammo",

  -- mortar ammunition
  ["mortar-ammo"] = "ammo-row-mortar-bomb",
  ["physical-mortar-ammo"] = "ammo-row-physical-mortar-ammo",
  ["strategy-mortar-ammo"] = "ammo-row-strategy-mortar-ammo",
  ["electric-mortar-ammo"] = "ammo-row-electric-mortar-ammo",
}

if data.raw["item-group"]["ammo"] then
  -- Move existing subgroups into the ammo group.
  if data.raw["item-subgroup"]["alternative-ammo"] then
    data.raw["item-subgroup"]["alternative-ammo"].group = "ammo"
  end
  if data.raw["item-subgroup"]["mortar-ammo"] then
    data.raw["item-subgroup"]["mortar-ammo"].group = "ammo"
  end

  local recipe_subgroups = {}

  for _, recipe in pairs(data.raw.recipe) do
    for _, result in pairs(recipe.results or {}) do
      local ammo = data.raw.ammo[result.name]

      if ammo then
        local subgroup = ammo_category_subgroups[ammo.ammo_category]

        if subgroup and data.raw["item-subgroup"][subgroup] then
          recipe_subgroups[recipe.name] = subgroup
          recipe.group = "ammo"
        end

        break
      end
    end
  end

  oc_recipe.change_recipes_subgroup(recipe_subgroups)
  -- oc_recipe.change_recipes_group(recipe_subgroups, "ammo")
end
-- ]]

-- [[
if data.raw["item-group"]["ammo"] then
  data.raw["item-subgroup"]["alternative-ammo"].group = "ammo"
  if data.raw["item-subgroup"]["mortar-ammo"] then
    data.raw["item-subgroup"]["mortar-ammo"].group = "ammo"
  end
  -- this means all my subgroup definitions still are fine within the new group

  local mapping = {
    -- bullet ammo
    ["tungsten-rounds-magazine"] = "ammo-row-bullet",
    ["oc-casting-firearm-magazine"] = "ammo-row-bullet",
    ["oc-casting-piercing-rounds-magazine"] = "ammo-row-bullet",
    ["oc-casting-uranium-rounds-magazine"] = "ammo-row-bullet",
    ["oc-casting-tungsten-rounds-magazine"] = "ammo-row-bullet",
    -- shotgun ammo
    ["tungsten-shotgun-shell"] = "ammo-row-shotgun-shell",
    ["uranium-shotgun-shell"] = "ammo-row-shotgun-shell",
    ["oc-casting-shotgun-shell"] = "ammo-row-shotgun-shell",
    ["oc-casting-piercing-shotgun-shell"] = "ammo-row-shotgun-shell",
    ["oc-casting-tungsten-shotgun-shell"] = "ammo-row-shotgun-shell",
    ["oc-casting-uranium-shotgun-shell"] = "ammo-row-shotgun-shell",
    -- bio rockets
    ["oc-bio-rocket"] = "ammo-row-rockets",
    ["oc-bio-explosive-rocket"] = "ammo-row-rockets",
    ["oc-cryo-atom-bomb"] = "ammo-row-rockets",
    -- cannon shells
    ["tungsten-cannon-shell-magazine"] = "ammo-row-cannon-shell-magazine",
    ["oc-casting-tungsten-cannon-shell-magazine"] = "ammo-row-cannon-shell-magazine",
    -- mortar ammo
    ["oc-cryo-mortar-light-nuclear-ammo"] = "ammo-row-mortar-bomb",
    ["oc-casting-mortar-shrapnel-ammo"] = "ammo-row-physical-mortar-ammo",
    ["oc-casting-mortar-bomb"] = "ammo-row-mortar-bomb",
    ["oc-casting-mortar-cluster-bomb"] = "ammo-row-mortar-bomb",
    ["oc-casting-mortar-fire-bomb"] = "ammo-row-strategy-mortar-ammo",
    ["oc-casting-mortar-poison-bomb"] = "ammo-row-strategy-mortar-ammo",
    ["oc-casting-mortar-heavy-ammo"] = "ammo-row-physical-mortar-ammo",
    ["oc-pulse-mortar-energy-ammo"] = "ammo-row-electric-mortar-ammo",
    -- artillery shells
    ["heavy-artillery-shell"] = "ammo-row-artillery-shell",
    ["heavy-artillery-shell-upgrading"] = "ammo-row-artillery-shell",
    ["heavy-artillery-shell-with-uranium"] = "ammo-row-artillery-shell",
    ["heavy-artillery-shell-upgrading-with-uranium"] = "ammo-row-artillery-shell",
    ["nuclear-artillery-shell"] = "ammo-row-artillery-shell",
    ["oc-casting-heavy-artillery-shell"] = "ammo-row-artillery-shell",
    ["oc-casting-heavy-artillery-shell-with-uranium"] = "ammo-row-artillery-shell",
    ["oc-cryo-nuclear-artillery-shell"] = "ammo-row-artillery-shell",
    -- railgun ammo
    ["tungsten-railgun-ammo"] = "ammo-row-railgun-ammo",
    ["oc-casting-railgun-ammo"] = "ammo-row-railgun-ammo",
    ["oc-casting-tungsten-railgun-ammo"] = "ammo-row-railgun-ammo",
  }
  oc_recipe.change_recipes_subgroup(mapping)
else
  local mapping = {
    -- base ammo
    ["oc-casting-firearm-magazine"] = "ammo",
    ["oc-casting-piercing-rounds-magazine"] = "ammo",
    ["oc-casting-uranium-rounds-magazine"] = "ammo",
    ["oc-casting-tungsten-rounds-magazine"] = "ammo",
    ["oc-casting-shotgun-shell"] = "ammo",
    ["oc-casting-piercing-shotgun-shell"] = "ammo",
    ["oc-casting-cannon-shell"] = "ammo",
    ["oc-casting-uranium-cannon-shell"] = "ammo",
    ["oc-casting-tungsten-cannon-shell"] = "ammo",
    ["oc-casting-tungsten-shotgun-shell"] = "ammo",
    ["oc-casting-railgun-ammo"] = "ammo",
    ["oc-casting-tungsten-railgun-ammo"] = "ammo",
    -- explosive ammo
    ["oc-casting-explosive-cannon-shell"] = "ammo",
    ["oc-casting-explosive-uranium-cannon-shell"] = "ammo",
    ["oc-casting-artillery-shell"] = "ammo",
    ["oc-casting-medium-artillery-shell"] = "ammo",
    ["oc-casting-heavy-artillery-shell"] = "ammo",
    -- bio rockets
    ["oc-bio-rocket"] = "ammo",
    ["oc-bio-explosive-rocket"] = "ammo",
    -- scattergun turret aka modular turret mod
    ["oc-casting-uranium-shotgun-shell"] = "ammo",
    ["oc-casting-fragmentation-shell"] = "ammo",
    -- vtk cannon turret mod
    ["oc-casting-cannon-turret"] = "ammo",
    ["oc-casting-cannon-turret-heavy"] = "ammo",
    ["oc-casting-cannon-shell-magazine"] = "ammo",
    ["oc-casting-uranium-cannon-shell-magazine"] = "ammo",
    ["oc-tungsten-cannon-shell-magazine"] = "ammo",
    ["oc-casting-tungsten-cannon-shell-magazine"] = "ammo",
  }
  oc_recipe.change_recipes_subgroup(mapping)
end
-- ]]
