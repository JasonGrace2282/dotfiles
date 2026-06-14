-- See https://wiki.hyprland.org/Configuring/Monitors/

hl.monitor({
  output = "eDP-1",
  mode = "1920x1080@60",
  position = "0x0",
  scale = "1.25",
})

hl.monitor({
  output = "HDMI-A-1",
  mode = "1920x1080@60",
  position = "0x0",
  scale = "1.25",
  mirror = "eDP-1",
})

hl.monitor({
  output = "HDMI-A-2",
  mode = "1920x1080@60",
  position = "0x0",
  scale = "1.25",
  mirror = "eDP-1",
})

-- unscale XWayland

require("startup")

TERMINAL = "kitty"
FILE_MANAGER = "pcmanfm"
MENU_COMMAND =
"rofi -modi drun,run -show drun -icon-theme 'Papirus' -show-icons -display-drun '' -run-shell-command '{terminal} -e zsh -ic \"{cmd} && read\"'"
BROWSER = "firefox"

hl.env("XCURSOR_SIZE", "24")
hl.env("GDK_SCALE", "1.25")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1.25")
-- TODO: manual review — malformed env on line 29: GDK_BACKEND,wayland,x11
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")

hl.curve("simple", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.animation({
  leaf = "windows",
  enabled = true,
  speed = 4,
  bezier = "simple",
})
hl.animation({
  leaf = "windowsOut",
  enabled = true,
  speed = 7,
  bezier = "default",
  style = "popin 80%",
})
hl.animation({
  leaf = "border",
  enabled = true,
  speed = 10,
  bezier = "default",
})
hl.animation({
  leaf = "borderangle",
  enabled = true,
  speed = 8,
  bezier = "default",
})
hl.animation({
  leaf = "fade",
  enabled = true,
  speed = 7,
  bezier = "default",
})
hl.animation({
  leaf = "workspaces",
  enabled = true,
  speed = 6,
  bezier = "default",
})

hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace",
})

hl.device({
  name = "g2touch-multi-touch-by-g2tsp",
  enabled = false,
})

MOD = "SUPER"

-- Source: ~/.config/hypr/binds.conf — convert this file to Lua and ensure it is on Lua's package.path.
require("binds")

-- Source: ~/.config/hypr/window_binds.conf — convert this file to Lua and ensure it is on Lua's package.path.
require("window_binds")

-- Source: ~/.config/hypr/rules.conf — convert this file to Lua and ensure it is on Lua's package.path.
require("rules")

hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 20,
    border_size = 2,
    col = {
      active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
      inactive_border = "rgba(595959aa)",
    },
    layout = "dwindle",
    -- Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
    allow_tearing = false,
  },
  decoration = {
    rounding = 10,
    blur = {
      -- battery consuming, keep?
      enabled = true,
      size = 1,
      passes = 1,
      vibrancy = 0.1696,
    },
    shadow = {
      enabled = false,
      range = 4,
      render_power = 3,
      color = "rgba(1a1a1aee)",
    },
  },
  cursor = {
    no_hardware_cursors = false,
  },
  xwayland = {
    force_zero_scaling = true,
  },
  animations = {
    enabled = true,
  },

  -- See https://wiki.hyprland.org/Configuring/Keywords/ for more
  input = {
    kb_layout = "us",
    kb_variant = "",
    kb_model   = "",
    kb_rules   = "",
    kb_options = "caps:escape",
    follow_mouse = 2,
    touchpad = {
      natural_scroll = true,
    },
  },
  dwindle = {
    -- See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
    preserve_split = true,
  },
  misc = {
    -- See https://wiki.hyprland.org/Configuring/Variables/ for more
    force_default_wallpaper = 0,
    -- force_hypr_chan = 0
    -- focus_on_activate = true
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
    middle_click_paste = false,
  },
  debug = {
    vfr = true,
  },
})
