data:extend({ -- standard ammo techs of this mod
  { -- casting light ammo (red&yellow ammo)
    type = "technology",
    name = "casting-light-ammo-tech",
    icon = "__OCs_ammo_casting__/graphics/technologies/casting-light-ammo-tech.png",
    icon_size = 256,  icon_mipmaps = 4,
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
    icon = "__OCs_ammo_casting__/graphics/technologies/casting-heavy-ammo-tech.png",
    icon_size = 256,  icon_mipmaps = 4,
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
     order = "ab"
  },
  { -- casting tungsten ammo
    type = "technology",
    name = "casting-tungsten-ammo-tech",
    icon = "__OCs_ammo_casting__/graphics/technologies/casting-tungsten-ammo-tech.png",
    icon_size = 256, icon_mipmaps = 4,
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
    --  order = "aba"
  },
  { -- casting railgung ammo
    type = "technology",
    name = "casting-railgun-ammo-tech",
    icon = "__OCs_ammo_casting__/graphics/technologies/casting-railgun-tech-1.png",
    icon_size = 256, icon_mipmaps = 4,
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
  { -- casting explosive ammo
    type = "technology",
    name = "casting-explosive-ammo-tech",
    icon = "__OCs_ammo_casting__/graphics/technologies/casting-explosives-tech.png",
    icon_size = 256,  icon_mipmaps = 4,
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
