
-- 1. Preparations: Edit all Tables
-- done in the OCs_base_assets mod

-- 2. Execute the Generator.
local casting_dict = {
    ["kr-imersite-rounds-magazine"] = "metallurgy",
    ["kr-impulse-rifle-ammo"] = "metallurgy",
    ["kr-basic-railgun-shell"] = "metallurgy",
    ["kr-antimatter-railgun-shell"] = "metallurgy",
    ["kr-nuclear-artillery-shell"] = "metallurgy",
    ["kr-antimatter-artillery-shell"] = "metallurgy",
    ["kr-advanced-tank"] = "metallurgy",
    
    -- rockets are a biochamber thing in my mod, but electronics is for the EMplant
    ["kr-nuclear-turret-rocket"] = "metallurgy",
    ["kr-explosive-railgun-shell"] = "metallurgy",
    ["kr-explosive-turret-rocket"] = "metallurgy",
    ["kr-antimatter-rocket"] = "electromagnetics", -- does that even work?
    ["kr-antimatter-turret-rocket"] = "electromagnetics", -- does that even work?
    ["kr-heavy-rocket"] = "metallurgy",
    ["kr-heavy-rocket-launcher"] = "metallurgy",
}
batch_generator(casting_dict)

-- 3. Add Recipes to Techs
local recipe_tech_mapping = {
    ["casting-kr-antimatter-artillery-shell"] = {"foundry"}, -- or for free
    ["casting-kr-antimatter-railgun-shell"] = {"foundry"}, -- or for the auto-core tech
    ["casting-kr-advanced-tank"] = {"kr-advanced-tank"},
    ["casting-kr-antimatter-rocket"] = {"kr-railgun"},
}
add_recipe_unlocks(recipe_tech_mapping)

-- 4. Add new techs for this mod
-- data:extend({
--     -- { -- oc-kr-railgun
--     --     type = "technology",
--     --     name = "casting-kr-railgun-shells",
--     --     icons = {
--     --         {
--     --             icon = "__Krastorio2Assets__/graphics/technology/railgun.png",
--     --             icon_size = 256,
--     --             icon_mipmaps = 4,
--     --         },
--     --         {
--     --             icon = "__OCs_base_assets__/graphics/icons/overlayer-technology-casting.png",
--     --             icon_size = 64,
--     --             icon_mipmaps = 4,
--     --         }
--     --     },
--     --     -- prerequisites = {"","kr-railgun"},
--     --     effects = {
--     --         {
--     --             type = "unlock-recipe",
--     --             recipe = "casting-kr-basic-railgun-shell"
--     --         },
--     --         {
--     --             type = "unlock-recipe",
--     --             recipe = "casting-kr-explosive-railgun-shell"
--     --         },
--     --     },
--     --     unit = {
--     --         time = 30,
--     --         count = 150,
--     --         ingredients = {
--     --             {"automation-science-pack", 1},
--     --             {"logistic-science-pack", 1},
--     --             {"chemical-science-pack", 1},
--     --         },
--     --     },
--     -- },
--     { -- oc-kr-heavy-rocket
--         type = "technology",
--         name = "casting-kr-heavy-rocket",
--         icons = {
--             {
--                 icon = "__Krastorio2Assets__/technology/heavy-rocketry.png",
--                 icon_size = 256,
--                 icon_mipmaps = 4,
--             },
--             {
--                 icon = "__OCs_base_assets__/graphics/icons/overlayer-tech-molten-iron.png",
--                 icon_size = 256,
--                 icon_mipmaps = 4,
--             }
--         },
--         -- prerequisites = {"bio-rocketry-tech","kr-heavy-rocket-launcher"},
--         effects = {
--             {type = "unlock-recipe", recipe = "casting-kr-heavy-rocket"},
--             {type = "unlock-recipe", recipe = "casting-kr-heavy-rocket-launcher"},
--         },
--         unit = {
--             time = 30,
--             count = 150,
--             ingredients = {
--                 {"automation-science-pack", 1},
--                 {"logistic-science-pack", 1},
--                 {"chemical-science-pack", 1},
--             },
--         },
--     },
-- })