data:extend({
    { -- tungsten shotgun pellet
      type = "projectile",
      name = "tungsten-shotgun-pellet",
      flags = {"not-on-map"},
      hidden = true,
      collision_box = {{-0.05, -0.25}, {0.05, 0.25}},
      acceleration = 0,
      piercing_damage = 100,  -- scattergun_turret mod has that for uranium shotgun shells
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
            damage = {amount = 20, type = "physical"} -- per pellet
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
    { -- tungsten cannon shell
        type = "projectile",
        name = "tungsten-cannon-projectile",
        flags = {"not-on-map"},
        hidden = true,
        collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
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
                damage = {amount = 2000 , type = "physical"}
              },
              {
                type = "damage",
                damage = {amount = 200 , type = "explosion"}
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

-- -- Ensure the shockwave exists before defining the projectile
-- local base_nuke_shockwave = data.raw["explosion"]["nuke-shockwave"]
-- if base_nuke_shockwave then
--   local small_nuke_shockwave = table.copy_and_rename(base_nuke_shockwave, "small-nuke-shockwave")

--   if small_nuke_shockwave.animations and small_nuke_shockwave.animations[1] then
--     small_nuke_shockwave.animations[1].scale = 0.5 -- Reduce size
--   end

--   small_nuke_shockwave.created_effect = {
--     type = "direct",
--     action_delivery = {
--       type = "instant",
--       target_effects = {
--         {
--           type = "damage",
--           damage = { amount = 400, type = "explosion" }, 
--         },
--         {
--           type = "damage",
--           damage = { amount = 100, type = "fire" }, 
--         }
--       }
--     }
--   }

--   data:extend({ small_nuke_shockwave })
-- else
--   log("Error: base nuke-shockwave not found in data.raw!")
-- end

local massive_explosion = table.deepcopy(data.raw["explosion"]["big-explosion"])
massive_explosion.name = "massive-explosion"
data:extend({massive_explosion})

-- Create heavy artillery shell only if the settings allow it
if settings.startup["allow-casting-explosive-ammo"].value then
  local heavy_projectile = table.copy_and_rename(data.raw["artillery-projectile"]["artillery-projectile"], "heavy-artillery-projectile")

  -- Modify the properties for balance
  heavy_projectile.action = {
    type = "area",
    radius = 6, -- epicenter explosion, +50% blast radius
    force = "all",
    action_delivery = {
      type = "instant",
      target_effects = {
        -- inner explosion
        {
          type = "damage",
          damage = { amount = 3000, type = "physical" }
        },
        {
          type = "damage",
          damage = { amount = 1000, type = "explosion" }
        },
        {
          type = "destroy-cliffs",
          radius = 4, -- +33% more than cliff explosives
        },
        -- -- shockwave
        -- {
        --   type = "nested-result",
        --   action = {
        --     type = "area",
        --     radius = 12, -- shockwave radius
        --     action_delivery = {
        --       type = "instant",
        --       target_effects = {
        --         {
        --           type = "create-entity",
        --           entity_name = "small-nuke-shockwave",
        --         }
        --       }
        --     }
        --   }
        -- }
      }
    }
  }

    -- Register the new projectile
    data:extend({heavy_projectile})

end
