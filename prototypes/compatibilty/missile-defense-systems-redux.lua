local generator_api = require("__OCs_base_assets__.prototypes.utils.api")
local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")
local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")


-- creating new recipes
local casting_dict = {
  ["mds-ballistic-missile"] = "organic",
  ["mds-ballistic-explosive-missile"] = "organic",
  ["mds-ballistic-incendiary-missile"] = "organic", -- compat with "chemical rocket
  ["mds-ballistic-chemical-missile"] = "organic",   -- compat with "chemical rocket
  ["mds-ballistic-tungsten-missile"] = "organic",
  ["mds-ballistic-atomic-bomb-missile"] = "cryogenics",
}
generator_api.batch_generator(casting_dict)


data:extend({
  {
    type = "technology",
    name = "bio-mds-rocketry-tech",
    icons = {
      {
        icon = "__missile-defense-systems-redux__/graphics/technology/ballistic-missile-defense-system.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_base_assets__/graphics/technology/overlayer-tech-biochamber.png",
        icon_size = 256,
        icon_mipmaps = 4,
      }
    },
    prerequisites = { "agricultural-science-pack", "ballistic-missile-defense-system", "bio-rocketry-tech", "bio-grenades-tech" },
    unit = {
      ingredients = {
        { "automation-science-pack",   1 },
        { "logistic-science-pack",     1 },
        { "chemical-science-pack",     1 },
        { "military-science-pack",     2 },
        { "space-science-pack",        1 },
        { "utility-science-pack",      1 },
        { "production-science-pack",   1 },
        { "agricultural-science-pack", 2 }, -- removed if cheaper
      },
      time = 60,
      count = 1500,
    },
    effects = {
      { type = "unlock-recipe", recipe = "oc-bio-mds-ballistic-missile" },
      { type = "unlock-recipe", recipe = "oc-bio-mds-ballistic-explosive-missile" },
      -- { type = "unlock-recipe", recipe = "oc-bio-mds-ballistic-tungsten-missile" },
    },
  }
})

-- add recipes to technology
local recipe_unlock_mapping = {
  ["oc-bio-mds-ballistic-incendiary-missile"] = { "bio-mds-rocketry-tech" }, -- compat with "chemical rocket"
  ["oc-bio-mds-ballistic-chemical-missile"] = { "bio-mds-rocketry-tech" },   -- compat with "chemical rocket"
  ["oc-bio-mds-ballistic-tungsten-missile"] = { "bio-mds-rocketry-tech" },   -- safety feature
  ["oc-cryo-mds-ballistic-atomic-bomb-missile"] = { "nuclear-ammo-tech" },
}
oc_tech.add_recipe_unlocks(recipe_unlock_mapping)

-- add prerequisites to techs
local additional_prereq = {
  ["nuclear-ammo-tech"] = { "mds-ballistic-atomic-bomb-missile", "bio-mds-rocketry-tech" },
}
oc_tech.add_prerequisites(additional_prereq)

if settings.startup["casting-weapons"].value then
  local weapons_dict = {
    ["basic-missile-defense-system"] = "metallurgy",
    ["advanced-missile-defense-system"] = "metallurgy",
    ["ballistic-missile-defense-system"] = "metallurgy",
  }
  generator_api.batch_generator(weapons_dict)
  -- add recipes to technology
  local r_unlocks = {
    ["oc-casting-basic-missile-defense-system"] = { "basic-missile-defense-system" },
    ["oc-casting-advanced-missile-defense-system"] = { "advanced-missile-defense-system" },
    ["oc-casting-ballistic-missile-defense-system"] = { "ballistic-missile-defense-system" },
  }
  oc_tech.add_recipe_unlocks(r_unlocks)
end
