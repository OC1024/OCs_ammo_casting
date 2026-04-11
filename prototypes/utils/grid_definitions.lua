local grids = {}

-- define new grid sizes
grids.equipment_grids = {
    -- small-equipment_grid (vanilla, modular armor) 5x5
    ["micro-equipment-grid"] = {
        width = 2,
        height = 3,
    },
    ["tiny-equipment-grid"] = {
        width = 4,
        height = 3,
    },
    -- just like from other mods
    ["car-equipment-grid"] = {
        width = 6,
        height = 4,
    },
    -- vanilla values
    ["tank-equipment-grid"] = {
        width = 8,
        height = 6,
    },
}

-- new definitions and overwrite grids
grids.override_gridtype = {
    ["light-armor"] = "micro-equipment-grid",
    ["heavy-armor"] = "tiny-equipment-grid",
    -- ["power-armor"] = "medium-equipment-grid",-- vanilla
    ["car"] = "car-equipment-grid",
    ["tank"] = "tank-equipment-grid",
}

return grids