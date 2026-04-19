--  load api
local generator_api = require("__OCs_base_assets__.prototypes.utils.api")
local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")
local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")

-- increase effective range for tungsten cannon shell
if data.raw["ammo"]["tungsten-cannon-shell"] and data.raw["projectile"]["tungsten-cannon-projectile"] then
  data.raw["ammo"]["tungsten-cannon-shell"].ammo_type.range_modifier = 1.375 -- such that it is still better but just half of the bonus added
  data.raw["ammo"]["tungsten-cannon-shell"].ammo_type.target_type = "position"
  data.raw["ammo"]["tungsten-cannon-shell"].ammo_type.action.action_delivery.max_range = 90
  data.raw["ammo"]["tungsten-cannon-shell"].ammo_type.action.action_delivery.direction_deviation = nil
  data.raw["ammo"]["tungsten-cannon-shell"].ammo_type.action.action_delivery.range_deviation = nil
  log("Removed the maximal ranges of tungsten cannon ammo to be usable with the Modular Turred Mod turrets.")
  data.raw["projectile"]["tungsten-cannon-projectile"].force_condition = "not-same"
  data.raw["projectile"]["tungsten-cannon-projectile"].direction_only = false
  data.raw["projectile"]["tungsten-cannon-projectile"].hit_collision_mask = { layers = { object = true, player = true, train = true, trigger_target = true } }
  -- log(serpent.block(data.raw["ammo"]["tungsten-cannon-shell"]))
  -- log(serpent.block(data.raw["projectile"]["tungsten-cannon-projectile"]))
end
if data.raw["ammo"]["tungsten-shotgun-shell"] and data.raw["projectile"]["explosive-uranium-cannon-projectile"] then
  data.raw["ammo"]["tungsten-shotgun-shell"].ammo_type.target_type = "position"
end


-- "casting" scattergun_turret stuff
local casting_dict = {
  ["w93-fragmentation-cannon-shell"] = "metallurgy",
  ["w93-uranium-shotgun-shell"] = "metallurgy",
  ["w93-slowdown-magazine"] = "metallurgy",
  ["w93-turret-slowdown-rocket"] = "organic",
}
generator_api.batch_generator(casting_dict)

-- add recipes to technology
local recipe_unlock_mapping = {
  ["oc-casting-w93-fragmentation-cannon-shell"] = { "casting-light-ammo-tech" },
  ["oc-casting-w93-uranium-shotgun-shell"] = { "casting-heavy-ammo-tech" },
  ["oc-casting-w93-slowdown-magazine"] = "casting-light-ammo-tech",
  ["oc-bio-w93-turret-slowdown-rocket"] = { "bio-rocketry-tech" },
}
oc_tech.add_recipe_unlocks(recipe_unlock_mapping)

-- move to subgroup
local subgroup_mapping = {
  ["oc-casting-w93-fragmentation-cannon-shell"] = "alternative-ammo",
  ["oc-casting-w93-uranium-shotgun-shell"] = "alternative-ammo",
  ["oc-casting-w93-slowdown-magazine"] = "alternative-ammo",
  ["oc-bio-w93-turret-slowdown-rocket"] = "alternative-ammo",
}
oc_recipe.change_recipes_subgroup(subgroup_mapping)


if settings.startup["casting-weapons"].value then
  local weapons_dict = {
    ["w93-scattergun-turret"] = "metallurgy",
    ["w93-modular-turret-base"] = "metallurgy",
    ["w93-modular-turret2-base"] = "electromagnetics",
    ["w93-modular-gun-hmg"] = "metallurgy",
    ["w93-modular-gun-lcannon"] = "metallurgy",
    ["w93-modular-gun-plaser"] = "electromagnetics",
    ["w93-modular-gun-radar"] = "electromagnetics",
    ["w93-modular-gun-radar2"] = "electromagnetics",
  }
  generator_api.batch_generator(weapons_dict)

  data:extend({
    { -- casting w93 turrets and guns
      type = "technology",
      name = "casting-modular-turrets",
      icons = {
        {
          icon = "__scattergun_turret__/graphics/technology/modular-turret-tech.png",
          icon_size = 128,
          icon_mipmaps = 1,
        },
        {
          icon = "__OCs_base_assets__/graphics/technology/overlayer-tech-molten-iron.png",
          icon_size = 256,
          icon_mipmaps = 4,
        }
      },
      prerequisites = {
        "casting-light-ammo-tech",
        "w93-modular-turrets2",
        "w93-scattergun-turrets",
        "space-science-pack",
        "utility-science-pack",
        "production-science-pack",
        "metallurgic-science-pack",
      },
      unit = {
        ingredients = {
          { "automation-science-pack",  1 },
          { "logistic-science-pack",    1 },
          { "chemical-science-pack",    1 },
          { "military-science-pack",    2 },
          { "utility-science-pack",     1 }, -- removed if cheaper
          { "production-science-pack",  1 }, -- removed if cheaper
          { "space-science-pack",       1 },
          { "metallurgic-science-pack", 2 }, -- removed if cheaper
        },
        time = 45,
        count = 150
      },
      effects =
      {
        { type = "unlock-recipe", recipe = "oc-casting-w93-scattergun-turret" },
        -- { type = "unlock-recipe", recipe = "oc-casting-w93-modular-turret-base" },
        { type = "unlock-recipe", recipe = "oc-casting-w93-modular-gun-hmg" },
        { type = "unlock-recipe", recipe = "oc-casting-w93-modular-gun-lcannon" },
      },
    },
    { -- pulse w93 turrets and guns
      type = "technology",
      name = "pulse-modular-turrets",
      icons = {
        {
          icon = "__scattergun_turret__/graphics/technology/modular-turret-tech.png",
          icon_size = 128,
          icon_mipmaps = 1,
        },
        {
          icon = "__OCs_base_assets__/graphics/technology/overlayer-tech-em-plant.png",
          icon_size = 256,
          icon_mipmaps = 4,
        }
      },
      prerequisites = {
        "casting-light-ammo-tech",
        -- "w93-modular-turrets2",
        "w93-modular-turrets-radar",
        "space-science-pack",
        "utility-science-pack",
        "production-science-pack",
        "electromagnetic-science-pack",
      },
      unit = {
        ingredients = {
          { "automation-science-pack",      1 },
          { "logistic-science-pack",        1 },
          { "chemical-science-pack",        1 },
          { "military-science-pack",        2 },
          { "utility-science-pack",         1 },  -- removed if cheaper
          { "production-science-pack",      1 },  -- removed if cheaper
          { "space-science-pack",           1 },
          { "electromagnetic-science-pack", 2 },  -- removed if cheaper
        },
        time = 45,
        count = 150
      },
      effects =
      {
        { type = "unlock-recipe", recipe = "oc-pulse-w93-modular-gun-plaser" },
        { type = "unlock-recipe", recipe = "oc-pulse-w93-modular-turret2-base" },
        { type = "unlock-recipe", recipe = "oc-pulse-w93-modular-gun-radar" },
        { type = "unlock-recipe", recipe = "oc-pulse-w93-modular-gun-radar2" },
      },
    },
  })
end
