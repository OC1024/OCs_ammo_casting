if not settings.startup["armour-plating"].value then return end -- skip if armor plating is disabled

local plating_variants = require("prototypes.utils.plating_variants")
local armor_platings = {}

for _, variant in pairs(plating_variants) do
  table.insert(armor_platings,
    { -- armor-plating-prototype
      type = "energy-shield-equipment", -- base for energy shield, does consume energy
      -- type = "battery-equipment", -- does not consume energy
      -- type = "movement-bonus-equipment", -- base for movement bonus
      name = variant.name,
      sprite = {
        filename = "__OCs_base_assets__/graphics/icons/reinforced_plating.png",
        width = 64,
        height = 64,
        icon_mipmaps = 4,
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
        buffer_capacity = variant.buffer_capacity,
        input_flow_limit = variant.input_flow_limit,
      },
      -- movement_bonus = variant.movement_bonus, -- optional. not possible to have both
      resistances = variant.resistances,
      categories = variant.categories,
      order = variant.order,
    }
  )
end

data:extend(armor_platings)
