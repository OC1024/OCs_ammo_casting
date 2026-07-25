--  load api
local generator_api = require("__OCs_base_assets__.prototypes.utils.api")
local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")
local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")

-- optional TODO: create new tungsten mortar dart/ tungsten shrapnel ammo

-- casting mortar
local casting_dict = {
  -- casting
  ["mortar-bomb"] = "metallurgy",          -- overwrite basic recipe
  ["mortar-cluster-bomb"] = "metallurgy",  -- overwrite basic recipe
  ["mortar-shrapnel-ammo"] = "metallurgy", -- basic
  ["mortar-heavy-ammo"] = "metallurgy",    -- heavy ammo
  ["mortar-fire-ammo"] = "metallurgy",     -- chemical (see gunboat-compat file)
  ["mortar-fire-bomb"] = "metallurgy",     -- chemical (see gunboat-compat file)
  -- bio/chemical
  ["mortar-slowdown-ammo"] = "organic",
  ["mortar-poison-bomb"] = "organic", -- overwrite gunboat-compat file
  ["mortar-illumination-ammo"] = "organic",
  ["mortar-hypnosis-ammo"] = "organic",
  -- electromagnetics
  ["mortar-energy-ammo"] = "electromagnetics",
  ["mortar-defender-robot-ammo"] = "electromagnetics",
  ["mortar-distractor-robot-ammo"] = "electromagnetics",
  ["mortar-destroyer-robot-ammo"] = "electromagnetics",
  ["mortar-lure-robot-ammo"] = "electromagnetics",
  -- nuclear
  ["mortar-light-nuclear-ammo"] = "cryogenics",
}
if settings.startup["casting-weapons"].value then
  casting_dict["mortar-turret"] = "metallurgy" -- in case the gunboat+mortar-turret mod is not active
  casting_dict["heavy-mortar-turret"] = "metallurgy"
end
generator_api.batch_generator(casting_dict)

if data.raw.recipe["oc-casting-mortar-poison-bomb"] then
  data.raw.recipe["oc-casting-mortar-poison-bomb"].hidden = true -- overwrite old casting version in favour of the bio one.
end

-- creating new mortat techs
data:extend({
  { -- biochemical mortar ammo
    type = "technology",
    name = "biochemical-mortar-ammo-tech",
    icons = {
      {
        icon = "__strategy-mortar-turret__/graphics/icons/mortar-hypnosis-ammo.png",
        icon_size = 64,
        icon_mipmaps = 1, --sadly
      },
      {
        icon = "__OCs_base_assets__/graphics/technology/overlayer-tech-biochamber.png",
        icon_size = 256,
        icon_mipmaps = 4,
      }
    },
    prerequisites = {
      "biochamber",                     -- crafting building
      -- "casting-basic-mortar-ammo-tech", -- continuation of chemical ammo? independent of the foundry!
      -- "mortar-slowdown-ammo",
      -- "mortar-poison-bomb",
      -- "mortar-illumination-ammo",
      -- "mortar-hypnosis-ammo",
      "space-science-pack",        -- removed if cheaper
      "utility-science-pack",      -- removed if cheaper
      "agricultural-science-pack", -- removed if cheaper
    },
    unit = {
      ingredients = {
        { "automation-science-pack",   1 },
        { "logistic-science-pack",     1 },
        { "military-science-pack",     2 },
        { "chemical-science-pack",     2 },
        { "utility-science-pack",      1 }, -- removed if cheaper
        { "space-science-pack",        1 }, -- removed if cheaper
        { "agricultural-science-pack", 2 }, -- removed if cheaper
      },
      time = 30,
      count = 200
    },
    effects = {
      -- { type = "unlock-recipe", recipe = "oc-bio-mortar-slowdown-ammo" },
      -- { type = "unlock-recipe", recipe = "oc-bio-mortar-poison-bomb" },
      -- { type = "unlock-recipe", recipe = "oc-bio-mortar-illumination-ammo" },
      -- { type = "unlock-recipe", recipe = "oc-bio-mortar-hypnosis-ammo" },
    },
  },
  { -- robot mortar ammo
    type = "technology",
    name = "pulse-mortar-ammo-tech",
    icons = {
      {
        icon = "__strategy-mortar-turret__/graphics/icons/mortar-destroyer-ammo.png",
        icon_size = 64,
        icon_mipmaps = 1, --sadly
      },
      {
        icon = "__OCs_base_assets__/graphics/technology/overlayer-tech-em-plant.png",
        icon_size = 256,
        icon_mipmaps = 4,
      }
    },
    prerequisites = {
      "electromagnetic-plant", -- crafting building
      "mortar-turret",         -- its okay if it does not require the foundry-path
      -- "mortar-energy-ammo",
      -- "mortar-defender-robot-ammo",
      -- "mortar-distractor-robot-ammo",
      -- "mortar-destroyer-robot-ammo",
      -- "mortar-lure-robot-ammo",
      "utility-science-pack",         -- removed if cheaper
      "electromagnetic-science-pack", -- removed if cheaper
    },
    unit = {
      ingredients = {
        { "automation-science-pack",      1 },
        { "logistic-science-pack",        1 },
        { "military-science-pack",        2 },
        { "chemical-science-pack",        2 },
        { "space-science-pack",           1 },
        { "utility-science-pack",         1 }, -- removed if cheaper
        { "electromagnetic-science-pack", 2 }, -- removed if cheaper
      },
      time = 30,
      count = 200
    },
    effects = {
      -- { type = "unlock-recipe", recipe = "oc-pulse-mortar-energy-ammo" },
      -- { type = "unlock-recipe", recipe = "oc-pulse-mortar-defender-robot-ammo" },
      -- { type = "unlock-recipe", recipe = "oc-pulse-mortar-distractor-robot-ammo" },
      -- { type = "unlock-recipe", recipe = "oc-pulse-mortar-destroyer-robot-ammo" },
      -- { type = "unlock-recipe", recipe = "oc-pulse-mortar-lure-robot-ammo" },
    },
  },
})
if not mods["ironclad-gunboat-and-mortar-turret-fork"] then -- changes see compat file. This is the replacement changes
  -- creating new mortat techs
  data:extend({
    { -- chemical mortar ammo
      type = "technology",
      name = "casting-chemical-mortar-ammo-tech",
      icons = {
        {
          icon = "__strategy-mortar-turret__/graphics/technology/mortar-turret.png", -- as gunboad mod is missing
          icon_size = 256,
          icon_mipmaps = 4,
        },
        {
          icon = "__OCs_base_assets__/graphics/technology/overlayer-tech-molten-iron.png",
          icon_size = 256,
          icon_mipmaps = 4,
        }
      },
      prerequisites = { "casting-basic-mortar-ammo-tech", "military-4", "mortar-cluster-bomb" },
      unit = {
        ingredients = {
          { "automation-science-pack",  1 },
          { "logistic-science-pack",    1 },
          { "military-science-pack",    2 },
          { "chemical-science-pack",    2 },
          { "space-science-pack",       1 }, -- removed if earler
          { "metallurgic-science-pack", 2 }, -- removed if earler
        },
        time = 30,
        count = 150
      },
      effects = {
      },
    },
  })

  local chemical_mortar_tech_effects = {
    ["oc-casting-mortar-fire-bomb"] = "casting-chemical-mortar-ammo-tech",
    ["oc-casting-mortar-poison-bomb"] = "casting-chemical-mortar-ammo-tech",
    -- ["oc-casting-mortar-cluster-bomb"] = "casting-chemical-mortar-ammo-tech", -- added below anyway
  }
  oc_tech.add_recipe_unlocks(chemical_mortar_tech_effects)

  local removing_prereq_dict = {
    ["casting-basic-mortar-ammo-tech"] = { "ironclad" }, -- decouple mortar from ironclad
  }
  oc_tech.remove_prerequisites(removing_prereq_dict)
  local adding_prereq_dict = {
    -- would need "military-4" for the clusterbomb. maybe moving the clusterbomb to the casting-explosive-ammo-tech
    ["casting-basic-mortar-ammo-tech"] = { "mortar-turret", "military-3" },
    ["casting-chemical-mortar-ammo-tech"] = { "mortar-cluster-bomb" },
    ["casting-explosive-ammo-tech"] = { "oc-casting-chemical-mortar-ammo-tech" },
  }
  oc_tech.add_prerequisites(adding_prereq_dict)
end

-- biochemical mortar ammo
local biochemical_req = {
  ["biochemical-mortar-ammo-tech"] = {
    "mortar-slowdown-ammo",
    "mortar-poison-bomb",
    "mortar-illumination-ammo",
    "mortar-hypnosis-ammo",
  }
}
oc_tech.add_prerequisites(biochemical_req)

local biochemical_ammo = {
  ["oc-bio-mortar-slowdown-ammo"]     = "biochemical-mortar-ammo-tech",
  ["oc-bio-mortar-poison-bomb"]       = "biochemical-mortar-ammo-tech",
  ["oc-bio-mortar-illumination-ammo"] = "biochemical-mortar-ammo-tech",
  ["oc-bio-mortar-hypnosis-ammo"]     = "biochemical-mortar-ammo-tech",
}
oc_tech.add_recipe_unlocks(biochemical_ammo)

-- robot mortar ammo
local robot_req = {
  ["pulse-mortar-ammo-tech"] = {
    "mortar-energy-ammo",
    "mortar-defender-robot-ammo",
    "mortar-distractor-robot-ammo",
    "mortar-destroyer-robot-ammo",
    "mortar-lure-robot-ammo",
  }
}
oc_tech.add_prerequisites(robot_req)

local robot_ammo = {
  ["oc-pulse-mortar-energy-ammo"]           = "pulse-mortar-ammo-tech",
  ["oc-pulse-mortar-defender-robot-ammo"]   = "pulse-mortar-ammo-tech",
  ["oc-pulse-mortar-distractor-robot-ammo"] = "pulse-mortar-ammo-tech",
  ["oc-pulse-mortar-destroyer-robot-ammo"]  = "pulse-mortar-ammo-tech",
  ["oc-pulse-mortar-lure-robot-ammo"]       = "pulse-mortar-ammo-tech",
}
oc_tech.add_recipe_unlocks(robot_ammo)

-- add prerequisites
local adding_prereq_dict = {
  ["casting-heavy-ammo-tech"] = { "casting-basic-mortar-ammo-tech", "mortar-heavy-ammo" },                                -- because heavy mortar ammo
  ["nuclear-ammo-tech"] = { "casting-chemical-mortar-ammo-tech", "pulse-mortar-ammo-tech", "mortar-light-nuclear-ammo" }, -- requires all of my techs and nuclear mortar tech
  ["casting-chemical-mortar-ammo-tech"] = { "mortar-cluster-bomb", "mortar-fire-bomb" },
  ["casting-explosive-ammo-tech"] = { "casting-chemical-mortar-ammo-tech" },                                              -- because explosive mortar ammo
}
oc_tech.add_prerequisites(adding_prereq_dict)

-- remove old unlocks
local old_unlocks = {
  ["oc-casting-mortar-poison-bomb"]  = { "casting-chemical-mortar-ammo-tech" }, -- added in the gunboat-compat file, moved to the new bio-chemical tech
  ["oc-casting-mortar-cluster-bomb"] = { "casting-basic-mortar-ammo-tech" },    -- added in the aai-ironclad-compat file, replaced by shrapnel ammo
}
oc_tech.remove_recipe_unlocks(old_unlocks)

-- add recipe unlocks to technology
local unlock_mapping = {
  ["oc-casting-mortar-cluster-bomb"]    = "casting-chemical-mortar-ammo-tech",
  ["oc-casting-mortar-shrapnel-ammo"]   = "casting-basic-mortar-ammo-tech", -- replaces the now stronger cluster-bomb
  ["oc-casting-mortar-fire-ammo"]       = "casting-chemical-ammo-tech",
  ["oc-casting-mortar-heavy-ammo"]      = "casting-heavy-ammo-tech",
  ["oc-cryo-mortar-light-nuclear-ammo"] = "nuclear-ammo-tech",
  -- weapons (if present)
  ["oc-casting-mortar-turret"]          = "mortar-turret", -- if gunboat mod is disabled
  ["oc-casting-heavy-mortar-turret"]    = "heavy-mortar-turret",
}
oc_tech.add_recipe_unlocks(unlock_mapping)


-- move to subgroup
local subgroup_mapping = {
  ["oc-casting-mortar-shrapnel-ammo"]   = "mortar-ammo",
  ["mortar-illumination-bomb"]          = "mortar-ammo",
  ["mortar-fire-ammo"]                  = "mortar-ammo",
  ["oc-pulse-mortar-energy-ammo"]       = "mortar-ammo",
  ["oc-casting-mortar-heavy-ammo"]      = "mortar-ammo",
  ["oc-cryo-mortar-light-nuclear-ammo"] = "mortar-ammo",
}
oc_recipe.change_recipes_subgroup(subgroup_mapping)
