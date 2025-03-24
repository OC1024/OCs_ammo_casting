local function check_and_destroy_ablative(entity)
  -- Function can now accept players or vehicles
  local grid = nil

  if entity.type == "player" then
    local armor = entity.get_inventory(defines.inventory.character_armor)[1]
    if armor and armor.valid_for_read and armor.grid then
      grid = armor.grid
    end
  elseif entity.grid then
    -- For vehicles and similar entities with grids
    grid = entity.grid
  end

  if not grid then return end

  for _, equipment in pairs(grid.equipment) do
    if equipment.name == "ablative-armor-plate" and equipment.shield == 0 then
      grid.take{equipment = equipment}
      if entity.type == "player" then
        entity.print("Ablative armor plate destroyed!")
      end
    end
  end
end

-- Run check on player and vehicle damage
script.on_event(defines.events.on_entity_damaged, function(event)
  if not (event.entity and event.entity.valid) then return end
  if event.entity.type == "player" or event.entity.grid then
    check_and_destroy_ablative(event.entity)
  end
end)
