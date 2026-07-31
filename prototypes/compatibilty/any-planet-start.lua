local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")
local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")
local starter_planet_tables = require("prototypes.utils.starter-planet-tables")

local starter_planets = {}

-- sp: multiple possible starter planets
if mods["planet-picker-21patch"] then
  if settings.startup["oc-pp-vulcanus"].value then
    starter_planets.vulcanus = true
  end
  if settings.startup["oc-pp-fulgora"].value then
    starter_planets.fulgora = true
  end
  if settings.startup["oc-pp-gleba"].value then
    starter_planets.gleba = true
  end
  if settings.startup["oc-pp-moshine"].value then
    starter_planets.moshine = true
  end
end
local aps_starter_planet = settings.startup["aps-planet"].value

local supported_planets = {
  none = true,
  vulcanus = true,
  fulgora = true,
  gleba = true,
  moshine = true,
}

if not supported_planets[aps_starter_planet] then
  log(
    "Unsupported starter planet: " ..
    tostring(aps_starter_planet) ..
    ". Supported planets are: " ..
    table.concat({ "none", "vulcanus", "fulgora", "gleba", "moshine" }, ", ")
  )
else
  starter_planets[aps_starter_planet] = true
end


-- todo : add dedicated moshine compat, not just a simpler vulcanus clone
if starter_planets.moshine then
  -- make techs cheaper and simpler
  local moshine_techs = starter_planet_tables.moshine_techs
  oc_tech.remove_prerequisites(moshine_techs)
  oc_tech.remove_tech_ingredients(moshine_techs)

  -- end of moshine changes, WIP
  starter_planets[#starter_planets + 1] = "moshine"
end

if starter_planets.vulcanus then
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

  -- new techs for switching
  data.raw["technology"]["casting-tungsten-ammo-tech"].hidden = true -- basically removing the old tech
  data.raw["technology"]["casting-uranium-ammo-tech"].hidden = false -- activating the hidden tech
  data.raw["technology"]["tungsten-ammo-tech"].hidden = false        -- activating the hidden tech

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
    ["oc-casting-uranium-shotgun-shell"] = "casting-uranium-ammo-tech", --if activated
    -- scattergun turret/modular turrets
    ["oc-casting-w93-uranium-shotgun-shell"] = "casting-uranium-ammo-tech",
    -- metal-and-stars
    ["oc-casting-thorium-cannon-shell"] = "casting-uranium-ammo-tech",
    ["oc-casting-thorium-rounds-magazine"] = "casting-uranium-ammo-tech",
    -- vtk-cannon-turret
    ["tungsten-cannon-shell-magazine"] = "tungsten-ammo-tech",
    ["oc-casting-tungsten-cannon-shell-magazine"] = "casting-heavy-ammo-tech",
    -- ["oc-casting-cannon-shell-magazine"] = "casting-uranium-ammo-tech",
    ["oc-casting-uranium-cannon-shell-magazine"] = "casting-uranium-ammo-tech",
  })

  -- end of vulcanus changes
  starter_planets[#starter_planets + 1] = "vulcanus"
end

if starter_planets.gleba then
  -- make techs cheaper and simpler
  local gleba_techs = starter_planet_tables.gleba_techs
  oc_tech.remove_prerequisites(gleba_techs)
  oc_tech.remove_tech_ingredients(gleba_techs)

  -- end of gleba changes
  starter_planets[#starter_planets + 1] = "gleba"
end

if starter_planets.fulgora then
  -- make techs cheaper and simpler
  local fulgora_techs = starter_planet_tables.fulgora_techs
  oc_tech.remove_prerequisites(fulgora_techs)
  oc_tech.remove_tech_ingredients(fulgora_techs)

  -- end of fulgora changes
  starter_planets[#starter_planets + 1] = "fulgora"
end

log("Changed OCs techs slightly because starter planets are " .. table.concat(starter_planets, ", "))
