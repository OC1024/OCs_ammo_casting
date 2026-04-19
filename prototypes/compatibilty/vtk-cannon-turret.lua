--  load api
local generator_api = require("__OCs_base_assets__.prototypes.utils.api")
local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")
local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")

local projtungsten = table.deepcopy(data.raw["projectile"]["tungsten-cannon-projectile"])
local item_sounds = require("__base__.prototypes.item_sounds")
projtungsten.name = "tungsten-cannon-magazine-projectile"
projtungsten.flags = {}
projtungsten.direction_only = true
projtungsten.force_condition = "not-same"
projtungsten.hit_collision_mask = { layers = { object = true, player = true, train = true, trigger_target = true } }

data:extend({
  projtungsten,
})
log("Thanks the clean code, vtk! Sincerely, OC1024.")

data:extend({
  -- item/ammo
  { -- tungsten cannon shell magazine
    type = "ammo",
    name = "tungsten-cannon-shell-magazine",
    icon = "__OCs_ammo_casting__/graphics/icons/tungsten-cannon-shell-magazine.png",
    ammo_category = "cannon-shell-magazine",
    ammo_type = {
      category = "cannon-shell-magazine",
      range_modifier = 1.25,
      target_type = "direction",
      action = {
        type = "direct",
        action_delivery = {
          type = "projectile",
          projectile = "tungsten-cannon-magazine-projectile",
          starting_speed = 1,
          direction_deviation = 0.05,
          range_deviation = 0.1,
          max_range = 35 * 1.375,
          min_range = 5,
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          }
        }
      }
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "d[cannon-shell]-d[tungsten]-m[magazine]",
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    stack_size = 20,
    weight = (40 * 10 + 20) * kg -- +20*kg accound for the magazinie clip
  },
  -- crafting
  { -- tungsten-cannon-shell-magazine
    type = "recipe",
    name = "tungsten-cannon-shell-magazine",
    icons = {
      {
        icon = "__OCs_ammo_casting__/graphics/icons/tungsten-cannon-shell-magazine.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
    },
    category = "advanced-crafting",
    group = "combat",
    subgroup = "ammo",
    enabled = false,
    energy_required = 2,
    ingredients = {
      { type = "item", name = "tungsten-cannon-shell", amount = 10 },
      { type = "item", name = "iron-plate",            amount = 2 },
      { type = "item", name = "plastic-bar",           amount = 1 },
    },
    results = {
      { type = "item", name = "tungsten-cannon-shell-magazine", amount = 1 },
    },
    allow_productivity = false,
    allow_decomposition = true,
  },
})

local casting_dict = {
  ["cannon-shell-magazine"] = "metallurgy",
  ["uranium-cannon-shell-magazine"] = "metallurgy",
  ["tungsten-cannon-shell-magazine"] = "metallurgy",
}
if settings.startup["allow-casting-explosive-ammo"].value then
  casting_dict["explosive-cannon-shell-magazine"] = "metallurgy"
  casting_dict["explosive-uranium-cannon-shell-magazine"] = "metallurgy"
end
if settings.startup["casting-weapons"].value then
  casting_dict["vtk-cannon-turret"] = "metallurgy"
  casting_dict["vtk-cannon-turret-heavy"] = "metallurgy"
end
generator_api.batch_generator(casting_dict)

local recipe_unlock_mapping = {
  -- turrets
  ["oc-casting-vtk-vtk-cannon-turret"] = { "vtk-cannon-turret-unlock" },
  ["oc-casting-vtk-vtk-cannon-turret-heavy"] = { "vtk-cannon-turret-heavy-unlock" },
  -- ammo
  ["oc-casting-cannon-shell-magazine"] = { "casting-heavy-ammo-tech" },
  ["oc-casting-uranium-cannon-shell-magazine"] = { "casting-heavy-ammo-tech" },
  ["oc-casting-tungsten-cannon-shell-magazine"] = { "casting-tungsten-ammo-tech" },
  ["tungsten-cannon-shell-magazine"] = { "casting-tungsten-ammo-tech" },
}
if settings.startup["allow-casting-explosive-ammo"].value then
  recipe_unlock_mapping["oc-casting-explosive-cannon-shell-magazine"] = { "casting-explosive-ammo-tech" }
  recipe_unlock_mapping["oc-casting-explosive-uranium-cannon-shell-magazine"] = { "casting-explosive-ammo-tech" }
end
oc_tech.add_recipe_unlocks(recipe_unlock_mapping)

local subgroup_mapping = {}

for key, _ in pairs(casting_dict) do
    subgroup_mapping[key] = "alternative-ammo"
end
-- weapons are not ammo
subgroup_mapping["vtk-cannon-turret"] = nil
subgroup_mapping["vtk-cannon-turret-heavy"] = nil

oc_recipe.change_recipes_subgroup(subgroup_mapping)
