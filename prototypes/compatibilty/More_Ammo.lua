local item_sounds = require("__base__.prototypes.item_sounds")
-- experimental compatibility


-- developement paused
if data.raw.recipe["casting-tungsten-rounds-magazine"] then
  data.raw.recipe["casting-tungsten-rounds-magazine"].ingredients = {
    {type="fluid", name="molten-iron", amount=50}, -- piercing-rounds-magazine: 1steel + 5copper + 2iron-plate(empty shells)
    {type="fluid", name="molten-copper", amount=50},
    {type="item", name="tungsten-carbide", amount=1}
  }
  log("Modified recipe for casting-tungsten-rounds-magazine.")
else
  log("Warning: Recipe 'casting-tungsten-rounds-magazine' not found.")
end

if data.raw.recipe["tungsten-rounds-magazine"] then
  data.raw.recipe["tungsten-rounds-magazine"].ingredients = {
    {type="item", name="piercing-rounds-magazine", amount=1},
    {type="item", name="tungsten-carbide", amount=1}
  }
  log("Modified recipe for tungsten-rounds-magazine.")
else
  log("Warning: Recipe 'tungsten-rounds-magazine' not found.")
end

if data.raw.recipe["casting-tungsten-shotgun-shell"] then
  data.raw.recipe["casting-tungsten-shotgun-shell"].ingredients = {
    {type="fluid", name="molten-iron", amount=60}, -- 1 piercing-shogun-shell =2steel + 5copper + 2copper-plate(empty shells)
    {type="fluid", name="molten-copper", amount=20},
    {type="item", name="tungsten-carbide", amount=1}
  }
  log("Modified recipe for casting-tungsten-shotgun-shell.")
else
  log("Warning: Recipe 'casting' not found.")
end

if data.raw.recipe["tungsten-shotgun-shell"] then
  data.raw.recipe["tungsten-shotgun-shell"].ingredients = {
    {type="item", name="piercing-shotgun-shell", amount=1},
    {type="item", name="tungsten-carbide", amount=1}
  }
  log("Modified recipe for tungsten-shotgun-shell.")
else
  log("Warning: Recipe 'tungsten-shotgun-shell' not found.")
end


data:extend({
  { -- tungsten rounds magazine
    type = "ammo",
    name = "tungsten-rounds-magazine",
    icon = "__OCs_ammo_casting__/graphics/icons/tungsten-firearm-magazine.png",
    ammo_category = "bullet",
    ammo_type =
    {
      range_modifier = 1.25,
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          source_effects =
          {
            type = "create-explosion",
            entity_name = "explosion-gunshot"
          },
          target_effects =
          {
            {
              type = "create-entity",
              entity_name = "explosion-hit",
              offsets = {{0, 1}},
              offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}}
            },
            {
              type = "damage",
              damage = {amount = 24, type = "physical"}
            },
            {
              type = "activate-impact",
              deliver_category = "bullet"
            }
          }
        }
      }
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "a[piercing-rounds-magazine]-b[uranium-rounds-magazine]",
    inventory_move_sound = item_sounds.ammo_small_inventory_move,
    pick_sound = item_sounds.ammo_small_inventory_pickup,
    drop_sound = item_sounds.ammo_small_inventory_move,
    stack_size = 100,
    weight = 40*kg
  },
  { -- tungsten shotgun shell
      type = "ammo",
      name = "tungsten-shotgun-shell",
      icon = "__OCs_ammo_casting__/graphics/icons/tungsten-shotgun-shell.png",
      icon_size = 64,
      icon_mipmaps = 4,
      ammo_category = "shotgun-shell",
      ammo_type =
      {
          range_modifier = 1.25,
          target_type = "direction",
          clamp_position = true,
          action =
          {
          {
              type = "direct",
              action_delivery =
              {
              type = "instant",
              source_effects =
              {
                  {
                  type = "create-explosion",
                  entity_name = "explosion-gunshot"
                  }
              }
              }
          },
          {
              type = "direct",
              repeat_count = 16,
              action_delivery =
              {
              type = "projectile",
              projectile = "tungsten-shotgun-pellet",
              starting_speed = 1,
              starting_speed_deviation = 0.1,
              direction_deviation = 0.3,
              range_deviation = 0.3,
              max_range = 15*1.25
              }
          }
          }
      },
      magazine_size = 10,
      subgroup = "ammo",
      order = "b[piercing-shotgun-shells]",
      inventory_move_sound = item_sounds.ammo_small_inventory_move,
      pick_sound = item_sounds.ammo_small_inventory_pickup,
      drop_sound = item_sounds.ammo_small_inventory_move,
      stack_size = 100,
      weight = 40*kg
  },
})
log("Overriding tungsten ammo from 'More_Ammo'. Experimental and unfinished.")
-- overwrite tungsten ammo from that specific mod to make it alingt with my one. Also add the casting recipes for the new ammo and empty magazines from that mod.