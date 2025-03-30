-- local base_armor_plating =
-- { -- armor-plating-prototype
--   type = "battery-equipment", -- does not consume energy
--   -- type = "movement-bonus-equipment",
--   name = "armour-plating",
--   sprite = { -- placeholder
--     filename = "__OCs_ammo_casting__/graphics/icons/heat-shielding.png",
--     width = 64,
--     height = 64,
--     icon_mipmaps = 1,
--     priority = "medium",
--   },
--   shape = {
--     width = 2,
--     height = 2,
--     type = "full"
--   },
--   -- max_shield_value = 50, -- HP boost
--   energy_source = {
--     type = "electric",
--     usage_priority = "primary-input",
--     -- buffer_capacity = "10kJ", -- optional, for battery and shields
--     -- input_flow_limit = "240kW", -- optional, for battery and shields
--   },
--   movement_bonus = -0.1, -- -10% speed
--   resistances = {},
--   -- categories = { "vehicle" }, -- Only for vehicle grids
--   categories = {"armor-plating-equipment"},
-- }

local armor_platings = {}

require("plating_variants")  -- Import the variant table

for _, variant in pairs(plating_variants) do
  table.insert(armor_platings, 
    { -- armor-plating-prototype
      type = "battery-equipment", -- does not consume energy
      -- type = "movement-bonus-equipment",
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
      -- max_shield_value = 50, -- HP boost
      energy_source = {
        type = "electric",
        usage_priority = "primary-input",
        -- buffer_capacity = "10kJ", -- optional, for battery and shields
        -- input_flow_limit = "240kW", -- optional, for battery and shields
      },
      movement_bonus = -0.1, -- -10% speed
      resistances = variant.resistances,
      categories = variant.categories,
      order = variant.order,
    }
  )
end

data:extend(armor_platings)
