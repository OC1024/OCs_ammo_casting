-- raise stack size of tungsten rifle ammo to match Factorio 1.1 and K2SO of 200
data.raw.ammo["tungsten-rounds-magazine"].stack_size = 200
if data.raw.ammo["heavy-artillery-shell"] then data.raw.ammo["heavy-artillery-shell"].stack_size = 25 end

-- 0. load API
local generator_api = require("__OCs_base_assets__.prototypes.utils.api")
local oc_helper = require("__OCs_base_assets__.prototypes.utils.helper")

-- 1. Preparations: Edit all Tables
local new_blacklist = {
  ["organic"] = {
    blacklist_item = {
      "rocket-fuel", -- this is used in the rocket turret ammo
    }
  },
  ["cryogenics"] = {
    blacklist_item = {
      "rocket-fuel" -- also used in atomic bomb, turret version
    }
  }
}
generator_api.register_multi_item_blacklists(new_blacklist)

-- 2. Execute the Generator.
local casting_dict = {
  -- rifle ammo
  ["kr-rifle-magazine"]                              = "metallurgy", -- yellow
  ["kr-armor-piercing-rifle-magazine"]               = "metallurgy", -- red
  -- uranium ammo unchanged -> already generated
  ["kr-imersite-rifle-magazine"]                     = "metallurgy", -- pink. old name
  ["kr-imersite-rounds-magazine"]                    = "metallurgy", -- pink. new name

  -- sniper ammo
  ["kr-anti-materiel-rifle-magazine"]                = "metallurgy", -- yellow
  ["kr-armor-piercing-anti-materiel-rifle-magazine"] = "metallurgy", -- red
  ["kr-uranium-anti-materiel-rifle-magazine"]        = "metallurgy", -- green
  ["kr-imersite-anti-materiel-rifle-magazine"]       = "metallurgy", -- pink

  -- impulse rifle ammo
  ["kr-impulse-rifle-ammo"]                          = "electromagnetics",

  -- heavy ammo
  ["kr-basic-railgun-shell"]                         = "metallurgy",
  ["kr-explosive-railgun-shell"]                     = "metallurgy",

  -- rockets are a biochamber thing in my mod, but electronics is for the EMplant
  ["kr-heavy-rocket"]                                = "organic",
  ["kr-explosive-turret-rocket"]                     = "organic",
}

if settings.startup["casting-weapons"].value then
  -- weapons
  casting_dict["kr-anti-materiel-rifle"] = "metallurgy" -- sniper rifle
  casting_dict["kr-impulse-rifle"] = "electromagnetics" -- impulse rifle
  casting_dict["kr-heavy-rocket-launcher"] = "electromagnetics"
  -- casting_dict["kr-advanced-tank"] = "metallurgy" -- big tank
end
if settings.startup["nuclear-ammo"].value then
  casting_dict["kr-nuclear-turret-rocket"] = "cryogenics"
  casting_dict["kr-nuclear-artillery-shell"] = "cryogenics"
end
generator_api.batch_generator(casting_dict)

-- Add new techs for this mod
data:extend({
  { -- kr-imersite and heavy rocket tech
    type = "technology",
    name = "casting-imersite-ammo-tech",
    icons = {
      {
        icon = "__Krastorio2Assets__/technologies/military-5.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_base_assets__/graphics/technology/overlayer-tech-molten-iron.png",
        icon_size = 256,
        icon_mipmaps = 4,
      }
    },
    prerequisites = { "kr-military-5", "casting-heavy-ammo-tech" },
    effects = {
      -- { type = "unlock-recipe", recipe = "casting-kr-imersite-rifle-magazine" },               -- pink rifle ammo
      -- { type = "unlock-recipe", recipe = "casting-kr-imersite-anti-materiel-rifle-magazine" }, -- pink sniper ammo
      -- {type = "unlock-recipe", recipe = "pulse-kr-impulse-rifle"}, -- impulse rifle
      { type = "unlock-recipe", recipe = "pulse-kr-impulse-rifle-ammo" }, -- impulse rifle ammo
    },
    unit = {
      time = 60,
      count = 1000,
      ingredients = {
        { "military-science-pack",        1 },
        { "space-science-pack",           1 },
        { "utility-science-pack",         1 },
        { "metallurgic-science-pack",     2 },
        { "electromagnetic-science-pack", 2 },
        { "kr-matter-tech-card",          2 },
        { "kr-advanced-tech-card",        2 },
      },
    },
  },
})
local imersite_ammo = {
  "casting-kr-imersite-rifle-magazine",               -- for K2SO <1.5 old name for pink rifle ammo
  "casting-kr-imersite-anti-materiel-rifle-magazine", -- pink sniper ammo. old name for K2SO <1.5
  "kr-imersite-rounds-magazine",                      -- for K2SO >=1.5 new name for pink rifle ammo
}
oc_helper.add_recipe_unlocks({ ["casting-imersite-ammo-tech"] = imersite_ammo })

if settings.startup["allow-bio-explosives"].value then -- heavy rocket if bio explosive
  oc_helper.add_prerequisites({ ["casting-imersite-ammo-tech"] = { "bio-rocketry-tech" } })
  oc_helper.add_recipe_unlocks({ ["bio-kr-heavy-rocket"] = { "casting-imersite-ammo-tech" } })
end

if settings.startup["casting-weapons"].value then -- optional new gun to pulse
  local additional_unlocks = {
    ["pulse-kr-impulse-rifle"] = { "casting-imersite-ammo-tech" },
    ["pulse-kr-heavy-rocket-launcher"] = { "casting-imersite-ammo-tech" }, -- iff bio-explosive
  }
  oc_helper.add_recipe_unlocks(additional_unlocks)
end

if settings.startup["allow-casting-explosive-ammo"].value then --is imersite ammo explosive?
  oc_helper.add_prerequisites({ ["casting-imersite-ammo-tech"] = "casting-explosive-ammo-tech" })
end

-- [[ -- antimatter recipes + tech
if settings.startup["antimatter-ammo"].value and settings.startup["nuclear-ammo"].value then
  local antimatter_dict = {
    -- antimatter ammo is to high-tech for any of the simple machines
    ["kr-antimatter-rocket"] = "cryogenics",
    ["kr-antimatter-railgun-shell"] = "cryogenics",
    ["kr-antimatter-turret-rocket"] = "cryogenics",
    ["kr-antimatter-artillery-shell"] = "cryogenics",
  }
  generator_api.batch_generator(antimatter_dict)

  data:extend({
    { -- oc antimatter ammo
      type = "technology",
      name = "antimatter-ammo-tech",
      icons =
      {
        {
          icon = "__Krastorio2Assets__/technologies/antimatter-ammo.png",
          icon_size = 256,
          -- icon_mipmaps = 4, -- could be 1
        },
        {
          icon = "__OCs_base_assets__/graphics/technology/overlayer-tech-cryo-plant.png",
          icon_size = 256,
          icon_mipmaps = 4,
        }
      },
      prerequisites = { "kr-antimatter-ammo", "casting-imersite-ammo-tech", "nuclear-ammo-tech" },
      unit = {
        time = 90,
        count = 2000,
        ingredients = {
          { "military-science-pack",    2 },
          { "production-science-pack",  1 },
          { "utility-science-pack",     1 },
          { "space-science-pack",       1 },
          { "cryogenic-science-pack",   2 },
          { "kr-advanced-tech-card",    1 },
          { "kr-matter-tech-card",      2 },
          { "kr-singularity-tech-card", 2 },
          { "promethium-science-pack",  1 },
        },
      },
      effects = {
        { type = "unlock-recipe", recipe = "cryo-kr-antimatter-turret-rocket" },
        { type = "unlock-recipe", recipe = "cryo-kr-antimatter-artillery-shell" },
        { type = "unlock-recipe", recipe = "cryo-kr-antimatter-rocket" },
        { type = "unlock-recipe", recipe = "cryo-kr-antimatter-railgun-shell" },
      }
    },
  })
end
-- ]]

-- Add Recipes to Techs
local recipe_tech_mapping = {
  -- rifle ammo
  ["casting-kr-rifle-magazine"]                              = { "casting-light-ammo-tech" }, -- yellow
  ["casting-kr-armor-piercing-rifle-magazine"]               = { "casting-light-ammo-tech" }, -- red
  -- ["kr-imersite-rounds-magazine"]                            = "metallurgy",                  -- pink ammo, unlocked with immersite ammo tech

  -- sniper rifle ammo
  ["casting-kr-anti-materiel-rifle-magazine"]                = { "casting-light-ammo-tech" }, -- yellow
  ["casting-kr-armor-piercing-anti-materiel-rifle-magazine"] = { "casting-light-ammo-tech" }, -- red
  ["casting-kr-uranium-anti-materiel-rifle-magazine"]        = { "casting-heavy-ammo-tech" }, -- green
  -- ["kr-imersite-anti-materiel-rifle-magazine"]               = { "casting-imersite-ammo-tech" },  -- pink sniper ammo, unlocked with immersite ammo tech
  -- ["pulse-kr-impulse-rifle-ammo"]                            = { "casting-imersite-ammo-tech" }, -- unlocked with immersite ammo tech

  -- rockets
  ["bio-kr-explosive-turret-rocket"]                         = "bio-rocketry-tech",
  ["cryo-kr-nuclear-turret-rocket"]                          = "nuclear-ammo-tech",
  -- ["bio-kr-heavy-rocket"]                                    = "bio-rocketry-tech", -- unlocked with immersite ammo tech

  -- railgun and artillery
  ["casting-kr-basic-railgun-shell"]                         = { "casting-railgun-ammo-tech" },
  ["casting-kr-explosive-railgun-shell"]                     = { "casting-railgun-ammo-tech" },
  ["cryo-kr-nuclear-artillery-shell"]                        = { "nuclear-ammo-tech" },
  -- ["kr-antimatter-artillery-shell"]                          = { "antimatter-ammo-tech" },
}
if settings.startup["casting-weapons"].value then
  -- weapons
  recipe_tech_mapping["casting-kr-anti-materiel-rifle"] = { "casting-light-ammo-tech" } -- sniper for light ammo tech
  -- vehicles
  -- recipe_tech_mapping["casting-kr-advanced-tank"] = { "kr-advanced-tank" }
end
oc_helper.add_recipe_unlocks(recipe_tech_mapping)
