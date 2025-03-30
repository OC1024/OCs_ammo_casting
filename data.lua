-- define a function used for injecting a new data into a existing table
function table.contains(tbl, element)
    for _, value in pairs(tbl) do
      if value == element then
        return true
      end
    end
    return false
end

function table.copy_and_rename(original_table, new_name)
    if not data.raw[original_table.type] or not data.raw[original_table.type][original_table.name] then
      error("Original table does not exist: " .. original_table.name)
    end

    local copied_table = table.deepcopy(data.raw[original_table.type][original_table.name])
    copied_table.name = new_name
    log("Table: " ..original_table.name.. " cloned to " ..new_name)
    return copied_table
end

require("prototypes.category")
require("prototypes.plating_variants") -- Import the variant table
require("prototypes.grid_definitions") -- defines and maps categories(personal, vehicle) to equipment_grid
require("prototypes.item")
require("prototypes.equipment")
require("prototypes.equipment-grid")
require("prototypes.projectile")
require("prototypes.recipe")
require("prototypes.technology")