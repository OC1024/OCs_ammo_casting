local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")
local starter_planet_tables = require("prototypes.utils.starter-planet-tables")

-- doing all at once sans vulcanus (uranium-tungsten) switch
if settings.startup["earlier-alt-ammo-techs"].value then
  -- == make casting-tree simpler == --
  local vulcanus_techs = starter_planet_tables.vulcanus_techs
  oc_tech.remove_prerequisites(vulcanus_techs)
  oc_tech.remove_tech_ingredients(vulcanus_techs)

  -- == make bio-explosive-tree simpler == --
  local gleba_techs = starter_planet_tables.gleba_techs
  oc_tech.remove_prerequisites(gleba_techs)
  oc_tech.remove_tech_ingredients(gleba_techs)

  -- == make emplant stuff simpler == --
  local fulgora_techs = starter_planet_tables.fulgora_techs
  oc_tech.remove_prerequisites(fulgora_techs)
  oc_tech.remove_tech_ingredients(fulgora_techs)

end
