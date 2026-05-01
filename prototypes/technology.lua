local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")
local plating_variants = require("prototypes.utils.plating_variants")

-- standard ammo-casting techs of this mod
data:extend({
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
    prerequisites = { "foundry", "military-2", "chemical-science-pack", "space-science-pack", "metallurgic-science-pack" },
    unit = {
      ingredients = {
        { "automation-science-pack",  1 },
        { "logistic-science-pack",    1 },
        { "military-science-pack",    2 },
        { "chemical-science-pack",    1 },
        { "space-science-pack",       1 }, -- removed if cheaper settings
        { "metallurgic-science-pack", 2 }, -- removed if cheaper settings
      },
      time = 30,
      count = 100
    },
    effects = {
      { type = "unlock-recipe", recipe = "oc-casting-firearm-magazine" },
      { type = "unlock-recipe", recipe = "oc-casting-piercing-rounds-magazine" },
      { type = "unlock-recipe", recipe = "oc-casting-shotgun-shell" },
    },
  },
  { -- casting heavy ammo (uranium ammo and tank shells)
    type = "technology",
    name = "casting-heavy-ammo-tech",
    icons = {
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
    prerequisites = { "casting-light-ammo-tech", "uranium-ammo", "space-science-pack", "utility-science-pack", "metallurgic-science-pack" },
    unit = {
      ingredients = {
        { "automation-science-pack",  1 },
        { "logistic-science-pack",    1 },
        { "chemical-science-pack",    1 },
        { "military-science-pack",    2 },
        { "space-science-pack",       1 }, -- removed if cheaper settings
        { "utility-science-pack",     1 }, -- removed if cheaper settings
        { "metallurgic-science-pack", 2 }, -- removed if cheaper settings
      },
      time = 45,
      count = 400
    },
    effects = {
      { type = "unlock-recipe", recipe = "oc-casting-piercing-shotgun-shell" },
      { type = "unlock-recipe", recipe = "oc-casting-cannon-shell" },
      { type = "unlock-recipe", recipe = "oc-casting-uranium-rounds-magazine" },
      { type = "unlock-recipe", recipe = "oc-casting-uranium-cannon-shell" },
    },
  },
  { -- casting tungsten ammo
    type = "technology",
    name = "casting-tungsten-ammo-tech",
    icons = {
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
    prerequisites = { "casting-heavy-ammo-tech", "production-science-pack", "metallurgic-science-pack", },
    unit = {
      ingredients = {
        { "automation-science-pack",  1 },
        { "logistic-science-pack",    1 },
        { "military-science-pack",    2 },
        { "chemical-science-pack",    1 },
        { "utility-science-pack",     1 },
        { "production-science-pack",  1 },
        { "space-science-pack",       1 },
        { "metallurgic-science-pack", 2 },
      },
      time = 60,
      count = 800
    },
    effects = {
      { type = "unlock-recipe", recipe = "tungsten-rounds-magazine" },
      { type = "unlock-recipe", recipe = "tungsten-shotgun-shell" },
      { type = "unlock-recipe", recipe = "tungsten-cannon-shell" },
      { type = "unlock-recipe", recipe = "oc-casting-tungsten-rounds-magazine" },
      { type = "unlock-recipe", recipe = "oc-casting-tungsten-shotgun-shell" },
      { type = "unlock-recipe", recipe = "oc-casting-tungsten-cannon-shell" },
    },
  },
  { -- casting railgun ammo
    type = "technology",
    name = "casting-railgun-ammo-tech",
    icons = {
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
      { type = "unlock-recipe", recipe = "oc-casting-railgun-ammo" },
      { type = "unlock-recipe", recipe = "tungsten-railgun-ammo" },
      { type = "unlock-recipe", recipe = "oc-casting-tungsten-railgun-ammo" },
    },
  },
})
-- biochamber techs
data:extend({
  { -- bio explosives
    type = "technology",
    name = "bio-explosives-tech",
    icons = {
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
    prerequisites = { "biochamber", "explosives", "chemical-science-pack", "space-science-pack", "agricultural-science-pack" },
    unit = {
      ingredients = {
        { "automation-science-pack",   1 },
        { "logistic-science-pack",     1 },
        { "chemical-science-pack",     2 },
        { "space-science-pack",        1 },   -- removed if cheaper settings
        { "agricultural-science-pack", 2 },   -- removed if cheaper settings
      },
      time = 30,
      count = 150
    },
    effects = {
      { type = "unlock-recipe", recipe = "oc-bio-explosives" },
      { type = "unlock-recipe", recipe = "oc-bio-explosives-gleba" },
      { type = "unlock-recipe", recipe = "oc-bio-explosives-space" },
    },
  },
  { -- bio rocketry
    type = "technology",
    name = "bio-rocketry-tech",
    icons = {
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
        { "automation-science-pack",   1 },
        { "logistic-science-pack",     1 },
        { "chemical-science-pack",     1 },
        { "military-science-pack",     2 },
        { "space-science-pack",        1 },   -- removed if cheaper settings
        { "agricultural-science-pack", 2 },   -- removed if cheaper settings
      },
      time = 45,
      count = 200
    },
    effects = {
      { type = "unlock-recipe", recipe = "oc-bio-rocket" },
      { type = "unlock-recipe", recipe = "oc-bio-explosive-rocket" },
    },
  },
})

if settings.startup["uranium-shotgun-shell"].value and (not data.raw["item"]["uranium-shotgun-shell"]) then
  oc_tech.add_recipe_unlocks({ {
    ["uranium-shotgun-shell"] = "uranium-ammo",
    ["oc-casting-uranium-shotgun-shell"] = "casting-heavy-ammo-tech",
  } })
end

-- Conditionally included technologies: explosive ammo (including heavy artillery shells)
if settings.startup["allow-casting-explosive-ammo"].value then
  data:extend({
    { -- casting explosive cannon shells and artillery shells
      type = "technology",
      name = "casting-explosive-ammo-tech",
      icons = {
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
      prerequisites = { "casting-tungsten-ammo-tech", "artillery" }, -- explosives is indirectly required for tank and artillery
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
        { type = "unlock-recipe", recipe = "oc-casting-explosive-cannon-shell" },
        { type = "unlock-recipe", recipe = "oc-casting-explosive-uranium-cannon-shell" },
        { type = "unlock-recipe", recipe = "oc-casting-artillery-shell" },
      },
    },
  })
  if settings.startup["heavy-artillery-shells"].value then
    local heavy_art = {
      ["oc-casting-heavy-artillery-shell"] = "casting-explosive-ammo-tech",
      ["heavy-artillery-shell"] = "casting-explosive-ammo-tech",
      ["heavy-artillery-shell-upgrading"] = "casting-explosive-ammo-tech",
    }
    oc_tech.add_recipe_unlocks(heavy_art)
  end
else
  -- tech is disabled but heavy artillery might be enambled
  local heavy_art = {
    -- ["oc-casting-heavy-artillery-shell"] = "artillery",-- as it is not allowed to cast it directly
    ["heavy-artillery-shell"] = "artillery",
    ["heavy-artillery-shell-upgrading"] = "artillery",
  }
  oc_tech.add_recipe_unlocks(heavy_art)
end


if settings.startup["armour-plating"].value then
  -- wheather bio-explosive is needed or not
  local prereq_tech_reactive
  if settings.startup["allow-bio-explosives"].value then
    prereq_tech_reactive = { "heavy-armour-plating-tech", "power-armor", "military-4", "bio-explosives-tech",
      "agricultural-science-pack" }
  else
    prereq_tech_reactive = { "heavy-armour-plating-tech", "power-armor", "military-4", "explosives",
      "agricultural-science-pack" }
  end

  -- armour plating techs
  data:extend({
    { -- light armour plating
      type = "technology",
      name = "light-armour-plating-tech",
      icons = {
        {
          icon = "__OCs_base_assets__/graphics/technology/reinforced_plating.png",
          icon_size = 256,
          icon_mipmaps = 4,
          tint = plating_variants["light"].tint,
        },
      },
      prerequisites = { "solar-panel-equipment", "military-science-pack", "automobilism" }, --modular armor as indirect prereq of solar-panel-equipment
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
        { type = "unlock-recipe", recipe = "oc-casting-light-armour-plating" },
      },
    },
    { -- heavy armour plating
      type = "technology",
      name = "heavy-armour-plating-tech",
      icons = {
        {
          icon = "__OCs_base_assets__/graphics/technology/reinforced_plating.png",
          icon_size = 256,
          icon_mipmaps = 4,
        },
        -- {
        --   icon = "__base__/graphics/icons/energy-shield-mk2-equipment.png",
        --   icon_size = 64,
        --   icon_scale = 0.25,
        --   shift = { 32, -32 },
        --   icon_mipmaps = 4,
        -- }
      },
      prerequisites = { "light-armour-plating-tech", "power-armor", "tank", "low-density-structure" },
      unit = {
        ingredients = {
          { "automation-science-pack", 1 },
          { "logistic-science-pack",   1 },
          { "chemical-science-pack",   2 },
          { "military-science-pack",   2 }, -- duh!
          -- { "utility-science-pack",    2 }, -- duh-hu!
        },
        time = 45,
        count = 150
      },
      effects = {
        { type = "unlock-recipe", recipe = "heavy-armour-plating" },
        { type = "unlock-recipe", recipe = "oc-casting-heavy-armour-plating" },
      },
    },
    { -- tungsten armour plating
      type = "technology",
      name = "tungsten-armour-plating-tech",
      icons = {
        {
          icon = "__OCs_base_assets__/graphics/technology/reinforced_plating.png",
          icon_size = 256,
          icon_mipmaps = 4,
          tint = plating_variants["tungsten"].tint,

        },
        {
          icon = "__OCs_base_assets__/graphics/technology/overlayer-tech-molten-iron.png",
          icon_size = 256,
          icon_mipmaps = 4,
        }
      },
      prerequisites = { "heavy-armour-plating-tech", "military-4", "power-armor", "metallurgic-science-pack" },
      unit = {
        ingredients = {
          { "automation-science-pack",  1 },
          { "logistic-science-pack",    1 },
          { "chemical-science-pack",    1 },
          { "military-science-pack",    2 }, -- duh!
          { "utility-science-pack",     2 }, -- duh-hu!
          { "production-science-pack",  1 },
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
          icon = "__OCs_base_assets__/graphics/technology/reinforced_plating.png",
          icon_size = 256,
          icon_mipmaps = 4,
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
          { "utility-science-pack",      2 }, -- duh-hu!
          { "production-science-pack",   1 },
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
          icon = "__OCs_base_assets__/graphics/technology/reinforced_plating.png",
          icon_size = 256,
          icon_mipmaps = 4,
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
          { "utility-science-pack",         2 }, -- duh-hu!
          { "production-science-pack",      1 },
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

  if settings.startup["earlier-armor-plating"].value then
    local remove_prereps = {
      ["light-armour-plating-tech"] = { "solar-panel-equipment", "military-science-pack", "automobilism" },
      ["heavy-armour-plating-tech"] = { "power-armor", "tank", "low-density-structure" },
    }
    local adding_prereps = {
      ["light-armour-plating-tech"] = { "heavy-armor", "military-2", "electronics" },
      ["heavy-armour-plating-tech"] = { "modular-armor", "automobilism", "military-science-pack", "solar-panel-equipment", "advanced-material-proces", "chemical-science-pack" },
    }
    oc_tech.remove_prerequisites(remove_prereps)
    oc_tech.add_prerequisites(adding_prereps)
    -- also make the techs easier/cheaper
    oc_tech.remove_tech_ingredients({ "light-armour-plating-tech", "military-science-pack" })
    data.raw["technology"]["light-armour-plating-tech"].unit.count = 90 -- because it was 120 military-science-pack before
  end
  if settings.startup["earlier-solar-panel-equipment"].value then
    -- make the solar panel equipment earlier
    local remove_prereps = {
      ["solar-panel-equipment"] = { "modular-armor" },
    }
    oc_tech.remove_prerequisites(remove_prereps)
    local add_prereps = {
      ["solar-panel-equipment"] = { "heavy-armor", "electronics", "military-2" },
      -- make sure follow-up techs are still properly locked
      ["energy-shield-equipment"] = { "modular-armor", "advanced-circuit" },
      ["belt-immunity-equipment"] = { "modular-armor", "advanced-circuit" },
      ["night-vision-equipment"] = { "modular-armor", "advanced-circuit" },
    }
    oc_tech.add_prerequisites(add_prereps)
  end
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
          { "automation-science-pack",      1 },
          { "logistic-science-pack",        1 },
          { "chemical-science-pack",        1 },
          { "military-science-pack",        2 },
          { "space-science-pack",           1 },
          { "metallurgic-science-pack",     2 },
          { "electromagnetic-science-pack", 2 },
          -- {"agricultural-science-pack", 2}, -- it is still fun with(out) gleba-science
          { "cryogenic-science-pack",       2 },
        },
        time = 60,
        count = 1000,
      },
      effects = {
        { type = "unlock-recipe", recipe = "oc-cryo-atomic-bomb" },
      },
    },
  })
  -- add the optional techs as prerequisites
  if settings.startup["allow-bio-explosives"].value then
    oc_tech.add_prerequisites({ ["nuclear-ammo-tech"] = "bio-rocketry-tech" })
  end
  if settings.startup["allow-casting-explosive-ammo"].value then
    oc_tech.add_prerequisites({ ["nuclear-ammo-tech"] = "casting-explosive-ammo-tech" })
  end
end

-- changes to vanilla techs
if settings.startup["space-fish"].value then
  oc_tech.add_recipe_unlocks({ ["space-fish-breeding"] = { "fish-breeding" } })
end

-- changes to mod tech
if settings.startup["casting-weapons"].value then
  -- adding recipes to techs
  local recipe_tech_mapping = {
    ["oc-casting-pistol"] = { "casting-light-ammo-tech" },
    ["oc-casting-submachine-gun"] = { "casting-light-ammo-tech" },
    ["oc-casting-shotgun"] = { "casting-light-ammo-tech" },
    ["oc-casting-combat-shotgun"] = { "casting-heavy-ammo-tech" },
    ["oc-pulse-rocket-launcher"] = { "bio-rocketry-tech" },
    ["oc-casting-flamethrower"] = { "casting-explosive-ammo-tech" },
    ["oc-casting-gun-turret"] = { "casting-light-ammo-tech" },
    ["oc-casting-flamethrower-turret"] = { "casting-explosive-ammo-tech" },
  }
  oc_tech.add_recipe_unlocks(recipe_tech_mapping)
end
