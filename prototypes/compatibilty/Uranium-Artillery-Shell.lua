--  load api
local generator_api = require("__OCs_base_assets__.prototypes.utils.api")
local oc_helper = require("__OCs_base_assets__.prototypes.utils.helper")

if settings.startup["allow-casting-explosive-ammo"].value then
    generator_api.batch_generator({ ["uranium-artillery-shell"] = "metallurgy", }) -- very heavy artillery shell, not nuclear

    oc_helper.add_prerequisites({ ["casting-explosive-ammo-tech"] = { "uranium-artillery-shell" }, })

    if settings.startup["nuclear-ammo"].value then -- "nuclear" artillery shell and special ingredients
        local casting_dict = {
            ["uranium-artillery-shell"] = "metallurgy",
            -- ["uranium-antidote"] = "", -- does not fit here
            ["dense-uranium-casing"] = "metallurgy",
            -- ["stabilized-radiation-core"] = "electromagnetics",-- which category should this be in?
            ["uranium-artillery-shell-mk2"] = "metallurgy",
        }
        generator_api.batch_generator(casting_dict)
        oc_helper.add_prerequisites({ ["nuclear-ammo-tech"] = { "uranium-artillery-shell-mk2" } })
    end
end

local mapping = {
    ["casting-uranium-artillery-shell"] = "alternative-ammo",
    -- ["pulse-dense-uranium-casing"] = "alternative-ammo",
    -- ["casting-stabilized-radiation-core"] = "alternative-ammo",
    ["casting-uranium-artillery-shell-mk2"] = "alternative-ammo",
}
oc_helper.change_recipes_subgroup(mapping)
