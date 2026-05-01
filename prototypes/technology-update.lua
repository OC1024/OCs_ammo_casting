local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")

if settings.startup["earlier-alt-ammo-techs"].value then
  -- == make casting-tree simpler == --
  local vulcanus_mapping = {
    ["casting-light-ammo-tech"] = { "space-science-pack", "metallurgic-science-pack" },
    ["casting-heavy-ammo-tech"] = { "space-science-pack", "utility-science-pack", "metallurgic-science-pack" },
    ["casting-basic-mortar-ammo-tech"] = { "space-science-pack", "metallurgic-science-pack" },
    ["casting-chemical-mortar-ammo-tech"] = { "metallurgic-science-pack", "space-science-pack" },
    ["casting-modular-turrets"] = { "space-science-pack", "utility-science-pack", "metallurgic-science-pack" },
  }
  oc_tech.remove_prerequisites(vulcanus_mapping)
  oc_tech.remove_tech_ingredients(vulcanus_mapping)

  -- == make bio-explosive-tree simpler == --
  local gleba_mapping = {
    ["bio-explosives-tech"] = { "space-science-pack", "agricultural-science-pack" },
    ["bio-rocketry-tech"] = { "space-science-pack", "agricultural-science-pack" },
    ["biochemical-mortar-ammo-tech"] = { "space-science-pack", "utility-science-pack", "agricultural-science-pack" },
  }
  oc_tech.remove_prerequisites(gleba_mapping)
  oc_tech.remove_tech_ingredients(gleba_mapping)

  -- == make emplant stuff simpler == --
  local fulgora_mapping = {
    ["pulse-mortar-ammo-tech"] = { "space-science-pack", "utility-science-pack", "electromagnetic-science-pack", },
    ["pulse-modular-turrets"] = { "space-science-pack", "utility-science-pack", "electromagnetic-science-pack" }
  }
  oc_tech.remove_prerequisites(fulgora_mapping)
  oc_tech.remove_tech_ingredients(fulgora_mapping)
end
