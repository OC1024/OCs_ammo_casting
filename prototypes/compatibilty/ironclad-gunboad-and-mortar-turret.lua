--  load api
local generator_api = require("__OCs_base_assets__.prototypes.utils.api")
local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")
local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")

-- optional TODO: create new tungsten mortar dart/ tungsten shrapnel ammo

-- casting mortar
local casting_dict = {
    ["mortar-fire-bomb"] = "metallurgy",
    ["mortar-poison-bomb"] = "metallurgy",
}
if settings.startup["casting-weapons"].value then
    casting_dict["ironclad-gunboat"] = "metallurgy"
    casting_dict["mortar-turret"] = "metallurgy"
end
generator_api.batch_generator(casting_dict)

-- creating new mortat techs
data:extend({
    { -- chemical mortar ammo
        type = "technology",
        name = "casting-chemical-mortar-ammo-tech",
        icons = {
            {
                icon = "__ironclad-gunboat-and-mortar-turret-fork__/graphics/icons/mortar-turret.png",
                icon_size = 256,
                icon_mipmaps = 4,
            },
            {
                icon = "__OCs_base_assets__/graphics/technology/overlayer-tech-molten-iron.png",
                icon_size = 256,
                icon_mipmaps = 4,
            }
        },
        prerequisites = { "casting-basic-mortar-ammo-tech", "military-4", "ironclad" },
        unit = {
            ingredients = {
                { "automation-science-pack",  1 },
                { "logistic-science-pack",    1 },
                { "military-science-pack",    2 },
                { "chemical-science-pack",    2 },
                { "space-science-pack",       1 }, -- removed if earler
                { "metallurgic-science-pack", 2 }, -- removed if earler
            },
            time = 30,
            count = 150
        },
        effects = {
            { type = "unlock-recipe", recipe = "oc-casting-mortar-fire-bomb" },
            { type = "unlock-recipe", recipe = "oc-casting-mortar-poison-bomb" },
            { type = "unlock-recipe", recipe = "oc-casting-mortar-cluster-bomb" }, -- require military-4, else military-2 is sufficient.
        },
    },
})
-- changing (ironclad) mod tech
local removing_prereq_dict = {
    ["oc-casting-basic-mortar-ammo-tech"] = { "ironclad" }, -- decouple mortar from ironclad
}
oc_tech.remove_prerequisites(removing_prereq_dict)
local adding_prereq_dict = {
    -- would need "military-4" for the clusterbomb. maybe moving the clusterbomb to the casting-explosive-ammo-tech
    ["oc-casting-basic-mortar-ammo-tech"] = { "mortar-turret", "military-3" },
    ["oc-casting-explosive-ammo-tech"] = { "oc-casting-chemical-mortar-ammo-tech" },
}
oc_tech.add_prerequisites(adding_prereq_dict)

-- remove recipe from techs
oc_tech.remove_recipe_unlocks({
    { ["oc-casting-mortar-cluster-bomb"] = "casting-basic-mortar-ammo-tech" }
})

-- add recipes to technology
local mapping = {
    -- ["mortar-slowdown-bomb"] = "metallurgy",
    -- ["casting-mortar-poison-bomb"] = "metallurgy",
    -- weapons (if present)
    ["oc-casting-ironclad-gunboat"] = "ironclad-gunboat",
    ["oc-casting-mortar-turret"] = "mortar-turret",
}
oc_tech.add_recipe_unlocks(mapping)
-- TODO: create new techs or reordering them slightly to make the mortar ammor still midgame (midgame+vulcanus) available
-- Note: keep Any_planet in mind such that a vulcanus run feels even better.
-- Note: Mortar still shall be midgame (even on vuclanus start)

-- move to subgroup
local mapping = {
    -- mortar turret
    ["mortar-fire-bomb"] = "mortar-ammo",
    ["mortar-poison-bomb"] = "mortar-ammo",
}
oc_recipe.change_recipes_subgroup(mapping)
