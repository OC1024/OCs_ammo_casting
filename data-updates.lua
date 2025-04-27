-- mod compatibility
if mods["aai-industry"] then
  require("prototypes.compatibilty.aai-industry")
end

if mods["scattergun_turret"] then
  require("prototypes.compatibilty.scattergun_turret")
end

if mods["vtk-cannon-turret"] then
  require("prototypes.compatibilty.vtk-cannon-turret")
end

if mods["bzlead"] then
  require("prototypes.compatibilty.bzlead")    
end

if mods["More_Ammo"] then
  require("prototypes.compatibilty.More_Ammo")    
end

if mods["AmmoGroup"] then
  require("prototypes.compatibilty.AmmoGroup")
end

-- generator related code
-- main frame of this mod
-- require("prototypes.recipe-updates")
-- require("prototypes.technology-updates")