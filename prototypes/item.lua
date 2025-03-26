local item_sounds = require("__base__.prototypes.item_sounds")

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
              repeat_count = 16, -- amout of pellets
              action_delivery =
              {
              type = "projectile",
              projectile = "tungsten-shotgun-pellet",
              starting_speed = 1,
              starting_speed_deviation = 0.1,
              direction_deviation = 0.3/1.25, -- less spread, more directional
              range_deviation = 0.3*1.25, -- accounting for range bonus
              max_range = 15*1.25, -- accounting for range bonus
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
    { -- tungsten cannon shell
      type = "ammo",
      name = "tungsten-cannon-shell",
      icon = "__OCs_ammo_casting__/graphics/icons/tungsten-cannon-shell.png",
      ammo_category = "cannon-shell",
      ammo_type =
      {
        range_modifier = 1.25,
        target_type = "direction",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "projectile",
            projectile = "tungsten-cannon-projectile",
            starting_speed = 1,
            direction_deviation = 0.1,
            range_deviation = 0.1,
            max_range = 30*1.375,
            min_range = 5,
            source_effects =
            {
              type = "create-explosion",
              entity_name = "explosion-gunshot"
            }
          }
        }
      },
      subgroup = "ammo",
      order = "d[cannon-shell]-c[uranium]",
      inventory_move_sound = item_sounds.ammo_large_inventory_move,
      pick_sound = item_sounds.ammo_large_inventory_pickup,
      drop_sound = item_sounds.ammo_large_inventory_move,
      stack_size = 100,
      weight = 40*kg
    },
    { -- tungsten railgun ammo
      type = "ammo",
      name = "tungsten-railgun-ammo",
      icon = "__OCs_ammo_casting__/graphics/icons/tungsten-railgun-ammo.png",
      ammo_category = "railgun",
      ammo_type =
      {
        range_modifier = 1.25,
        target_type = "direction",
        clamp_position = true,
        action =
        {
          type = "line",
          range = 50*1.25,
          width = 1,
          range_effects =
          {
            type = "create-explosion",
            entity_name = "railgun-beam"
          },
          action_delivery =
          {
            type = "instant",
            target_effects =
            {
              type = "damage",
              damage = {amount = 10000, type = "physical"}
            },
            source_effects =
            {
              type = "create-explosion",
              entity_name = "explosion-gunshot"
            }
          }
        }
      },
      subgroup = "ammo",
      order = "e[railgun-ammo]-a[basic]",
      inventory_move_sound = item_sounds.ammo_large_inventory_move,
      pick_sound = item_sounds.ammo_large_inventory_pickup,
      drop_sound = item_sounds.ammo_large_inventory_move,
      stack_size = 10,
      weight = 250*kg
    },
})

if settings.startup["allow-casting-explosive-ammo"].value then

  -- Modify the vanilla artillery shell to be called "Medium Artillery Shell"
  data.raw["ammo"]["artillery-shell"].localised_name = {"item-name.medium-artillery-shell"}

  data:extend({
    { -- heavy-artillery-shell
      type = "ammo",
      name = "heavy-artillery-shell",
      icon = "__OCs_ammo_casting__/graphics/icons/tungsten-artillery-shell.png",
      icon_size = 64, icon_mipmaps = 4,
      ammo_category = "artillery-shell",
      ammo_type =
      {
        target_type = "position",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "artillery",
            projectile = "heavy-artillery-projectile",
            starting_speed = 0.8, -- -20% range
            direction_deviation = 0,
            range_deviation = 0,
            source_effects =
            {
              type = "create-explosion",
              entity_name = "artillery-cannon-muzzle-flash"
            }
          }
        }
      },
      subgroup = "ammo",
      order = "d[explosive-cannon-shell]-d[artillery]-b[heavy]",
      inventory_move_sound = item_sounds.artillery_large_inventory_move,
      pick_sound = item_sounds.artillery_large_inventory_pickup,
      drop_sound = item_sounds.artillery_large_inventory_move,
      stack_size = 1,
      weight = 200 * kg -- twice vanilla artillery shell
    }
  })
end

if settings.startup["armour-plating"] then
  data:extend({
    {-- light-armour-plating
      type =  "item",
      name = "light-armour-plating",
      icons =
      {
        {
          icon = "__OCs_ammo_casting__/graphics/icons/heat-shielding.png", -- from Space Exploration by Earendel
          icon_size = 64,
          -- icon_mipmaps = 4,
          tint = {r = 1.0, g = 1.0, b = 1.0, a = 0.6}, -- lighter grey
        },
        {
          icon = "__base__/graphics/equipment/energy-shield-equipment.png",
          icon_size = 128,
          icon_scale = 0.125,
          shift = {16, -16},
          -- icon_mipmaps = 4,
        }
      },
      group = "intermediate-products",
      subgroup = "military-equipment",
      order = "a[shield]-a[energy-shield-equipment]",
      inventory_move_sound = item_sounds.energy_shield_inventory_move,
      pick_sound = item_sounds.energy_shield_inventory_pickup,
      drop_sound = item_sounds.energy_shield_inventory_move,
      stack_size =20,
      weight = 50 * kg,
    },
    {-- heavy-armour-plating
      type =  "item",
      name = "heavy-armour-plating",
      icons =
      {
        {
          icon = "__OCs_ammo_casting__/graphics/icons/heat-shielding.png", -- from Space Exploration by Earendel
          icon_size = 64,
          -- icon_mipmaps = 4,
        },
        {
          icon = "__base__/graphics/equipment/energy-shield-mk2-equipment.png",
          icon_size = 128,
          icon_scale = 0.125,
          shift = {16, -16},
          -- icon_mipmaps = 4,
        }
      },
      group = "intermediate-products",
      subgroup = "military-equipment",
      order = "a[shield]-a[energy-shield-equipment]",
      inventory_move_sound = item_sounds.energy_shield_inventory_move,
      pick_sound = item_sounds.energy_shield_inventory_pickup,
      drop_sound = item_sounds.energy_shield_inventory_move,
      stack_size =10,
      weight = 100 * kg,
    },
    {-- tungsten-armour-plating
      type =  "item",
      name = "tungsten-armour-plating",
      icons =
      {
        {
          icon = "__OCs_ammo_casting__/graphics/icons/heat-shielding.png", -- from Space Exploration by Earendel
          icon_size = 64,
          -- icon_mipmaps = 4,
          tint = {r = 0.8, g = 0.6, b = 1.0, a = 1.0}, -- purple
        },
        -- {
        --   icon = "__OCs_ammo_casting__/graphics/icons/overlayer-recipe-molten-iron.png",
        --   icon_size = 64,
        --   icon_mipmaps = 4,
        -- }
      },
      group = "intermediate-products",
      subgroup = "military-equipment",
      order = "a[shield]-a[energy-shield-equipment]",
      inventory_move_sound = item_sounds.energy_shield_inventory_move,
      pick_sound = item_sounds.energy_shield_inventory_pickup,
      drop_sound = item_sounds.energy_shield_inventory_move,
      stack_size = 5,
      weight = 200 * kg,
    },
    {-- reactive-armour-plating
      type =  "item",
      name = "reactive-armour-plating",
      icons =
      {
        {
          icon = "__OCs_ammo_casting__/graphics/icons/heat-shielding.png", -- from Space Exploration by Earendel
          icon_size = 64,
          -- icon_mipmaps = 4,
          tint = {r = 0.6, g = 1.0, b = 0.6, a = 1.0}, -- green
        },
        -- {
        --   icon = "__OCs_ammo_casting__/graphics/icons/overlayer-recipe-molten-iron.png",
        --   icon_size = 64,
        --   icon_mipmaps = 4,
        -- }
      },
      group = "intermediate-products",
      subgroup = "military-equipment",
      order = "a[shield]-a[energy-shield-equipment]",
      inventory_move_sound = item_sounds.energy_shield_inventory_move,
      pick_sound = item_sounds.energy_shield_inventory_pickup,
      drop_sound = item_sounds.energy_shield_inventory_move,
      stack_size = 10,
      weight = 100 * kg,
    },
    {-- reactive-armour-plating
      type =  "item",
      name = "reactive-armour-plating",
      icons =
      {
        {
          icon = "__OCs_ammo_casting__/graphics/icons/heat-shielding.png", -- from Space Exploration by Earendel
          icon_size = 64,
          -- icon_mipmaps = 4,
          tint = {r = 0.6, g = 0.6, b = 1.0, a = 1.0}, -- blue
        },
        -- {
        --   icon = "__OCs_ammo_casting__/graphics/icons/overlayer-recipe-molten-iron.png",
        --   icon_size = 64,
        --   icon_mipmaps = 4,
        -- }
      },
      group = "intermediate-products",
      subgroup = "military-equipment",
      order = "a[shield]-a[energy-shield-equipment]",
      inventory_move_sound = item_sounds.energy_shield_inventory_move,
      pick_sound = item_sounds.energy_shield_inventory_pickup,
      drop_sound = item_sounds.energy_shield_inventory_move,
      stack_size = 40,
      weight = 25 * kg,
    },
    {-- ultra-light-armour-plating
      type =  "item",
      name = "ultra-light-armour-plating",
      icons =
      {
        {
          icon = "__OCs_ammo_casting__/graphics/icons/heat-shielding.png", -- from Space Exploration by Earendel
          icon_size = 64,
          -- icon_mipmaps = 4,
          tint = {r = 0.6, g = 0.6, b = 1.0, a = 1.0}, -- blue
        },
        -- {
        --   icon = "__OCs_ammo_casting__/graphics/icons/overlayer-recipe-molten-iron.png",
        --   icon_size = 64,
        --   icon_mipmaps = 4,
        -- }
      },
      group = "intermediate-products",
      subgroup = "military-equipment",
      order = "a[shield]-a[energy-shield-equipment]",
      inventory_move_sound = item_sounds.energy_shield_inventory_move,
      pick_sound = item_sounds.energy_shield_inventory_pickup,
      drop_sound = item_sounds.energy_shield_inventory_move,
      stack_size = 40,
      weight = 25 * kg,
    },
  })
end