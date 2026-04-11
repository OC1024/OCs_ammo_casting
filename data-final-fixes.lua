local oc_helper = require("__OCs_base_assets__.prototypes.utils.helper")

-- fixes what K2 breaks in their final-fixes
if mods["Krastorio2-spaced-out"] then -- replaces normal Krastorio2 with space-age compatible version
    oc_helper.replace_ingredient("tungsten-rounds-magazine", "ammo", "piercing-rounds-magazine", "ammo",
    "k2-armor-piercing-rifle-magazine", true)
end

-- fix "mortar-cluster-bomb" technology missing prerequisite (its defined in the data-fina-fixes stage)
if mods["ironclad-gunboad-and-mortar-turret"] then
    local adding_prereq_dict = {
        ["casting-chemical-mortar-ammo-tech"] = { "mortar-cluster-bomb"}, -- fire bomb already added in data-update stage
    }
    oc_helper.add_prerequisites(adding_prereq_dict)
end