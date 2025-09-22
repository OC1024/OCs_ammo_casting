
-- 1. Preparations: Edit all Tables
-- done in the OCs_base_assets mod

-- 2. Execute the Generator.
local casting_dict = {
    -- changed vanilla recipes
    ["kr-rifle-magazine"]  ="metallurgy", -- yellow ammo
    ["kr-armor-piercing-rifle-magazine"]  ="metallurgy", -- red ammo
    --  krastorio2 recipes
    ["kr-imersite-rounds-magazine"] = "metallurgy",
    ["kr-impulse-rifle-ammo"] = "metallurgy",
    ["kr-basic-railgun-shell"] = "metallurgy",
    ["kr-explosive-railgun-shell"] = "metallurgy",
    ["kr-antimatter-railgun-shell"] = "metallurgy",
    ["kr-nuclear-artillery-shell"] = "metallurgy",
    ["kr-antimatter-artillery-shell"] = "metallurgy",
    ["kr-advanced-tank"] = "metallurgy",

    -- rockets are a biochamber thing in my mod, but electronics is for the EMplant
    ["kr-nuclear-turret-rocket"] = "metallurgy",
    ["kr-explosive-turret-rocket"] = "metallurgy",
    ["kr-antimatter-rocket"] = "electromagnetics", -- does that even work?
    ["kr-antimatter-turret-rocket"] = "electromagnetics", -- does that even work?
    ["kr-heavy-rocket"] = "organic",
    ["kr-heavy-rocket-launcher"] = "organic",
}
batch_generator(casting_dict)

-- 3. Add Recipes to Techs
local recipe_tech_mapping = {
    -- vanilla additives
    ["casting-kr-rifle-magazine"]  ="casting-light-ammo-tech", -- yellow ammo
    ["casting-kr-armor-piercing-rifle-magazine"]  ="casting-light-ammo-tech", -- red ammo
    -- k2 specific
    ["casting-kr-basic-railgun-shell"] = "casting-railgun-ammo-tech",
    ["casting-kr-explosive-railgun-shell"] = "casting-railgun-ammo-tech",
    ["casting-kr-antimatter-railgun-shell"] = {"foundry"},
    ["casting-kr-antimatter-artillery-shell"] = {"casting-antimatter-ammo-tech"},
    ["casting-kr-advanced-tank"] = {"kr-advanced-tank"},
    ["casting-kr-antimatter-rocket"] = {"kr-railgun"},
}
add_recipe_unlocks(recipe_tech_mapping)

-- 4. Add new techs for this mod
-- [[
data:extend({
    { -- casting antimatter ammo
        type = "technology",
        name = "casting-antimatter-ammo-tech",
        icons =
        {
          {
            icon = "__Krastorio2Assets__/technologies/antimatter-ammo.png",
            icon_size = 256,
            -- icon_mipmaps = 4, -- could be 1
          },
          {
            icon = "__OCs_base_assets__/graphics/technology/overlayer-tech-molten-iron.png",
            icon_size = 256,
            icon_mipmaps = 4,
          }
        },
        prerequisites = {"kr-antimatter-ammo","casting-explosive-ammo-tech","casting-railgun-ammo-tech"},
        unit = {
          time = 60,
          count = 2000,
          ingredients = {
            { "military-science-pack", 2},
            { "production-science-pack", 1 },
            { "utility-science-pack", 1 },
            { "space-science-pack", 1 },
            { "kr-matter-tech-card", 1 },
            { "kr-advanced-tech-card", 1 },
            { "kr-singularity-tech-card", 1 },
            { "promethium-science-pack", 1 },
          },
        },
        effects = {
            { type = "unlock-recipe", recipe = "casting-kr-antimatter-turret-rocket" },
            { type = "unlock-recipe", recipe = "casting-kr-antimatter-artillery-shell" },
            { type = "unlock-recipe", recipe = "bio-kr-antimatter-rocket" },
            { type = "unlock-recipe", recipe = "casting-kr-antimatter-railgun-shell" },
        }
    },
    --[[
    { -- oc-kr-railgun
        type = "technology",
        name = "casting-kr-railgun-shells",
        icons = {
            {
                icon = "__Krastorio2Assets__/graphics/technology/railgun.png",
                icon_size = 256,
                icon_mipmaps = 4,
            },
            {
                icon = "__OCs_base_assets__/graphics/icons/overlayer-technology-casting.png",
                icon_size = 64,
                icon_mipmaps = 4,
            }
        },
        -- prerequisites = {"","kr-railgun"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "casting-kr-basic-railgun-shell"
            },
            {
                type = "unlock-recipe",
                recipe = "casting-kr-explosive-railgun-shell"
            },
        },
        unit = {
            time = 30,
            count = 150,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
            },
        },
    },
    -- ]]
    { -- oc-kr-heavy-rocket
        type = "technology",
        name = "casting-kr-heavy-rocket",
        icons = {
            {
                icon = "__Krastorio2Assets__/technology/heavy-rocketry.png",
                icon_size = 256,
                icon_mipmaps = 4,
            },
            {
                icon = "__OCs_base_assets__/graphics/icons/overlayer-tech-molten-iron.png",
                icon_size = 256,
                icon_mipmaps = 4,
            }
        },
        prerequisites = {"bio-rocketry-tech","kr-military-5"},
        unit = {
            time = 30,
            count = 100,
            ingredients = {
                {"chemical-science-pack", 1},
                {"military-science-pack", 2},
                {"utility-science-pack", 1},
                {"space-science-pack", 1},
                {"agricultural-science-pack", 2},
            },
        },
        effects = {
            {type = "unlock-recipe", recipe = "bio-kr-heavy-rocket"}, -- TODO make that happen
            {type = "unlock-recipe", recipe = "casting-kr-heavy-rocket-launcher"},
        },
    },
})
-- ]]