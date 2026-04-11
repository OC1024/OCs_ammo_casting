--  load api
local generator_api = require("__OCs_base_assets__.prototypes.utils.api")
local oc_helper = require("__OCs_base_assets__.prototypes.utils.helper")

-- optional TODO: create new tungsten mortar dart/ tungsten shrapnel ammo

-- casting mortar
local casting_dict = {
    -- casting
    -- ["mortar-cluster-bomb"] = "metallurgy", -- basic
    ["mortar-shrapnel-ammo"] = "metallurgy", -- basic
    ["mortar-heavy-ammo"] = "metallurgy",    -- heavy ammo
    ["mortar-fire-ammo"] = "metallurgy",     -- chemical (see gunboat-compat file)
    -- bio/chemical
    ["mortar-slowdown-ammo"] = "organic",
    ["mortar-poison-bomb"] = "organic", -- overwrite gunboat-compat file
    ["mortar-illumination-ammo"] = "organic",
    ["mortar-hypnosis-ammo"] = "organic",
    -- electromagnetics
    ["mortar-energy-ammo"] = "electromagnetics",
    ["mortar-defender-robot-ammo"] = "electromagnetics",
    ["mortar-distractor-robot-ammo"] = "electromagnetics",
    ["mortar-destroyer-robot-ammo"] = "electromagnetics",
    ["mortar-lure-robot-ammo"] = "electromagnetics",
    -- nuclear
    ["mortar-light-nuclear-ammo"] = "cryogenics",
}
if settings.startup["casting-weapons"].value then
    casting_dict["heavy-mortar-turret"] = "metallurgy"
end
generator_api.batch_generator(casting_dict)

data.raw.recipe["casting-mortar-poison-bomb"].hidden = true -- overwrite old casting version in favor of the bio one.

-- creating new mortat techs
data:extend({
    { -- bio/chemical mortar ammo
        type = "technology",
        name = "biochemical-mortar-ammo-tech",
        icons = {
            {
                icon = "__strategy-mortar-turret__/graphics/icons/mortar-hypnosis-ammo.png",
                icon_size = 64,
                icon_mipmaps = 1, --sadly
            },
            {
                icon = "__OCs_base_assets__/graphics/technology/overlayer-tech-biochamber.png",
                icon_size = 256,
                icon_mipmaps = 4,
            }
        },
        prerequisites = {
            "biochamber", -- crafting building
            -- "casting-basic-mortar-ammo-tech", -- continuation of chemical ammo
            -- "mortar-slowdown-ammo",
            -- "mortar-poison-bomb",
            -- "mortar-illumination-ammo",
            -- "mortar-hypnosis-ammo",
        },
        unit = {
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack",   1 },
                { "military-science-pack",   2 },
                { "chemical-science-pack",   2 },
                { "production-science-pack", 1 },
                -- {"agricultural-science-pack", 2},
            },
            time = 30,
            count = 200
        },
        effects = {
            -- { type = "unlock-recipe", recipe = "bio-mortar-slowdown-ammo" },
            -- { type = "unlock-recipe", recipe = "bio-mortar-poison-bomb" },
            -- { type = "unlock-recipe", recipe = "bio-mortar-illumination-ammo" },
            -- { type = "unlock-recipe", recipe = "bio-mortar-hypnosis-ammo" },
        },
    },
    { -- robot mortar ammo
        type = "technology",
        name = "pulse-mortar-ammo-tech",
        icons = {
            {
                icon = "__strategy-mortar-turret__/graphics/icons/mortar-destroyer-ammo.png",
                icon_size = 64,
                icon_mipmaps = 1, --sadly
            },
            {
                icon = "__OCs_base_assets__/graphics/technology/overlayer-tech-em-plant.png",
                icon_size = 256,
                icon_mipmaps = 4,
            }
        },
        prerequisites = {
            "electromagnetic-plant", -- crafting building
            "mortar-turret",         -- its okay if it does not require the foundry-path
            -- "mortar-energy-ammo",
            -- "mortar-defender-robot-ammo",
            -- "mortar-distractor-robot-ammo",
            -- "mortar-destroyer-robot-ammo",
            -- "mortar-lure-robot-ammo",
        },
        unit = {
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack",   1 },
                { "military-science-pack",   2 },
                { "chemical-science-pack",   2 },
                { "utility-science-pack",    1 },
                -- {"electromagnetic-science-pack", 2},
            },
            time = 30,
            count = 200
        },
        effects = {
            -- { type = "unlock-recipe", recipe = "pulse-mortar-energy-ammo" },
            -- { type = "unlock-recipe", recipe = "pulse-mortar-defender-robot-ammo" },
            -- { type = "unlock-recipe", recipe = "pulse-mortar-distractor-robot-ammo" },
            -- { type = "unlock-recipe", recipe = "pulse-mortar-destroyer-robot-ammo" },
            -- { type = "unlock-recipe", recipe = "pulse-mortar-lure-robot-ammo" },
        },
    },
})

-- biochemical mortar ammo
local biochemical_req = {
    ["biochemical-mortar-ammo-tech"] =
    {
        "casting-basic-mortar-ammo-tech", -- continuation of chemical ammo
        "mortar-slowdown-ammo",
        "mortar-poison-bomb",
        "mortar-illumination-ammo",
        "mortar-hypnosis-ammo",
    }
}
oc_helper.add_prerequisites(biochemical_req)

local biochemical_ammo = {
    ["bio-mortar-slowdown-ammo"] = "biochemical-mortar-ammo-tech",
    ["bio-mortar-poison-bomb"] = "biochemical-mortar-ammo-tech",
    ["bio-mortar-illumination-ammo"] = "biochemical-mortar-ammo-tech",
    ["bio-mortar-hypnosis-ammo"] = "biochemical-mortar-ammo-tech",
}
oc_helper.add_recipe_unlocks(biochemical_ammo)

-- robot mortar ammo
local robot_req = {
    ["pulse-mortar-ammo-tech"] = {
        "mortar-energy-ammo",
        "mortar-defender-robot-ammo",
        "mortar-distractor-robot-ammo",
        "mortar-destroyer-robot-ammo",
        "mortar-lure-robot-ammo",
    }
}
oc_helper.add_prerequisites(robot_req)
local robot_ammo = {
    ["pulse-mortar-energy-ammo"] = "pulse-mortar-ammo-tech",
    ["pulse-mortar-defender-robot-ammo"] = "pulse-mortar-ammo-tech",
    ["pulse-mortar-distractor-robot-ammo"] = "pulse-mortar-ammo-tech",
    ["pulse-mortar-destroyer-robot-ammo"] = "pulse-mortar-ammo-tech",
    ["pulse-mortar-lure-robot-ammo"] = "pulse-mortar-ammo-tech",
}
oc_helper.add_recipe_unlocks(robot_ammo)

-- add prerequisites
local adding_prereq_dict = {
    ["casting-heavy-ammo-tech"] = { "casting-basic-mortar-ammo-tech", "mortar-heavy-ammo" },                                -- because heavy mortar ammo
    ["nuclear-ammo-tech"] = { "casting-chemical-mortar-ammo-tech", "pulse-mortar-ammo-tech", "mortar-light-nuclear-ammo" }, -- requires all of my techs
    ["casting-chemical-mortar-ammo-tech"] = { "mortar-cluster-bomb", "mortar-fire-bomb" },
}
oc_helper.add_prerequisites(adding_prereq_dict)

-- remove old unlocks
local old_unlocks = {
    ["casting-mortar-poison-bomb"]  = { "casting-chemical-mortar-ammo-tech" }, -- added in the gunboat-compat file, moved to the new bio-chemical tech
    ["casting-mortar-cluster-bomb"] = { "casting-basic-mortar-ammo-tech" },    -- added in the aai-ironclad-compat file, replaced by shrapnel ammo
}
oc_helper.remove_recipe_unlocks(old_unlocks)

-- add recipe unlocks to technology
local mapping = {
    ["casting-mortar-cluster-bomb"] = "casting-chemical-mortar-ammo-tech",
    ["casting-mortar-shrapnel-ammo"] = "casting-basic-mortar-ammo-tech", -- replaces the now stronger cluster-bomb
    ["casting-mortar-fire-ammo"] = "casting-chemical-ammo-tech",
    ["casting-mortar-heavy-ammo"] = "casting-heavy-ammo-tech",
    ["cryo-mortar-light-nuclear-ammo"] = "nuclear-ammo-tech",
    -- weapons (if present)
    ["casting-heavy-mortar-turret"] = "heavy-mortar-turret",
}
oc_helper.add_recipe_unlocks(mapping)


-- move to subgroup
local mapping = {
    ["casting-mortar-shrapnel-ammo"] = "mortar-ammo",
    ["mortar-illumination-bomb"] = "mortar-ammo",
    ["mortar-fire-ammo"] = "mortar-ammo",
    ["pulse-mortar-energy-ammo"] = "mortar-ammo",
    ["casting-mortar-heavy-ammo"] = "mortar-ammo",
    ["cryo-mortar-light-nuclear-ammo"] = "mortar-ammo",
}
oc_helper.change_recipes_subgroup(mapping)
