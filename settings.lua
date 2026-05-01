data:extend({
  { -- casting weapons
    type = "bool-setting",
    name = "casting-weapons",
    setting_type = "startup",
    default_value = true,
    order = "a",
  },
  { -- casting explosive ammo (artilery, explosive cannon shells)
    type = "bool-setting",
    name = "allow-casting-explosive-ammo",
    setting_type = "startup",
    default_value = true,
    order = "b-b",
  },
  { -- replace vanilla shells to medium and DLC to heavy shells.
    type = "bool-setting",
    name = "heavy-artillery-shells",
    setting_type = "startup",
    default_value = false,
    order = "b-c",
  },
  { -- crafting explosives and rockets in biochamber (mandatory)
    type = "bool-setting",
    name = "allow-bio-explosives",
    setting_type = "startup",
    default_value = true,
    hidden = true, -- now mandatory
    order = "c-a",
  },
  { -- space fish breeding
    type = "bool-setting",
    name = "space-fish",
    setting_type = "startup",
    default_value = true,
    order = "c-b",
  },
  { -- fulgora coal
    type = "bool-setting",
    name = "fulgora-coal",
    setting_type = "startup",
    default_value = false,
    order = "c-c",
  },
  -- armor and armor plating
  { -- key setting for the follwinging (maybe mandatory in the future)
    type = "bool-setting",
    name = "armour-plating",
    setting_type = "startup",
    default_value = true,
    order = "d-a",
  },
  { -- early armor grid
    type = "string-setting",
    name = "early-armor-grid",
    setting_type = "startup",
    allowed_values = { "light-armor", "heavy-armor", "none" },
    default_value = "heavy-armor",
    order = "d-b",
  },
  { -- earlier armor plating (requires armour-plating to be true)
    type = "bool-setting",
    name = "earlier-armor-plating",
    setting_type = "startup",
    default_value = false,
    order = "d-c",
  },
  { -- earlier solar panel equipment
    type = "bool-setting",
    name = "earlier-solar-panel-equipment",
    setting_type = "startup",
    default_value = false,
    order = "d-d",
  },
  -- crafting options
  { -- tungsten steel ammo (changes tungsten carbide+steel to tungsten steel)
    type = "bool-setting",
    name = "tungsten-steel-ammo",
    setting_type = "startup",
    default_value = false,
    order = "e-a",
  },
  { -- uranium shotgun shell
    type = "bool-setting",
    name = "uranium-shotgun-shell",
    setting_type = "startup",
    default_value = true,
    order = "e-b",
  },
  -- even more powerful ammo types
  { -- vanilla nuclear rockets and key setting for fusion, anitmatter, ...
    type = "bool-setting",
    name = "nuclear-ammo",
    setting_type = "startup",
    default_value = true,
    order = "f-a",
  },
  { -- [K2SO: antimatter ammo] (requires nuclear ammo TRUE)
    type = "bool-setting",
    name = "antimatter-ammo",
    setting_type = "startup",
    default_value = false,
    order = "f-b",
  },
  {
    type = "bool-setting",
    name = "earlier-alt-ammo-techs",
    setting_type = "startup",
    default_value = false,
    order = "g",
  }
})
