local oc_helper = require("__OCs_base_assets__.prototypes.utils.helper")
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
oc_helper.change_recipes_subgroup(mapping)