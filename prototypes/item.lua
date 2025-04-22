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
      order = "a[piercing-rounds-magazine]-c[tungsten-rounds-magazine]",
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
      order = "b-[shotgun]-b[piercing-shotgun-shells]",
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
            direction_deviation = 0.05,
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
      order = "d[cannon-shell]-d[tungsten]",
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
      order = "e[railgun-ammo]-b[tungsten]",
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

  local items = {}
 -- creating the items for armour plating
  for _, variant in pairs(plating_variants) do
    table.insert(items, {
      type = "item",
      name = variant.name,
      icons = {
        {
          icon = "__OCs_ammo_casting__/graphics/icons/heat-shielding.png", -- from Space Exploration by Earendel
          icon_size = 64,
          icon_mipmaps = 1,
          tint = variant.tint,
        }
      },
      group = variant.group,
      subgroup = variant.subgroup,
      order = variant.order,
      place_as_equipment_result = variant.place_as_equipment_result,
      inventory_move_sound = item_sounds.armor_large_inventory_move,
      pick_sound = item_sounds.armor_large_inventory_pickup,
      drop_sound = item_sounds.armor_large_inventory_move,
      stack_size = variant.stack_size,
      weight = variant.weight,
    })
  end

  data:extend(items)  -- Add to the game

  -- add a 2x3 grid to the heavy armor for early usage of armor platings
  data:extend({
    {
      type = "equipment-grid",
      name = "tiny-equipment-grid",
      width = 2,
      height = 3,
      equipment_categories = {"armor", "personal-armour-plating-equipment"}
    }
  })
  local heavy_armor_with_grid = table.deepcopy(data.raw["armor"]["heavy-armor"])
  heavy_armor_with_grid.equipment_grid = "tiny-equipment-grid" -- This must match a defined grid!
  data:extend({ heavy_armor_with_grid })

  -- define a grid for vehicles
  local car = data.raw["car"]["car"]  -- Getting the car prototype
  if not car.equipment_grid then
    car.equipment_grid = "car-equipment-grid"
    data:extend({
      {
        type = "equipment-grid",
        name = "car-equipment-grid",
        width = 4,
        height = 4,
        equipment_categories = {"vehicle-armour-plating-equipment", "armor"}
      }
    })
  end
  -- local chaingunner = data.raw["car"]["vehicle-chaingunner"]
  -- if not chaingunner.equipment_grid then
  --   chaingunner.equipment_grid = "chaingunner-equipment-grid"
  --   data:extend({
  --       {
  --           type = "equipment-grid",
  --           name = "chaingunner-equipment-grid",
  --           width = 2,
  --           height = 3,
  --           equipment_categories = {"vehicle-armour-plating-equipment", "armor"}
  --       }
  --   })
  -- end
end

-- mod compatibility
if mods["vtk-cannon-turret"] then
  data:extend({
    { -- tungsten cannon shell magazine
      type = "ammo",
      name = "tungsten-cannon-shell-magazine",
      icon = "__OCs_ammo_casting__/graphics/icons/tungsten-cannon-shell-magazine.png",
      ammo_category = "cannon-shell-magazine",
      ammo_type =
      {
        category = "cannon-shell-magazine",
        range_modifier = 1.25,
        target_type = "direction",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "projectile",
            projectile = "tungsten-cannon-magazine-projectile",
            starting_speed = 1,
            direction_deviation = 0.05,
            range_deviation = 0.1,
            max_range = 35*1.375,
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
      weight = (40*10+20)*kg -- +20*kg accound for the magazinie clip
    },
  })
end