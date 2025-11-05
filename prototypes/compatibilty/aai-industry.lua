--  load api
local generator_api = require("__OCs_base_assets__.prototypes.utils.api")

-- use generator_api
local casting_dict = {
    ["gun-turret"] = "metallurgy",
}
generator_api.batch_generator(casting_dict)
log("Compatibility for AAI Industry: Modified recipe for casting-gun-turret.")