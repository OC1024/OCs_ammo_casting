
local projtungsten = table.deepcopy(data.raw["projectile"]["tungsten-cannon-projectile"])
local item_sounds = require("__base__.prototypes.item_sounds")
projtungsten.name = "tungsten-cannon-magazine-projectile"
projtungsten.flags = {}
projtungsten.direction_only = true
projtungsten.force_condition = "not-same"
projtungsten.hit_collision_mask = {layers={object=true, player=true, train=true, trigger_target=true}}

data:extend(
    {
    projtungsten,
    })
log("Thanks the clean code, vtk!")

-- item/ammo
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
-- crafting
data:extend({
    { -- casting-cannon-turret
      type = "recipe",
      name = "casting-cannon-turret",
      icons =
      {
        {
          icon = "__vtk-cannon-turret__/graphics/icons/cannon-turret-icon.png",
          icon_size = 64,
          icon_mipmaps = 4,
        },
        {
          icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-molten-iron.png",
          icon_size = 64,
          icon_mipmaps = 4,
        }
      },
      category = "metallurgy",
      group = "combat",
      subgroup = "turret",
      -- order = "ba",
      enabled = false,
      energy_required = 10,
      ingredients = {
        {type = "fluid", name = "molten-iron", amount = 300*2+30*30}, -- (10*10iron-plates + 10*10iron-gear-wheel)*2+30*30steel-plate
        {type = "fluid", name = "molten-copper", amount = 10*2}, -- 10 copper plates*2
        {type = "item", name = "electronic-circuit", amount = 2}
      },
      results = {{type = "item", name = "vtk-cannon-turret", amount = 1}},
      allow_productivity = false,
    },
    { -- casting-cannon-turret-heavy
      type = "recipe",
      name = "casting-cannon-turret-heavy",
      icons =
      {
        {
          icon = "__vtk-cannon-turret__/graphics/icons/cannon-turret-heavy-icon.png",
          icon_size = 64,
          icon_mipmaps = 4,
        },
        {
          icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-molten-iron.png",
          icon_size = 64,
          icon_mipmaps = 4,
        }
      },
      category = "metallurgy",
      group = "combat",
      subgroup = "turret",
      -- order = "ba",
      enabled = false,
      energy_required = 40, -- only last step
      ingredients = {
        {type = "fluid", name = "molten-iron", amount = (300*2+30*30)*2+50*30}, -- ((10*10iron-plates + 10*10iron-gear-wheel)*2+30*30steel-plate)*2 + 30*50steel-plate
        {type = "fluid", name = "molten-copper", amount = 10*2*2}, -- 10 copper plates*2
        {type = "item", name = "electronic-circuit", amount = 2*2},
        {type = "item", name = "advanced-circuit", amount = 10}
      },
      results = {{type = "item", name = "vtk-cannon-turret-heavy", amount = 1}},
      allow_productivity = false,
    },
    { -- casting-cannon-shell-magazine
      type = "recipe",
      name = "casting-cannon-shell-magazine",
      icons =
      {
        {
          icon = "__vtk-cannon-turret__/graphics/icons/cannon-shell-magazine.png",
          icon_size = 64,
          icon_mipmaps = 4,
        },
        {
          icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-molten-iron.png",
          icon_size = 64,
          icon_mipmaps = 4,
        }
      },
      category = "metallurgy",
      group = "combat",
      subgroup = "alternative-ammo",
      -- order = "ba",
      enabled = false,
      energy_required = 8*10+2, -- vanilla: 8
      ingredients = { -- 10 cannon-shell + 2 iron-plate + 1 plastic-bar
        {type = "fluid", name = "molten-iron", amount = 60*10+10}, -- 30 iron/steel * 2 steel
        {type = "item", name = "explosives", amount = 1*10},
        {type = "item", name = "plastic-bar", amount = 2*10+1},
      },
      results = {{type = "item", name = "cannon-shell-magazine", amount = 1}},
      allow_productivity = false,
    },
    { -- casting-uranium-cannon-shell-magazine
      type = "recipe",
      name = "casting-uranium-cannon-shell-magazine",
      icons =
      {
        {
          icon = "__vtk-cannon-turret__/graphics/icons/uranium-cannon-shell-magazine.png",
          icon_size = 64,
          icon_mipmaps = 4,
        },
        {
          icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-molten-iron.png",
          icon_size = 64,
          icon_mipmaps = 4,
        }
      },
      category = "metallurgy",
      group = "combat",
      subgroup = "alternative-ammo",
      -- order = "bb",
      enabled = false,
      energy_required = 12*10+2, -- vanilla: 8 + 12
      ingredients = {  -- 10 uranium-cannon-shell + 2 iron-plate + 1 plastic-bar
        {type = "fluid", name = "molten-iron", amount = 60*10+10}, -- 30 iron/steel * 2 steel
        {type = "item", name = "explosives", amount = 1*10},
        {type = "item", name = "plastic-bar", amount = 2*10+1},
        {type = "item", name = "uranium-238", amount = 1*10},
      },
      results = {{type = "item", name = "uranium-cannon-shell-magazine", amount = 1}},
      allow_productivity = false,
      allow_decomposition = false,
    },
    { -- casting-explosive-cannon-shell-magazine
      type = "recipe",
      name = "casting-explosive-cannon-shell-magazine",
      icons =
      {
        {
          icon = "__vtk-cannon-turret__/graphics/icons/explosive-cannon-shell-magazine.png",
          icon_size = 64,
          icon_mipmaps = 4,
        },
        {
          icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-molten-iron.png",
          icon_size = 64,
          icon_mipmaps = 4,
        }
      },
      category = "metallurgy",
      group = "combat",
      subgroup = "alternative-ammo",
      -- order = "ba",
      enabled = false,
      energy_required = 8*10+2, -- vanilla: 8
      ingredients = { -- 10 cannon-shell + 2 iron-plate + 1 plastic-bar
        {type = "fluid", name = "molten-iron", amount = 60*10+10}, -- 30 iron/steel * 2 steel
        {type = "item", name = "explosives", amount = 2*10},
        {type = "item", name = "plastic-bar", amount = 2*10+1},
      },
      results = {{type = "item", name = "explosive-cannon-shell-magazine", amount = 1}},
      allow_productivity = false,
    },
    { -- casting-uranium-cannon-shell-magazine
      type = "recipe",
      name = "casting-explosive-uranium-cannon-shell-magazine",
      icons =
      {
        {
          icon = "__vtk-cannon-turret__/graphics/icons/explosive-uranium-cannon-shell-magazine.png",
          icon_size = 64,
          icon_mipmaps = 4,
        },
        {
          icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-molten-iron.png",
          icon_size = 64,
          icon_mipmaps = 4,
        }
      },
      category = "metallurgy",
      group = "combat",
      subgroup = "alternative-ammo",
      -- order = "bb",
      enabled = false,
      energy_required = 12*10+2, -- vanilla: 8 + 12
      ingredients = {  -- 10 uranium-cannon-shell + 2 iron-plate + 1 plastic-bar
        {type = "fluid", name = "molten-iron", amount = 60*10+10}, -- 30 iron/steel * 2 steel
        {type = "item", name = "explosives", amount = 2*10},
        {type = "item", name = "plastic-bar", amount = 2*10+1},
        {type = "item", name = "uranium-238", amount = 1*10},
      },
      results = {{type = "item", name = "explosive-uranium-cannon-shell-magazine", amount = 1}},
      allow_productivity = false,
      allow_decomposition = false,
    },
    { -- tungsten-cannon-shell-magazine
      type = "recipe",
      name = "tungsten-cannon-shell-magazine",
      icons =
      {
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
        {type = "item", name = "tungsten-cannon-shell", amount = 10},
        {type = "item", name = "iron-plate", amount = 2},
        {type = "item", name = "plastic-bar", amount = 1},
      },
      results = {
        {type = "item", name = "tungsten-cannon-shell-magazine", amount = 1},
      },
      allow_productivity = false,
      allow_decomposition = true,
    },
    { -- casting-tungsten-cannon-shell-magazine
      type = "recipe",
      name = "casting-tungsten-cannon-shell-magazine",
      icons =
      {
        {
          icon = "__OCs_ammo_casting__/graphics/icons/tungsten-cannon-shell-magazine.png",
          icon_size = 64,
          icon_mipmaps = 4,
        },
        {
          icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-molten-iron.png",
          icon_size = 64,
          icon_mipmaps = 4,
        }
      },
      category = "metallurgy",
      subgroup = "alternative-ammo",
      enabled = false,
      energy_required = 12*10+2,
      ingredients = { --10 tungsten-cannon-shell + 2 iron-plate + 1 plastic-bar
        {type="fluid", name="molten-iron", amount=50*10+10},
        {type="item", name="tungsten-carbide", amount=2*10},
        {type = "item", name = "explosives", amount = 2*10},
        {type = "item", name = "plastic-bar", amount = 1},
      },
      results = {
        {type = "item", name = "tungsten-cannon-shell-magazine", amount = 1},
      },
      allow_productivity = false,
      allow_decomposition = false,
      auto_recycle = true,
    },
})
-- TODO: if vtk-cannon-turret and aai-industry then the cannon turrets must be recalculated.

local mapping = {
  ["casting-cannon-turret"] = {"vtk-cannon-turret-unlock"},
  ["casting-cannon-turret-heavy"] = {"vtk-cannon-turret-heavy-unlock"},
  ["casting-cannon-shell-magazine"] = {"casting-heavy-ammo-tech"},
  ["casting-uranium-cannon-shell-magazine"] = {"casting-heavy-ammo-tech"},
  ["casting-tungsten-cannon-shell-magazine"] = {"casting-tungsten-ammo-tech"},
  ["tungsten-cannon-shell-magazine"] = {"casting-tungsten-ammo-tech"},
}
add_recipe_unlocks(mapping)


if settings.startup["allow-casting-explosive-ammo"].value then
  local mapping = {
    ["casting-explosive-cannon-shell-magazine"] = {"casting-explosive-ammo-tech"},
    ["casting-explosive-uranium-cannon-shell-magazine"] = {"casting-explosive-ammo-tech"},
  }
  add_recipe_unlocks(mapping)
end