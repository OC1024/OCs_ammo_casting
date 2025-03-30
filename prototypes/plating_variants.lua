plating_variants = {
    {
      name = "light-armour-plating",
      resistances = {
        {
         type = "physical",
         decrease = 1,
         percent = 5
        },
        -- {
        --  type = "fire",
        --  decrease = 1,
        --  percent = 5,
        -- },
      },
      categories = {"personal-armour-plating-equipment","vehicle-armour-plating-equipment"},
      tint = {r = 1.0, g = 1.0, b = 0.6, a = 1.0}, -- yellow
      group = "combat",
      subgroup = "armour-plating",
      order = "a-a",
      place_as_equipment_result = "light-armour-plating",
      max_shield_value = 100,
      energy_per_shield = "20kJ", -- energy per shield HP
      buffer_capacity = "1kJ",
      input_flow_limit = "2kW", -- divide by energy_per_shield to get HP/s healrate
      movement_bonus = -0.05, -- -5% speed
      stack_size = 20,
      weight = 50 * kg,
    },
    {
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
      categories = {"personal-armour-plating-equipment","vehicle-armour-plating-equipment"},
      tint = {r = 1.0, g = 1.0, b = 1.0, a = 1.0}, -- no tint
      group = "combat",
      subgroup = "armour-plating",
      order = "a-b",
      place_as_equipment_result = "heavy-armour-plating",
      max_shield_value = 200,
      energy_per_shield = "20kJ", -- energy per shield HP
      buffer_capacity = "2kJ",
      input_flow_limit = "4kW", -- divide by energy_per_shield to get HP/s healrate
      movement_bonus = -0.1, -- -10% speed
      stack_size = 10,
      weight = 100 * kg,
    },
    {
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
      categories = {"vehicle-armour-plating-equipment"},
      tint = {r = 0.85, g = 0.7, b = 1.0, a = 1.0}, -- purple
      group = "combat",
      subgroup = "armour-plating",
      order = "b-a",
      place_as_equipment_result = "tungsten-armour-plating",
      max_shield_value = 400,
      energy_per_shield = "40kJ", -- energy per shield HP
      buffer_capacity = "4kJ",
      input_flow_limit = "8kW", -- divide by energy_per_shield to get HP/s healrate
      movement_bonus = -0.2,
      stack_size = 5,
      weight = 200 * kg,
    },
    {
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
      categories = {"vehicle-armour-plating-equipment"},
      tint = {r = 0.75, g = 1.0, b = 0.75, a = 1.0}, -- green
      group = "combat",
      subgroup = "armour-plating",
      order = "b-b",
      place_as_equipment_result = "reactive-armour-plating",
      max_shield_value = 300,
      energy_per_shield = "40kJ", -- energy per shield HP
      buffer_capacity = "4kJ",
      input_flow_limit = "8kW", -- divide by energy_per_shield to get HP/s healrate
      movement_bonus = -0.1, -- -10% speed
      stack_size = 10,
      weight = 100 * kg,
    },
    {
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
      categories = {"personal-armour-plating-equipment","vehicle-armour-plating-equipment"},
      tint = {r = 0.6, g = 0.8, b = 1.0, a = 1.0} , -- blue
      group = "combat",
      subgroup = "armour-plating",
      order = "b-c",
      place_as_equipment_result = "ultra-light-armour-plating",
      max_shield_value = 300,
      energy_per_shield = "40kJ", -- energy per shield HP
      buffer_capacity = "4kJ",
      input_flow_limit = "8kW", -- divide by energy_per_shield to get HP/s healrate
      movement_bonus = 0.0, -- no change
      stack_size = 40,
      weight = 25 * kg,
    },
  }