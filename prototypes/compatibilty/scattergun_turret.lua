if data.raw["ammo"]["tungsten-cannon-shell"] and data.raw["projectile"]["tungsten-cannon-projectile"] then
    data.raw["ammo"]["tungsten-cannon-shell"].ammo_type.range_modifier = 1.375 -- such that it is still better but just half of the bonus added
    data.raw["ammo"]["tungsten-cannon-shell"].ammo_type.target_type = "position"
    data.raw["ammo"]["tungsten-cannon-shell"].ammo_type.action.action_delivery.max_range = 90
    data.raw["ammo"]["tungsten-cannon-shell"].ammo_type.action.action_delivery.direction_deviation = nil
    data.raw["ammo"]["tungsten-cannon-shell"].ammo_type.action.action_delivery.range_deviation = nil
    log("Removed the maximal ranges of tungsten cannon ammo to be usable with the Modular Turred Mod turrets.")
    data.raw["projectile"]["tungsten-cannon-projectile"].force_condition = "not-same"
    data.raw["projectile"]["tungsten-cannon-projectile"].direction_only = false
    data.raw["projectile"]["tungsten-cannon-projectile"].hit_collision_mask = {layers={object=true, player=true, train=true, trigger_target=true}}
    -- log(serpent.block(data.raw["ammo"]["tungsten-cannon-shell"]))
    -- log(serpent.block(data.raw["projectile"]["tungsten-cannon-projectile"]))
end
if data.raw["ammo"]["tungsten-shotgun-shell"] and data.raw["projectile"]["explosive-uranium-cannon-projectile"] then
    data.raw["ammo"]["tungsten-shotgun-shell"].ammo_type.target_type = "position"
end

-- Check for the scattergun_turret mod and add the adjacent recipes if it exists
-- recipes
data:extend({
    { -- casting uranium shotgun shell
    type = "recipe",
    name = "casting-uranium-shotgun-shell",
    icons =
    {
        {
        icon = "__OCs_ammo_casting__/graphics/icons/uranium-shotgun-shell.png",
        icon_size = 64,
        icon_mipmaps = 4,
        },
        {
        icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-molten-iron.png",
        icon_size = 64,
        icon_mipmaps = 4,
        }
    },
    category = "metallurgy",
    group = "combat",
    subgroup = "alternative-ammo",
    enabled = false,
    energy_required = 12,
    ingredients =
    {
        {type="fluid", name="molten-iron", amount=120}, -- 1 piercing-shogun-shell = 9iron + 2steel + 4copper
        {type="fluid", name="molten-copper", amount=40},
        {type="item", name="uranium-238", amount=1}
    },
    results = {{type="item", name="w93-uranium-shotgun-shell", amount=1}},
    allow_productivity = false,
    },
    { -- casting fragmentation shell
    type = "recipe",
    name = "casting-fragmentation-shell",
    icons =
    {
        {
        icon = "__scattergun_turret__/graphics/icons/fragmentation-cannon-shell.png",
        icon_size = 64,
        icon_mipmaps = 4,
        },
        {
        icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-molten-iron.png",
        icon_size = 64,
        icon_mipmaps = 4,
        }
    },
    category = "metallurgy",
    group = "combat",
    subgroup = "alternative-ammo",
    enabled = false,
    energy_required = 8,
    ingredients = {
        {type="fluid", name="molten-iron", amount=100}, --  30*2 steel + 5*8 iron stick
        {type="item", name="explosives", amount=1}
    },
    results = {{type="item", name="w93-fragmentation-cannon-shell", amount=2}},
    allow_productivity = false,
    },
})

-- technology
local mapping = {
    ["casting-fragmentation-shell"] = {"casting-light-ammo-tech"},
    ["casting-uranium-shotgun-shell"] = {"casting-heavy-ammo-tech"},
}
add_recipe_unlocks(mapping)