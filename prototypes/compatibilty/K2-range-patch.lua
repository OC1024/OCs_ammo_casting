-- dictionary: ammo_name -> max_range
local ammo_range_patch = {
    -- rifle ammo
    ["kr-rifle-magazine"]  = 50, -- yellow ammo
    ["kr-armor-piercing-rifle-magazine"]  = 50, -- red ammo
    ["kr-uranium-rifle-magazine"] = 50, -- green ammo
    ["kr-imersite-rifle-magazine"] = 50, -- pink ammo
    ["tungsten-rounds-magazine"] = 80, -- green ammo

    -- sniper ammo
    ["kr-anti-materiel-rifle-magazine"] = 100, -- yellow sniper ammo
    ["kr-armor-piercing-anti-materiel-rifle-magazine"] = 100, -- red sniper ammo
    ["kr-uranium-anti-materiel-rifle-magazine"] = 100, -- green sniper ammo
    ["kr-imersite-anti-materiel-rifle-magazine"] = 100, -- pink sniper ammo
    -- cannon shells
    ["cannon-shell"] = 120,
    ["explosive-cannon-shell"] = 120,
    ["uranium-cannon-shell"] = 120,
    ["explosive-uranium-cannon-shell"] = 120,
    ["tungsten-cannon-shell"] = 150,

    ["kr-impulse-rifle-ammo"] = 70,

    -- k2 heavy rockets
    -- ["kr-basic-rocket"] = 200,
    ["kr-heavy-rocket"] = 250,
    ["kr-antimatter-rocket"] = 300,
    -- k2 railgun
    ["kr-basic-railgun-shell"] = 200,
    ["kr-explosive-railgun-shell"] = 250,
    ["kr-antimatter-railgun-shell"] = 300,
    -- k2 rocket turret
    ["kr-explosive-turret-rocket"] = 200,
    ["kr-nuclear-turret-rocket"]    = 250,
    ["kr-antimatter-turret-rocket"] = 300,
    -- k2 artillery
    -- ["kr-nuclear-artillery-shell"] = 800,
    -- ["kr-antimatter-artillery-shell"] = 1000,
}

local function ensure_actions_table(a)
    -- return array of actions
    if not a then return {} end
    if a.type then return {a} end
    return a
end

log("Sorry for the crude patch, but HeroTurretRedux has higher range than Krastorio2 ammo by default.")
for name, new_range in pairs(ammo_range_patch) do
  local ammo = data.raw["ammo"][name]
  if not ammo or not ammo.ammo_type then goto continue end
  log("Patching ammo '"..name.."' from max_range="..tostring(ammo.ammo_type.range_modifier).." to "..tostring(new_range))

  -- enforce canonical behaviour
  ammo.ammo_type.range_modifier = nil
  ammo.ammo_type.target_type = "position"

  local actions = ensure_actions_table(ammo.ammo_type.action)
  for _, act in ipairs(actions) do
    local delivery = act and act.action_delivery
    if not delivery then goto inner_continue end

    -- is this delivery a list of deliveries?
    if delivery[1] ~= nil then
      for _, d in pairs(delivery) do
        if d.max_range then d.max_range = new_range end
        if d.projectile and data.raw["projectile"][d.projectile] then
          data.raw["projectile"][d.projectile].force_condition = "not-same"
        end
      end
    else
      if delivery.max_range ~= nil then
        delivery.max_range = new_range
      end
      if delivery.projectile and data.raw["projectile"][delivery.projectile] then
        data.raw["projectile"][delivery.projectile].force_condition = "not-same"
      end
    end

    ::inner_continue::
  end

  log("Patched ammo '"..name.."' to max_range="..tostring(new_range))

  ::continue::
end