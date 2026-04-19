--  load api
local generator_api = require("__OCs_base_assets__.prototypes.utils.api")
local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")
local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")

-- casting all KingJoe ammos
local casting_dict = {
    -- kj_pak_gun
    ["kj_pak_ap"] = "metallurgy",
    ["kj_pak_he"] = "metallurgy",
    ["kj_pak_inc"] = "metallurgy",
    -- kj_panzer4
    ["kj_75kwk40_ap"] = "metallurgy",
    ["kj_75kwk40_he"] = "metallurgy",
    ["kj_75kwk40_aphe"] = "metallurgy",
    -- kj_2cmfv (vierlingsflack/flakpanzer)
    ["kj_2cmfv_normal"] = "metallurgy",
    ["kj_wirbelwind"] = "metallurgy",
    ["kj_2cmfv_normal_vierling"] = "metallurgy",
    -- kj_maustank
    ["kj_120kwk40_ap"] = "metallurgy",
    ["kj_120kwk40_he"] = "metallurgy",
    ["kj_120kwk40_aphe"] = "metallurgy",
    -- kj_2a6
    ["aj_rh120_ap"] = "metallurgy",
    ["kj_rh120_he"] = "metallurgy",
    ["kj_rh120_aphe"] = "metallurgy",
    ["kj_rh120_can"] = "metallurgy",
    -- kj_rattetank
    ["kj_280SKC34_ap"] = "metallurgy",
    ["kj_280SKC34_he"] = "metallurgy",
    ["kj_280SKC34_inc"] = "metallurgy",
    -- kj_master
    ["kj_bolt"] = "metallurgy",
    -- Warhammer 40k stuff
    ["kj_predator_normal"] = "metallurgy",
    ["kj_lemanruss_normal"] = "metallurgy",
    ["kj_baneblade_normal"] = "metallurgy",
    ["kj_baneblade_artillery"] = "metallurgy",
    ["kj_40kdreadnought_normal"] = "metallurgy",
    ["kj_rex_normal"] = "metallurgy",
}
generator_api.batch_generator(casting_dict)

if settings.startup["casting-weapons"].value then
    local casting_weapons_dict = {-- tanks/weapons
        -- IRL tanks
        ["kj_pak_gun"] = "metallurgy",
        ["kj_panzer4"] = "metallurgy",
        ["kj_vierling"] = "metallurgy",
        ["kj_maustank"] = "metallurgy",
        ["kj_2a6"] = "metallurgy",
        ["kj_rattetank"] = "metallurgy",
        -- Warhammer 40k stuff
        ["kj_40kpredator"] = "metallurgy",
        ["kj_40kbaneblade"] = "metallurgy",
        ["kj_40klemanruss"] = "metallurgy",
        ["kj_40kdreadnought"] = "metallurgy",
        ["kj_rex"] = "metallurgy",
        -- hand weapons
        ["kj_mg34_hand"] = "metallurgy",
        ["kj_mg42_hand"] = "metallurgy",
        ["kj_mg3_hand"] = "metallurgy",
    }
    generator_api.batch_generator(casting_weapons_dict)
end

-- add recipes to technology
local unlocking_tech = {
    -- === vehicles/ammo === --
    -- kj_pak_gun
    ["oc-casting-kj_pak_ap"] = "casting-heavy-ammo-tech",
    ["oc-casting-kj_pak_he"] = "casting-explosive-ammo-tech",
    ["oc-casting-kj_pak_inc"] = "casting-explosive-ammo-tech",
    -- kj_panzer4
    ["oc-casting-kj_75kwk40_ap"] = "casting-heavy-ammo-tech",
    ["oc-casting-kj_75kwk40_he"] = "casting-explosive-ammo-tech",
    ["oc-casting-kj_75kwk40_aphe"] = "casting-explosive-ammo-tech",
    -- kj_2cmfv (vierlingsflack/flakpanzer)
    ["oc-casting-kj_2cmfv_normal"] = "casting-heavy-ammo-tech",
    ["oc-casting-kj_2cmfv_normal_vierling"] = "casting-heavy-ammo-tech",
    -- kj_maustank
    ["oc-casting-kj_120kwk40_ap"] = "casting-heavy-ammo-tech",
    ["oc-casting-kj_120kwk40_he"] = "casting-explosive-ammo-tech",
    ["oc-casting-kj_120kwk40_aphe"] = "casting-explosive-ammo-tech",
    -- kj_2a6
    ["oc-casting-aj_rh120_ap"] = "casting-heavy-ammo-tech",
    ["oc-casting-kj_rh120_he"] = "casting-explosive-ammo-tech",
    ["oc-casting-kj_rh120_aphe"] = "casting-explosive-ammo-tech",
    ["oc-casting-kj_rh120_can"] = "casting-heavy-ammo-tech",
    -- kj_rattetank
    ["oc-casting-kj_280SKC34_ap"] = "casting-heavy-ammo-tech",
    ["oc-casting-kj_280SKC34_he"] = "casting-explosive-ammo-tech",
    ["oc-casting-kj_280SKC34_inc"] = "casting-explosive-ammo-tech",
    -- kj_master
    ["oc-casting-kj_bolt"] = "casting-heavy-ammo-tech",
    -- Warhammer 40k stuff
    ["oc-casting-kj_predator_normal"] = "casting-heavy-ammo-tech",
    ["oc-casting-kj_lemanruss_normal"] = "casting-heavy-ammo-tech",
    ["oc-casting-kj_baneblade_normal"] = "casting-heavy-ammo-tech",
    ["oc-casting-kj_baneblade_artillery"] = "casting-heavy-ammo-tech",
    ["oc-casting-kj_40kdreadnought_normal"] = "casting-heavy-ammo-tech",
    ["oc-casting-kj_rex_normal"] = "casting-heavy-ammo-tech",
    -- === vehicles/guns === --
    -- IRL tanks
    ["oc-casting-kj_pak_gun"] = "kj_pak",
    ["oc-casting-kj_panzer4"] = "kj_panzer4",
    ["oc-casting-kj_vierling"] = "kj_2cmfv",
    ["oc-casting-kj_wirbelwind"] = "kj_2cmfv",
    ["oc-casting-kj_maustank"] = "kj_maustank",
    ["oc-casting-kj_2a6"] = "kj_2a6",
    ["oc-casting-kj_rattetank"] = "kj_rattetank",
    -- Warhammer 40k stuff
    ["oc-casting-kj_40kpredator"] = "kj_40kpredator",
    ["oc-casting-kj_40kbaneblade"] = "kj_40kbaneblade",
    ["oc-casting-kj_40klemanruss"] = "kj_40klemanruss",
    ["oc-casting-kj_40kdreadnought"] = "kj_40kdreadnought",
    ["oc-casting-kj_rex"] = "kj_rex",
    -- === hand weapons === --
    ["oc-casting-kj_mg34_hand"] = {"kj_panzer4"},
    ["oc-casting-kj_mg42_hand"] = {"kj_maustank"},
    ["oc-casting-kj_mg3_hand"] = {"kj_2a6"},
}
oc_tech.add_recipe_unlocks(unlocking_tech)

-- move to subgroup
-- if modsettings exist and true, then within the KJ groupd, have the subgroup
if data.raw["item-group"]["kj_group"] then
    data:extend({
        {
            type = "item-subgroup",
            name = "alternative-ammo", -- reuse the same name as for non-kj stuff
            group = "kj_group",
            -- order = "g-a", -- TODO
        },
    })
end

local subgroup_mapping = {}

for key, _ in pairs(casting_dict) do
    subgroup_mapping[key] = "alternative-ammo"
end

oc_recipe.change_recipes_subgroup(subgroup_mapping)