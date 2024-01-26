from libqtile import bar, widget
from libqtile.config import Screen
from libqtile.lazy import lazy
from qtile_extras.widget.decorations import RectDecoration
import os

from constants import colors, decoration_defaults

screens = [
    Screen(
        bottom = bar.Bar([
            widget.Spacer(length = 5),
            widget.GroupBox(
                hide_unused = True,
                disable_drag = True,
                toggle = False,
                highlight_method = "block",
                borderwidth = 4,
                this_current_screen_border = colors["blue"],
                block_highlight_text_color = colors["background"],
                active = colors["background_darker"],
                other_screen_border = colors["grey"],
                inactive = colors["lightblue"],
                urgent_alert_method = "block",
                urgent_border = colors["purple"],
                urgent_text = colors["red"],
                spacing = 4,
                margin_x = 6,
                margin_y = 3,
                padding_x = 2,
                padding_y = 2,
                decorations = [
                    RectDecoration(
                        colour = colors["white"],
                        **decoration_defaults,
                    )
                ],
            ),  
            widget.WidgetBox(
                widgets=[
                    widget.Systray(
                        # background = colors["systray"],
                        icon_size = 30,
                        padding = 2,
                    ),
                ],
                text_closed = '^',
                text_open = 'v',
                foreground = colors["lightblue"]
            ),
            widget.TaskList(
                theme_path = "/usr/share/icons/Papirus/index.theme",
                theme_mode = "preferred",
                highlight_method = 'block',
                icon_size = 18,
                max_title_width = 150,
                margin = 1.9,
                padding = 6.5,
                fontsize = 18,
                font = "Fredoka",
                border = colors["background"],
                foreground = colors["lightblue"],
                borderwidth = 3,
                urgent_border = colors["red"],
                txt_floating = ' ',
                txt_minimized = '_ ',
            ),
            widget.PulseVolume(
                padding = 8,
                emoji = False,
                mute_command = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle",
                volume_down_command = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-",
                volume_up_command = "wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+",
                # volume_app = "wpctl",
                get_volume_command = "volume=\"$(wpctl get-volume @DEFAULT_AUDIO_SINK@)\" && echo \"${volume:8}%\"",
                check_mute_string = "volume=\"$(wpctl get-volume @DEFAULT_AUDIO_SINK@)\" && echo \"${volume:8}% [MUTED]\"",
                foreground = colors["lightblue"],
                fmt="Vol: {0}"
            ),
            widget.Battery(
                padding = 8,
                format = "{percent:2.0%} ({hour:d}h:{min:02d} left)",
                decorations = [
                    RectDecoration(
                        colour = colors["orange"],
                        **decoration_defaults
                    )
                ],
                foreground = colors["lightblue"]
            ),
            widget.Clock(
                padding = 12,
                format = "%A, %d %b %I:%M",
                mouse_callbacks = {'Button1': lazy.spawn("osmo")},
                decorations = [
                    RectDecoration(
                        colour = colors["orange"],
                        **decoration_defaults,
                    )
                ],
                foreground = colors["lightblue"]
            ),
            ],
            35, # WIDTH
            margin = 2,
            background = colors["transparent"],
        ),
    )
]


