data:extend({ -- standard ammo techs of this mod
  { -- casting light ammo (red&yellow ammo)
    type = "technology",
    name = "casting-light-ammo-tech",
    icons = {
      {
        icon = "__base_/graphics/technology/weapon-shooting-speed-1.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_ammo_casting__/graphics/technology/overlayer-tech-molten-iron.png",
        icon_size = 256,
        icon_mipmaps = 4,
      }
    },
    prerequisites = {"foundry","military-2"}, -- early as possible
    unit = {
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 2},
        -- {"metallurgic-science-pack", 2},
      },
      time = 30,
      count = 100
      },
      effects = {
        {type = "unlock-recipe", recipe = "casting-firearm-magazine"},
        {type = "unlock-recipe", recipe = "casting-piercing-rounds-magazine"},
        {type = "unlock-recipe", recipe = "casting-shotgun-shell"},
      },
     order = "aa"
  },
  { -- casting heavy ammo (uranium ammo and tank shells)
    type = "technology",
    name = "casting-heavy-ammo-tech",
    icons =
    {
      {
        icon = "__base__/graphics/technology/physical-projectile-damage-2.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_ammo_casting__/graphics/technologies/overlayer-tech-molten-iron.png",
        icon_size = 256,
        icon_mipmaps = 4,
      }
    },
    prerequisites = {"casting-light-ammo-tech","uranium-ammo"},
    unit = {
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        -- {"utility-science-pack", 1},
        {"military-science-pack", 2},
        -- {"metallurgic-science-pack", 2},
      },
      time = 45,
      count = 400
      },
      effects = {
        {type = "unlock-recipe", recipe = "casting-uranium-rounds-magazine"},
        {type = "unlock-recipe", recipe = "casting-piercing-shotgun-shell"},
        {type = "unlock-recipe", recipe = "casting-cannon-shell"},
        {type = "unlock-recipe", recipe = "casting-uranium-cannon-shell"},
      },
  },
  { -- casting tungsten ammo
    type = "technology",
    name = "casting-tungsten-ammo-tech",
    icons =
    {
      {
        icon = "__OCs_ammo_casting__/graphics/technologies/tungsten-ammo-tech.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_ammo_casting__/graphics/technologies/overlayer-tech-molten-iron.png",
        icon_size = 256,
        icon_mipmaps = 4,
      }
    },
    prerequisites = {"casting-heavy-ammo-tech","metallurgic-science-pack"},
    unit = {
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 1},
        {"military-science-pack", 2},
        {"production-science-pack", 1},
        {"space-science-pack", 1},
        {"metallurgic-science-pack", 2},
        -- {"electromagnetic-science-pack", 2},
      },
      time = 60,
      count = 800
      },
      effects = {
        {type = "unlock-recipe", recipe = "casting-tungsten-rounds-magazine"},
        {type = "unlock-recipe", recipe = "casting-tungsten-shotgun-shell"},
        {type = "unlock-recipe", recipe = "casting-tungsten-cannon-shell"},
        {type = "unlock-recipe", recipe = "tungsten-rounds-magazine"},
        {type = "unlock-recipe", recipe = "tungsten-shotgun-shell"},
        {type = "unlock-recipe", recipe = "tungsten-cannon-shell"},
      },
  },
  { -- casting railgung ammo
    type = "technology",
    name = "casting-railgun-ammo-tech",
    icons =
    {
      {
        icon = "__space-age__/graphics/technology/railgun.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_ammo_casting__/graphics/technologies/overlayer-tech-molten-iron.png",
        icon_size = 256,
        icon_mipmaps = 4,
      }
    },
    prerequisites = {"casting-tungsten-ammo-tech","railgun"},
    unit = {
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 2},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"metallurgic-science-pack", 2},
        {"electromagnetic-science-pack", 2},
        {"cryogenic-science-pack", 2}
      },
      time = 60,
      count = 1000
      },
      effects = {
        {type = "unlock-recipe", recipe = "casting-railgun-ammo"},
        {type = "unlock-recipe", recipe = "tungsten-railgun-ammo"},
        {type = "unlock-recipe", recipe = "casting-tungsten-railgun-ammo"},
      },
  --    order = "ad"
  },
})

-- Conditionally included technologies
if settings.startup["allow-casting-explosive-ammo"].value then
  data:extend({
  { -- casting explosive tank shells and artillery shells
    type = "technology",
    name = "casting-explosive-ammo-tech",
    icons =
    {
      {
        icon = "__base__/graphics/technology/explosives.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_ammo_casting__/graphics/technologies/overlayer-tech-molten-iron.png",
        icon_size = 256,
        icon_mipmaps = 4,
      }
    },
    prerequisites = {"casting-tungsten-ammo-tech","artillery"}, -- explosives is indirectly required for tanks and artillery
    unit = {
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 2},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"metallurgic-science-pack", 2},
      },
      time = 60,
      count = 1000
      },
      effects = {
        {type = "unlock-recipe", recipe = "casting-explosive-shell"},
        {type = "unlock-recipe", recipe = "casting-explosive-uranium-shell"},
        {type = "unlock-recipe", recipe = "casting-artillery-shell"},
        {type = "unlock-recipe", recipe = "heavy-artillery-shell" },
        {type = "unlock-recipe", recipe = "casting-heavy-artillery-shell"},
        {type = "unlock-recipe", recipe = "heavy-artillery-shell-upgrading" }
      },
     order = "ac"
  },
  })
end

if settings.startup["allow-bio-explosives"].value then
  data:extend({ -- biochamber techs
  { -- bio explosives
    type = "technology",
    name = "bio-explosives-tech",
    icons =
    {
      {
        icon = "__base__/graphics/technology/explosives.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_ammo_casting__/graphics/technologies/overlayer-tech-biochamber.png",
        icon_size = 256,
        icon_mipmaps = 4,
      }
    },
    prerequisites = {"biochamber","explosives"},
    unit = {
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 2},
        -- {"military-science-pack", 2},
        -- {"space-science-pack", 1},
        -- {"agricultural-science-pack", 2},
      },
      time = 30,
      count = 150
      },
      effects = {
        {type = "unlock-recipe", recipe = "bio-explosives"},
        {type = "unlock-recipe", recipe = "bio-explosives-gleba"},
        {type = "unlock-recipe", recipe = "bio-explosives-space"},
      },
  },
  { -- bio rocketry
    type = "technology",
    name = "bio-rocketry-tech",
    icons =
    {
      {
        icon = "__base__/graphics/technology/explosive-rocketry.png",
        icon_size = 256,
        icon_mipmaps = 4,
      },
      {
        icon = "__OCs_ammo_casting__/graphics/technologies/overlayer-tech-biochamber.png",
        icon_size = 256,
        icon_mipmaps = 4,
      }
    },
    prerequisites = {"bio-explosives-tech","explosive-rocketry"},
    unit = {
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 2},
        -- {"space-science-pack", 1},
        -- {"agricultural-science-pack", 2},
      },
      time = 45,
      count = 200
      },
      effects = {
        {type = "unlock-recipe", recipe = "bio-rocket"},
        {type = "unlock-recipe", recipe = "bio-explosive-rocket"},
      },
  },
  })
end

if settings.startup["armor-plating-tree"].value then
  data:extend({
    { -- light armor plating
      type = "technology",
      name = "light-armor-plating-tech",
      icons = {
        {
          icon = "__OCs_ammo_casting__/graphics/technology/heat-shielding.png", -- from  space-exploration by Earendel
          icon_size = 64,
          icon_mipmaps = 1,
          scale = 4,
          tint = {r = 1.0, g = 1.0, b = 1.0, a = 0.6},
        },
        {
          icon = "__OCs_ammo_casting__/graphics/technology/overlayer-tech-molten-iron.png",
          icon_size = 256,
          icon_mipmaps = 4,
        }
      },
      prerequisites = {"modular-armor","automobilism"},
      unit = {
        ingredients = {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"millitary-science-pack", 2}, -- duh!
        },
        time = 30,
        count = 60 -- effectively 120 millitary-science-pack
        },
        effects = { -- not impemented yet
          -- {type = "unlock-recipe", recipe = "casting-light-armor-plating"},
          {type = "unlock-recipe", recipe = "light-armor-plating"},
          {type = "unlock-recipe", recipe = "ablative-armor-equipment"},
        },
    },
    { -- heavy armor plating
      type = "technology",
      name = "heavy-armor-plating-tech",
      icons = {
        {
          icon = "__OCs_ammo_casting__/graphics/technology/heat-shielding.png", -- from  space-exploration by Earendel
          icon_size = 64,
          icon_mipmaps = 1,
          scale = 4,
        },
        {
          icon = "__OCs_ammo_casting__/graphics/technology/overlayer-tech-molten-iron.png",
          icon_size = 256,
          icon_mipmaps = 4,
        }
      },
      icon_size = 256, icon_mipmaps = 4,
      prerequisites = {"light-armor-plating-tech","tank"},
      unit = {
        ingredients = {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
          {"millitary-science-pack", 2}, -- duh!
          {"utility-science-pack", 1},
          {"production-science-pack", 2}, -- duh-hu!
        },
        time = 45,
        count = 120
        },
        effects = { -- not impemented yet
          {type = "unlock-recipe", recipe = "casting-heavy-armor-plating"},
          {type = "unlock-recipe", recipe = "heavy-armor-plating"},
          {type = "unlock-recipe", recipe = "heavy-ablative-armor-equipment"},
        },
    },
    { -- tungsten armor plating
      type = "technology",
      name = "tungsten-armor-plating-tech",
      icons = {
        {
          icon = "__OCs_ammo_casting__/graphics/technology/heat-shielding.png", -- from  space-exploration by Earendel
          icon_size = 64,
          icon_mipmaps = 1,
          scale = 4,
          tint = {r = 0.8, g = 0.6, b = 1.0, a = 1.0}, -- purple
        },
        {
          icon = "__OCs_ammo_casting__/graphics/technology/overlayer-tech-molten-iron.png",
          icon_size = 256,
          icon_mipmaps = 4,
        }
      },
      icon_size = 256, icon_mipmaps = 4,
      prerequisites = {"heavy-armor-plating-tech","tungsten-steel","military-4"},
      unit = {
        ingredients = {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
          {"millitary-science-pack", 2}, -- duh!
          {"utility-science-pack", 1},
          {"production-science-pack", 2}, -- duh-hu!
          {"space-science-pack", 1},
          {"metallurgic-science-pack", 2}, -- duh-uh-hu!
        },
        time = 60,
        count = 400
        },
        effects = { -- not impemented yet
          {type = "unlock-recipe", recipe = "casting-heavy-armor-plating"},
          {type = "unlock-recipe", recipe = "heavy-armor-plating"},
          {type = "unlock-recipe", recipe = "heavy-ablative-armor-equipment"},
        },
    },
    -- { -- reactive armor plating
    --   type = "technology",
    --   name = "reactive-armor-plating-tech",
    --   icons = {
    --     {
    --       icon = "__OCs_ammo_casting__/graphics/technology/heat-shielding.png", -- from  space-exploration by Earendel
    --       icon_size = 64,
    --       icon_mipmaps = 1,
    --       scale = 4,
    --       tint = {r = 0.8, g = 0.6, b = 1.0, a = 1.0}, -- purple
    --     },
    --     {
    --       icon = "__OCs_ammo_casting__/graphics/technology/overlayer-tech-molten-iron.png",
    --       icon_size = 256,
    --       icon_mipmaps = 4,
    --     }
    --   },
    --   icon_size = 256, icon_mipmaps = 4,
    --   prerequisites = {"heavy-armor-plating-tech","tungsten-steel","military-4"},
    --   unit = {
    --     ingredients = {
    --       {"automation-science-pack", 1},
    --       {"logistic-science-pack", 1},
    --       {"chemical-science-pack", 1},
    --       {"millitary-science-pack", 2}, -- duh!
    --       {"utility-science-pack", 1},
    --       {"production-science-pack", 2}, -- duh-hu!
    --       {"space-science-pack", 1},
    --       {"metallurgic-science-pack", 2}, -- duh-uh-hu!
    --     },
    --     time = 60,
    --     count = 400
    --     },
    --     effects = { -- not impemented yet
    --       {type = "unlock-recipe", recipe = "casting-heavy-armor-plating"},
    --       {type = "unlock-recipe", recipe = "heavy-armor-plating"},
    --       {type = "unlock-recipe", recipe = "reactive-armor-equipment"},
    --     },
    -- },
  })
  end

-- changes to vanilla techs
if settings.startup["space-fish"].value and settings.startup["allow-bio-explosives"].value then
  table.insert(data.raw["technology"]["fish-breeding"].effects,
    { type = "unlock-recipe", recipe = "space-fish-breeding" }
  )
  log("Note: space fish-breeding recipe now is added to the vanilla tech.")
else
  local recipe = data.raw["recipe"]["space-fish-breeding"]
  if recipe then
    recipe.hidden = true
  end
  log("Note: space fish-breeding recipe now is hidden.")
end

-- changes to mod tech
if settings.startup["allow-casting-gun-turrets"].value then
  if data.raw["technology"]["casting-light-ammo-tech"] then
      table.insert(data.raw["technology"]["casting-light-ammo-tech"].effects, {
          type = "unlock-recipe",
          recipe = "casting-gun-turret",
      })
      log("Successfully added 'casting-gun-turret' to 'casting-light-ammo-tech'.")
  else
      log("Warning: Technology 'casting-light-ammo-tech' not found. Unable to add 'casting-gun-turret' recipe.")
  end
end
