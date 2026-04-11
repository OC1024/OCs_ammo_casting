local plating_variants = require("prototypes.utils.plating_variants")
local tungsten_steel_mode = settings.startup["tungsten-steel-ammo"].value
local generator_api = require("__OCs_base_assets__.prototypes.utils.api") -- pepare the generator
local oc_helper = require("__OCs_base_assets__.prototypes.utils.helper")

--- either tungsten-plate or tungsten-carbide + steel-plate
---@param n integer --amount of (n tungsten-plate) OR (2*n of tungten-carbide + n of steel-plate)
---@return table -- list for ingredient table. needed to be unpacked with table.unpack(tungsten_ing(n)) in the recipe definition
local function tungsten_ing(n)
  if tungsten_steel_mode then
    return {
      { type = "item", name = "tungsten-plate", amount = 1 * n }
    }
  else
    return {
      { type = "item", name = "tungsten-carbide", amount = 2 * n },
      { type = "item", name = "steel-plate",      amount = 1 * n }
    }
  end
end

-- crafting tungsten ammo
data:extend({
  { -- tungsten-rounds
    type = "recipe",
    name = "tungsten-rounds-magazine",
    icon = "__OCs_ammo_casting__/graphics/icons/tungsten-firearm-magazine.png",
    icon_size = 64,
    icon_mipmaps = 4,
    category = "advanced-crafting",
    group = "combat",
    subgroup = "ammo",
    enabled = false,
    energy_required = 8,
    ingredients = {
      { type = "item", name = "piercing-rounds-magazine", amount = 1 },
      table.unpack(tungsten_ing(1)),
    },
    results = { { type = "item", name = "tungsten-rounds-magazine", amount = 1 } },
    allow_productivity = false,
    allow_decomposition = false,
    auto_recycle = true,
  },
  { -- tungsten-shotgun-shell
    type = "recipe",
    name = "tungsten-shotgun-shell",
    icon = "__OCs_ammo_casting__/graphics/icons/tungsten-shotgun-shell.png",
    icon_size = 64,
    icon_mipmaps = 4,
    category = "advanced-crafting",
    group = "combat",
    subgroup = "ammo",
    enabled = false,
    energy_required = 10,
    ingredients = {
      { type = "item", name = "piercing-shotgun-shell", amount = 1 },
      { type = "item", name = "tungsten-carbide",       amount = 1 } -- always tungsten-carbide here
    },
    results = { { type = "item", name = "tungsten-shotgun-shell", amount = 1 } },
    allow_productivity = false,
    allow_decomposition = false,
    auto_recycle = true,
  },
  { -- tungsten-cannon-shell
    type = "recipe",
    name = "tungsten-cannon-shell",
    icon = "__OCs_ammo_casting__/graphics/icons/tungsten-cannon-shell.png",
    icon_size = 64,
    icon_mipmaps = 4,
    category = "advanced-crafting",
    group = "combat",
    subgroup = "ammo",
    enabled = false,
    energy_required = 12,
    ingredients = {
      { type = "item", name = "iron-plate", amount = 2 }, -- fins or something
      { type = "item", name = "explosives", amount = 2 }, -- twice the vanilla
      table.unpack(tungsten_ing(1)),
    },
    results = { { type = "item", name = "tungsten-cannon-shell", amount = 1 } },
    allow_productivity = false,
    allow_decomposition = false,
    auto_recycle = true,
  },
  { -- tungsten railgun ammo
    type = "recipe",
    name = "tungsten-railgun-ammo",
    icon = "__OCs_ammo_casting__/graphics/icons/tungsten-railgun-ammo.png",
    icon_size = 64,
    icon_mipmaps = 4,
    category = "advanced-crafting",
    group = "combat",
    subgroup = "ammo",
    enabled = false,
    energy_required = 25,
    ingredients = {
      { type = "item", name = "copper-cable", amount = 10 },
      { type = "item", name = "explosives",   amount = 2 }, -- like vanilla
      table.unpack(tungsten_ing(2)),
    },
    results = { { type = "item", name = "tungsten-railgun-ammo", amount = 1 } },
    allow_productivity = false,
    allow_decomposition = false,
    auto_recycle = true,
  },
})

-- uranium shotgun shell (avoid duplicates)
if not mods["scattergun_turret"] then
  data:extend({
    { -- uranium shotgun shell
      type = "recipe",
      name = "uranium-shotgun-shell",
      icons = { {
        icon = "__OCs_ammo_casting__/graphics/icons/uranium-shotgun-shell.png",
        icon_size = 64,
        icon_mipmaps = 4,
        -- tint = { r = 0.1, g = 0.8, b = 0.1 }
      } },
      category = "crafting",
      group = "combat",
      subgroup = "ammo",
      enabled = false,
      energy_required = 10,
      ingredients = {
        { type = "item", name = "piercing-shotgun-shell", amount = 1 },
        { type = "item", name = "uranium-238",          amount = 1 }
      },
      results = { { type = "item", name = "uranium-shotgun-shell", amount = 1 } },
      allow_productivity = false,
      allow_decomposition = false,
      auto_recycle = true,
     }
   })
end

-- biochamber recipes
data:extend({
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
        icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-biochamber.png",
        icon_size = 64,
        icon_mipmaps = 4,
      }
    },
    category = "organic",
    group = "intermediate-products",
    enabled = false,
    energy_required = 4,
    ingredients = {
      { type = "fluid", name = "water",  amount = 10 },
      { type = "item",  name = "sulfur", amount = 1 },
      { type = "item",  name = "coal",   amount = 1 },
    },
    results = { { type = "item", name = "explosives", amount = 2 } },
    allow_productivity = true,
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
        icon = "__OCs_base_assets__/graphics/technology/overlayer-tech-space.png",
        icon_size = 256,
        icon_mipmaps = 4,
        icon_scale = 0.25,
      }
    },
    category = "organic",
    group = "intermediate-products",
    enabled = false,
    energy_required = 10,
    -- 4explosives + 5*2coal-synthesis = 14 -- use the slowest part
    ingredients = {
      { type = "fluid", name = "water",  amount = 10 }, -- could be replaced by waterice
      { type = "item",  name = "sulfur", amount = 2 },  -- 1 for coal-synthesis + 1 for explosives
      { type = "item",  name = "carbon", amount = 5 },  -- 5 for coal-synthesis
    },
    results = { { type = "item", name = "explosives", amount = 2 } },
    allow_productivity = true,
    allow_decomposition = false,
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
        icon = "__OCs_base_assets__/graphics/technology/overlayer-tech-gleba.png",
        icon_size = 256,
        icon_mipmaps = 4,
        icon_scale = 0.25,
      }
    },
    category = "organic",
    group = "intermediate-products",
    enabled = false,
    energy_required = 20,
    -- 5*12spoilage-to-carbon + 5*2coal-synthesis + 2*2sulfur + 1*4explosives = 78 -- slowest part (5*12=60) -- na, use just arbitrary value
    ingredients = {
      { type = "fluid", name = "water",    amount = 35 }, -- 10 for explosives + 5*5 coal-synthesis
      { type = "item",  name = "spoilage", amount = 40 }, -- 5 for sulfur x2, 6 for carbon x5 for 1 coal-synthesis = 2*5 + 5*6 = 40
      { type = "item",  name = "bioflux",  amount = 2 },  -- 1 for sulfur x2 (one for coal-synthesis)
    },
    results = { { type = "item", name = "explosives", amount = 2 } },
    allow_productivity = true,
    allow_decomposition = false,
    -- auto_recycle = true,
  },
})
if settings.startup["space-fish"].value then
  data:extend({
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
          icon = "__OCs_base_assets__/graphics/technology/overlayer-tech-space.png",
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
        { type = "item",  name = "raw-fish",  amount = 2,  ignored_by_stats = 2 },
        { type = "item",  name = "nutrients", amount = 110 }, -- vanilla is 100. Positive-feedback-loop now at +10 instead of +20 per cycle.
        { type = "fluid", name = "water",     amount = 100 }
      },
      results = { { type = "item", name = "raw-fish", amount = 4 } }, -- percent_spoiled=0.5
      allow_productivity = false,
      allow_quality = false,
      crafting_machine_tint =
      {
        primary = { 0, 0, 1, 1 },
        secondary = { 0, 0, 1, 1 }
      },
      show_amount_in_title = false
    },
  })
end

-- armour plating related
if settings.startup["armour-plating"].value then
  data:extend({
    { -- light armour plating
      type = "recipe",
      name = "light-armour-plating",
      icons = {
        {
          icon = "__OCs_base_assets__/graphics/icons/reinforced_plating.png",
          icon_size = 64,
          icon_mipmaps = 4,
          tint = plating_variants["light"].tint,
        },
      },
      category = "crafting",
      group = "combat",
      subgroup = "armour-plating",
      enabled = false,
      energy_required = 4,
      ingredients = { -- 96iron-plate +8electronic-circuit >= 100iron-plate
        { type = "item", name = "iron-plate",         amount = 16 },
        { type = "item", name = "steel-plate",        amount = 16 },
        { type = "item", name = "electronic-circuit", amount = 8 },
      },
      results = {
        { type = "item", name = "light-armour-plating", amount = 1 },
      },
      allow_productivity = false,
      allow_decomposition = true,
    },
    { -- heavy armour plating
      type = "recipe",
      name = "heavy-armour-plating",
      icons = {
        {
          icon = "__OCs_base_assets__/graphics/icons/reinforced_plating.png",
          icon_size = 64,
          icon_mipmaps = 4,
        },
      },
      category = "crafting-with-fluid-or-metallurgy",
      group = "combat",
      subgroup = "armour-plating",
      enabled = false,
      energy_required = 16,
      ingredients = { -- >= 400iron-plate
        { type = "item", name = "light-armour-plating",  amount = 4 },
        -- { type = "item", name = "carbon", amount = 4 },
        -- {type = "item", name = "steel-plate", amount = 16},
        { type = "item", name = "low-density-structure", amount = 2 },
        { type = "item", name = "advanced-circuit",      amount = 4 },
      },
      results = {
        { type = "item", name = "heavy-armour-plating", amount = 1 },
      },
      allow_productivity = false,
      allow_decomposition = true,
    },
    { -- tungsten armour plating
      type = "recipe",
      name = "tungsten-armour-plating",
      icons = {
        {
          icon = "__OCs_base_assets__/graphics/icons/reinforced_plating.png",
          icon_size = 64,
          icon_mipmaps = 4,
          tint = plating_variants["tungsten"].tint,
        },
        {
          icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-tungsten-plate.png",
          icon_size = 64,
          icon_mipmaps = 4,
        }
      },
      category = "metallurgy",
      group = "combat",
      subgroup = "armour-plating",
      enabled = false,
      energy_required = 64,
      ingredients = {
        { type = "item", name = "heavy-armour-plating",  amount = 4 },
        { type = "item", name = "tungsten-plate",        amount = 4 },
        -- {type = "fluid", name = "molten-iron", amount = 480}, -- 30*16steel-plate
        { type = "item", name = "low-density-structure", amount = 4 },
        { type = "item", name = "processing-unit",       amount = 1 },
      },
      results = {
        { type = "item", name = "tungsten-armour-plating", amount = 1 },
      },
      allow_productivity = false,
      allow_decomposition = false,
      allow_autodecomposition = true,
    },
    { -- reactive armour plating
      type = "recipe",
      name = "reactive-armour-plating",
      icons = {
        {
          icon = "__OCs_base_assets__/graphics/icons/reinforced_plating.png",
          icon_size = 64,
          icon_mipmaps = 4,
          tint = plating_variants["reactive"].tint,
        },
        {
          icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-biochamber.png",
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
        { type = "item", name = "heavy-armour-plating",  amount = 4 },
        { type = "item", name = "explosives",            amount = 4 },
        -- {type = "item", name = "steel-plate", amount = 16},
        { type = "item", name = "low-density-structure", amount = 4 },
        { type = "item", name = "processing-unit",       amount = 1 },
      },
      results = {
        { type = "item", name = "reactive-armour-plating", amount = 1 },
      },
      allow_productivity = false,
      allow_decomposition = true,
    },
    { -- ultra-light armour plating
      type = "recipe",
      name = "ultra-light-armour-plating",
      icons = {
        {
          icon = "__OCs_base_assets__/graphics/icons/reinforced_plating.png",
          icon_size = 64,
          icon_mipmaps = 4,
          tint = plating_variants["ultra_light"].tint,
        },
        {
          icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-em-plant.png",
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
        { type = "item", name = "heavy-armour-plating",  amount = 4 },
        { type = "item", name = "carbon-fiber",          amount = 4 },
        -- {type = "item", name = "steel-plate", amount = 16},
        { type = "item", name = "low-density-structure", amount = 4 },
        { type = "item", name = "processing-unit",       amount = 1 },
      },
      results = {
        { type = "item", name = "ultra-light-armour-plating", amount = 1 },
      },
      allow_productivity = false,
      allow_decomposition = true,
    },
  })

  if settings.startup["earlier-armor-plating"].value then
    -- replace_ingredient("heavy-armour-plating", "item", "carbon", "item", "coal", true)
    -- remove_ingredient("heavy-armour-plating", "item", "electric-circuit", 4)
    oc_helper.remove_ingredient("heavy-armour-plating", "item", "low-density-structure", 2)
    oc_helper.add_ingredient("heavy-armour-plating", "item", "steel-plate", 10)-- 2x2steel-plate + 2x5plastic-bar. round down
    oc_helper.add_ingredient(("heavy-armour-plating"), "item", "copper-plate", 40)-- 2x20copper-plate
  end
  if settings.startup["earlier-solar-panel-equipment"].value then
    oc_helper.remove_ingredient("solar-panel-equipment", "item", "advanced-circuit", 2)
    oc_helper.add_ingredient("solar-panel-equipment", "item", "electronic-circuit", 10)-- 2x2=4 but it shall not to be to cheap
  end
end

-- change vanilla artillery shells to medium and introduce heavy artillery shells
if settings.startup["heavy-artillery-shells"].value then
  -- vanilla version is overwritten to medium artillery shell
  if data.raw["recipe"]["artillery-shell"] then
    data.raw["recipe"]["artillery-shell"].localised_name = { "recipe-name.medium-artillery-shell" }
    data.raw["recipe"]["artillery-shell"].ingredients = { -- replaced by vanilla like recipe
      { type = "item", name = "steel-plate", amount = 8 },
      -- {type = "item", name = "plastic-bar", amount = 8}, -- I don't like plastic ammo
      { type = "item", name = "explosives",  amount = 8 }, -- half of vanilla, the other 8 are inside the 4explosive-cannon-shell
      -- {type = "item", name = "explosive-cannon-shell", amount = 4}, -- vanilla. replace it with items above
      { type = "item", name = "radar",       amount = 1 },
    }
    log("Replaced artillery shell with medium artillery shell.")
  end

  -- casting light artillery shell + heavy artillery shell
  data:extend({
    { -- heavy artillery shell (DLC-like)
      type = "recipe",
      name = "heavy-artillery-shell",
      icon = "__OCs_ammo_casting__/graphics/icons/tungsten-artillery-shell.png",
      icon_size = 64,
      icon_mipmaps = 4,
      category = "crafting-with-fluid", -- just so it needs at least assembling machine 2
      group = "combat",
      subgroup = "ammo",
      enabled = false,
      energy_required = 25,
      ingredients = { -- DLC like recipe
        { type = "item", name = "radar",          amount = 1 },
        { type = "item", name = "explosives",     amount = 16 },
        { type = "item", name = "calcite",        amount = 1 },
        { type = "item", name = "tungsten-plate", amount = 4 },
        -- {type = "item", name = "plastic-bar", amount = 8}, -- I don't like plastic ammo
      },
      results = { { type = "item", name = "heavy-artillery-shell", amount = 1 } },
      allow_productivity = false,
      allow_decomposition = false,
      auto_recycle = true,
    },
    { -- upgrade to heavy artillery shell from artillery shell
      type = "recipe",
      name = "heavy-artillery-shell-upgrading",
      icon = "__OCs_ammo_casting__/graphics/icons/tungsten-artillery-shell.png",
      icon_size = 64,
      icon_mipmaps = 4,
      category = "crafting-with-fluid", -- just so it needs at least assembling machine 2
      group = "combat",
      subgroup = "ammo",
      enabled = false,
      energy_required = 10,
      ingredients = {
        { type = "item", name = "artillery-shell", amount = 1 },
        { type = "item", name = "explosives",      amount = 8 },
        { type = "item", name = "calcite",         amount = 1 },
        { type = "item", name = "tungsten-plate",  amount = 4 },
      },
      results = { { type = "item", name = "heavy-artillery-shell", amount = 1 } },
    },
  })
  local artillery_stack_size = data.raw.ammo["artillery-shell"] and data.raw.ammo["artillery-shell"].stack_size or 1
  if data.raw.ammo["heavy-artillery-shell"] then data.raw.ammo["heavy-artillery-shell"].stack_size = artillery_stack_size end
  log("Added heavy artillery shell recipes.")
else -- nothing happens
  log("Vanilla Artillery shell untouched.")
end

local new_alt_recipes = {
  ["organic"] = {
    alternative_recipes = {
      ["explosives"] = { "bio-explosives", "bio-explosives-space", "bio-explosives-gleba", "explosives" },
      ["rocket"] = { "bio-rocket", "rocket" },
      ["explosive-rocket"] = { "bio-explosive-rocket", "explosive-rocket" },
    }
  },
  ["metallurgy"] = {
    alternative_recipes = {
      -- personal ammo
      ["firearm-magazine"] = { "casting-firearm-magazine", "firearm-magazine" },
      ["piercing-rounds-magazine"] = { "casting-piercing-rounds-magazine", "piercing-rounds-magazine" },
      ["uranium-rounds-magazine"] = { "casting-uranium-rounds-magazine", "uranium-rounds-magazine" },
      ["tungsten-rounds-magazine"] = { "casting-tungsten-rounds-magazine", "tungsten-rounds-magazine" },
      ["shotgun-shell"] = { "casting-shotgun-shell", "shotgun-shell" },
      ["piercing-shotgun-shell"] = { "casting-piercing-shotgun-shell", "piercing-shotgun-shell" },
      ["uranium-shotgun-shell"] = { "casting-uranium-shotgun-shell", "uranium-shotgun-shell" }, -- if existent
      ["tungsten-shotgun-shell"] = { "casting-tungsten-shotgun-shell", "tungsten-shotgun-shell" },
      -- heavy ammo
      ["cannon-shell"] = { "casting-cannon-shell", "cannon-shell" },
      ["uranium-cannon-shell"] = { "casting-uranium-cannon-shell", "uranium-cannon-shell" },
      ["tungsten-cannon-shell"] = { "casting-tungsten-cannon-shell", "tungsten-cannon-shell" },
      ["railgun-ammo"] = { "casting-railgun-ammo", "railgun-ammo" },
      ["tungsten-railgun-ammo"] = { "casting-tungsten-railgun-ammo", "tungsten-railgun-ammo" },
      ["artillery-shell"] = { "casting-artillery-shell", "artillery-shell" },
      ["heavy-artillery-shell"] = { "casting-heavy-artillery-shell", "heavy-artillery-shell", "heavy-artillery-shell-upgrading" },
      -- armour plating
      ["light-armour-plating"] = { "casting-light-armour-plating", "light-armour-plating" },
      ["heavy-armour-plating"] = { "casting-heavy-armour-plating", "heavy-armour-plating" },
      -- buildings
      ["gun-turret"] = { "casting-gun-turret", "gun-turret" },
    }
  }
}
generator_api.register_multi_category_alt_recipes(new_alt_recipes)

oc_helper.debug_log("__OCs_ammo_casting__ rules table: " .. serpent.block(generator_api.rules_table), "generator_api")

local casting_dict = {
  -- vanilla ammo casting
  ["firearm-magazine"]         = "metallurgy",
  ["piercing-rounds-magazine"] = "metallurgy",
  ["uranium-rounds-magazine"]  = "metallurgy",
  ["shotgun-shell"]            = "metallurgy",
  ["piercing-shotgun-shell"]   = "metallurgy",
  ["cannon-shell"]             = "metallurgy",
  ["uranium-cannon-shell"]     = "metallurgy",
  ["railgun-ammo"]             = "metallurgy",
  -- casting tungsten ammo
  ["tungsten-rounds-magazine"] = "metallurgy",
  ["tungsten-shotgun-shell"]   = "metallurgy",
  ["tungsten-cannon-shell"]    = "metallurgy",
  ["tungsten-railgun-ammo"]    = "metallurgy",
  -- casting armour plating
  ["light-armour-plating"]     = "metallurgy",
  ["heavy-armour-plating"]     = "metallurgy",
  -- biochamber ammo
  ["explosives"]               = "organic",
  ["rocket"]                   = "organic",
  ["explosive-rocket"]         = "organic",
}
-- add optional recipes to the casting_dict
if not mods["scattergun_turret"] then
  casting_dict["uranium-shotgun-shell"] = "metallurgy"
end
if settings.startup["casting-weapons"].value then
  -- weapons
  casting_dict["gun-turret"] = "metallurgy"
  casting_dict["combat-shotgun"] = "metallurgy"
  casting_dict["flamethrower"] = "metallurgy"
  casting_dict["rocket-launcher"] = "electromagnetics"
  casting_dict["pistol"] = "metallurgy"
  casting_dict["submachine-gun"] = "metallurgy"
  casting_dict["shotgun"] = "metallurgy"
  casting_dict["combat-shotgun"] = "metallurgy"
  casting_dict["rocket-launcher"] = "electromagnetics"
  casting_dict["flamethrower"] = "metallurgy"
end
if settings.startup["nuclear-ammo"].value then
  casting_dict["atomic-bomb"] = "cryogenics"
end
if settings.startup["allow-casting-explosive-ammo"].value then
  casting_dict["explosive-cannon-shell"] = "metallurgy"
  casting_dict["explosive-uranium-cannon-shell"] = "metallurgy"
  casting_dict["artillery-shell"] = "metallurgy"
end
if settings.startup["allow-casting-explosive-ammo"].value and settings.startup["heavy-artillery-shells"].value then
  casting_dict["heavy-artillery-shell"] = "metallurgy"
end
-- execute generator from casting_dict
generator_api.batch_generator(casting_dict)

-- set the subgroup to alternative-ammo to distinct them from normal crafting recipes
local mapping = {
  -- base ammo
  ["casting-firearm-magazine"] = "alternative-ammo",
  ["casting-piercing-rounds-magazine"] = "alternative-ammo",
  ["casting-uranium-rounds-magazine"] = "alternative-ammo",
  ["casting-tungsten-rounds-magazine"] = "alternative-ammo",
  ["casting-shotgun-shell"] = "alternative-ammo",
  ["casting-piercing-shotgun-shell"] = "alternative-ammo",
  ["casting-uranium-shotgun-shell"] = "alternative-ammo", -- if existent
  ["casting-cannon-shell"] = "alternative-ammo",
  ["casting-uranium-cannon-shell"] = "alternative-ammo",
  ["casting-explosive-cannon-shell"] = "alternative-ammo",
  ["casting-explosive-uranium-cannon-shell"] = "alternative-ammo",
  ["casting-tungsten-cannon-shell"] = "alternative-ammo",
  ["casting-tungsten-shotgun-shell"] = "alternative-ammo",
  ["casting-railgun-ammo"] = "alternative-ammo",
  ["casting-tungsten-railgun-ammo"] = "alternative-ammo",
  ["bio-rocket"] = "alternative-ammo",
  ["bio-explosive-rocket"] = "alternative-ammo",
  ["cryo-atomic-bomb"] = "alternative-ammo",
}
oc_helper.change_recipes_subgroup(mapping)
