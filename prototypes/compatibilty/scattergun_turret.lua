--  load api
local generator_api = require("__OCs_base_assets__.prototypes.utils.api")

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

-- recipes
-- data:extend({
--     { -- casting uranium shotgun shell
--     type = "recipe",
--     name = "casting-uranium-shotgun-shell",
--     icons =
--     {
--         {
--         icon = "__OCs_ammo_casting__/graphics/icons/uranium-shotgun-shell.png",
--         icon_size = 64,
--         icon_mipmaps = 4,
--         },
--         {
--         icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-molten-iron.png",
--         icon_size = 64,
--         icon_mipmaps = 4,
--         }
--     },
--     category = "metallurgy",
--     group = "combat",
--     subgroup = "alternative-ammo",
--     enabled = false,
--     energy_required = 12,
--     ingredients =
--     {
--         {type="fluid", name="molten-iron", amount=120}, -- 1 piercing-shogun-shell = 9iron + 2steel + 4copper
--         {type="fluid", name="molten-copper", amount=40},
--         {type="item", name="uranium-238", amount=1}
--     },
--     results = {{type="item", name="w93-uranium-shotgun-shell", amount=1}},
--     allow_productivity = false,
--     },
--     { -- casting fragmentation shell
--     type = "recipe",
--     name = "casting-fragmentation-shell",
--     icons =
--     {
--         {
--         icon = "__scattergun_turret__/graphics/icons/fragmentation-cannon-shell.png",
--         icon_size = 64,
--         icon_mipmaps = 4,
--         },
--         {
--         icon = "__OCs_base_assets__/graphics/icons/overlayer-recipe-molten-iron.png",
--         icon_size = 64,
--         icon_mipmaps = 4,
--         }
--     },
--     category = "metallurgy",
--     group = "combat",
--     subgroup = "alternative-ammo",
--     enabled = false,
--     energy_required = 8,
--     ingredients = {
--         {type = "fluid", name = "molten-iron", amount = 100}, --  30*2 steel + 5*8 iron stick
--         {type = "item", name = "explosives", amount = 1}
--     },
--     results = {{type="item", name="w93-fragmentation-cannon-shell", amount=2}},
--     allow_productivity = false,
--     },
-- })

-- casting scattergun_turret stuff
local casting_dict = {
    ["w93-fragmentation-cannon-shell"] = "metallurgy",
    ["w93-uranium-shotgun-shell"] = "metallurgy", -- create my own instead?
    ["w93-slowdown-magazine"] = "metallurgy",
    ["w93-turret-slowdown-rocket"] = "organic",
}
generator_api.batch_generator(casting_dict)

-- add recipes to technology
local mapping = {
    ["casting-w93-fragmentation-cannon-shell"] = {"casting-light-ammo-tech"},
    ["casting-w93-uranium-shotgun-shell"] = {"casting-heavy-ammo-tech"},
    ["casting-w93-slowdown-magazine"]="casting-light-ammo-tech",
    ["bio-w93-turret-slowdown-rocket"] = {"bio-rocketry-tech"},
}
add_recipe_unlocks(mapping)
-- move to subgroup
local mapping = {
    ["casting-w93-fragmentation-cannon-shell"] = "alternative-ammo",
    ["casting-w93-uranium-shotgun-shell"] = "alternative-ammo",
    ["casting-w93-slowdown-magazine"] = "alternative-ammo",
    ["bio-w93-turret-slowdown-rocket"] = "alternative-ammo",
}
set_recipes_subgroup_mapped(mapping)


if settings.startup["casting-weapons"].value then
    local casting_dict = {
    ["w93-scattergun-turret"] = "metallurgy",
    ["w93-modular-turret-base"] = "metallurgy",
    ["w93-modular-turret2-base"] = "metallurgy",
    ["w93-modular-gun-hmg"] = "metallurgy",
    ["w93-modular-gun-lcannon"] = "metallurgy",
    }
    generator_api.batch_generator(casting_dict)

    data:extend({
    {-- casting w93 turrets and guns
        type = "technology",
        name = "casting-modular-turrets",
        icons =
        {
            {
                icon = "__scattergun_turret__/graphics/technology/modular-turret-tech.png",
                icon_size = 128,
                icon_mipmaps = 1,
            },
            {
                icon = "__OCs_base_assets__/graphics/technology/overlayer-tech-molten-iron.png",
                icon_size = 256,
                icon_mipmaps = 4,
            }
        },
        prerequisites = {"casting-light-ammo-tech","w93-modular-turrets2", "w93-scattergun-turrets"},
        unit = {
            ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"military-science-pack", 2},
            -- {"utility-science-pack", 1},
            -- {"production-science-pack", 1},
            {"space-science-pack", 1},
            {"metallurgic-science-pack", 2}
            },
            time = 45,
            count = 150
        },
        effects =
        {
            {type = "unlock-recipe", recipe = "casting-w93-scattergun-turret"},
            {type = "unlock-recipe", recipe = "casting-w93-modular-turret-base"},
            {type = "unlock-recipe", recipe = "casting-w93-modular-turret2-base"},
            {type = "unlock-recipe", recipe = "casting-w93-modular-gun-hmg"},
            {type = "unlock-recipe", recipe = "casting-w93-modular-gun-lcannon"},
        },
    }
})
end