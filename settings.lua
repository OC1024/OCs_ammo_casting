data:extend({
    {
        type = "bool-setting",
        name = "allow-casting-gun-turrets",
        setting_type = "startup",
        default_value = true,
        order = "a",
    },
    -- {
    --     type = "bool-setting",
    --     name = "allow-tungsten-ammo",
    --     setting_type = "startup",
    --     default_value = true,
    --     order = "b-a",
    -- },
    {
        type = "bool-setting",
        name = "allow-casting-explosive-ammo", -- now includes heavy artillery
        setting_type = "startup",
        default_value = true,
        order = "b-b",
    },
    -- {
    --     type = "bool-setting",
    --     name = "allow-heavy-artillery-shell",
    --     setting_type = "startup",
    --     default_value = true,
    --     order = "b-c",
    -- },
    {
        type = "bool-setting",
        name = "allow-bio-explosives", -- crafting explosives and rockets in biochamber
        setting_type = "startup",
        default_value = true,
        order = "c-a",
    },
    {
        type = "bool-setting",
        name = "space-fish", -- space fish breeding
        setting_type = "startup",
        default_value = false,
        order = "c-b",
    },
})