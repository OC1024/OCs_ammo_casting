if data.raw.recipe["casting-gun-turret"] then
    data.raw.recipe["casting-gun-turret"].ingredients = {
    {type="fluid", name="molten-iron", amount=550}, -- 20iron-plate + 10gear-wheel + 5single-cylinder-engine (1iron-plate + 1gear-wheel)
    -- {type="fluid", name="molten-copper", amount=50},
    }
    log("Compatibility for AAI Industry: Modified recipe for casting-gun-turret.")
end