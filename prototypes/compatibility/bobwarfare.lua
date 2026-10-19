local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")
local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")
local generator_api = require("__OCs_base_assets__.prototypes.utils.api")

local blacklist_items = {
  "bob-gun-cotton",
  "bob-cordite",
  "bob-mech-brain",
  "bob-robot-brain-combat",
  "bob-robot-brain-combat-2",
  "bob-robot-brain-combat-3",
  "bob-robot-brain-combat-4",
}
generator_api.register_all_item_blacklist(blacklist_items)

-- use generator_api
local casting_dict = {
  -- rifle
  -- ["bob-magazine"] = "metallurgy", -- empty magazine is intermediate
  ["bob-bullet-magazine"] = "metallurgy",
  ["bob-ap-bullet-magazine"] = "metallurgy",
  ["bob-he-bullet-magazine"] = "organic",
  ["bob-flame-bullet-magazine"] = "organic",
  ["bob-acid-bullet-magazine"] = "organic",
  ["bob-poison-bullet-magazine"] = "organic",
  ["bob-electric-bullet-magazine"] = "electromagnetics",
  ["uranium-rounds-magazine"] = "metallurgy", -- update

  -- shotgun
  ["bob-better-shotgun-shell"] = "metallurgy",
  ["bob-shotgun-ap-shell"] = "metallurgy",
  ["bob-shotgun-electric-shell"] = "electromagnetics",
  ["bob-shotgun-explosive-shell"] = "organic",
  ["bob-shotgun-acid-shell"] = "organic",
  ["bob-shotgun-flame-shell"] = "organic",
  ["bob-shotgun-poison-shell"] = "organic",
  ["bob-shotgun-uranium-shell"] = "metallurgy",

  -- cannon shells
  ["bob-scatter-cannon-shell"] = "metallurgy",
  -- artillery
  ["bob-poison-artillery-shell"] = "metallurgy",
  ["bob-fire-artillery-shell"] = "metallurgy",
  ["bob-explosive-artillery-shell"] = "metallurgy",
  ["bob-distractor-artillery-shell"] = "metallurgy",
  ["bob-atomic-artillery-shell"] = "cryogenics",

  -- laser
  -- ["bob-laser-rifle-battery"] = "electromagnetics", -- intermediate
  ["bob-laser-rifle-battery-ruby"] = "electromagnetics",
  ["bob-laser-rifle-battery-sapphire"] = "electromagnetics",
  ["bob-laser-rifle-battery-emerald"] = "electromagnetics",
  ["bob-laser-rifle-battery-amethyst"] = "electromagnetics",
  ["bob-laser-rifle-battery-topaz"] = "electromagnetics",
  ["bob-laser-rifle-battery-diamond"] = "electromagnetics",

  -- rockets
  ["bob-rocket"] = "organic",
  ["bob-piercing-rocket"] = "organic",
  ["bob-electric-rocket"] = "electromagnetics",
  ["bob-explosive-rocket"] = "organic",
  ["bob-acid-rocket"] = "organic",
  ["bob-flame-rocket"] = "organic",
  ["bob-poison-rocket"] = "organic",

  -- land mines
  ["bob-poison-mine"] = "organic",
  ["bob-slowdown-mine"] = "organic",
  ["bob-distractor-mine"] = "electromagnetics",

  -- plasma?
  -- ["bob-plasma-bullet-magazine"] = "metallurgy",
  -- ["bob-shorgun-plasma-shell"] = "metallurgy",
  -- ["bob-plasma-rocket"] = "organic",
  -- ["bob-robot-plasma-drone"] = "electromagnetics",

  -- drones
  ["bob-robot-gun-drone"] = "electromagnetics",
  ["bob-robot-laser-drone"] = "electromagnetics",
  ["bob-robot-flamethrower-drone"] = "electromagnetics",

  -- other buildings
  ["bob-radar-2"] = "electromagnetics",
  ["bob-radar-3"] = "electromagnetics",
  ["bob-radar-4"] = "electromagnetics",
  ["bob-radar-5"] = "electromagnetics",
}
generator_api.batch_generator(casting_dict)

if settings.startup["casting-weapons"].value then
  local weapons_dict = {
    -- guns
    ["bob-laser-rifle"]      = "electromagnetics",
    ["bob-rifle"]            = "metallurgy",
    ["bob-sniper-rifle"]     = "metallurgy",
    -- turrets
    ["bob-gun-turret-2"]     = "metallurgy",
    ["bob-gun-turret-3"]     = "metallurgy",
    ["bob-gun-turret-4"]     = "metallurgy",
    ["bob-gun-turret-5"]     = "metallurgy",
    ["bob-sniper-turret-1"]  = "metallurgy",
    ["bob-sniper-turret-2"]  = "metallurgy",
    ["bob-sniper-turret-3"]  = "metallurgy",
    ["bob-laser-turret-2"]   = "electromagnetics",
    ["bob-laser-turret-3"]   = "electromagnetics",
    ["bob-laser-turret-4"]   = "electromagnetics",
    ["bob-laser-turret-5"]   = "electromagnetics",
    -- idk what plasma witchcraft this is
    -- ["bob-plasma-turret-1"] = "electromagnetics",
    -- ["bob-plasma-turret-2"] = "electromagnetics",
    -- ["bob-plasma-turret-3"] = "electromagnetics",
    -- ["bob-plasma-turret-4"] = "electromagnetics",
    -- artillery is not casted in base game
    -- ["bob-artillery-turret-2"] = "metallurgy",
    -- ["bob-artillery-turret-3"] = "metallurgy",
    ["bob-tank-2"]           = "metallurgy",
    ["bob-tank-3"]           = "metallurgy",
    -- vehicles (and parts)
    ["bob-mech-armor-plate"] = "metallurgy",
    ["bob-mech-frame"]       = "metallurgy",
    ["bob-mech-leg-segment"] = "metallurgy",
    ["bob-mech-foot"] = "metallurgy",
    ["bob-mech-hip"] = "metallurgy",
    ["bob-mech-leg"] = "metallurgy",
    ["bob-spidertron-cannon"] = "metallurgy",
  }
  generator_api.batch_generator(weapons_dict)
end

data:extend({
  --[[
  { -- casting_dict bob standard ammo tech
    type = "technology",
    name = "casting-bob-ammo-tech",
    icons = {
      {
        icon = "__space-age__/graphics/technology/foundry.png",
        icon_size = 256,
      },
      {
        icon = "__bobwarfare__/graphics/icons/bullet-magazine.png",
        icon_size = 32,
        scale = 1,
        shift = { -48, 48 },
      },
      {
        icon = "__bobwarfare__/graphics/icons/ap-bullet-magazine.png",
        icon_size = 32,
        scale = 1,
        shift = { -16, 48 },
      },
      {
        icon = "__bobwarfare__/graphics/icons/shotgun-shell.png",
        icon_size = 32,
        scale = 1,
        shift = { 16, 48 },
      },
      {
        icon = "__bobwarfare__/graphics/icons/shotgun-ap-shell.png",
        icon_size = 32,
        scale = 1,
        shift = { 48, 48 },
      },
    },
    prerequisites = {
      "casting-light-ammo-tech",
      "utility-science-pack",
      "bob-ap-bullets",
      "bob-shotgun-ap-shells",
    },
    unit = {
      count = 200,
      ingredients = {
        { "automation-science-pack",  1 },
        { "logistic-science-pack",    1 },
        { "military-science-pack",    2 },
        { "chemical-science-pack",    1 },
        { "space-science-pack",       1 }, -- removed if Vulcanus
        { "utility-science-pack",     1 }, -- removed if Vulcanus
        { "metallurgic-science-pack", 2 }, -- removed if Vulcanus
      },
      time = 60,
    },
    effects = {
      { type = "unlock-recipe", recipe = "oc-casting-bob-ap-bullet-magazine" },
      { type = "unlock-recipe", recipe = "oc-casting-bob-bullet-magazine" },
      { type = "unlock-recipe", recipe = "oc-casting-bob-better-shotgun-shell" },
      { type = "unlock-recipe", recipe = "oc-casting-bob-shotgun-ap-shell" },
    }
  },
  -- ]]
  { -- pulse bob electric ammo tech
    type = "technology",
    name = "pulse-bob-ammo-tech",
    icons = {
      {
        icon = "__space-age__/graphics/technology/electromagnetic-plant.png",
        icon_size = 256,
      },
      {
        icon = "__bobwarfare__/graphics/icons/electric-bullet-magazine.png",
        icon_size = 32,
        scale = 1,
        shift = { -48, 48 },
      },
      {
        icon = "__bobwarfare__/graphics/icons/shotgun-electric-shell.png",
        icon_size = 32,
        scale = 1,
        shift = { -24, 48 },
      },
      {
        icon = "__bobwarfare__/graphics/icons/electric-rocket.png",
        icon_size = 32,
        scale = 1,
        shift = { 0, 48 },
      },
    },
    prerequisites = {
      "electromagnetic-plant",
      "utility-science-pack",
      "bob-electric-bullets",
      "bob-shotgun-electric-shells",
      "bob-electric-rocket",
    },
    unit = {
      count = 200,
      ingredients = {
        { "automation-science-pack",      1 },
        { "logistic-science-pack",        1 },
        { "military-science-pack",        2 },
        { "chemical-science-pack",        1 },
        { "space-science-pack",           1 }, -- removed if Fulgora
        { "utility-science-pack",         1 }, -- removed if Fulgora
        { "electromagnetic-science-pack", 2 }, -- removed if Fulgora
      },
      time = 60,
    },
    effects = {
      { type = "unlock-recipe", recipe = "oc-pulse-bob-electric-bullet-magazine" },
      { type = "unlock-recipe", recipe = "oc-pulse-bob-shotgun-electric-shell" },
      { type = "unlock-recipe", recipe = "oc-pulse-bob-electric-rocket" },
      -- { type = "unlock-recipe", recipe = "oc-pulse-bob-robot-plasma-drone"},
    }
  },
  { -- pulse bob drones tech
    type = "technology",
    name = "pulse-bob-drones-tech",
    icons = {
      {
        icon = "__space-age__/graphics/technology/electromagnetic-plant.png",
        icon_size = 256,
      },
      {
        icon = "__bobwarfare__/graphics/icons/gun-drone.png",
        icon_size = 64,
        scale = 0.5,
        shift = { -48, 48 },
      },
      {
        icon = "__bobwarfare__/graphics/icons/laser-drone.png",
        icon_size = 64,
        scale = 0.5,
        shift = { -16, 48 },
      },
      {
        icon = "__bobwarfare__/graphics/icons/flamethrower-drone.png",
        icon_size = 64,
        scale = 0.5,
        shift = { 16, 48 },
      },
    },
    prerequisites = {
      "space-science-pack",
      "utility-science-pack",
      "electromagnetic-plant",
      "electromagnetic-science-pack",
      "bob-robot-gun-drones",
      "bob-robot-laser-drones",
      "bob-robot-flamethrower-drones",
      "bob-distractor-mine",
    },
    unit = {
      count = 200,
      ingredients = {
        { "automation-science-pack",      1 },
        { "logistic-science-pack",        1 },
        { "military-science-pack",        2 },
        { "chemical-science-pack",        1 },
        { "space-science-pack",           1 }, -- removed if Fulgora
        { "utility-science-pack",         1 }, -- removed if Fulgora
        { "electromagnetic-science-pack", 2 }, -- removed if Fulgora
      },
      time = 60,
    },
    effects = {
      { type = "unlock-recipe", recipe = "oc-pulse-bob-robot-gun-drone" },
      { type = "unlock-recipe", recipe = "oc-pulse-bob-robot-laser-drone" },
      { type = "unlock-recipe", recipe = "oc-pulse-bob-robot-flamethrower-drone" },
      { type = "unlock-recipe", recipe = "oc-pulse-bob-distractor-mine"},
    }
  },
  { -- bio chemical bullets
    type = "technology",
    name = "bio-bob-bullets-tech",
    icons = {
      {
        icon = "__space-age__/graphics/technology/biochamber.png",
        icon_size = 256,
      },
      {
        icon = "__bobwarfare__/graphics/icons/flame-bullet-magazine.png",
        icon_size = 32,
        scale = 1,
        shift = { -48, 48 },
      },
      {
        icon = "__bobwarfare__/graphics/icons/acid-bullet-magazine.png",
        icon_size = 32,
        scale = 1,
        shift = { -16, 48 },
      },
      {
        icon = "__bobwarfare__/graphics/icons/poison-bullet-magazine.png",
        icon_size = 32,
        scale = 1,
        shift = { 16, 48 },
      },
      {
        icon = "__bobwarfare__/graphics/icons/he-bullet-magazine.png",
        icon_size = 32,
        scale = 1,
        shift = { 48, 48 },
      },
    },
    prerequisites = {
      "utility-science-pack",
      "bio-explosives-tech",
      "bob-acid-bullets",
      "bob-flame-bullets",
      "bob-poison-bullets",
      "bob-he-bullets",
    },
    unit = {
      count = 200,
      ingredients = {
        { "automation-science-pack",   1 },
        { "logistic-science-pack",     1 },
        { "military-science-pack",     2 },
        { "chemical-science-pack",     1 },
        { "space-science-pack",        1 }, -- removed if Gleba
        { "utility-science-pack",      1 }, -- removed if Gleba
        { "agricultural-science-pack", 2 }, -- removed if Gleba
      },
      time = 60,
    },
    effects = {
      { type = "unlock-recipe", recipe = "oc-bio-bob-flame-bullet-magazine" },
      { type = "unlock-recipe", recipe = "oc-bio-bob-acid-bullet-magazine" },
      { type = "unlock-recipe", recipe = "oc-bio-bob-poison-bullet-magazine" },
      { type = "unlock-recipe", recipe = "oc-bio-bob-he-bullet-magazine" },
    }
  },
  { -- bio chemical shotgun shells
    type = "technology",
    name = "bio-bob-shotgun-tech",
    icons = {
      {
        icon = "__space-age__/graphics/technology/biochamber.png",
        icon_size = 256,
      },
      {
        icon = "__bobwarfare__/graphics/icons/shotgun-flame-shell.png",
        icon_size = 32,
        scale = 1,
        shift = { -48, 48 },
      },
      {
        icon = "__bobwarfare__/graphics/icons/shotgun-explosive-shell.png",
        icon_size = 32,
        scale = 1,
        shift = { -16, 48 },
      },
      {
        icon = "__bobwarfare__/graphics/icons/shotgun-acid-shell.png",
        icon_size = 32,
        scale = 1,
        shift = { 16, 48 },
      },
      {
        icon = "__bobwarfare__/graphics/icons/shotgun-poison-shell.png",
        icon_size = 32,
        scale = 1,
        shift = { 48, 48 },
      },
    },
    prerequisites = {
      "utility-science-pack",
      "bio-explosives-tech",
      "bob-shotgun-flame-shells",
      "bob-shotgun-explosive-shells",
      "bob-shotgun-acid-shells",
      "bob-shotgun-poison-shells",
    },
    unit = {
      count = 200,
      ingredients = {
        { "automation-science-pack",   1 },
        { "logistic-science-pack",     1 },
        { "military-science-pack",     2 },
        { "chemical-science-pack",     1 },
        { "space-science-pack",        1 }, -- removed if Gleba
        { "utility-science-pack",      1 }, -- removed if Gleba
        { "agricultural-science-pack", 2 }, -- removed if Gleba
      },
      time = 60,
    },
    effects = {
      { type = "unlock-recipe", recipe = "oc-bio-bob-shotgun-explosive-shell" },
      { type = "unlock-recipe", recipe = "oc-bio-bob-shotgun-flame-shell" },
      { type = "unlock-recipe", recipe = "oc-bio-bob-shotgun-acid-shell" },
      { type = "unlock-recipe", recipe = "oc-bio-bob-shotgun-poison-shell" },
    }
  }
})

-- add prereq
local adding_prereq = {
  ["casting-light-ammo-tech"] = {
    "bob-ap-bullets",
    "bob-shotgun-ap-shells",
  },
  ["casting-heavy-ammo-tech"] = {
    "bob-scatter-cannon-shells",
  },
  ["bio-grenades-tech"] = {
    "bob-poison-mine",
    "bob-slowdown-mine",
    "bob-distractor-mine",
  },
  ["bio-rocketry-tech"] = {
    "bob-piercing-rocket",
    -- "bob-electric-rocket",
    "bob-explosive-rocket",
    "bob-acid-rocket",
    "bob-flame-rocket",
    "bob-poison-rocket",
  },
}
if settings.startup["allow-casting-explosive-ammo"].value then
  adding_prereq["casting-explosive-ammo-tech"] = {
    -- artillery
    "bob-poison-artillery-shell",
    "bob-fire-artillery-shell",
    "bob-explosive-artillery-shell",
    "bob-distractor-artillery-shell",
  }
end
if settings.startup["nuclear-ammo"].value then
  adding_prereq["nuclear-ammo-tech"] = { "bob-atomic-artillery-shell" }
end
oc_tech.add_prerequisites(adding_prereq)

-- add recipes to technology
local recipe_unlock_mapping = {
  ["casting-light-ammo-tech"] = {
    "oc-casting-bob-bullet-magazine",
    "oc-casting-bob-ap-bullet-magazine",
    "oc-casting-bob-better-shotgun-shell",
    "oc-casting-bob-shotgun-ap-shell",
  },
  ["casting-heavy-ammo-tech"] = {
    "oc-casting-bob-scatter-cannon-shell",
  },
  ["bio-grenades-tech"] = {
    "oc-bio-bob-poison-mine",
    "oc-bio-bob-slowdown-mine",
    -- "oc-bio-bob-distractor-mine",
  },
  ["bio-rocketry-tech"] = {
    "oc-bio-bob-piercing-rocket",
    "oc-bio-bob-explosive-rocket",
    "oc-bio-bob-acid-rocket",
    "oc-bio-bob-flame-rocket",
    "oc-bio-bob-poison-rocket",
  },
  -- laser rifle batteries
  ["bob-laser-rifle-ammo-1"] = "oc-pulse-bob-laser-rifle-battery-ruby",
  ["bob-laser-rifle-ammo-2"] = "oc-pulse-bob-laser-rifle-battery-sapphire",
  ["bob-laser-rifle-ammo-3"] = "oc-pulse-bob-laser-rifle-battery-emerald",
  ["bob-laser-rifle-ammo-4"] = "oc-pulse-bob-laser-rifle-battery-amethyst",
  ["bob-laser-rifle-ammo-5"] = "oc-pulse-bob-laser-rifle-battery-topaz",
  ["bob-laser-rifle-ammo-6"] = "oc-pulse-bob-laser-rifle-battery-diamond",
  -- if casting-weeapons true:
  ["military-3"] = { "oc-casting-bob-rifle", "oc-casting-bob-sniper-rifle" },
  ["bob-laser-rifle"] = "oc-pulse-laser-rifle",
  ["bob-tanks-2"] = "oc-casting-bob-tank-2",
  ["bob-tanks-3"] = "oc-casting-bob-tank-3",
  ["bob-gun-turrets-2"] = "oc-casting-bob-gun-turret-2",
  ["bob-gun-turrets-3"] = "oc-casting-bob-gun-turret-3",
  ["bob-gun-turrets-4"] = "oc-casting-bob-gun-turret-4",
  ["bob-gun-turrets-5"] = "oc-casting-bob-gun-turret-5",
  ["bob-sniper-turrets-1"] = "oc-casting-bob-sniper-turret-1",
  ["bob-sniper-turrets-2"] = "oc-casting-bob-sniper-turret-2",
  ["bob-sniper-turrets-3"] = "oc-casting-bob-sniper-turret-3",
  ["bob-laser-turrets-2"] = "oc-pulse-bob-laser-turret-2",
  ["bob-laser-turrets-3"] = "oc-pulse-bob-laser-turret-3",
  ["bob-laser-turrets-4"] = "oc-pulse-bob-laser-turret-4",
  ["bob-laser-turrets-5"] = "oc-pulse-bob-laser-turret-5",
  -- spidertron parts
  ["bob-walking-vehicle"] = {
    "oc-casting-bob-mech-frame",
    "oc-casting-bob-mech-segment",
    "oc-casting-bob-mech-foot",
    "oc-casting-bob-mech-hip",
    "oc-casting-bob-mech-knee",
  },
  ["bob-tankotron"] = {
    "oc-casting-bob-mech-armor-plate",
    "oc-casting-bob-mech-leg-segment",
    "oc-casting-bob-spidertron-cannon",
  },
  -- other buildings
  ["bob-radar-2"] = "oc-pulse-bob-radar-2",
  ["bob-radar-3"] = "oc-pulse-bob-radar-3",
  ["bob-radar-4"] = "oc-pulse-bob-radar-4",
  ["bob-radar-5"] = "oc-pulse-bob-radar-5",
}
if settings.startup["allow-casting-explosive-ammo"].value then
  recipe_unlock_mapping["casting-explosive-ammo-tech"] = {
    "oc-casting-bob-poison-artillery-shell",
    "oc-casting-bob-poison-artillery-shell",
    "oc-casting-bob-fire-artillery-shell",
    "oc-casting-bob-explosive-artillery-shell",
    "oc-casting-bob-distractor-artillery-shell",
  }
  recipe_unlock_mapping["bob-laser-rifle"] = "oc-pulse-laser-rifle"
end
if settings.startup["nuclear-ammo"].value then
  recipe_unlock_mapping["nuclear-ammo-tech"] = { "oc-cryo-bob-atomic-artillery-shell" }
end
oc_tech.add_tech_unlocks(recipe_unlock_mapping)

local new_cat = {
  ["bob-power-armor-3"] = "electromagnetics",
  ["bob-power-armor-4"] = "electromagnetics",
  ["bob-power-armor-5"] = "electromagnetics",
}
oc_recipe.add_crafting_categories(new_cat)
