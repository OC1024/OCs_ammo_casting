
if mods["scattergun_turret"] then
  if data.raw["ammo"]["tungsten-cannon-shell"] and data.raw["projectile"]["tungsten-cannon-projectile"] then
    data.raw["ammo"]["tungsten-cannon-shell"].ammo_type.range_modifier = 1.375 -- such that it is still better but just half of the bonus added
    data.raw["ammo"]["tungsten-cannon-shell"].ammo_type.target_type = "position"
    data.raw["ammo"]["tungsten-cannon-shell"].ammo_type.action.action_delivery.max_range = 90
    data.raw["ammo"]["tungsten-cannon-shell"].ammo_type.action.action_delivery.direction_deviation = nil
    data.raw["ammo"]["tungsten-cannon-shell"].ammo_type.action.action_delivery.range_deviation = nil
    log("Removed the maximal ranges of tungsten cannon ammo to be usable with the Modular Turred Mod turrets.")
    data.raw["projectile"]["tungsten-cannon-projectile"].force_condition = "not-same"
    data.raw["projectile"]["tungsten-cannon-projectile"].direction_only = false
    data.raw["projectile"]["tungsten-cannon-projectile"].hit_collision_mask = {layers={object=true, player=true, train=true, trigger_target=true}}
    -- log(serpent.block(data.raw["ammo"]["tungsten-cannon-shell"]))
    -- log(serpent.block(data.raw["projectile"]["tungsten-cannon-projectile"]))
  end
  if data.raw["ammo"]["tungsten-shotgun-shell"] and data.raw["projectile"]["explosive-uranium-cannon-projectile"] then
    data.raw["ammo"]["tungsten-shotgun-shell"].ammo_type.target_type = "position"
  end
  if data.raw["technology"]["casting-light-ammo-tech"] then
    table.insert(data.raw["technology"]["casting-light-ammo-tech"].effects, {
      type = "unlock-recipe",
      recipe = "casting-fragmentation-shell",
    })
    log("Successfully added 'casting-fragmentation-shell' to 'casting-light-ammo-tech'.")
  end
  if data.raw["technology"]["casting-heavy-ammo-tech"] then
    -- Inject the recipe unlock into the technology
    table.insert(data.raw["technology"]["casting-heavy-ammo-tech"].effects, {
        type = "unlock-recipe",
        recipe = "casting-uranium-shotgun-shell",
    })
    log("Successfully added 'casting-uranium-shotgun-shell' to 'casting-heavy-ammo-tech'.")
else
    log("Warning: Technology 'casting-heavy-ammo-tech' not found. Unable to add 'casting-uranium-shotgun-shell' recipe.")
end
end
-- experimental compatibility
if mods["More_Ammo"] then
  log("Overriding tungsten ammo from 'More_Ammo'. Experimental and unfinished.")
  -- overwrite tungsten ammo from that specific mod to make it alingt with my one. Also add the casting recipes for the new ammo and empty magazines from that mod.
end
-- require("prototypes.recipe-updates")
-- require("prototypes.technology-updates")