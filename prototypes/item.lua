local item_sounds = require("__base__.prototypes.item_sounds")
local plating_variants = require("prototypes.utils.plating_variants")

-- tungsten ammo
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
              offsets = { { 0, 1 } },
              offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } }
            },
            {
              type = "damage",
              damage = { amount = 24, type = "physical" }
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
    order = "a[piercing-rounds-magazine]-c[tungsten-rounds-magazine]",
    inventory_move_sound = item_sounds.ammo_small_inventory_move,
    pick_sound = item_sounds.ammo_small_inventory_pickup,
    drop_sound = item_sounds.ammo_small_inventory_move,
    stack_size = 100,
    weight = 40 * kg
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
            direction_deviation = 0.3 / 1.25, -- less spread, more directional
            range_deviation = 0.3 * 1.25,     -- accounting for range bonus
            max_range = 15 * 1.25,            -- accounting for range bonus
          }
        }
      }
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "b-[shotgun]-b[piercing-shotgun-shells]",
    inventory_move_sound = item_sounds.ammo_small_inventory_move,
    pick_sound = item_sounds.ammo_small_inventory_pickup,
    drop_sound = item_sounds.ammo_small_inventory_move,
    stack_size = 100,
    weight = 40 * kg
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
          direction_deviation = 0.05,
          range_deviation = 0.1,
          max_range = 30 * 1.375,
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
    order = "d[cannon-shell]-d[tungsten]",
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    stack_size = 100,
    weight = 40 * kg
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
        range = 50 * 1.25,
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
            damage = { amount = 10000, type = "physical" }
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
    order = "e[railgun-ammo]-b[tungsten]",
    inventory_move_sound = item_sounds.ammo_large_inventory_move,
    pick_sound = item_sounds.ammo_large_inventory_pickup,
    drop_sound = item_sounds.ammo_large_inventory_move,
    stack_size = 10,
    weight = 250 * kg
  },
})

if settings.startup["allow-casting-explosive-ammo"].value then
  -- Modify the vanilla artillery shell to be called "Medium Artillery Shell"
  data.raw["ammo"]["artillery-shell"].localised_name = { "item-name.medium-artillery-shell" }
end

if settings.startup["heavy-artillery-shells"].value then
  data:extend({
    { -- heavy-artillery-shell
      type = "ammo",
      name = "heavy-artillery-shell",
      icon = "__OCs_ammo_casting__/graphics/icons/tungsten-artillery-shell.png",
      icon_size = 64,
      icon_mipmaps = 4,
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
  local items = {}
  -- creating the items for armour plating
  for _, variant in pairs(plating_variants) do
    table.insert(items, {
      type = "item",
      name = variant.name,
      icons = {
        {
          icon = "__OCs_base_assets__/graphics/icons/reinforced_plating.png",
          icon_size = 64,
          icon_mipmaps = 4,
          tint = variant.tint,
        }
      },
      group = "military",
      subgroup = "armour-plating",
      order = variant.order,
      place_as_equipment_result = variant.name,
      inventory_move_sound = item_sounds.armor_large_inventory_move,
      pick_sound = item_sounds.armor_large_inventory_pickup,
      drop_sound = item_sounds.armor_large_inventory_move,
      stack_size = variant.stack_size,
      weight = variant.weight,
    })
  end

  data:extend(items) -- add to the game
end

if settings.startup["uranium-shotgun-shells"] then
  data:extend({
    { -- uranium shotgun shell
      type = "ammo",
      name = "uranium-shotgun-shell",
      icons = { {
        icon = "__OCs_ammo_casting__/graphics/icons/uranium-shotgun-shell.png",
        icon_size = 64,
        icon_mipmaps = 4,
        -- tint = { r = 0.5, g = 1.0, b = 0.5 }
      } },
      ammo_category = "shotgun-shell",
      ammo_type =
      {
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
              projectile = "uranium-shotgun-pellet",
              starting_speed = 1,
              starting_speed_deviation = 0.1,
              direction_deviation = 0.3,
              range_deviation = 0.3,
              max_range = 15,
            }
          }
        }
      },
      magazine_size = 10,
      subgroup = "ammo",
      order = "b-[shotgun]-b[piercing-shotgun-shells]",
      inventory_move_sound = item_sounds.ammo_small_inventory_move,
      pick_sound = item_sounds.ammo_small_inventory_pickup,
      drop_sound = item_sounds.ammo_small_inventory_move,
      stack_size = 100,
      weight = 40 * kg
    },
  })
end
