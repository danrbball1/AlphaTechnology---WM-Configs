local xresources = require 'beautiful.xresources'
local beautiful = require 'beautiful'
local wibox = require 'wibox'
local gears = require 'gears'
local props = require 'ui.actions.props'

local dpi = xresources.apply_dpi

local helpers = {}

function helpers.percent(n, p)
    return p * n / 100
end

function helpers.mkblock(opts)
    local height = opts.height or helpers.percent(props.height, 15)
    local widget = opts.widget or {}
    local flat = opts.flat or false

    return {
        {
            {
                widget,
                margins = props.gaps,
                widget = wibox.container.margin,
            },
            bg = flat and beautiful.actions.bg or beautiful.actions.contrast,
            forced_height = dpi(height),
            widget = wibox.container.background,
            shape = function (cr, w, h)
                return gears.shape.rounded_rect(cr, w, h, props.radius)
            end
        },
        top = props.gaps,
        left = props.gaps,
        right = props.gaps,
        widget = wibox.container.margin,
    }
end

return helpers
