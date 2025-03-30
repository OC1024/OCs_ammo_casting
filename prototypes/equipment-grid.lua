
if settings.startup["armour-plating"] then
    local personal_armor_grids = {
        ["modular-amror"] = "small-equipment-grid",
        ["power-armor"] = "medium-equipment-grid",
        ["power-armor-mk2"] = "large-equipment-grid",
        ["mech-armor"] = "huge-equipment-grid",
    }

    local vehicle_grids = {
        ["car"] = "car-equipment-grid",
        ["tank"] = "tank-equipment-grid",
        ["spidertron"] = "spidertron-equipment-grid",
        -- AAI vehicles
        ["vehicle-chaingunner"] = "chaingunner-equipment-grid",
        ["vehicle-flame-tumbler"] = "flame-tumbler-equipment-grid",
        ["vehicle-warden"] = "warden-equipment-grid",
        ["vehicle-flame-tank"] = "flame-tank-equipment-grid",
        ["vehicle-laser-tank"] = "laser-tank-equipment-grid",
        ["ironclad"] = "ironclad-equipment-grid",
        -- hovercraft mod
        ["hovercraft-entity"] = "hovercraft-equipment-grid",
        ["missilecraft"] = "hovercraft-equipment-grid",
    }

    -- Ensure all personal armors have the correct grid and category
    for armor_name, grid_name in pairs(personal_armor_grids) do
        local armor = data.raw["armor"][armor_name]
        if armor then
            armor.equipment_grid = armor.equipment_grid or grid_name
            local grid = data.raw["equipment-grid"][armor.equipment_grid]
            if grid and not table.contains(grid.equipment_categories, "personal-armour-plating-equipment") then
                table.insert(grid.equipment_categories, "personal-armour-plating-equipment")
            end
        end
    end

    -- Ensure all vehicles have their correct grids and categories
    for vehicle_name, grid_name in pairs(vehicle_grids) do
        local entity = data.raw["car"][vehicle_name] or data.raw["spider-vehicle"][vehicle_name]
        if entity and entity.equipment_grid then
            -- -- Assign the grid if it doesn’t have one
            -- entity.equipment_grid = entity.equipment_grid or grid_name

            -- Add the "vehicle-armour-plating-equipment" category if missing
            local grid = data.raw["equipment-grid"][entity.equipment_grid]
            if grid and not table.contains(grid.equipment_categories, "vehicle-armour-plating-equipment") then
                table.insert(grid.equipment_categories, "vehicle-armour-plating-equipment")
            end
        end
    end

end