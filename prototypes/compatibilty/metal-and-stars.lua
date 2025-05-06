
for tech_name, tech_data in pairs(data.raw.technology) do
    if string.match(tech_name, "^bullet%-productivity%-?%d*$") then
        add_productivity_bonus(tech_data, "casting-piercing-rounds-magazine", 0.1)
        add_productivity_bonus(tech_data, "casting-uranium-rounds-magazine", 0.1)
        add_productivity_bonus(tech_data, "tungsten-rounds-magazine", 0.1)
        add_productivity_bonus(tech_data, "casting-tungsten-rounds-magazine", 0.1)
        log("Added bullet prod to tech "..tech_name)
    else
        log("tech ".. tech_name.. " not match bullet-productivity")
    end
end

for tech_name, tech_data in pairs(data.raw.technology) do
    if string.match(tech_name, "^railgun%-ammo%-productivity%-?%d*$")then
        add_productivity_bonus(tech_data, "casting-railgun-ammo", 0.1)
        add_productivity_bonus(tech_data, "casting-tungsten-railgun-ammo", 0.1)
        add_productivity_bonus(tech_data, "tungsten-railgun-ammo", 0.1)
    end
end

for tech_name, tech_data in pairs(data.raw.technology) do
    if string.match(tech_name, "^rocket%-ammo%-productivity%-?%d*$")then
        add_productivity_bonus(tech_data, "bio-rocket", 0.1)
        add_productivity_bonus(tech_data, "bio-explosive-rocket", 0.1)
    end
end