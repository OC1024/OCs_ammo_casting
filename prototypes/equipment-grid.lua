if not settings.startup["armour-plating"].value then return end -- skip if armor plating is disabled

local grids = require("prototypes.utils.grid_definitions")      -- defines and maps categories (personal, vehicle) to equipment_grid

-- 0) Create new equipment categories
data:extend({
  { type = "equipment-category", name = "personal-grid", },
  { type = "equipment-category", name = "vehicle-grid", },
})

-- 1) Create new grid prototypes
for grid_name, def in pairs(grids.equipment_grids or {}) do
  if not data.raw["equipment-grid"][grid_name] then
    data:extend({
      {
        type = "equipment-grid",
        name = grid_name,
        width = def.width,
        height = def.height,
        -- equipment_categories = def.equipment_categories
      }
    })
  end
end
-- 1.5) Apply early armor grid setting
local early_setting = settings.startup["early-armor-grid"].value

if early_setting == "light-armor" then -- add grid to both
  if data.raw["armor"]["light-armor"] then
    data.raw["armor"]["light-armor"].equipment_grid = "micro-equipment-grid"
  end
  if data.raw["armor"]["heavy-armor"] then
    data.raw["armor"]["heavy-armor"].equipment_grid = "tiny-equipment-grid"
  end
elseif early_setting == "heavy-armor" then -- add grid only to heavy armor
  if data.raw["armor"]["heavy-armor"] then
    data.raw["armor"]["heavy-armor"].equipment_grid = "tiny-equipment-grid"
  end
end

-- 2) Apply grid overrides
for entity_name, grid_name in pairs(grids.override_gridtype or {}) do
  for _, type_table in pairs(data.raw) do
    if type_table[entity_name] then
      type_table[entity_name].equipment_grid = grid_name
    end
  end
end

-- 3) Build structural groups AFTER overrides
grids.grid_groups = {
  ["personal-grid"] = {},
  ["vehicle-grid"]  = {}
}

local function register_grid(grid_name, group)
  grids.grid_groups[group][grid_name] = true
end

local function ensure_category(grid_name, category)
  local grid = data.raw["equipment-grid"][grid_name]
  if not grid then
    return
      log("Error: " .. grid .. " is not a valid grid.")
  end

  grid.equipment_categories = grid.equipment_categories or {}

  if not table.contains(grid.equipment_categories, category) then
    log("Grid " .. grid_name .. " already has category " .. category .. ", doing category assignment anyaway.")
    table.insert(grid.equipment_categories, category)
  else
    table.insert(grid.equipment_categories, category)
    log("Grid " .. grid_name .. " now has category " .. category)
  end
end

-- Personal Armor
for _, proto in pairs(data.raw["armor"] or {}) do
  if proto.equipment_grid then
    register_grid(proto.equipment_grid, "personal-grid")
    ensure_category(proto.equipment_grid, "personal-grid")
    ensure_category(proto.equipment_grid, "armor") -- keep vanilla compatibility
    log("Registered grid " .. proto.equipment_grid .. " used by " .. proto.name .. " as personal-grid.")
  end
end
-- Vehicles
local vehicle_types = { "car", "tank", "spider-vehicle" }
for _, vehicle_type in pairs(vehicle_types) do
  -- for all vehicles of the "car", "tank" prototype.
  for _, proto in pairs(data.raw[vehicle_type] or {}) do
    if proto.equipment_grid then
      -- SKIP if this grid is used by armor
      if not grids.grid_groups["personal-grid"][proto.equipment_grid] then
        register_grid(proto.equipment_grid, "vehicle-grid")

        ensure_category(proto.equipment_grid, "vehicle-grid")
        ensure_category(proto.equipment_grid, "armor") -- allow everything else again in vehicles
        log("Registered grid " .. proto.equipment_grid .. " used by " .. proto.name .. " as vehicle-grid.")
      else
        log("Grid " .. proto.equipment_grid .. " used by " .. proto.name ..
          " is already registered as personal-grid, skipping vehicle-grid assignment.")
      end
    end
  end
end

-- log(data.raw["car"]["tank"].equipment_grid)
-- log(data.raw["armor"]["power-armor"].equipment_grid)
