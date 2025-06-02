plating_variants = {
    light =
    { -- light plating
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
      tint = {r = 1.0, g = 1.0, b = 0.5, a = 1.0}, -- yellow
      group = "combat",
      subgroup = "armour-plating",
      order = "a-a",
      place_as_equipment_result = "light-armour-plating",
      max_shield_value = 100,
      energy_per_shield = "32kJ", -- energy per shield HP
      buffer_capacity = "16kJ",
      input_flow_limit = "32kW", -- divide by energy_per_shield to get HP/s healrate
      movement_bonus = -0.05, -- -5% speed
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
      categories = {"personal-armour-plating-equipment","vehicle-armour-plating-equipment"},
      tint = {r = 1.0, g = 1.0, b = 1.0, a = 1.0}, -- no tint
      group = "combat",
      subgroup = "armour-plating",
      order = "a-b",
      place_as_equipment_result = "heavy-armour-plating",
      max_shield_value = 200,
      energy_per_shield = "32kJ", -- energy per shield HP
      buffer_capacity = "32kJ",
      input_flow_limit = "64kW", -- divide by energy_per_shield to get HP/s healrate
      movement_bonus = -0.1, -- -10% speed
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
      categories = {"vehicle-armour-plating-equipment","personal-armour-plating-equipment"}, -- to be changed to vehicle only
      tint = {r = 0.85, g = 0.7, b = 1.0, a = 1.0}, -- purple
      group = "combat",
      subgroup = "armour-plating",
      order = "b-a",
      place_as_equipment_result = "tungsten-armour-plating",
      max_shield_value = 800,
      energy_per_shield = "32kJ", -- energy per shield HP
      buffer_capacity = "32kJ",
      input_flow_limit = "64kW", -- divide by energy_per_shield to get HP/s healrate
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
      categories = {"vehicle-armour-plating-equipment","personal-armour-plating-equipment"}, -- to be changed to vehicle only
      tint = {r = 0.75, g = 1.0, b = 0.75, a = 1.0}, -- green
      group = "combat",
      subgroup = "armour-plating",
      order = "b-b",
      place_as_equipment_result = "reactive-armour-plating",
      max_shield_value = 400,
      energy_per_shield = "32kJ", -- energy per shield HP
      buffer_capacity = "32kJ",
      input_flow_limit = "64kW", -- divide by energy_per_shield to get HP/s healrate
      movement_bonus = -0.1, -- -10% speed
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
      categories = {"personal-armour-plating-equipment","vehicle-armour-plating-equipment"},
      tint = {r = 0.6, g = 0.8, b = 1.0, a = 1.0} , -- blue
      group = "combat",
      subgroup = "armour-plating",
      order = "b-c",
      place_as_equipment_result = "ultra-light-armour-plating",
      max_shield_value = 400,
      energy_per_shield = "32kJ", -- energy per shield HP
      buffer_capacity = "64kJ",
      input_flow_limit = "128kW", -- divide by energy_per_shield to get HP/s healrate
      movement_bonus = 0.0, -- no change
      stack_size = 20,
      weight = 50 * kg,
    },
  }