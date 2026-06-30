local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")
local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")

-- fixes what K2 breaks in their final-fixes
if mods["Krastorio2-spaced-out"] then -- replaces normal Krastorio2 with space-age compatible version
    oc_recipe.replace_ingredient("tungsten-rounds-magazine", "ammo", "piercing-rounds-magazine", "ammo",
    "k2-armor-piercing-rifle-magazine", true)
end

-- fix "mortar-cluster-bomb" technology missing prerequisite (its defined in the data-fina-fixes stage)
if mods["ironclad-gunboad-and-mortar-turret"] then
    local adding_prereq_dict = {
        ["oc-casting-chemical-mortar-ammo-tech"] = { "mortar-cluster-bomb"}, -- fire bomb already added in data-update stage
    }
    oc_tech.add_prerequisites(adding_prereq_dict)
end