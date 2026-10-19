
-- small mods

if mods["kc-lunarpanel"] then
  require("prototypes.compatibility.kc-lunarpanel")
end

if mods["kj_vehicles"] then
  require("prototypes.compatibility.king-jo")
end

if mods["aai-vehicles-chaingunner"] then
  require("prototypes.compatibility.aai-vehicles-chaingunner")
end

if mods["aai-vehicles-ironclad"] then
  require("prototypes.compatibility.aai-vehicles-ironclad")
end
if mods["ironclad-gunboat-and-mortar-turret-fork"] then
  require("prototypes.compatibility.ironclad-gunboad-and-mortar-turret")
end
if mods["strategy-mortar-turret"] then
  require("prototypes.compatibility.stategy-mortar-turret") -- note that there has to be a step in the data-final-fixes stage
end

if mods["scattergun_turret"] then -- modular turret mod
  require("prototypes.compatibility.scattergun_turret")
end

if mods["vtk-cannon-turret"] then
  require("prototypes.compatibility.vtk-cannon-turret")
end

if mods["cupric-asteroids"] then
  require("prototypes.compatibility.cupric-asteroids")
end

if mods["More_Ammo"] then -- experimental
  require("prototypes.compatibility.More_Ammo")
end

if mods["more-ammo-redux"] then -- by QuingKhaos 
  require("prototypes.compatibility.more-ammo-redux")
end

if mods["chemical-rocket"] then
  require("prototypes.compatibility.chemical-rocket")
end

if mods["missile-defense-systems-redux"] then
  require("prototypes.compatibility.missile-defense-systems-redux")
end

if mods["Uranium-Artillery-Shell"] then -- experimental; ascended to be integrated
  require("prototypes.compatibility.Uranium-Artillery-Shell")
end

if mods["atomic-land-mines"] then
  require("prototypes.compatibility.atomic-land-mines")
end

if mods["shield-projector"] then
  require("prototypes.compatibility.shield-projector")
end

if mods["AmmoGroup"] then -- pushing the subgroups in the new group
  require("prototypes.compatibility.AmmoGroup")
end

-- overhaul mods

if mods["more-infinite-research"] then
  require("prototypes.compatibility.more-infinite-research")
end

if mods["metal-and-stars"] then
  require("prototypes.compatibility.metal-and-stars")
end

if mods["bzlead"] or mods["khaoslead"] then
  require("prototypes.compatibility.bzlead")
end

if mods["aai-industry"] then
  require("prototypes.compatibility.aai-industry")
end

if mods["bobwarfare"] then
  require("prototypes.compatibility.bobwarfare")
end

if mods["Krastorio2-spaced-out"] then -- replaces normal Krastorio2 with space-age compatible version
  require("prototypes.compatibility.Krastorio2")
end

if mods["Krastorio2-spaced-out"] and mods["HeroTurretRedux"] then -- tripple compat patch
  require("prototypes.compatibility.K2-range-patch")
end

if mods["any-planet-start"] or mods["planet-picker-21patch"] then -- pp21patch is a unofficial patch
  require("prototypes.compatibility.any-planet-start") -- must be after most other mod patches
end

require("prototypes.technology-update")