
-- small mods

if mods["kj_vehicles"] then
  require("prototypes.compatibilty.king-jo")
end

if mods["aai-vehicles-ironclad"] then
  require("prototypes.compatibilty.aai-vehicles-ironclad")
end
if mods["ironclad-gunboat-and-mortar-turret-fork"] then
  require("prototypes.compatibilty.ironclad-gunboad-and-mortar-turret")
end
if mods["strategy-mortar-turret"] then
  require("prototypes.compatibilty.stategy-mortar-turret") -- note that there has to be a step in the data-final-fixes stage
end

if mods["scattergun_turret"] then -- modular turret mod
  require("prototypes.compatibilty.scattergun_turret")
end

if mods["vtk-cannon-turret"] then
  require("prototypes.compatibilty.vtk-cannon-turret")
end

if mods["cupric-asteroids"] then
  require("prototypes.compatibilty.cupric-asteroids")
end

if mods["More_Ammo"] then -- experimental
  require("prototypes.compatibilty.More_Ammo")
end

if mods["Uranium-Artillery-Shell"] then -- experimental
  require("prototypes.compatibilty.Uranium-Artillery-Shell")
end

if mods["atomic-land-mines"] then
  require("prototypes.compatibilty.atomic-land-mines")
end

if mods["AmmoGroup"] then -- pushing the subgroups in the new group
  require("prototypes.compatibilty.AmmoGroup")
end

-- overhaul mods
if mods["metal-and-stars"] then
  require("prototypes.compatibilty.metal-and-stars")
end

if mods["bzlead"] then
  require("prototypes.compatibilty.bzlead")
end

if mods["aai-industry"] then
  require("prototypes.compatibilty.aai-industry")
end

if mods["Krastorio2-spaced-out"] then -- replaces normal Krastorio2 with space-age compatible version
  require("prototypes.compatibilty.Krastorio2")
end

if mods["Krastorio2-spaced-out"] and mods["HeroTurretRedux"] then -- tripple compat patch
  require("prototypes.compatibilty.K2-range-patch")
end

if mods["any-planet-start"] then
  require("prototypes.compatibilty.any-planet-start") -- must be after most other mod patches
end
if mods["planet-picker-21patch"] then -- unofficial patch
  require("prototypes.compatibilty.planet-picker") -- must be after most other mod patches
end

require("prototypes.technology-update")