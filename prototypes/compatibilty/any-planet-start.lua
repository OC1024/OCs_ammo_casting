local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")
local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")
local starter_planet_tables = require("prototypes.utils.starter-planet-tables")

local starter_planet = settings.startup["aps-planet"].value
-- expected result: "none", "vulcanus", "fulgora", "gleba"}
local supported_planets = { "none", "vulcanus", "fulgora", "gleba", "moshine" }
if not table.contains(supported_planets, starter_planet) then
  log("Unsupported starter planet: " ..  tostring(starter_planet) .. ". Supported planets are: " .. table.concat(supported_planets, ", "))
end


if starter_planet == "none" then
  return
elseif starter_planet == "moshine" then
  -- todo : add dedicated moshine compat, not just a simpler vulcanus clone
  -- make techs cheaper and simpler
  local moshine_techs = starter_planet_tables.moshine_techs
  oc_tech.remove_prerequisites(moshine_techs)
  oc_tech.remove_tech_ingredients(moshine_techs)

  -- end of moshine changes, WIP
elseif starter_planet == "vulcanus" then
  -- make techs cheaper and simpler
  local vulcanus_techs = starter_planet_tables.vulcanus_techs
  oc_tech.remove_prerequisites(vulcanus_techs)
  oc_tech.remove_tech_ingredients(vulcanus_techs)

  -- other changes to later techs
  local vulcanus_mapping = {
    ["casting-heavy-ammo-tech"] = "uranium-ammo",
    ["casting-explosive-ammo-tech"] = "casting-tungsten-ammo-tech",
    ["casting-railgun-ammo-tech"] = "casting-tungsten-ammo-tech",
  }
  oc_tech.remove_prerequisites(vulcanus_mapping)
  oc_tech.remove_tech_ingredients(vulcanus_mapping)

  -- new techs
  data:extend({
    { -- tungsten-ammo-tech, as the "uranium-ammo" equivalent
      type = "technology",
      name = "tungsten-ammo-tech",
      icons = {
        {
          icon = "__OCs_ammo_casting__/graphics/technology/tungsten-ammo-tech.png",
          icon_size = 256,
          icon_mipmaps = 4,
        }
      },
      prerequisites = { "tungsten-steel", "tank", "military-4" },
      unit = {
        ingredients = {
          { "automation-science-pack", 1 },
          { "logistic-science-pack",   1 },
          { "military-science-pack",   2 },
          { "chemical-science-pack",   1 },
          { "utility-science-pack",    2 }, -- like uranium ammo
        },
        time = 60,
        count = 500, -- effectively 1k for the interesting science packs
      },
      effects = {
        { type = "unlock-recipe", recipe = "tungsten-rounds-magazine" },
        { type = "unlock-recipe", recipe = "tungsten-shotgun-shell" },
        { type = "unlock-recipe", recipe = "tungsten-cannon-shell" },
      },
    },
    { -- casting-uranium-ammo-tech, as the "casting-tungsten-ammo-tech" equivalent
      type = "technology",
      name = "casting-uranium-ammo-tech",
      icons = {
        {
          icon = "__base__/graphics/technology/uranium-ammo.png",
          icon_size = 256,
          icon_mipmaps = 4,
        },
        {
          icon = "__OCs_base_assets__/graphics/technology/overlayer-tech-molten-iron.png",
          icon_size = 256,
          icon_mipmaps = 4,
        },
      },
      prerequisites = { "uranium-ammo", "casting-heavy-ammo-tech", "space-science-pack", "production-science-pack", "metallurgic-science-pack" },
      unit = {
        ingredients = {
          { "automation-science-pack",  1 },
          { "logistic-science-pack",    1 },
          { "military-science-pack",    2 },
          { "chemical-science-pack",    1 },
          { "utility-science-pack",     1 },
          { "space-science-pack",       1 },
          { "production-science-pack",  1 },
          { "metallurgic-science-pack", 2 },
        },
        time = 60,
        count = 800, -- effectively 1k for the interesting science packs
      },
      effects = {
        { type = "unlock-recipe", recipe = "oc-casting-uranium-rounds-magazine" },
        -- { type = "unlock-recipe", recipe = "oc-casting-uranium-shotgun-shell" },--optional, see below
        { type = "unlock-recipe", recipe = "oc-casting-uranium-cannon-shell" },
      },
    },
  })
  -- switch uranium and tungsten ammo functionally
  oc_tech.add_prerequisites({
    ["casting-heavy-ammo-tech"] = "tungsten-ammo-tech",
    ["uranium-ammo"] = "tungsten-ammo-tech", --switching indirect dependendy
    ["casting-explosive-ammo-tech"] = "casting-uranium-ammo-tech",
    ["casting-railgun-ammo-tech"] = "casting-uranium-ammo-tech",
    -- vtk-cannnon-turret
    ["tungsten-ammo-tech"] = "vtk-cannon-turret-unlock" -- as it has the cannon shell magazines
  })
  -- switch uranium and tungsten recipe unlocks
  oc_tech.remove_recipe_unlocks({
    ["oc-casting-uranium-cannon-shell"] = "casting-heavy-ammo-tech",
    ["oc-casting-uranium-shotgun-shell"] = "casting-heavy-ammo-tech",
    ["oc-casting-uranium-rounds-magazine"] = "casting-heavy-ammo-tech",
    -- scattergun turret/modular turrets
    ["oc-casting-w93-uranium-shotgun-shell"] = "casting-heavy-ammo-tech",
    -- metal-and-stars
    ["oc-casting-thorium-cannon-shell"] = "casting-heavy-ammo-tech",
    ["oc-casting-thorium-rounds-magazine"] = "casting-heavy-ammo-tech",
    -- vtk-cannnon-turret
    ["oc-casting-uranium-cannon-shell-magazine"] = "casting-heavy-ammo-tech"
  })
  oc_tech.add_recipe_unlocks({
    ["oc-casting-tungsten-cannon-shell"] = "casting-heavy-ammo-tech",
    ["oc-casting-tungsten-shotgun-shell"] = "casting-heavy-ammo-tech",
    ["oc-casting-tungsten-rounds-magazine"] = "casting-heavy-ammo-tech",
    ["oc-casting-uranium-shotgun-shell"] = "casting-uranium-ammo-tech", -- if activated
    -- scattergun turret/modular turrets
    ["oc-casting-w93-uranium-shotgun-shell"] = "casting-uranium-ammo-tech",
    -- metal-and-stars
    ["oc-casting-thorium-cannon-shell"] = "casting-uranium-ammo-tech",
    ["oc-casting-thorium-rounds-magazine"] = "casting-uranium-ammo-tech",
    -- vtk-cannon-turret
    ["tungsten-cannon-shell-magazine"] = "tungsten-ammo-tech",
    ["oc-casting-tungsten-cannon-shell-magazine"] = "casting-heavy-ammo-tech",
    ["oc-casting-cannon-shell-magazine"] = "casting-uranium-ammo-tech",
    ["oc-casting-uranium-cannon-shell-magazine"] = "casting-uranium-ammo-tech",
  })
  data.raw["technology"]["casting-tungsten-ammo-tech"].hidden = true -- basically removing the old tech

  -- end of vulvanus changes
elseif starter_planet == "gleba" then
  -- make techs cheaper and simpler
  local gleba_techs = starter_planet_tables.gleba_techs
  oc_tech.remove_prerequisites(gleba_techs)
  oc_tech.remove_tech_ingredients(gleba_techs)

  -- end of gleba changes
elseif starter_planet == "fulgora" then
  -- make techs cheaper and simpler
  local fulgora_techs = starter_planet_tables.fulgora_techs
  oc_tech.remove_prerequisites(fulgora_techs)
  oc_tech.remove_tech_ingredients(fulgora_techs)

  -- end of fulgora changes
end

log("Changed OCs techs slightly because starter planet is " .. tostring(starter_planet))
