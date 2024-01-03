--[[

     Dremora Awesome WM theme 2.0
     github.com/lcpz

--]]
-- CUSTOM WIDGETS
volume_widget                                   = require('awesome-wm-widgets.pactl-widget.volume')
local battery_widget                            = require('awesome-wm-widgets.battery-widget.battery')

-- tiling?
-- local treesome                                  = require("treesome")

-- normal theme stuff
local gears                                     = require("gears")
local lain                                      = require("lain")
local awful                                     = require("awful")
local wibox                                     = require("wibox")
local dpi                                       = require("beautiful.xresources").apply_dpi

local os                                        = os
local my_table                                  = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme                                     = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/dremora"
theme.wallpaper                                 = os.getenv("HOME") .. "/important/pc_background.jpg"
theme.font                                      = "Terminus 10.5"
theme.taglist_font                              = "Icons 10"
theme.fg_normal                                 = "#747474"
theme.fg_focus                                  = "#ededed" -- color of focused window text
theme.bg_normal                                 = "#121212" -- bg of bar: ex) 121212
theme.bg_focus                                  = "#0C4A50" -- selected tab bg
theme.fg_urgent                                 = "#CC9393"
theme.bg_urgent                                 = "#2A1F1E"
theme.border_width                              = dpi(9)
theme.border_normal                             = "#000000"
theme.border_focus                              = theme.bg_focus
theme.titlebar_bg_focus                         = "#303030"
theme.taglist_fg_focus                          = theme.fg_focus
theme.taglist_bg_focus                          = theme.bg_focus -- ex) #c12d00
theme.menu_height                               = dpi(16)
theme.menu_width                                = dpi(130)
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
theme.awesome_icon                              = theme.dir .. "/icons/awesome.png"
theme.taglist_squares_sel                       = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"
theme.layout_tile                               = theme.dir .. "/icons/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons/floating.png"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = false
theme.useless_gap                               = dpi(10)
theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"
-- USER

local markup        = lain.util.markup
local separators    = lain.util.separators
local white         = theme.fg_focus
local gray          = "#858585"

-- Textclock
local mytextclock   = wibox.widget.textclock(markup(gray, " %a")
  .. markup(white, " %d ") .. markup(gray, "%b ") .. markup(white, "%I:%M%p "))
mytextclock.font    = theme.font

-- Calendar
theme.cal           = lain.widget.cal({
  attach_to = { mytextclock },
  notification_preset = {
    font = "Terminus 11",
    fg   = white,
    bg   = theme.bg_normal
  }
})

-- Separators
local first     = wibox.widget.textbox('<span font="Terminus 4"> </span>')
local arrl_pre  = separators.arrow_right("alpha", "#1A1A1A")
local arrl_post = separators.arrow_right("#1A1A1A", "alpha")

function theme.at_screen_connect(s)
  -- Quake application
  s.quake = lain.util.quake({ app = awful.util.terminal })

  -- If wallpaper is a function, call it with the screen
  local wallpaper = theme.wallpaper
  if type(wallpaper) == "function" then
    wallpaper = wallpaper(s)
  end
  gears.wallpaper.maximized(wallpaper, s, true)

  -- Tags
  awful.util.tagnames = { "main", "coding", "discord", "spotify", "misc"}
  local suit = awful.layout.suit
  awful.tag(awful.util.tagnames, s, {
    suit.floating,
    suit.tile,
    suit.tile,
    suit.floating,
    suit.floating
  })

  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()
  -- Create an imagebox widget which will contains an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox(s)
  s.mylayoutbox:buttons(my_table.join(
    awful.button({}, 1, function() awful.layout.inc(1) end),
    awful.button({}, 2, function() awful.layout.set(awful.layout.layouts[1]) end),
    awful.button({}, 3, function() awful.layout.inc(-1) end),
    awful.button({}, 4, function() awful.layout.inc(1) end),
    awful.button({}, 5, function() awful.layout.inc(-1) end)))
  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

  -- Create a tasklist widget
  s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

  -- Create the wibox
  s.mywibox = awful.wibar({
    position = "top",
    screen = s,
    height = dpi(18), 
    bg = theme.bg_normal,
    fg = theme.fg_normal,
    optop = true,
    visible=true
  })

  -- Add widgets to the wibox
  s.mywibox:setup {
    layout = wibox.layout.align.horizontal,
    { -- Left widgets
      layout = wibox.layout.fixed.horizontal,
      first,
      s.mytaglist,
      arrl_pre,
      s.mylayoutbox,
      arrl_post,
      s.mypromptbox,
      first,
    },
    s.mytasklist, -- Middle widget
    {             -- Right widgets
      layout = wibox.layout.fixed.horizontal,
      wibox.widget.systray(),
      first,
      battery_widget,
      volume_widget(),
      mytextclock,
    },
  }
end

return theme
