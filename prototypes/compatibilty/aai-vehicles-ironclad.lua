--  load api
local generator_api = require("__OCs_base_assets__.prototypes.utils.api")
local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")
local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")

-- optional TODO: create new tungsten mortar dart/ tungsten shrapnel ammo

-- casting mortar
local casting_dict = {
    ["mortar-bomb"] = "metallurgy",
    ["mortar-cluster-bomb"] = "metallurgy",
}
if settings.startup["casting-weapons"].value then
    casting_dict["ironclad"] = "metallurgy"
end
generator_api.batch_generator(casting_dict)

data:extend({
    { -- casting basic mortar ammo tech
        type = "technology",
        name = "casting-basic-mortar-ammo-tech",
        icons = {
            {
                icon = "__aai-vehicles-ironclad__/graphics/technology/ironclad.png",
                icon_size = 256,
                icon_mipmaps = 4,
            },
            {
                icon = "__OCs_base_assets__/graphics/technology/overlayer-tech-molten-iron.png",
                icon_size = 256,
                icon_mipmaps = 4,
            }
        },
        prerequisites = { "foundry", "ironclad", "space-science-pack", "metallurgic-science-pack" }, -- early as possible
        unit = {
            ingredients = {
                { "automation-science-pack",  1 },
                { "logistic-science-pack",    1 },
                { "military-science-pack",    2 },
                { "space-science-pack",       1 }, -- removed if earlier
                { "metallurgic-science-pack", 2 }, -- removed if earlier
            },
            time = 30,
            count = 100
        },
        effects = {
            { type = "unlock-recipe", recipe = "oc-casting-mortar-bomb" },
            { type = "unlock-recipe", recipe = "oc-casting-mortar-cluster-bomb" },
        },
    },
})
local adding_prereq_dict = {
    ["casting-explosive-ammo-tech"] = { "casting-basic-mortar-ammo-tech" },
}
oc_tech.add_prerequisites(adding_prereq_dict)

local recipe_unlock_mapping = {
    ["oc-casting-ironclad"] = "ironclad", -- if "casting weapons" is enabled
}
oc_tech.add_recipe_unlocks(recipe_unlock_mapping)

-- move to subgroup
data:extend({
    {
        type = "item-subgroup",
        name = "mortar-ammo",
        group = "combat",
        -- order = "g-a", -- TODO
    },
})
local mapping = {
    ["mortar-bomb"] = "mortar-ammo",
    ["mortar-cluster-bomb"] = "mortar-ammo",
    ["casting-mortar-bomb"] = "mortar-ammo",
    ["casting-mortar-cluster-bomb"] = "mortar-ammo",
}
oc_recipe.change_recipes_subgroup(mapping)
