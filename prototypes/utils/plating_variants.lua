local plating_variants = {
  light =
  { -- light plating
    name = "light-armour-plating",
    resistances = {
      {
        type = "physical",
        decrease = 1,
        percent = 5
      },
      {
        type = "fire",
        percent = 5,
      },
    },
    categories = { "personal-grid", "vehicle-grid" },
    tint = { r = 1.0, g = 1.0, b = 0.5, a = 1.0 }, -- yellow
    order = "a-a",
    max_shield_value = 100,
    energy_per_shield = "32kJ", -- energy per shield HP
    buffer_capacity = "16kJ",
    input_flow_limit = "32kW",  -- divide by energy_per_shield to get HP/s healrate
    movement_bonus = -0.05,     -- -5% speed
    stack_size = 20,
    weight = 50 * kg,
  },
  heavy =
  { -- heavy plating
    name = "heavy-armour-plating",
    resistances = {
      {
        type = "physical",
        decrease = 2,
        percent = 10
      },
      {
        type = "fire",
        decrease = 1,
        percent = 10,
      },
    },
    categories = { "personal-grid", "vehicle-grid" },
    tint = { r = 1.0, g = 1.0, b = 1.0, a = 1.0 }, -- no tint
    order = "a-b",
    max_shield_value = 200,
    energy_per_shield = "32kJ", -- energy per shield HP
    buffer_capacity = "32kJ",
    input_flow_limit = "64kW",  -- divide by energy_per_shield to get HP/s healrate
    movement_bonus = -0.1,      -- -10% speed
    stack_size = 10,
    weight = 100 * kg,
  },
  tungsten =
  { -- tungsten plating
    name = "tungsten-armour-plating",
    resistances = {
      {
        type = "physical",
        decrease = 4,
        percent = 20
      },
      {
        type = "acid",
        decrease = 10,
        percent = 20,
      },
      {
        type = "fire",
        decrease = 1,
        percent = 10,
      },
    },
    categories = { "vehicle-grid", "personal-grid" }, -- to be changed to vehicle only
    tint = { r = 0.85, g = 0.7, b = 1.0, a = 1.0 },   -- purple
    order = "b-a",
    max_shield_value = 800,
    energy_per_shield = "32kJ", -- energy per shield HP
    buffer_capacity = "32kJ",
    input_flow_limit = "64kW",  -- divide by energy_per_shield to get HP/s healrate
    movement_bonus = -0.2,
    stack_size = 5,
    weight = 200 * kg,
  },
  reactive =
  { -- reactive plating
    name = "reactive-armour-plating",
    resistances = {
      {
        type = "physical",
        decrease = 2,
        percent = 10
      },
      {
        type = "explosion",
        decrease = 10,
        percent = 20,
      }
    },
    categories = { "vehicle-grid" },-- not personal-grid
    tint = { r = 0.75, g = 1.0, b = 0.75, a = 1.0 }, -- green
    order = "b-b",
    max_shield_value = 400,
    energy_per_shield = "32kJ", -- energy per shield HP
    buffer_capacity = "32kJ",
    input_flow_limit = "64kW",  -- divide by energy_per_shield to get HP/s healrate
    movement_bonus = -0.1,      -- -10% speed
    stack_size = 10,
    weight = 100 * kg,
  },
  ultra_light =
  { -- ultra-light plating
    name = "ultra-light-armour-plating",
    resistances = {
      {
        type = "physical",
        decrease = 2,
        percent = 10
      },
      {
        type = "fire",
        decrease = 2,
        percent = 10,
      }
    },
    categories = { "personal-grid", "vehicle-grid" },
    tint = { r = 0.6, g = 0.8, b = 1.0, a = 1.0 }, -- blue
    order = "b-c",
    max_shield_value = 400,
    energy_per_shield = "32kJ", -- energy per shield HP
    buffer_capacity = "64kJ",
    input_flow_limit = "128kW", -- divide by energy_per_shield to get HP/s healrate
    movement_bonus = 0.0,       -- no change
    stack_size = 20,
    weight = 50 * kg,
  },
}
return plating_variants
