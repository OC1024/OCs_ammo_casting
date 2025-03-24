local item_sounds = require("__base__.prototypes.item_sounds")

if mods["More_Ammo"] and settings.startup["allow-tungsten-ammo"].value then
data:raw({
  {
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
  {
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
end