data:extend({ -- casting vanilla recipes
  { -- casting-firearm-magazine
    type = "recipe",
    name = "casting-firearm-magazine",
    icons =
    {
      {
        icon = "__base__/graphics/icons/firearm-magazine.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_ammo_casting__/graphics/icons/overlayer-recipe-molten-iron.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    category = "metallurgy",
    group = "combat",
    subgroup = "alternative-ammo",
    -- order = "aa",
    enabled = false,
    energy_required = 1,
    ingredients =
    {
      {type="fluid",name="molten-iron",amount=40}
    },
    results = {{type="item",name="firearm-magazine",amount=1}},
    allow_productivity = false,
  },
  { -- casting-piercing-rounds-magazine
    type = "recipe",
    name = "casting-piercing-rounds-magazine",
    icons =
    {
      {
        icon = "__base__/graphics/icons/piercing-rounds-magazine.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_ammo_casting__/graphics/icons/overlayer-recipe-molten-iron.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    category = "metallurgy",
    group = "combat",
    subgroup = "alternative-ammo",
    -- order = "j[piercing-rounds-magazine]",
    enabled = false,
    energy_required = 3,
    ingredients =
    {
        {type = "fluid", name = "molten-iron", amount = 70},
        {type = "fluid", name = "molten-copper", amount = 50}
    },
    results = {{type="item",name="piercing-rounds-magazine",amount=1}},
    allow_productivity = false,
  },
  { -- casting-uranium-rounds-magazine
      type = "recipe",
      name = "casting-uranium-rounds-magazine",
      icon = "__OCs_ammo_casting__/graphics/icons/casting-uranium-ammo.png",
      icons =
      {
        {
          icon = "__base__/graphics/icons/uranium-rounds-magazine.png",
          icon_size = 64,
          icon_mipmaps = 4,
        },
        -- {
        --   icon = "__base__/graphics/icons/uranium-rounds-magazine-light.png",
        --   icon_size = 64,
        --   icon_mipmaps = 4,
        -- },
        {
          icon = "__OCs_ammo_casting__/graphics/icons/overlayer-recipe-molten-iron.png",
          icon_size = 64,
          icon_mipmaps = 4,
        }
      },
      category = "metallurgy",
      group = "combat",
      subgroup = "alternative-ammo",
      -- order = "ac",
      enabled = false,
      energy_required = 10, -- just last step
      ingredients =
      {
        {type = "fluid", name = "molten-iron", amount = 70},
        {type = "fluid", name = "molten-copper", amount = 50},
        {type = "item", name = "uranium-238", amount = 1}
      },
      results = {{type="item", name="uranium-rounds-magazine", amount=1}},
      allow_productivity = false,
  },
  { -- casting-shotgun-shell
    type = "recipe",
    name = "casting-shotgun-shell",
    icons =
    {
      {
        icon = "__base__/graphics/icons/shotgun-shell.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_ammo_casting__/graphics/icons/overlayer-recipe-molten-iron.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    category = "metallurgy",
    group = "combat",
    subgroup = "alternative-ammo",
    -- order = "ad",
    enabled = false,
    energy_required = 12, -- vanilla: 8 + 12
    ingredients = {
      {type = "fluid", name = "molten-iron", amount = 20}, -- 2 iron plates
      {type = "fluid", name = "molten-copper", amount = 20}, -- 2 copper plates
    },
    results = {{type = "item", name = "shotgun-shell", amount = 1}},
    allow_productivity = false,
  },
  { -- casting-piercing-shotgun-shell
    type = "recipe",
    name = "casting-piercing-shotgun-shell",
    icons =
    {
      {
        icon = "__base__/graphics/icons/piercing-shotgun-shell.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_ammo_casting__/graphics/icons/overlayer-recipe-molten-iron.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    category = "metallurgy",
    group = "combat",
    subgroup = "alternative-ammo",
    -- order = "ae",
    enabled = false,
    energy_required = 12, -- vanilla: 8 + 12
    ingredients = {
      {type = "fluid", name = "molten-iron", amount = 100}, -- 4 iron plates + 2 steel plates
      {type = "fluid", name = "molten-copper", amount = 90}, -- 9 copper plates
    },
    results = {{type = "item", name = "piercing-shotgun-shell", amount = 1}},
    allow_productivity = false,
  },
  { -- casting-cannon-shell
    type = "recipe",
    name = "casting-cannon-shell",
    icons =
    {
      {
        icon = "__base__/graphics/icons/cannon-shell.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_ammo_casting__/graphics/icons/overlayer-recipe-molten-iron.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    category = "metallurgy",
    group = "combat",
    subgroup = "alternative-ammo",
    -- order = "ba",
    enabled = false,
    energy_required = 8, -- vanilla: 8
    ingredients = {
      {type = "fluid", name = "molten-iron", amount = 60}, -- 30 iron/steel * 2 steel
      {type = "item", name = "explosives", amount = 1},
      {type = "item", name = "plastic-bar", amount = 2},
    },
    results = {{type = "item", name = "cannon-shell", amount = 1}},
    allow_productivity = false,
  },
  { -- casting-uranium-cannon-shell
    type = "recipe",
    name = "casting-uranium-cannon-shell",
    icons =
    {
      {
        icon = "__base__/graphics/icons/uranium-cannon-shell.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_ammo_casting__/graphics/icons/overlayer-recipe-molten-iron.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    category = "metallurgy",
    group = "combat",
    subgroup = "alternative-ammo",
    -- order = "bb",
    enabled = false,
    energy_required = 12, -- vanilla: 8 + 12
    ingredients = {
      {type = "fluid", name = "molten-iron", amount = 60}, -- 30 iron/steel * 2 steel
      {type = "item", name = "explosives", amount = 1},
      {type = "item", name = "plastic-bar", amount = 2},
      {type = "item", name = "uranium-238", amount = 1},
    },
    results = {{type = "item", name = "uranium-cannon-shell", amount = 1}},
    allow_productivity = false,
  },
  { -- casting railgun ammo
    type = "recipe",
    name = "casting-railgun-ammo",
    icons =
    {
      {
        icon = "__space-age__/graphics/icons/railgun-ammo.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_ammo_casting__/graphics/icons/overlayer-recipe-molten-iron.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    category = "metallurgy",
    group = "combat",
    subgroup = "alternative-ammo",
    -- order = "cb",
    enabled = false,
    energy_required = 25, -- vanilla
    ingredients = {
      {type = "fluid", name = "molten-iron", amount = 150}, -- 5 steel plates
      {type = "fluid", name = "molten-copper", amount = 25}, -- 5 copper plates= 5 copper cables
      {type = "item", name = "explosives", amount = 2},
    },
    results = {{type = "item", name = "railgun-ammo", amount = 1}},
    allow_productivity = false,
  },
})

data:extend({ -- crafting and casting tungsten ammo
  { -- tungsten-cannon-shell
    type = "recipe",
    name = "tungsten-cannon-shell",
    icon = "__OCs_ammo_casting__/graphics/icons/tungsten-cannon-shell.png",
    icon_size = 64, icon_mipmaps = 4,
    category = "advanced-crafting",
    group = "combat",
    subgroup = "ammo",
    enabled = false,
    energy_required = 12,
    ingredients = {
      {type="item", name="steel-plate", amount=1},
      {type="item", name="iron-plate", amount=2},
      {type="item", name="tungsten-carbide", amount=2},
      {type = "item", name = "explosives", amount = 2},
    },
    results = {{type="item", name="tungsten-cannon-shell", amount=1}},
    allow_productivity = false,
    allow_decomposition = false,
    auto_recycle = true,
  },
  { -- casting tungsten-cannon-shell
    type = "recipe",
    name = "casting-tungsten-cannon-shell",
    icons =
    {
      {
        icon = "__OCs_ammo_casting__/graphics/icons/tungsten-cannon-shell.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_ammo_casting__/graphics/icons/overlayer-recipe-molten-iron.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    category = "metallurgy",
    subgroup = "alternative-ammo",
    enabled = false,
    energy_required = 12,
    ingredients = {
      {type="fluid", name="molten-iron", amount=50}, --  30*1 steel + 10*2 iron plate
      {type="item", name="tungsten-carbide", amount=2},
      {type = "item", name = "explosives", amount = 2},
    },
    results = {{type="item", name="tungsten-cannon-shell", amount=1}},
    allow_productivity = false,
    allow_decomposition = false,
    -- auto_recycle = true,
  },
  { -- tungsten-shotgun-shell
    type = "recipe",
    name = "tungsten-shotgun-shell",
    icon = "__OCs_ammo_casting__/graphics/icons/tungsten-shotgun-shell.png",
    icon_size = 64, icon_mipmaps = 4,
    category = "advanced-crafting",
    group = "combat",
    subgroup = "ammo",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {type="item", name="piercing-shotgun-shell", amount=1},
      {type="item", name="tungsten-carbide", amount=1}
    },
    results = {{type="item", name="tungsten-shotgun-shell", amount=1}},
    allow_productivity = false,
    allow_decomposition = false,
    auto_recycle = true,
  },
  { -- casting tungsten-shotgun-shell
    type = "recipe",
    name = "casting-tungsten-shotgun-shell",
    icons =
    {
      {
        icon = "__OCs_ammo_casting__/graphics/icons/tungsten-shotgun-shell.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_ammo_casting__/graphics/icons/overlayer-recipe-molten-iron.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    category = "metallurgy",
    group = "combat",
    subgroup = "alternative-ammo",
    order = "b-[shotgun]-b[piercing-shotgun-shells]",
    enabled = false,
    energy_required = 10,
    ingredients = {
      {type="fluid", name="molten-iron", amount=100}, -- 1 piercing-shogun-shell = 4iron + 2steel + 9copper
      {type="fluid", name="molten-copper", amount=90},
      {type="item", name="tungsten-carbide", amount=1}
    },
    results = {{type="item", name="tungsten-shotgun-shell", amount=1}},
    allow_productivity = false,
    allow_decomposition = false,
    -- auto_recycle = true,
  },
  { -- tungsten-rounds
    type = "recipe",
    name = "tungsten-rounds-magazine",
    icon = "__OCs_ammo_casting__/graphics/icons/tungsten-firearm-magazine.png",
    icon_size = 64, icon_mipmaps = 4,
    category = "advanced-crafting",
    group = "combat",
    subgroup = "ammo",
    enabled = false,
    energy_required = 8,
    ingredients = {
      {type="item", name="piercing-rounds-magazine", amount=1},
      {type="item", name="tungsten-carbide", amount=1}
    },
    results = {{type="item", name="tungsten-rounds-magazine", amount=1}},
    allow_productivity = false,
    allow_decomposition = false,
    auto_recycle = true,
  },
  { -- casting tungsten-rounds-
    type = "recipe",
    name = "casting-tungsten-rounds-magazine",
    icons =
    {
      {
        icon = "__OCs_ammo_casting__/graphics/icons/tungsten-firearm-magazine.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_ammo_casting__/graphics/icons/overlayer-recipe-molten-iron.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    category = "metallurgy",
    group = "combat",
    subgroup = "alternative-ammo",
    enabled = false,
    energy_required = 8,
    ingredients = {
      {type="fluid", name="molten-iron", amount=70}, -- piercing-rounds-magazine: 4iron 1 steel 5 copper
      {type="fluid", name="molten-copper", amount=50},
      {type="item", name="tungsten-carbide", amount=1}
    },
    results = {{type="item", name="tungsten-rounds-magazine", amount=1}},
    allow_productivity = false,
    allow_decomposition = false,
    -- auto_recycle = true,
  },
  { -- tungsten railgun ammo
    type = "recipe",
    name = "tungsten-railgun-ammo",
    icon = "__OCs_ammo_casting__/graphics/icons/tungsten-railgun-ammo.png",
    icon_size = 64, icon_mipmaps = 4,
    category = "advanced-crafting",
    group = "combat",
    subgroup = "ammo",
    enabled = false,
    energy_required = 25,
    ingredients = {
      {type = "item", name = "steel-plate", amount = 2},
      {type = "item", name = "copper-cable", amount = 10},
      {type = "item", name = "explosives", amount = 2},
      {type = "item", name = "tungsten-carbide", amount = 4},
    },
    results = {{type="item", name="tungsten-railgun-ammo", amount=1}},
    allow_productivity = false,
    allow_decomposition = false,
    auto_recycle = true,
  },
  { -- casting tungsten railgun ammo
    type = "recipe",
    name = "casting-tungsten-railgun-ammo",
    icons =
    {
      {
        icon = "__OCs_ammo_casting__/graphics/icons/tungsten-railgun-ammo.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_ammo_casting__/graphics/icons/overlayer-recipe-molten-iron.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    category = "metallurgy",
    group = "combat",
    subgroup = "alternative-ammo",
    enabled = false,
    energy_required = 25,
    ingredients = {
      {type = "fluid", name = "molten-iron", amount = 60}, -- 30*2steel-plate
      {type = "fluid", name = "molten-copper", amount = 25}, -- 5*10/2 copper-cable
      {type = "item", name = "explosives", amount = 2},
      {type = "item", name = "tungsten-carbide", amount = 4},
    },
    results = {{type = "item", name = "tungsten-railgun-ammo", amount = 1}},
    allow_productivity = false,
    allow_decomposition = false,
    -- auto_recycle = true,
  },
})

data:extend({ -- casting turrets
  { -- casting gun turret
    type = "recipe",
    name = "casting-gun-turret",
    icons =
    {
      {
        icon = "__base__/graphics/icons/gun-turret.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_ammo_casting__/graphics/icons/overlayer-recipe-molten-iron.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    category = "metallurgy",
    group = "combat",
    subgroup = "turret",
    -- order = "d",
    enabled = false,
    energy_required = 8,
    ingredients = {
      {type = "fluid", name = "molten-iron", amount = 300}, -- 10*20iron-plates + 10*10iron-gear-wheel
      {type = "fluid", name = "molten-copper", amount = 10}, -- 10 copper plates
    },
    results = {{type = "item", name = "gun-turret", amount = 1}},
    allow_productivity = false,
  },
})

data:extend({ -- casting explosive ammo
  { -- casting explosive shell
    type = "recipe",
    name = "casting-explosive-shell",
    icons =
    {
      {
        icon = "__base__/graphics/icons/explosive-cannon-shell.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_ammo_casting__/graphics/icons/overlayer-recipe-molten-iron.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    category = "metallurgy",
    group = "combat",
    subgroup = "alternative-ammo",
    -- order = "bc",
    enabled = false,
    energy_required = 8, -- vanilla:
    ingredients = {
      {type = "fluid", name = "molten-iron", amount = 60}, -- 30 iron/steel * 2 steel
      {type = "item", name = "explosives", amount = 2},
      {type = "item", name = "plastic-bar", amount = 2},
    },
    results = {{type = "item", name = "explosive-cannon-shell", amount = 1}},
    allow_productivity = false,
  },
  { -- casting explosive uranium shell
    type = "recipe",
    name = "casting-explosive-uranium-shell",
    icons =
    {
      {
        icon = "__base__/graphics/icons/explosive-uranium-cannon-shell.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_ammo_casting__/graphics/icons/overlayer-recipe-molten-iron.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    category = "metallurgy",
    group = "combat",
    subgroup = "alternative-ammo",
    -- order = "bd",
    enabled = false,
    energy_required = 12, -- vanilla: 8 + 12 
    ingredients = {
      {type = "fluid", name = "molten-iron", amount = 60}, -- 30 iron/steel * 2 steel
      {type = "item", name = "explosives", amount = 2},
      {type = "item", name = "plastic-bar", amount = 2},
      {type = "item", name = "uranium-238", amount = 1},
    },
    results = {{type = "item", name = "explosive-uranium-cannon-shell", amount = 1}},
    allow_productivity = false,
  },
})

data:extend({ -- biochamber recipes
  { -- explosives (item)
    type = "recipe",
    name = "bio-explosives",
    icons =
    {
      {
        icon = "__base__/graphics/icons/explosives.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_ammo_casting__/graphics/icons/overlayer-recipe-biochamber.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    category = "organic",
    group = "intermediate-products",
    -- subgroup = "ammo",
    enabled = false,
    energy_required = 4,
    ingredients = {
      {type = "fluid", name = "water", amount = 10},
      {type = "item", name = "sulfur", amount = 1},
      {type = "item", name = "coal", amount = 1},
    },
    results = {{type = "item", name = "explosives", amount = 2}},
    -- allow_productivity = false,
    -- allow_decomposition = false,
    -- auto_recycle = true,
  },
  { -- explosives space (also viable on gleba)
    type = "recipe",
    name = "bio-explosives-space",
    icons =
    {
      {
        icon = "__base__/graphics/icons/explosives.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_ammo_casting__/graphics/technology/overlayer-tech-space.png",
        icon_size = 256,
        icon_mipmaps = 4,
        icon_scale = 0.25,
      }
    },
    category = "organic",
    group = "intermediate-products",
    -- subgroup = "ammo",
    enabled = false,
    energy_required = 10, -- 4explosives + 5*2coal-synthesis = 14 -- use the slowest part
    ingredients = {
      {type = "fluid", name = "water", amount = 10}, -- could be replaced by waterice
      {type = "item", name = "sulfur", amount = 2}, -- 1 for coal-synthesis + 1 for explosives
      {type = "item", name = "carbon", amount = 5}, -- 5 for coal-synthesis
    },
    results = {{type = "item", name = "explosives", amount = 2}},
    -- allow_productivity = false,
    -- allow_decomposition = false,
    -- auto_recycle = true,
  },
  { -- explosives gleba style
    type = "recipe",
    name = "bio-explosives-gleba",
    icons =
    {
      {
        icon = "__base__/graphics/icons/explosives.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_ammo_casting__/graphics/technology/overlayer-tech-gleba.png",
        icon_size = 256,
        icon_mipmaps = 4,
        icon_scale = 0.25,
      }
    },
    category = "organic",
    group = "intermediate-products",
    -- subgroup = "ammo",
    enabled = false,
    energy_required = 60, -- 5*12spoilage-to-carbon + 5*2coal-synthesis + 2*2sulfur + 1*4explosives = 78 -- use the slowest part (5*12=60)
    ingredients = {
      {type = "fluid", name = "water", amount = 35}, -- 10 for explosives + 5*5 coal-synthesis
      {type = "item", name = "spoilage", amount = 40}, -- 5 for sulfur x2, 6 for carbon x5 for 1 coal-synthesis = 2*5 + 5*6 = 40
      {type = "item", name = "bioflux", amount = 2}, -- 1 for sulfur x2 (one for coal-synthesis)
    },
    results = {{type = "item", name = "explosives", amount = 2}},
    -- allow_productivity = false,
    allow_decomposition = false,
    -- auto_recycle = true,
  },
  { -- bio-rocket
    type = "recipe",
    name = "bio-rocket",
    icons =
    {
      {
        icon = "__base__/graphics/icons/rocket.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_ammo_casting__/graphics/icons/overlayer-recipe-biochamber.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    category = "organic",
    group = "combat",
    subgroup = "alternative-ammo",
    enabled = false,
    energy_required = 4,
    ingredients = {
      {type = "item", name = "explosives", amount = 1},
      {type = "item", name = "iron-plate", amount = 2},
    },
    results = {{type = "item", name = "rocket", amount = 1}},
    allow_productivity = false,
    -- allow_decomposition = false,
    -- auto_recycle = true,
  },
  { -- bio-explosive-rocket
    type = "recipe",
    name = "bio-explosive-rocket",
    icons =
    {
      {
        icon = "__base__/graphics/icons/explosive-rocket.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_ammo_casting__/graphics/icons/overlayer-recipe-biochamber.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    category = "organic",
    group = "combat",
    subgroup = "alternative-ammo",
    enabled = false,
    energy_required = 8,
    ingredients = {
      {type = "item", name = "explosives", amount = 3},
      {type = "item", name = "iron-plate", amount = 2},
    },
    results = {{type = "item", name = "explosive-rocket", amount = 1}},
    allow_productivity = false,
    -- allow_decomposition = false,
    -- auto_recycle = true,
  },
  { -- fish-breeding shamelessly copied from space-age-dlc. space version
    type = "recipe",
    name = "space-fish-breeding",
    icons =
    {
      {
        icon = "__space-age__/graphics/icons/fish-breeding.png",
        icon_size = 64,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_ammo_casting__/graphics/technology/overlayer-tech-space.png",
        icon_size = 256,
        icon_mipmaps = 4,
        icon_scale = 0.25,
      }
    },
    category = "organic",
    subgroup = "nauvis-agriculture",
    order = "b[nauvis-agriculture]-b[fish-breeding]",
    result_is_always_fresh = true,
    auto_recycle = false,
    energy_required = 6,
    enabled = false,
    surface_conditions =
    {
      {
        property = "gravity",
        min = 0,
        max = 0
      }
    },
    ingredients =
    {
      {type = "item", name = "raw-fish", amount = 2, ignored_by_stats = 2},
      {type = "item", name = "nutrients", amount = 110}, -- vanilla is 100. Positive-feedback-loop now at +10 instead of +20 per cycle.
      {type = "fluid", name = "water", amount = 100}
    },
    results = {{type="item", name="raw-fish", amount=4}}, -- percent_spoiled=0.5
    allow_productivity = false,
    allow_quality = false,
    crafting_machine_tint =
    {
      primary = {0, 0, 1, 1},
      secondary = {0, 0, 1, 1}
    },
    show_amount_in_title = false
  },
})

data:extend({ -- armour plating related
  { -- light armour plating
    type = "recipe",
    name = "light-armour-plating",
    icons = {
      {
        icon = "__OCs_ammo_casting__/graphics/icons/heat-shielding.png", -- from Space Exploration by Earendel
        -- icon = "__base__/graphics/icons/iron-plate.png",
        icon_size = 64,
        icon_mipmaps = 1,
        tint = plating_variants["light"].tint,
      },
      -- {
      --   icon = "__OCs_ammo_casting__/graphics/technology/overlayer-tech-molten-iron.png",
      --   icon_size = 256,
      --   icon_mipmaps = 4,
      -- }
    },
    category = "crafting",
    group = "combat",
    subgroup = "armour-plating",
    enabled = false,
    energy_required = 4,
    ingredients = { -- 96iron-plate +8electronic-circuit =< 100iron-plate
      {type = "item", name = "iron-plate", amount = 16},
      {type = "item", name = "steel-plate", amount = 16},
      {type = "item", name = "electronic-circuit", amount = 8},
    },
    results = {
      {type = "item", name = "light-armour-plating", amount = 1},
    },
    allow_productivity = false,
    allow_decomposition = true,
  },
  { -- heavy armour plating
    type = "recipe",
    name = "heavy-armour-plating",
    icons = {
      {
        icon = "__OCs_ammo_casting__/graphics/icons/heat-shielding.png", -- from Space Exploration by Earendel
        icon_size = 64,
        icon_mipmaps = 1,
      },
      -- {
      --   icon = "__OCs_ammo_casting__/graphics/icons/overlayer-recipe-molten-iron.png",
      --   icon_size = 64,
      --   icon_mipmaps = 4,
      --   -- scale = 0.25,
      -- }
    },
    category = "crafting-with-fluid-or-metallurgy",
    group = "combat",
    subgroup = "armour-plating",
    enabled = false,
    energy_required = 16,
    ingredients = { -- =< 400iron-plate
      {type = "item", name = "light-armour-plating", amount = 4},
      {type = "item", name = "carbon", amount = 16},
      -- {type = "item", name = "steel-plate", amount = 16},
      {type = "item", name = "low-density-structure", amount = 2},
      {type = "item", name = "advanced-circuit", amount = 4},
    },
    results = {
      {type = "item", name = "heavy-armour-plating", amount = 1},
    },
    allow_productivity = false,
    allow_decomposition = true,
  },
  { -- casting light armour plating
    type = "recipe",
    name = "casting-light-armour-plating",
    icons =
    {
      {
        icon = "__OCs_ammo_casting__/graphics/icons/heat-shielding.png", -- from Space Exploration by Earendel
        icon_size = 64,
        -- icon_mipmaps = 4,
        tint = plating_variants["light"].tint,
      },
      {
        icon = "__OCs_ammo_casting__/graphics/icons/overlayer-recipe-molten-iron.png",
        icon_size = 64,
        -- icon_scale = 0.25,
        -- shift = {8, 8},
        icon_mipmaps = 4,
      }
    },
    category = "metallurgy",
    group = "combat",
    subgroup = "armour-plating",
    enabled = false,
    energy_required = 4,
    ingredients = {
      {type = "fluid", name = "molten-iron", amount = 640}, --  (16*30+16*10)
      {type = "item", name = "electronic-circuit", amount = 8},
    },
    results = {
      {type = "item", name = "light-armour-plating", amount = 1},
    },
    allow_productivity = false,
    allow_decomposition = true,
  },
  { -- tungsten armour plating
    type = "recipe",
    name = "tungsten-armour-plating",
    icons =
    {
      {
        icon = "__OCs_ammo_casting__/graphics/icons/heat-shielding.png", -- from Space Exploration by Earendel
        icon_size = 64,
        -- icon_mipmaps = 4,
        tint = plating_variants["tungsten"].tint,
      },
      -- {
      --   icon = "__OCs_ammo_casting__/graphics/icons/overlayer-recipe-molten-iron.png",
      --   icon_size = 64,
      --   icon_mipmaps = 4,
      -- }
    },
    category = "metallurgy",
    group = "combat",
    subgroup = "armour-plating",
    enabled = false,
    energy_required = 64,
    ingredients = {
      {type = "item", name = "heavy-armour-plating", amount = 4},
      {type = "item", name = "tungsten-plate", amount = 4},
      -- {type = "fluid", name = "molten-iron", amount = 480}, -- 30*16steel-plate
      {type = "item", name = "low-density-structure", amount = 4},
      {type = "item", name = "processing-unit", amount = 1},
    },
    results = {
      {type = "item", name = "tungsten-armour-plating", amount = 1},
    },
    allow_productivity = false,
    allow_decomposition = false,
    allow_autodecomposition = true,
  },
  { -- reactive armour plating
    type = "recipe",
    name = "reactive-armour-plating",
    icons =
    {
      {
        icon = "__OCs_ammo_casting__/graphics/icons/heat-shielding.png", -- from Space Exploration by Earendel
        icon_size = 64,
        -- icon_mipmaps = 4,
        tint = plating_variants["reactive"].tint,
      },
      {
        icon = "__OCs_ammo_casting__/graphics/icons/overlayer-recipe-biochamber.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    category = "organic",
    group = "combat",
    subgroup = "armour-plating",
    enabled = false,
    energy_required = 64,
    ingredients = {
      {type = "item", name = "heavy-armour-plating", amount = 4},
      {type = "item", name = "explosives", amount = 4},
      -- {type = "item", name = "steel-plate", amount = 16},
      {type = "item", name = "low-density-structure", amount = 4},
      {type = "item", name = "processing-unit", amount = 1},
    },
    results = {
      {type = "item", name = "reactive-armour-plating", amount = 1},
    },
    allow_productivity = false,
    allow_decomposition = true,
  },
  { -- ultra-light armour plating
    type = "recipe",
    name = "ultra-light-armour-plating",
    icons =
    {
      {
        icon = "__OCs_ammo_casting__/graphics/icons/heat-shielding.png", -- from Space Exploration by Earendel
        icon_size = 64,
        -- icon_mipmaps = 4,
        tint = plating_variants["ultra_light"].tint,
      },
      {
        icon = "__OCs_ammo_casting__/graphics/icons/overlayer-recipe-em-plant.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    category = "electromagnetics",
    group = "combat",
    subgroup = "armour-plating",
    enabled = false,
    energy_required = 64,
    ingredients = {
      {type = "item", name = "heavy-armour-plating", amount = 4},
      {type = "item", name = "carbon-fiber", amount = 4},
      -- {type = "item", name = "steel-plate", amount = 16},
      {type = "item", name = "low-density-structure", amount = 4},
      {type = "item", name = "processing-unit", amount = 1},
    },
    results = {
      {type = "item", name = "ultra-light-armour-plating", amount = 1},
    },
    allow_productivity = false,
    allow_decomposition = true,
  },
})

-- change vanilla artillery shells to medium and introduce heavy artillery shells
if settings.startup["allow-casting-explosive-ammo"].value then

  -- vanilla version is overwritten to medium artillery shell
  if data.raw["recipe"]["artillery-shell"] then
    data.raw["recipe"]["artillery-shell"].localised_name = {"recipe-name.medium-artillery-shell"}
    data.raw["recipe"]["artillery-shell"].ingredients = { -- replaced by vanilla like recipe
      {type = "item", name = "steel-plate", amount = 8},
      -- {type = "item", name = "plastic-bar", amount = 8}, -- I don't like plastic ammo
      {type = "item", name = "explosives", amount = 8}, -- half of vanilla, the other 8 are inside the 4explosive-cannon-shell
      -- {type = "item", name = "explosive-cannon-shell", amount = 4}, -- vanilla. replace it with items above
      {type = "item", name = "radar", amount = 1},
    }
    log("Replaced artillery shell with medium artillery shell.")
  end

  data:extend({ -- casting light artillery shell + heavy artillery shell
    { -- casting-artillery-shell (vanilla-like without DLC)
      type = "recipe",
      name = "casting-artillery-shell",
      localised_name = {"recipe-name.casting-medium-artillery-shell"},
      icons =
      {
        {
          icon = "__base__/graphics/icons/artillery-shell.png",
          icon_size = 64,
          icon_mipmaps = 4,
        },
        {
          icon = "__OCs_ammo_casting__/graphics/icons/overlayer-recipe-molten-iron.png",
          icon_size = 64,
          icon_mipmaps = 4,
        }
      },
      category = "metallurgy",
      group = "combat",
      subgroup = "alternative-ammo",
      -- order = "ca",
      enabled = false,
      energy_required = 16, -- from raw in space age: 24, last step: 15 for shell
      ingredients = { -- vanilla like recipe
        {type = "fluid", name = "molten-iron", amount = 490}, --  10*25iron-plate + 30*8steel-plate 
        {type = "fluid", name = "molten-copper", amount = 75}, -- 7.5 copper-plates
        {type = "item", name = "explosives", amount = 8}, -- half of vanilla
        -- {type = "item", name = "plastic-bar", amount = 8}, -- I don't like plastic ammo
      },
      -- ingredients = { -- exactly DLC recipe
      --   {type = "fluid", name = "molten-iron", amount = 250}, --  25iron-plate
      --   {type = "fluid", name = "molten-copper", amount = 75}, -- 7.5copper-plate
      --   {type = "item", name = "tungsten-plate", amount = 4},
      --   {type = "item", name = "explosives", amount = 8},
      --   {type = "item", name = "calcite", amount = 1},
      -- },
      results = {{type = "item", name = "artillery-shell", amount = 1}},
      allow_productivity = false,
    },
    { -- heavy artillery shell (DLC-like)
      type = "recipe",
      name = "heavy-artillery-shell",
      icon = "__OCs_ammo_casting__/graphics/icons/tungsten-artillery-shell.png",
      icon_size = 64, icon_mipmaps = 4,
      category = "crafting-with-fluid", -- just so it needs at least assembling machine 2
      group = "combat",
      subgroup = "ammo",
      enabled = false,
      energy_required = 25,
      ingredients = {-- DLC like recipe
        {type = "item", name = "radar", amount = 1},
        {type = "item", name = "explosives", amount = 16},
        {type = "item", name = "calcite", amount = 1},
        {type = "item", name = "tungsten-carbide", amount = 4}, -- carbide instread of plate
        -- {type = "item", name = "plastic-bar", amount = 8}, -- I don't like plastic ammo
      },
      results = {{type="item", name="heavy-artillery-shell", amount=1}},
      allow_productivity = false,
      allow_decomposition = false,
      auto_recycle = true,
    },
    { -- upgrade to heavy artillery shell from artillery shell
      type = "recipe",
      name = "heavy-artillery-shell-upgrading",
      icon = "__OCs_ammo_casting__/graphics/icons/tungsten-artillery-shell.png",
      icon_size = 64, icon_mipmaps = 4,
      category = "crafting-with-fluid", -- just so it needs at least assembling machine 2
      group = "combat",
      subgroup = "ammo",
      enabled = false,
      energy_required = 10,
      ingredients = {
        {type = "item", name = "artillery-shell", amount = 1},
        {type = "item", name = "explosives", amount = 8},
        {type = "item", name = "calcite", amount = 1},
        {type = "item", name = "tungsten-carbide", amount = 4}, -- carbide instread of plate
      },
      results = {{type="item", name="heavy-artillery-shell", amount=1}},
    },
    { -- casting heavy artillery shell
      type = "recipe",
      name = "casting-heavy-artillery-shell",
      icons =
      {
        {
          icon = "__OCs_ammo_casting__/graphics/icons/tungsten-artillery-shell.png",
          icon_size = 64,
          icon_mipmaps = 4,
        },
        {
          icon = "__OCs_ammo_casting__/graphics/icons/overlayer-recipe-molten-iron.png",
          icon_size = 64,
          icon_mipmaps = 4,
        }
      },
      category = "metallurgy",
      group = "combat",
      subgroup = "alternative-ammo",
      enabled = false,
      energy_required = 25,
      ingredients = { -- DLC like recipe
        {type = "fluid", name = "molten-iron", amount = 250}, --  25iron-plate
        {type = "fluid", name = "molten-copper", amount = 75}, -- 7.5copper-plate
        {type = "item", name = "explosives", amount = 16},
        {type = "item", name = "calcite", amount = 1},
        {type = "item", name = "tungsten-carbide", amount=4}, -- carbide instread of plate
        -- {type = "item", name = "plastic-bar", amount = 8}, -- I don't like plastic ammo
      },
      results = {{type="item", name="heavy-artillery-shell", amount=1}},
      allow_productivity = false,
      allow_decomposition = false,
      auto_recycle = true,
    }
  })
  log("Added heavy artillery shell and casting recipes.")
else -- nothing happens
  log("Vanilla Artillery shell untouched.")
end

-- Check for the scattergun_turret mod and add the adjacent recipes if it exists
if mods["scattergun_turret"] then
  data:extend({
    { -- casting uranium shotgun shell
      type = "recipe",
      name = "casting-uranium-shotgun-shell",
      icons =
      {
        {
          icon = "__OCs_ammo_casting__/graphics/icons/uranium-shotgun-shell.png",
          icon_size = 64,
          icon_mipmaps = 4,
        },
        {
          icon = "__OCs_ammo_casting__/graphics/icons/overlayer-recipe-molten-iron.png",
          icon_size = 64,
          icon_mipmaps = 4,
        }
      },
      category = "metallurgy",
      group = "combat",
      subgroup = "alternative-ammo",
      enabled = false,
      energy_required = 12,
      ingredients =
      {
        {type="fluid", name="molten-iron", amount=120}, -- 1 piercing-shogun-shell = 9iron + 2steel + 4copper
        {type="fluid", name="molten-copper", amount=40},
        {type="item", name="uranium-238", amount=1}
      },
      results = {{type="item", name="w93-uranium-shotgun-shell", amount=1}},
      allow_productivity = false,
    },
    { -- casting fragmentation shell
      type = "recipe",
      name = "casting-fragmentation-shell",
      icons =
      {
        {
          icon = "__scattergun_turret__/graphics/icons/fragmentation-cannon-shell.png",
          icon_size = 64,
          icon_mipmaps = 4,
        },
        {
          icon = "__OCs_ammo_casting__/graphics/icons/overlayer-recipe-molten-iron.png",
          icon_size = 64,
          icon_mipmaps = 4,
        }
      },
      category = "metallurgy",
      group = "combat",
      subgroup = "alternative-ammo",
      enabled = false,
      energy_required = 8,
      ingredients = {
        {type="fluid", name="molten-iron", amount=100}, --  30*2 steel + 5*8 iron stick
        {type="item", name="explosives", amount=1}
      },
      results = {{type="item", name="w93-fragmentation-cannon-shell", amount=2}},
      allow_productivity = false,
    },
  })
end

if mods["aai-industry"] then
  if data.raw.recipe["casting-gun-turret"] then
    data.raw.recipe["casting-gun-turret"].ingredients = {
      {type="fluid", name="molten-iron", amount=550}, -- 20iron-plate + 10gear-wheel + 5single-cylinder-engine (1iron-plate + 1gear-wheel)
      -- {type="fluid", name="molten-copper", amount=50},
    }
    log("Compatibility for AAI Industry: Modified recipe for casting-gun-turret.")
  end
end

if mods["vtk-cannon-turret"] then -- casting cannon turrets + all cannon shell magazines
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
          icon = "__OCs_ammo_casting__/graphics/icons/overlayer-recipe-molten-iron.png",
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
          icon = "__OCs_ammo_casting__/graphics/icons/overlayer-recipe-molten-iron.png",
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
          icon = "__OCs_ammo_casting__/graphics/icons/overlayer-recipe-molten-iron.png",
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
          icon = "__OCs_ammo_casting__/graphics/icons/overlayer-recipe-molten-iron.png",
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
          icon = "__OCs_ammo_casting__/graphics/icons/overlayer-recipe-molten-iron.png",
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
          icon = "__OCs_ammo_casting__/graphics/icons/overlayer-recipe-molten-iron.png",
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
          icon = "__OCs_ammo_casting__/graphics/icons/overlayer-recipe-molten-iron.png",
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
end
-- if vtk-cannon-turret and aai-industry then the cannon turrets must be recalculated.

if mods["More_Ammo"] then -- developement paused
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
end