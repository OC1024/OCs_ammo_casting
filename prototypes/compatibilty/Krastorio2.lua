
replace_ingredient("tungsten-rounds-magazine","ammo", "piercing-rounds-magazine","ammo", "k2-armor-piercing-rifle-magazine", true)

-- 0. load API
local generator_api = require("__OCs_base_assets__.prototypes.utils.api")

-- 1. Preparations: Edit all Tables
local new_blacklist = {
    ["organic"] = {
        blacklist_item = {
            "rocket-fuel", -- this is used in the rocket turret ammo
        }
    }
}
generator_api.register_multi_item_blacklists(new_blacklist)

-- 2. Execute the Generator.
local casting_dict = {
    -- rifle ammo
    ["kr-rifle-magazine"]  ="metallurgy", -- yellow ammo
    ["kr-armor-piercing-rifle-magazine"]  ="metallurgy", -- red ammo
    ["kr-imersite-rifle-magazine"] = "metallurgy", -- pink ammo

    -- sniper ammo
    ["kr-anti-materiel-rifle-magazine"] = "metallurgy", -- yellow sniper ammo
    ["kr-armor-piercing-anti-materiel-rifle-magazine"] = "metallurgy", -- red sniper ammo
    ["kr-uranium-anti-materiel-rifle-magazine"] = "metallurgy", -- green sniper ammo
    ["kr-imersite-anti-materiel-rifle-magazine"] = "metallurgy", -- pink sniper ammo

    ["kr-impulse-rifle-ammo"] = "electromagnetics",

    -- heavy ammo
    ["kr-basic-railgun-shell"] = "metallurgy",
    ["kr-explosive-railgun-shell"] = "metallurgy",
    -- ["kr-nuclear-artillery-shell"] = "metallurgy", -- which tech?

    -- rockets are a biochamber thing in my mod, but electronics is for the EMplant
    ["kr-heavy-rocket"] = "organic",
    ["kr-explosive-turret-rocket"] = "organic",
    ["kr-nuclear-turret-rocket"] = "organic",

    -- antimatter ammo is to high-tech for any of the machines
    -- ["kr-antimatter-rocket"] = "electromagnetics",
    -- ["kr-antimatter-railgun-shell"] = "metallurgy",
    -- ["kr-antimatter-turret-rocket"] = "electromagnetics", -- does that even work?
    -- ["kr-antimatter-artillery-shell"] = "metallurgy",
}
if settings.startup["casting-weapons"].value then
    -- weapons
    casting_dict["kr-anti-materiel-rifle"] = "metallurgy"
    casting_dict["kr-impulse-rifle"] = "electromagnetics"
    casting_dict["kr-heavy-rocket-launcher"]= "electromagnetics"
    -- casting_dict["kr-advanced-tank"] = "metallurgy"
end
generator_api.batch_generator(casting_dict)

-- Add new techs for this mod
if settings.startup["allow-casting-explosive-ammo"].value and settings.startup["allow-casting-explosive-ammo"].value then
    data:extend({
        { -- kr-imersite and heavy rocket tech
            type = "technology",
            name = "casting-imersite-ammo-tech",
            icons = {
                {
                    icon = "__Krastorio2Assets__/technologies/military-5.png",
                    icon_size = 256,
                    icon_mipmaps = 4,
                },
                {
                    icon = "__OCs_base_assets__/graphics/technology/overlayer-tech-molten-iron.png",
                    icon_size = 256,
                    icon_mipmaps = 4,
                }
            },
            prerequisites = {"casting-heavy-ammo-tech","kr-military-5","casting-explosive-ammo-tech"},
            effects = {
                {type = "unlock-recipe", recipe = "casting-kr-imersite-rifle-magazine"}, -- pink rifle ammo
                {type = "unlock-recipe", recipe = "casting-kr-imersite-anti-materiel-rifle-magazine"}, -- pink sniper ammo
                {type = "unlock-recipe", recipe = "pulse-kr-impulse-rifle"}, -- impulse rifle
                {type = "unlock-recipe", recipe = "pulse-kr-impulse-rifle-ammo"}, -- impulse rifle ammo
                {type = "unlock-recipe", recipe = "bio-kr-heavy-rocket"},
            },
            unit = {
                time = 60,
                count = 500,
                ingredients = {
                    {"military-science-pack", 1},
                    {"space-science-pack", 1},
                    {"utility-science-pack", 1},
                    {"metallurgic-science-pack", 2},
                    {"electromagnetic-science-pack", 2},
                },
            },
        },
    })
end
--[[
if settings.startup["kr-antimatter-ammo"].value then
    data:extend({
        { -- oc antimatter ammo
            type = "technology",
            name = "oc-antimatter-ammo-tech",
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
            prerequisites = {"kr-antimatter-ammo","casting-explimersite-ammo-tech",},
            unit = {
            time = 60,
            count = 1000,
            ingredients = {
                { "military-science-pack", 2},
                { "production-science-pack", 1 },
                { "utility-science-pack", 1 },
                { "space-science-pack", 1 },
                { "kr-matter-tech-card", 2 },
                { "kr-advanced-tech-card", 1 },
                { "kr-singularity-tech-card", 1 },
                { "promethium-science-pack", 1 },
            },
            },
            effects = {
                { type = "unlock-recipe", recipe = "bio-kr-antimatter-turret-rocket" },
                { type = "unlock-recipe", recipe = "bio-kr-antimatter-artillery-shell" },
                { type = "unlock-recipe", recipe = "bio-kr-antimatter-rocket" },
                { type = "unlock-recipe", recipe = "casting-kr-antimatter-railgun-shell" },
            }
        },
    })
end
-- ]]

-- Add Recipes to Techs
local recipe_tech_mapping = {
    -- rifle ammo
    ["casting-kr-rifle-magazine"]  = {"casting-light-ammo-tech"}, -- yellow ammo
    ["casting-kr-armor-piercing-rifle-magazine"]  = {"casting-light-ammo-tech"}, -- red ammo
    -- ["kr-imersite-rounds-magazine"] = "metallurgy", -- pink ammo
    -- sniper rifle ammo
    ["casting-kr-anti-materiel-rifle-magazine"] = {"casting-light-ammo-tech"}, -- yellow sniper ammo
    ["casting-kr-armor-piercing-anti-materiel-rifle-magazine"] = {"casting-light-ammo-tech"}, -- red sniper ammo
    ["casting-kr-uranium-anti-materiel-rifle-magazine"] = {"casting-heavy-ammo-tech"}, -- green sniper ammo
    -- ["kr-imersite-anti-materiel-rifle-magazine"] = "casting-imersite-ammo-tech", -- pink sniper ammo
    -- ["pulse-kr-impulse-rifle-ammo"] = {"casting-imersite-ammo-tech"},

    -- railgun and artillery
    ["casting-kr-basic-railgun-shell"] = {"casting-railgun-ammo-tech"},
    ["casting-kr-explosive-railgun-shell"] = {"casting-railgun-ammo-tech"},
    -- ["kr-nuclear-artillery-shell"] = {"metallurgy"},
}
if settings.startup["casting-weapons"].value then
    -- weapons
    recipe_tech_mapping["casting-kr-anti-materiel-rifle"] = {"casting-light-ammo-tech"}
    recipe_tech_mapping["pulse-kr-heavy-rocket-launcher"] = {"casting-imersite-ammo-tech"}
    -- recipe_tech_mapping["casting-kr-advanced-tank"] = {"kr-advanced-tank"}
end
add_recipe_unlocks(recipe_tech_mapping)