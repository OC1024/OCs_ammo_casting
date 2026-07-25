local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")
local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")


if data.raw["item-group"]["ammo"] then
  data.raw["item-subgroup"]["alternative-ammo"].group = "ammo"
  -- this means all my subgroup definitions still are fine within the new group

  local mapping = {
    ["heavy-artillery-shell-upgrading"] = "ammo-row-artillery-shell",
    ["oc-casting-tungsten-cannon-shell-magazine"] = "ammo-row-cannon-shell-magazine",
    ["oc-cryo-mortar-light-nuclear-ammo"] = "ammo-row-mortar-bomb",
    ["oc-casting-mortar-shrapnel-ammo"] = "ammo-row-physical-mortar-ammo",
    ["oc-casting-mortar-heavy-ammo"] = "ammo-row-physical-mortar-ammo",
    ["oc-pulse-mortar-energy-ammo"] = "ammo-row-electric-mortar-ammo",
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
