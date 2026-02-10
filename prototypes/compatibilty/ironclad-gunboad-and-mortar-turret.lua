--  load api
local generator_api = require("__OCs_base_assets__.prototypes.utils.api")

-- optional TODO: create new tungsten mortar dart/ tungsten shrapnel ammo

-- casting mortar
local casting_dict = {
    ["mortar-fire-bomb"] = "metallurgy",
    ["mortar-poison-bomb"] = "metallurgy",
}
generator_api.batch_generator(casting_dict)

if settings.startup["casting-weapons"].value then
    local casting_weapons_dict = {
        ["ironclad-gunboat"] = "metallurgy",
        ["mortar-turret"] = "metallurgy",
    }
    generator_api.batch_generator(casting_weapons_dict)
end

-- creating new mortat techs
data:extend({
    { -- bio-chemical mortar ammo
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
        prerequisites = { "casting-basic-mortar-ammo-tech", "military-3", "ironclad" },
        unit = {
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack",   1 },
                { "military-science-pack",   2 },
                { "chemical-science-pack",   2 },
                -- {"metallurgic-science-pack", 2},
            },
            time = 30,
            count = 150
        },
        effects = {
            { type = "unlock-recipe", recipe = "casting-mortar-fire-bomb" },
            { type = "unlock-recipe", recipe = "casting-mortar-poison-bomb" },
        },
    },
})
-- changing (ironclad) mod tech
local removing_prereq_dict = {
    ["casting-basic-mortar-ammo-tech"] = { "ironclad" }, -- decouple mortar from ironclad
}
remove_prerequisites(removing_prereq_dict)
local adding_prereq_dict = {
    -- would need "military-4" for the clusterbomb. maybe moving the clusterbomb to the casting-explosive-ammo-tech
    ["casting-basic-mortar-ammo-tech"] = { "mortar-turret"},
    ["casting-explosive-ammo-tech"] = {"casting-chemical-mortar-ammo-tech"},
}
add_prerequisites(adding_prereq_dict)


-- add recipes to technology
local mapping = {
    ["mortar-slowdown-bomb"] = "metallurgy",
    ["mortar-poison-bomb"] = "metallurgy",
    -- weapons (if present)
    ["casting-ironclad-gunboat"] = "ironclad-gunboat",
    ["casting-mortar-turret"] = "mortar-turret",
}
add_recipe_unlocks(mapping)
-- TODO: create new techs or reordering them slightly to make the mortar ammor still midgame (midgame+vulcanus) available
-- Note: keep Any_planet in mind such that a vulcanus run feels even better.
-- Note: Mortar still shall be midgame (even on vuclanus start)

-- move to subgroup
local mapping = {
    -- mortar turret
    ["mortar-fire-bomb"] = "mortar-ammo",
    ["mortar-poison-bomb"] = "mortar-ammo",
}
change_recipes_subgroup(mapping)
