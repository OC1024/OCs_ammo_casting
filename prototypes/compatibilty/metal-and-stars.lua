--  load api
local generator_api = require("__OCs_base_assets__.prototypes.utils.api")
local oc_recipe = require("__OCs_base_assets__.prototypes.utils.oc_recipe")
local oc_tech = require("__OCs_base_assets__.prototypes.utils.oc_tech")

generator_api.register_single_alt_recipe("metallurgy", "neodymium-plate", { "neodymium-alloy-plate", "neodymium-plate" })

-- casting metal-and-stars ammo
local casting_dict = {
  ["thorium-rounds-magazine"] = "metallurgy",
  ["thorium-cannon-shell"] = "metallurgy",
  ["gauss-rocket"] = "metallurgy",
}
generator_api.batch_generator(casting_dict)
--replace u238 with thorium in the thorium ammo recipes
oc_recipe.replace_ingredient("oc-casting-thorium-rounds-magazine", "item", "uranium-238", "item", "thorium")
oc_recipe.replace_ingredient("oc-casting-thorium-cannon-shell", "item", "uranium-238", "item", "thorium")

local mapping = {
  ["oc-casting-thorium-rounds-magazine"] = "alternative-ammo",
  ["oc-casting-thorium-cannon-shell"] = "alternative-ammo",
  ["oc-casting-gauss-rocket"] = "alternative-ammo",
}
oc_recipe.change_recipes_subgroup(mapping)

local recipe_tech_mapping = {
  ["oc-casting-thorium-rounds-magazine"] = { "casting-heavy-ammo-tech" },
  ["oc-casting-thorium-cannon-shell"] = "casting-heavy-ammo-tech",
  ["oc-casting-gauss-rocket"] = { "gauss-rockets" },
}
oc_tech.add_recipe_unlocks(recipe_tech_mapping)


-- ===  adding casting/bio recipes to the productivity-tech (also a K2SO patch inclusive) ===
local vanilla_bullets = {
  "firearm-magazine",
  "piercing-rounds-magazine",
  "uranium-rounds-magazine",
  "thorium-rounds-magazine",   --not vanilla but only casting recipe needed here
  -- no shotgun shells? well okay, I like that
}
local oc_bullets = {
  "tungsten-rounds-magazine",
}
local kr_bullets = {
  -- rifle ammo
  "kr-rifle-magazine",                  -- yellow ammo
  "kr-armor-piercing-rifle-magazine",   -- red ammo
  "kr-imersite-rifle-magazine",         -- pink ammo
  "kr-imersite-rounds-magazine",        -- new name: pink ammo

  -- sniper ammo
  "kr-anti-materiel-rifle-magazine",                  -- yellow sniper ammo
  "kr-armor-piercing-anti-materiel-rifle-magazine",   -- red sniper ammo
  "kr-uranium-anti-materiel-rifle-magazine",          -- green sniper ammo
  "kr-imersite-anti-materiel-rifle-magazine",         -- pink sniper ammo
}

-- building the all_bullets table
local all_bullets = {}
-- vanilla casting only
for _, r in ipairs(vanilla_bullets) do
  table.insert(all_bullets, "casting-" .. r)
end
-- oc normal + casting
for _, r in ipairs(oc_bullets) do
  table.insert(all_bullets, r)
  table.insert(all_bullets, "casting-" .. r)
end

if mods["Krastorio2-spaced-out"] then
  -- k2 normal + casting
  for _, r in ipairs(kr_bullets) do
    -- complat patch with K2SO - should be done within metal-and-stars mod instead.
    table.insert(all_bullets, r)
    -- compat patch for all three mods (yea this has to be done by me)
    table.insert(all_bullets, "oc-casting-" .. r)
  end
end

-- now iterate and add all these to the tech
for tech_name, _ in pairs(data.raw.technology) do
  if string.match(tech_name, "^bullet%-productivity%-?%d*$") then
    for _, recipe_name in ipairs(all_bullets) do
      oc_tech.add_productivity_bonus(tech_name, recipe_name, 0.1)
    end
  end
end

local vanilla_railgun = {
  "railgun-ammo",
}
local oc_railgun = {
  "tungsten-railgun-ammo"
}
local kr_railgun = {
  "kr-basic-railgun-shell",
  "kr-explosive-railgun-shell",
  -- ignoring the antimatter railgun shell
}

-- building the all_railguns table
local all_railguns = {}
-- vanilla/M&S casting only
for _, r in ipairs(vanilla_railgun) do
  table.insert(all_railguns, "oc-casting-" .. r)
end

-- oc normal + casting
for _, r in ipairs(oc_railgun) do
  table.insert(all_railguns, r)
  table.insert(all_railguns, "oc-casting-" .. r)
end

if mods["Krastorio2-spaced-out"] then
  -- k2 normal + casting
  for _, r in ipairs(kr_railgun) do
    -- complat patch with K2SO - should be done within metal-and-stars mod instead.
    table.insert(all_railguns, r)
    -- compat patch for all three mods (yea this has to be done by me)
    table.insert(all_railguns, "oc-casting-" .. r)
  end
end

for tech_name, _ in pairs(data.raw.technology) do
  if string.match(tech_name, "^railgun%-ammo%-productivity%-?%d*$") then
    for _, recipe_name in ipairs(all_railguns) do
      oc_tech.add_productivity_bonus(tech_name, recipe_name, 0.1)
    end
    -- log("Patched "..tech_name.." with productivity for "..#all_bullets.." recipes")
  end
end

local vanilla_rockets = {
  "rocket",
  "explosive-rocket",
}
local oc_rockets = {
  "gauss-rocket"   -- "casting-gauss-rocket" is my new recipe
}
local kr_rockets = {
  "kr-heavy-rocket",
  "kr-explosive-turret-rocket",
  -- ignoring the antimatter and nuclear rockets
}

-- building the all_rockets table
local all_rockets = {}
-- vanilla/M&S oc-bio-* only
for _, r in ipairs(vanilla_rockets) do
  table.insert(all_rockets, "oc-bio-" .. r)
end

-- oc normal + oc-bio-*
for _, r in ipairs(oc_rockets) do
  -- table.insert(all_rockets, r)
  table.insert(all_rockets, "oc-casting-" .. r) -- special case as these gauss rockets are casted instead of biologised as my other rockets
end

if mods["Krastorio2-spaced-out"] then
  -- k2 normal + oc-casting
  for _, r in ipairs(kr_rockets) do
    -- complat patch with K2SO - should be done within metal-and-stars mod instead.
    table.insert(all_rockets, r)
    -- compat patch for all three mods (yea this has to be done by me)
    table.insert(all_rockets, "oc-bio-" .. r)
  end
end

for tech_name, _ in pairs(data.raw.technology) do
  if string.match(tech_name, "^rocket%-ammo%-productivity%-?%d*$") then
    for _, recipe_name in ipairs(all_rockets) do
      oc_tech.add_productivity_bonus(tech_name, recipe_name, 0.1)
    end
    -- log("Patched "..tech_name.." with productivity for "..#all_bullets.." recipes")
  end
end
