
local casting_dict = {
    -- vanilla casting
    ["firearm-magazine"] = "metallurgy",
    ["piercing-rounds-magazine"] = "metallurgy",
    ["uranium-rounds-magazine"]  = "metallurgy",
    ["shotgun-shell"] = "metallurgy",
    ["piercing-shotgun-shell"] = "metallurgy",
    ["cannon-shell"] = "metallurgy",
    ["uranium-cannon-shell"] = "metallurgy",
    ["railgun-ammo"]  = "metallurgy",
    ["gun-turret"] = "metallurgy",
    -- casting tungsten ammo
    ["tungsten-rounds-magazine"] = "metallurgy",
    ["tungsten-shotgun-shell"] = "metallurgy",
    ["tungsten-cannon-shell"] = "metallurgy",
    ["tungsten-railgun-ammo"] = "metallurgy",
    -- casting armour plating
    ["light-armour-plating"]  = "metallurgy",
}
batch_generator(casting_dict)

local mapping = {
-- base ammo
    ["casting-firearm-magazine"] = "alternative-ammo",
    ["casting-piercing-rounds-magazine"] = "alternative-ammo",
    ["casting-uranium-rounds-magazine"] = "alternative-ammo",
    ["casting-tungsten-rounds-magazine"] = "alternative-ammo",
    ["casting-shotgun-shell"] = "alternative-ammo",
    ["casting-piercing-shotgun-shell"] = "alternative-ammo",
    ["casting-cannon-shell"] = "alternative-ammo",
    ["casting-uranium-cannon-shell"] = "alternative-ammo",
    ["casting-tungsten-cannon-shell"] = "alternative-ammo",
    ["casting-tungsten-shotgun-shell"] = "alternative-ammo",
    ["casting-railgun-ammo"] = "alternative-ammo",
    ["casting-tungsten-railgun-ammo"] = "alternative-ammo",
}
set_recipes_subgroup_mapped(mapping)