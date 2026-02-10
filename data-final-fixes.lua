-- fixes what K2 breaks in their final-fixes
if mods["Krastorio2-spaced-out"] then -- replaces normal Krastorio2 with space-age compatible version
    replace_ingredient("tungsten-rounds-magazine", "ammo", "piercing-rounds-magazine", "ammo",
    "k2-armor-piercing-rifle-magazine", true)
end

-- fix "mortar-cluster-bomb" technology missing prerequisite (its defined in the data-fina-fixes stage)
local adding_prereq_dict = {
    ["casting-chemical-mortar-ammo-tech"] = { "mortar-cluster-bomb"}, -- fire bomb already added in data-update stage
}
add_prerequisites(adding_prereq_dict)