lating_variants = {
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
      place_as_equipment_result = "light-armour-plating",
      group = "combat",
      subgroup = "armour-plating",
      order = "a-a",
      stack_size =20,
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
      place_as_equipment_result = "heavy-armour-plating",
      group = "combat",
      subgroup = "armour-plating",
      order = "a-b",
      stack_size =10,
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
      place_as_equipment_result = "tungsten-armour-plating",
      group = "combat",
      subgroup = "armour-plating",
      order = "b-a",
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
      place_as_equipment_result = "reactive-armour-plating",
      group = "combat",
      subgroup = "armour-plating",
      order = "b-b",
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
      place_as_equipment_result = "ultra-light-armour-plating",
      group = "combat",
      subgroup = "armour-plating",
      order = "b-c",
      stack_size = 40,
      weight = 25 * kg,
    },
  }