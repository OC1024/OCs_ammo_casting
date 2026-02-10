data:extend({ -- standard ammo techs of this mod
  { -- casting light ammo (red & yellow ammo)
    type = "technology",
    name = "casting-light-ammo-tech",
    icons = {
      {
        icon = "__base__/graphics/technology/weapon-shooting-speed-1.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_base_assets__/graphics/technology/overlayer-tech-molten-iron.png",
        icon_size = 256,
        icon_mipmaps = 4,
      }
    },
    prerequisites = { "foundry", "military-2" }, -- early as possible
    unit = {
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack",   1 },
        { "military-science-pack",   2 },
        -- {"metallurgic-science-pack", 2},
      },
      time = 30,
      count = 100
    },
    effects = {
      { type = "unlock-recipe", recipe = "casting-firearm-magazine" },
      { type = "unlock-recipe", recipe = "casting-piercing-rounds-magazine" },
      { type = "unlock-recipe", recipe = "casting-shotgun-shell" },
    },
  },
  { -- casting heavy ammo (uranium ammo and tank shells)
    type = "technology",
    name = "casting-heavy-ammo-tech",
    icons =
    {
      {
        icon = "__base__/graphics/technology/physical-projectile-damage-2.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_base_assets__/graphics/technology/overlayer-tech-molten-iron.png",
        icon_size = 256,
        icon_mipmaps = 4,
      }
    },
    prerequisites = { "casting-light-ammo-tech", "uranium-ammo" },
    unit = {
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack",   1 },
        { "chemical-science-pack",   1 },
        -- {"utility-science-pack", 1},
        { "military-science-pack",   2 },
        -- {"metallurgic-science-pack", 2},
      },
      time = 45,
      count = 400
    },
    effects = {
      { type = "unlock-recipe", recipe = "casting-uranium-rounds-magazine" },
      { type = "unlock-recipe", recipe = "casting-piercing-shotgun-shell" },
      { type = "unlock-recipe", recipe = "casting-cannon-shell" },
      { type = "unlock-recipe", recipe = "casting-uranium-cannon-shell" },
    },
  },
  { -- casting tungsten ammo
    type = "technology",
    name = "casting-tungsten-ammo-tech",
    icons =
    {
      {
        icon = "__OCs_ammo_casting__/graphics/technology/tungsten-ammo-tech.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_base_assets__/graphics/technology/overlayer-tech-molten-iron.png",
        icon_size = 256,
        icon_mipmaps = 4,
      }
    },
    prerequisites = { "casting-heavy-ammo-tech", "metallurgic-science-pack" },
    unit = {
      ingredients = {
        { "automation-science-pack",  1 },
        { "logistic-science-pack",    1 },
        { "chemical-science-pack",    1 },
        { "utility-science-pack",     1 },
        { "military-science-pack",    2 },
        { "production-science-pack",  1 },
        { "space-science-pack",       1 },
        { "metallurgic-science-pack", 2 },
        -- {"electromagnetic-science-pack", 2},
      },
      time = 60,
      count = 800
    },
    effects = {
      { type = "unlock-recipe", recipe = "casting-tungsten-rounds-magazine" },
      { type = "unlock-recipe", recipe = "casting-tungsten-shotgun-shell" },
      { type = "unlock-recipe", recipe = "casting-tungsten-cannon-shell" },
      { type = "unlock-recipe", recipe = "tungsten-rounds-magazine" },
      { type = "unlock-recipe", recipe = "tungsten-shotgun-shell" },
      { type = "unlock-recipe", recipe = "tungsten-cannon-shell" },
    },
  },
  { -- casting railgung ammo
    type = "technology",
    name = "casting-railgun-ammo-tech",
    icons =
    {
      {
        icon = "__space-age__/graphics/technology/railgun.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_base_assets__/graphics/technology/overlayer-tech-molten-iron.png",
        icon_size = 256,
        icon_mipmaps = 4,
      }
    },
    prerequisites = { "casting-tungsten-ammo-tech", "railgun" },
    unit = {
      ingredients = {
        { "automation-science-pack",      1 },
        { "logistic-science-pack",        1 },
        { "chemical-science-pack",        1 },
        { "military-science-pack",        2 },
        { "production-science-pack",      1 },
        { "utility-science-pack",         1 },
        { "space-science-pack",           1 },
        { "metallurgic-science-pack",     2 },
        { "electromagnetic-science-pack", 2 },
        { "cryogenic-science-pack",       2 }
      },
      time = 60,
      count = 1000
    },
    effects = {
      { type = "unlock-recipe", recipe = "casting-railgun-ammo" },
      { type = "unlock-recipe", recipe = "tungsten-railgun-ammo" },
      { type = "unlock-recipe", recipe = "casting-tungsten-railgun-ammo" },
    },
  },
})

-- Conditionally included technologies
if settings.startup["allow-casting-explosive-ammo"].value then
  data:extend({
    { -- casting explosive cannon shells and artillery shells
      type = "technology",
      name = "casting-explosive-ammo-tech",
      icons =
      {
        {
          icon = "__base__/graphics/technology/explosives.png",
          icon_size = 256,
          icon_mipmaps = 4,
        },
        {
          icon = "__OCs_base_assets__/graphics/technology/overlayer-tech-molten-iron.png",
          icon_size = 256,
          icon_mipmaps = 4,
        }
      },
      prerequisites = { "casting-tungsten-ammo-tech", "artillery" }, -- explosives is indirectly required for tanks and artillery
      unit = {
        ingredients = {
          { "automation-science-pack",  1 },
          { "logistic-science-pack",    1 },
          { "chemical-science-pack",    1 },
          { "military-science-pack",    2 },
          { "production-science-pack",  1 },
          { "utility-science-pack",     1 },
          { "space-science-pack",       1 },
          { "metallurgic-science-pack", 2 },
        },
        time = 60,
        count = 1000
      },
      effects = {
        { type = "unlock-recipe", recipe = "casting-explosive-cannon-shell" },
        { type = "unlock-recipe", recipe = "casting-explosive-uranium-cannon-shell" },
        { type = "unlock-recipe", recipe = "casting-artillery-shell" },
        { type = "unlock-recipe", recipe = "heavy-artillery-shell" },
        { type = "unlock-recipe", recipe = "casting-heavy-artillery-shell" },
        { type = "unlock-recipe", recipe = "heavy-artillery-shell-upgrading" }
      },
    },
  })
end

if settings.startup["allow-bio-explosives"].value then
  data:extend({ -- biochamber techs
    { -- bio explosives
      type = "technology",
      name = "bio-explosives-tech",
      icons =
      {
        {
          icon = "__base__/graphics/technology/explosives.png",
          icon_size = 256,
          icon_mipmaps = 4,
        },
        {
          icon = "__OCs_base_assets__/graphics/technology/overlayer-tech-biochamber.png",
          icon_size = 256,
          icon_mipmaps = 4,
        }
      },
      prerequisites = { "biochamber", "explosives", "chemical-science-pack" },
      unit = {
        ingredients = {
          { "automation-science-pack", 1 },
          { "logistic-science-pack",   1 },
          { "chemical-science-pack",   2 },
          -- {"agricultural-science-pack", 2}, -- not included to make a gleba-start more fun
        },
        time = 30,
        count = 150
      },
      effects = {
        { type = "unlock-recipe", recipe = "bio-explosives" },
        { type = "unlock-recipe", recipe = "bio-explosives-gleba" },
        { type = "unlock-recipe", recipe = "bio-explosives-space" },
      },
    },
    { -- bio rocketry
      type = "technology",
      name = "bio-rocketry-tech",
      icons =
      {
        {
          icon = "__base__/graphics/technology/explosive-rocketry.png",
          icon_size = 256,
          icon_mipmaps = 4,
        },
        {
          icon = "__OCs_base_assets__/graphics/technology/overlayer-tech-biochamber.png",
          icon_size = 256,
          icon_mipmaps = 4,
        }
      },
      prerequisites = { "bio-explosives-tech", "explosive-rocketry" },
      unit = {
        ingredients = {
          { "automation-science-pack", 1 },
          { "logistic-science-pack",   1 },
          { "chemical-science-pack",   1 },
          { "military-science-pack",   2 },
          -- {"space-science-pack", 1},
          -- {"agricultural-science-pack", 2}, -- not included to make a gleba-start more fun
        },
        time = 45,
        count = 200
      },
      effects = {
        { type = "unlock-recipe", recipe = "bio-rocket" },
        { type = "unlock-recipe", recipe = "bio-explosive-rocket" },
      },
    },
  })
end

if settings.startup["armour-plating"].value then
  -- wheather bio-explosive is needed or not
  if settings.startup["allow-bio-explosives"].value then
    prereq_tech_reactive = { "heavy-armour-plating-tech", "power-armor", "military-4", "bio-explosives-tech",
      "agricultural-science-pack" }
  else
    prereq_tech_reactive = { "heavy-armour-plating-tech", "power-armor", "military-4", "explosives",
      "agricultural-science-pack" }
  end

  data:extend({ -- armour plating techs
    { -- light armour plating
      type = "technology",
      name = "light-armour-plating-tech",
      icons = {
        {
          icon = "__OCs_ammo_casting__/graphics/icons/heat-shielding.png", -- from Space Exploration by Earendel
          -- icon = "__base__/graphics/icons/iron-plate.png",
          icon_size = 64,
          icon_mipmaps = 1,
          scale = 4,
          tint = plating_variants["light"].tint,
        },
        {
          icon = "__base__/graphics/icons/energy-shield-equipment.png",
          icon_size = 64,
          icon_scale = 0.25,
          -- shift = {16, -16},
          -- icon_mipmaps = 4,
        }
      },
      prerequisites = { "heavy-armor", "automobilism", "military-science-pack" },
      unit = {
        ingredients = {
          { "automation-science-pack", 1 },
          { "logistic-science-pack",   1 },
          { "military-science-pack",   2 }, -- duh!
        },
        time = 30,
        count = 60 -- effectively 120 military-science-pack
      },
      effects = {
        { type = "unlock-recipe", recipe = "light-armour-plating" },
        { type = "unlock-recipe", recipe = "casting-light-armour-plating" },
      },
    },
    { -- heavy armour plating
      type = "technology",
      name = "heavy-armour-plating-tech",
      icons = {
        {
          icon = "__OCs_ammo_casting__/graphics/icons/heat-shielding.png", -- from  space-exploration by Earendel
          icon_size = 64,
          icon_mipmaps = 1,
          scale = 4,
        },
        {
          icon = "__base__/graphics/icons/energy-shield-mk2-equipment.png",
          icon_size = 64,
          icon_scale = 0.25,
          -- shift = {16, -16},
          -- icon_mipmaps = 4,
        }
      },
      icon_size = 256,
      icon_mipmaps = 4,
      prerequisites = { "light-armour-plating-tech", "modular-armor", "tank", "space-science-pack", "military-science-pack", "utility-science-pack", "production-science-pack" },
      unit = {
        ingredients = {
          { "automation-science-pack", 1 },
          { "logistic-science-pack",   1 },
          { "chemical-science-pack",   1 },
          { "military-science-pack",   2 }, -- duh!
          { "utility-science-pack",    1 },
          { "production-science-pack", 2 }, -- duh-hu!
          { "space-science-pack",      1 },
        },
        time = 45,
        count = 120
      },
      effects = {
        { type = "unlock-recipe", recipe = "heavy-armour-plating" },
        { type = "unlock-recipe", recipe = "casting-heavy-armour-plating" },
      },
    },
    { -- tungsten armour plating
      type = "technology",
      name = "tungsten-armour-plating-tech",
      icons = {
        {
          icon = "__OCs_ammo_casting__/graphics/icons/heat-shielding.png", -- from  space-exploration by Earendel
          icon_size = 64,
          icon_mipmaps = 1,
          scale = 2,
          tint = plating_variants["tungsten"].tint,

        },
        {
          icon = "__OCs_base_assets__/graphics/technology/overlayer-tech-molten-iron.png",
          icon_size = 256,
          icon_mipmaps = 4,
        }
      },
      icon_size = 256,
      icon_mipmaps = 4,
      prerequisites = { "heavy-armour-plating-tech", "military-4", "power-armor", "metallurgic-science-pack" },
      unit = {
        ingredients = {
          { "automation-science-pack",  1 },
          { "logistic-science-pack",    1 },
          { "chemical-science-pack",    1 },
          { "military-science-pack",    2 }, -- duh!
          { "utility-science-pack",     1 },
          { "production-science-pack",  2 }, -- duh-hu!
          { "space-science-pack",       1 },
          { "metallurgic-science-pack", 2 }, -- duh-uh-hu!
        },
        time = 60,
        count = 400
      },
      effects = {
        { type = "unlock-recipe", recipe = "tungsten-armour-plating" },
      },
    },
    { -- reactive armour plating
      type = "technology",
      name = "reactive-armour-plating-tech",
      icons = {
        {
          icon = "__OCs_ammo_casting__/graphics/icons/heat-shielding.png", -- from  space-exploration by Earendel
          icon_size = 64,
          -- icon_mipmaps = 1,
          scale = 2,
          tint = plating_variants["reactive"].tint,
        },
        {
          icon = "__OCs_base_assets__/graphics/technology/overlayer-tech-biochamber.png",
          icon_size = 256,
          icon_mipmaps = 4,
        }
      },
      icon_size = 256,
      icon_mipmaps = 4,
      prerequisites = prereq_tech_reactive,
      unit = {
        ingredients = {
          { "automation-science-pack",   1 },
          { "logistic-science-pack",     1 },
          { "chemical-science-pack",     1 },
          { "military-science-pack",     2 }, -- duh!
          { "utility-science-pack",      1 },
          { "production-science-pack",   2 }, -- duh-hu!
          { "space-science-pack",        1 },
          { "agricultural-science-pack", 2 }, -- duh-uh-hu!
        },
        time = 60,
        count = 400
      },
      effects = {
        { type = "unlock-recipe", recipe = "reactive-armour-plating" },
      },
    },
    { -- ultra-light armour plating
      type = "technology",
      name = "ultra-light-armour-plating-tech",
      icons = {
        {
          icon = "__OCs_ammo_casting__/graphics/icons/heat-shielding.png", -- from  space-exploration by Earendel
          icon_size = 64,
          icon_mipmaps = 1,
          scale = 2,
          tint = plating_variants["ultra_light"].tint,
        },
        {
          icon = "__OCs_base_assets__/graphics/technology/overlayer-tech-em-plant.png",
          icon_size = 256,
          icon_mipmaps = 4,
        }
      },
      prerequisites = { "heavy-armour-plating-tech", "power-armor", "military-4", "carbon-fiber", "electromagnetic-plant" },
      unit = {
        ingredients = {
          { "automation-science-pack",      1 },
          { "logistic-science-pack",        1 },
          { "chemical-science-pack",        1 },
          { "military-science-pack",        2 }, -- duh!
          { "utility-science-pack",         1 },
          { "production-science-pack",      2 }, -- duh-hu!
          { "space-science-pack",           1 },
          { "electromagnetic-science-pack", 2 }, -- duh-uh-hu!
        },
        time = 60,
        count = 400
      },
      effects = {
        { type = "unlock-recipe", recipe = "ultra-light-armour-plating" },
      },
    },
  })
end

if settings.startup["nuclear-ammo"].value then
  data:extend({
    { -- nuclear ammo tech (cryo, atomic bomb)
      type = "technology",
      name = "nuclear-ammo-tech",
      icons =
      {
        {
          icon = "__base__/graphics/technology/atomic-bomb.png",
          icon_size = 256,
          icon_mipmaps = 4,
        },
        {
          icon = "__OCs_base_assets__/graphics/technology/overlayer-tech-cryo-plant.png",
          icon_size = 256,
          icon_mipmaps = 4,
        }
      },
      prerequisites = { "atomic-bomb", "cryogenic-science-pack" },
      unit = {
        ingredients = {
          { "automation-science-pack", 1 },
          { "logistic-science-pack",   1 },
          { "chemical-science-pack",   1 },
          { "military-science-pack",   2 },
          { "space-science-pack",      1 },
          { "metallurgic-science-pack", 2 },
          { "electromagnetic-science-pack", 2 },
          -- {"agricultural-science-pack", 2}, -- it is still fun with(out) gleba-science
          { "cryogenic-science-pack",  2 },
        },
        time = 60,
        count = 1000,
      },
      effects = {
        { type = "unlock-recipe", recipe = "cryo-atomic-bomb" },
      },
    },
  })
  -- add the optional techs as prerequisites
  if settings.startup["allow-bio-explosives"].value then
    add_prerequisites( { ["nuclear-ammo-tech"] = "bio-rocketry-tech"})
  end
  if settings.startup["allow-casting-explosive-ammo"].value then
    add_prerequisites( { ["nuclear-ammo-tech"] = "casting-explosive-ammo-tech"})
  end
end

-- changes to vanilla techs
if settings.startup["space-fish"].value and settings.startup["allow-bio-explosives"].value then
  add_recipe_unlocks( { ["space-fish-breeding"] = {"fish-breeding"}})
end

-- changes to mod tech
if settings.startup["casting-weapons"].value then
  -- adding recipes to techs
  local recipe_tech_mapping = {
    ["casting-gun-turret"] = { "casting-light-ammo-tech" },
    ["casting-pistol"] = { "casting-light-ammo-tech" },
    ["casting-submachine-gun"] = { "casting-light-ammo-tech" },
    ["casting-shotgun"] = { "casting-light-ammo-tech" },
    ["casting-combat-shotgun"] = { "casting-heavy-ammo-tech" },
    ["pulse-rocket-launcher"] = { "bio-rocketry-tech" },
    ["casting-flamethrower"] = { "casting-explosive-ammo-tech" },
  }
  add_recipe_unlocks(recipe_tech_mapping)
end
