data:extend({
    {
        type = "item-subgroup",
        name = "alternative-ammo",
        group = "combat",
        order = "b-b",
    },
})
if settings.startup["armour-plating"].value then
    data:extend({
        {
            type = "item-subgroup",
            name = "armour-plating",
            group = "combat",
            order = "g-a",
        },
    })
end
