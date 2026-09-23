local upgraded = 0

local function upgrade_artillery_inventory(inventory)
  if not inventory then
    return
  end

  for _, item in pairs(inventory.get_contents()) do
    if item.name == "artillery-shell" then
      local removed = inventory.remove({
        name = "artillery-shell",
        count = item.count,
        quality = item.quality
      })

      if removed > 0 then
        inventory.insert({
          name = "heavy-artillery-shell",
          count = removed,
          quality = item.quality
        })
        upgraded = upgraded + removed
      end
    end
  end
end


script.on_configuration_changed(function(event)
  -- Only perform this when the mod is newly added to an existing save.
  local mod_change = event.mod_changes and event.mod_changes[script.mod_name]
  if not mod_change or mod_change.old_version ~= nil then
    return
  end
  game.print("Thanks for using the mod [OCs Ammo & Armor]!")
  -- Check if the heavy artillery is even enabled
  local setting = settings.startup["heavy-artillery-shells"]
  if not setting or not setting.value then
    game.print("You have disabled the heavy artillery shells with the mod setting \"heavy artillery shells\". Enable it and reload the save game.")
    game.print("If you decide to change that later, I won't upgrade them for fee.")
    return
  end
  game.print("Existing save detected. Your artillery shells will be upgraded once to preserve your existing resources.")
  game.print("The vanilla [item=artillery-shell] artillery shell is now called \"Medium Artillery Shell\". The new [item=heavy-artillery-shell] \"Heavy Artillery Shell\" is a separate, more powerful version.")

  -- Player inventories.
  for _, player in pairs(game.players) do
    for inventory_index = 1, player.get_max_inventory_index() do
      upgrade_artillery_inventory(
        player.get_inventory(inventory_index)
      )
    end
  end

  -- Every entity on every surface.
  for _, surface in pairs(game.surfaces) do
    for _, entity in pairs(surface.find_entities()) do
      for inventory_index = 1, entity.get_max_inventory_index() do
        upgrade_artillery_inventory(
          entity.get_inventory(inventory_index)
        )
      end
    end
  end
  -- Log in chat
  if upgraded >= 0 then
    game.print({"", "[OCs Ammo & Armor]: Upgraded ", upgraded, " medium artillery shells to heavy artillery shells."})
  end
end)