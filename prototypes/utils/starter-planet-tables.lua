local starter_planet_tables = {}

-- todo : add dedicated moshine compat, not just a simpler vulcanus clone
starter_planet_tables.moshine_techs = {
  ["casting-light-ammo-tech"] = { "space-science-pack", "metallurgic-science-pack" },
  ["casting-heavy-ammo-tech"] = { "space-science-pack", "utility-science-pack", "metallurgic-science-pack" },
  ["casting-basic-mortar-ammo-tech"] = { "space-science-pack", "metallurgic-science-pack" },
  ["casting-chemical-mortar-ammo-tech"] = { "space-science-pack", "metallurgic-science-pack" },
  ["casting-modular-turrets"] = { "space-science-pack", "utility-science-pack", "metallurgic-science-pack" },
}

starter_planet_tables.vulcanus_techs = {
  ["casting-light-ammo-tech"] = { "space-science-pack", "metallurgic-science-pack" },
  ["casting-heavy-ammo-tech"] = { "space-science-pack", "metallurgic-science-pack" },
  -- ["tungsten-armour-plating-tech"] = { "space-science-pack", "metallurgic-science-pack" },-- plating
  ["casting-basic-mortar-ammo-tech"] = { "space-science-pack", "metallurgic-science-pack" },
  ["casting-chemical-mortar-ammo-tech"] = { "space-science-pack", "metallurgic-science-pack" },
  ["casting-modular-turrets"] = { "space-science-pack", "utility-science-pack", "metallurgic-science-pack" },
}

starter_planet_tables.gleba_techs = {
  ["bio-explosives-tech"] = { "space-science-pack", "agricultural-science-pack" },
  ["bio-rocketry-tech"] = { "space-science-pack", "agricultural-science-pack" },
  -- ["reactive-armour-plating-tech"] = { "space-science-pack", "agricultural-science-pack" },-- plating
  ["biochemical-mortar-ammo-tech"] = { "space-science-pack", "utility-science-pack", "agricultural-science-pack" },
}

starter_planet_tables.fulgora_techs = {
  -- ["ultra-light-armour-plating-tech"] = { "space-science-pack", "electromagnetic-science-pack" },-- plating
  ["pulse-mortar-ammo-tech"] = { "space-science-pack", "utility-science-pack", "electromagnetic-science-pack" },
  ["pulse-modular-turrets"] = { "space-science-pack", "utility-science-pack", "electromagnetic-science-pack" }
}

return starter_planet_tables
