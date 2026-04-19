local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")

if settings.startup["earlier-alt-ammo-techs"] then
  -- == make casting-tree simpler == --
  oc_tech.remove_prerequisites("casting-light-ammo-tech", "metallurgic-science-pack")
  oc_tech.remove_tech_ingredient("casting-light-ammo-tech", "metallurgic-science-pack")

  oc_tech.remove_prerequisites("casting-heavy-ammo-tech", "utility-science-pack")
  oc_tech.remove_tech_ingredient("casting-heavy-ammo-tech", "utility-science-pack")
  oc_tech.remove_tech_ingredient("casting-heavy-ammo-tech", "metallurgic-science-pack")

  oc_tech.remove_prerequisites("casting-basic-mortar-ammo-tech", { "metallurgic-science-pack" })
  oc_tech.remove_tech_ingredient("casting-basic-mortar-ammo-tech", "metallurgic-science-pack")

  oc_tech.remove_prerequisites("casting-chemical-mortar-ammo-tech", { "metallurgic-science-pack" })
  oc_tech.remove_tech_ingredient("casting-chemical-mortar-ammo-tech", "metallurgic-science-pack")
  oc_tech.remove_tech_ingredient("casting-chemical-mortar-ammo-tech", "space-science-pack")

  oc_tech.remove_prerequisites("casting-modular-turrets",
    { "utility-science-pack", "production-science-pack", "metallurgic-science-pack" })
  oc_tech.remove_tech_ingredient("casting-modular-turrets", "utility-science-pack")
  oc_tech.remove_tech_ingredient("casting-modular-turrets", "production-science-pack")

  -- == make bio-explosive-tree simpler == --
  oc_tech.remove_prerequisites("bio-explosives-tech", { "space-science-pack", "agricultural-science-pack" })
  oc_tech.remove_tech_ingredient("bio-explosives-tech", "agricultural-science-pack")
  oc_tech.remove_tech_ingredient("bio-explosives-tech", "space-science-pack")

  oc_tech.remove_prerequisites("bio-rocketry-tech", { "space-science-pack", "agricultural-science-pack" })
  oc_tech.remove_tech_ingredient("bio-rocketry-tech", "space-science-pack")
  oc_tech.remove_tech_ingredient("bio-rocketry-tech", "agricultural-science-pack")

  oc_tech.remove_prerequisites("biochemical-mortar-ammo-tech", { "utility-science-pack", "agricultural-science-pack" })
  oc_tech.remove_tech_ingredient("biochemical-mortar-ammo-tech", "space-science-pack")
  oc_tech.remove_tech_ingredient("biochemical-mortar-ammo-tech", "utility-science-tech")
  oc_tech.remove_tech_ingredient("biochemical-mortar-ammo-tech", "agricultural-science-pack")

  -- == make emplant stuff simpler == --
  oc_tech.remove_prerequisites("pulse-mortar-ammo-tech", { "utility-science-pack", "electromagnetic-science-pack" })
  oc_tech.remove_tech_ingredient("pulse-mortar-ammo-tech", "utility-science-pack")
  oc_tech.remove_tech_ingredient("pulse-mortar-ammo-tech", "electromagnetic-science-pack")

  oc_tech.remove_prerequisites("pulse-modular-turrets",
    { "utility-science-pack", "production-science-pack", "electromagnetic-science-pack" })
  oc_tech.remove_tech_ingredient("pulse-modular-turrets", "electromagnetic-science-pack")
  oc_tech.remove_tech_ingredient("pulse-modular-turrets", "utility-science-pack")
  oc_tech.remove_tech_ingredient("pulse-modular-turrets", "production-science-pack")
end
