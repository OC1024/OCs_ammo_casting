local plating_variants = require("prototypes.utils.plating_variants")

data:extend({
  { -- uranium shotgun pellet
    type = "projectile",
    name = "uranium-shotgun-pellet",
    flags = { "not-on-map" },
    hidden = true,
    collision_box = { { -0.05, -0.25 }, { 0.05, 0.25 } },
    acceleration = 0,
    piercing_damage = 100, -- scattergun_turret mod has that for uranium shotgun shells
    direction_only = true,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "damage",
          damage = { amount = 24, type = "physical" } -- per pellet
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      draw_as_glow = true,
      width = 3,
      height = 50,
      priority = "high",
      tint = { r = 0.0, g = 1.0, b = 0.0 },
    }
  },
  { -- tungsten shotgun pellet
    type = "projectile",
    name = "tungsten-shotgun-pellet",
    flags = { "not-on-map" },
    hidden = true,
    collision_box = { { -0.05, -0.25 }, { 0.05, 0.25 } },
    acceleration = 0,
    piercing_damage = 100, -- scattergun_turret mod has that for uranium shotgun shells
    direction_only = true,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "damage",
          damage = { amount = 24, type = "physical" } -- per pellet
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      draw_as_glow = true,
      width = 3,
      height = 50,
      priority = "high",
      tint = plating_variants.tungsten.tint,
    }
  },
  { -- tungsten cannon shell
    type = "projectile",
    name = "tungsten-cannon-projectile",
    flags = { "not-on-map" },
    hidden = true,
    collision_box = { { -0.3, -1.1 }, { 0.3, 1.1 } },
    acceleration = 0,
    direction_only = true,
    piercing_damage = 2200,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "damage",
            damage = { amount = 2000, type = "physical" }
          },
          {
            type = "damage",
            damage = { amount = 200, type = "explosion" }
          },
          {
            type = "create-entity",
            entity_name = "explosion"
          }
        }
      }
    },
    final_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "small-scorchmark-tintable",
            check_buildability = true
          }
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      draw_as_glow = true,
      width = 3,
      height = 50,
      priority = "high"
    }
  },
})

if not mods["scattergun_turret"] then
  data:extend({
    { -- uranium shotgun pellet
      type = "projectile",
      name = "uranium-shotgun-pellet",
      flags = { "not-on-map" },
      hidden = true,
      collision_box = { { -0.05, -0.25 }, { 0.05, 0.25 } },
      acceleration = 0,
      piercing_damage = 100, -- scattergun_turret mod has that for uranium shotgun shells
      direction_only = true,
      action = {
        type = "direct",
        action_delivery = {
          type = "instant",
          target_effects =
          { type = "damage", damage = { amount = 20, type = "physical" } } -- per pellet
        }
      },
      animation = {
        filename = "__base__/graphics/entity/bullet/bullet.png",
        draw_as_glow = true,
        width = 3,
        height = 50,
        priority = "high",
        tint = { r = 0.0, g = 1.0, b = 0.0 },
      }
    },
  })
end

-- Create heavy artillery shell only if the settings allow it
if settings.startup["heavy-artillery-shells"].value then
  ----------------------------------------------------------------------
  -- Heavy artillery shockwave
  ----------------------------------------------------------------------

  local max_steps = 10         -- set duration and radius(x2) of shockwave. vanilla = 30
  local interval = 10          -- time interval. vanilla = 10
  local shockwave_damage = 100 -- damage from first shockwave
  local damage_falloff = 0.7   -- decay of damage value
  local function make_heavy_artillery_shockwave()
    local shockwave_prototypes = {}
    local shockwave_delays = {}
    for step = 1, max_steps do
      local source_name = "small-demolisher-expanding-ash-cloud-" .. step
      local source = data.raw["smoke-with-trigger"][source_name]
      if not source then
        error("Missing prototype: " .. source_name)
      end

      local shockwave = table.deepcopy(source)
      shockwave.name = "heavy-artillery-shockwave-" .. step
      -- Keep the Demolisher's visual cluster actions.
      local visual_actions = {}

      for _, action in pairs(shockwave.action or {}) do
        if action.type == "cluster" then
          table.insert(visual_actions, action)
        end
      end

      shockwave.action = visual_actions
      shockwave_prototypes[#shockwave_prototypes + 1] = shockwave

      -- Each subsequent ring is spawned by a delayed-active-trigger.
      if step > 1 then
        local ring_damage = shockwave_damage * damage_falloff ^ (step - 1)
        shockwave_delays[#shockwave_delays + 1] = {
          type = "delayed-active-trigger",
          name = "heavy-artillery-shockwave-delay-" .. step,
          order = "ha-shockwave-" .. tostring(step),
          delay = math.max(interval * (step - 1), 1),
          action = {
            {
              type = "area",
              radius = 2 * step, -- lucky guess
              target_entities = true,
              action_delivery = {
                type = "instant",
                target_effects = {
                  {
                    type = "damage",
                    damage = {
                      amount = ring_damage,
                      type = "physical",
                    },
                    show_in_tooltip = true,
                  },
                },
              },
            },
            {
              type = "direct",
              action_delivery = {
                type = "instant",
                target_effects = {
                  {
                    type = "create-entity",
                    entity_name = "heavy-artillery-shockwave-" .. step,
                  },
                },
              },
            },
          },
        }
      end
    end

    data:extend(shockwave_prototypes)
    data:extend(shockwave_delays)
    for step = 1, max_steps do
      local name = "heavy-artillery-shockwave-" .. step
      local prototype = data.raw["smoke-with-trigger"][name]
      log(name .. " exists: " .. tostring(prototype ~= nil))
      if prototype then
        log(name .. " actions: " .. #prototype.action)
      end
    end

    -- This is the effect sequence which starts the wave.
    local effects = {
      {
        type = "create-entity",
        entity_name = "heavy-artillery-shockwave-1",
      },
    }
    for step = 2, max_steps do
      table.insert(effects, {
        type = "nested-result",
        action = {
          type = "direct",
          action_delivery = {
            type = "delayed",
            delayed_trigger = "heavy-artillery-shockwave-delay-" .. step,
          },
        },
      })
    end
    return effects
  end

  local heavy_artillery_shockwave = make_heavy_artillery_shockwave()

  local heavy_projectile = table.deepcopy(data.raw["artillery-projectile"]["artillery-projectile"])
  heavy_projectile.name = "heavy-artillery-projectile"

  ----------------------------------------------------------------------
  -- Heavy artillery projectile
  ----------------------------------------------------------------------
  -- Modify the properties for balance
  heavy_projectile.action = {
    type = "direct",
    action_delivery = {
      type = "instant",
      target_effects = {
        -- inner explosion (area damage)
        -- [[
        {
          type = "nested-result",
          action =
          {
            type = "area",
            radius = 6.0, -- vanilla = 4
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                {
                  type = "damage",
                  damage = { amount = 3000, type = "physical" } -- vanilla = 1000
                },
                {
                  type = "damage",
                  damage = { amount = 1000, type = "explosion" }
                }
              }
            }
          }
        },
        --]]
        -- cliff destruction
        {
          type = "destroy-cliffs",
          radius = 4, -- +33% more than cliff explosives
        },
        -- vanilla artillery visuals
        -- [[
        {
          type = "create-trivial-smoke",
          smoke_name = "artillery-smoke",
          initial_height = 0,
          speed_from_center = 0.05,
          speed_from_center_deviation = 0.005,
          offset_deviation = { { -4, -4 }, { 4, 4 } },
          max_radius = 3.5,
          repeat_count = 4 * 4 * 15
        },
        {
          type = "create-entity",
          entity_name = "big-artillery-explosion"
        },
        {
          type = "show-explosion-on-chart",
          scale = 8 / 32
        },
        --]]
        -- shockwave (added below)
      }
    },
  }
  -- shockwave
  for _, effect in ipairs(heavy_artillery_shockwave) do
    table.insert(heavy_projectile.action.action_delivery.target_effects, effect)
  end

  -- remove decorations (cliff-exposives=2; artillery-projectile=3.5)
  for _, effect in pairs(heavy_projectile.final_action.action_delivery.target_effects) do
    if effect.type == "destroy-decoratives" then
      effect.radius = 5
      break
    end
  end
  -- Register the new projectile
  data:extend({ heavy_projectile })
end
