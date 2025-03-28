data:extend({
    { -- armor-plating- prototype
      type = "movement-bonus-equipment",
      name = "heavy-armor-plating",
      sprite = {
        filename = "__OCs_ammo_casting__/graphics/equipment/heat-shielding.png",
        width = 64,
        height = 64,
        icon_mipmaps = 1,
        priority = "medium",
      },
      shape = {
        width = 2,
        height = 2,
        type = "full"
      },
      max_shield_value = 50, -- HP boost
      energy_source = {
        type = "electric",
        usage_priority = "primary-input"
      },
      movement_bonus = -0.1, -- -10% speed
      resistances = {
        {
          type = "physical",
          decrease = 2,
          percent = 10,
        }
      },
      categories = { "vehicle" } -- Only for vehicle grids
    }
  })
  