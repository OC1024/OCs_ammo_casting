-- Helper function to check if a grid category is compatible with a given equipment
local function is_grid_allowed_for_equipment(grid_name, equipment)
    local grid = data.raw["equipment-grid"][grid_name]
    if not grid then return false end

    -- Check if the grid has the same category as the equipment
    local equipment_category = equipment.categories or {}
    local grid_category = grid.equipment_categories or {}

    -- Allow only if any category of the grid matches any category of the equipment
    for _, equipment_cat in pairs(equipment_category) do
        for _, grid_cat in pairs(grid_category) do
            if equipment_cat == grid_cat then
                return true
            end
        end
    end
    return false
end

if settings.startup["armour-plating"] then

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