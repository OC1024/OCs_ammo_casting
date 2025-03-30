
local armor_platings = {}

for _, variant in pairs(plating_variants) do
  table.insert(armor_platings,
    { -- armor-plating-prototype
      type = "energy-shield-equipment",
      -- type = "battery-equipment", -- does not consume energy
      -- type = "movement-bonus-equipment", -- base for movement bonus
      name = variant.name,
      sprite = { -- placeholder
        filename = "__OCs_ammo_casting__/graphics/icons/heat-shielding.png",
        width = 64,
        height = 64,
        icon_mipmaps = 1,
        priority = "medium",
        tint = variant.tint,
      },
      shape = {
        width = 2,
        height = 2,
        type = "full"
      },
      max_shield_value = variant.max_shield_value, -- HP boost
      energy_per_shield = variant.energy_per_shield, -- energy per shield HP
      energy_source = {
        type = "electric",
        usage_priority = "primary-input",
        buffer_capacity = variant.buffer_capacity, -- optional, for battery and shields
        input_flow_limit = variant.input_flow_limit, -- optional, for battery and shields
      },
      movement_bonus = variant.movement_bonus, -- optional
      resistances = variant.resistances,
      categories = variant.categories,
      order = variant.order,
    }
  )
end

data:extend(armor_platings)
