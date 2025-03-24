data:extend({
    {
      type = "energy-shield-equipment",
      name = "ablative-armor-equipment",
      sprite = {
        filename = "__OCs_foundary_expansion__/graphics/icons/heat-shielding.png",
        width = 64,
        height = 64,
        priority = "medium"
      },
      shape = {
        width = 2,
        height = 2,
        type = "full"
      },
      max_shield_value = 100,           -- Acts as bonus HP
      energy_source = {
        type = "electric",
        usage_priority = "primary-input"
      },
      energy_per_shield = "1kJ",         -- No energy cost for regeneration
      shield_recharge_time = 1e12,    -- Effectively disables regen
      categories = {"armor"}            -- Or add your own custom category
    }
  })
  