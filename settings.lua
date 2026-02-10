data:extend({
    {
        type = "bool-setting",
        name = "casting-weapons",
        setting_type = "startup",
        default_value = true,
        order = "a",
    },
    {
        type = "bool-setting",
        name = "allow-casting-explosive-ammo",
        setting_type = "startup",
        default_value = true,
        order = "b-b",
    },
    {
        type = "bool-setting",
        name = "heavy-artillery-shells",
        setting_type = "startup",
        default_value = false,
        order = "b-c",
    },
    { -- crafting explosives and rockets in biochamber
        type = "bool-setting",
        name = "allow-bio-explosives",
        setting_type = "startup",
        default_value = true,
        order = "c-a",
    },
    { -- space fish breeding
        type = "bool-setting",
        name = "space-fish",
        setting_type = "startup",
        default_value = true,
        order = "c-b",
    },
    {
        type = "bool-setting",
        name = "armour-plating",
        setting_type = "startup",
        default_value = true,
        order = "d"
    },
    {
        type = "bool-setting",
        name = "tungsten-steel-ammo",
        setting_type = "startup",
        default_value = false,
        order = "e-a"
    },
    { -- vanilla nuclear rockets and key setting for fusion, anitmatter, ...
        type = "bool-setting",
        name = "nuclear-ammo",
        setting_type = "startup",
        default_value = true,
        order = "f-a"
    },
    { -- [K2SO: antimatter ammo]
        type = "bool-setting",
        name = "antimatter-ammo",
        setting_type = "startup",
        default_value = false,
        order = "f-b"
    }
})