from libqtile import bar, widget
from libqtile.config import Screen
from libqtile.lazy import lazy
from qtile_extras.widget.decorations import RectDecoration
import os

from constants import colors, decoration_defaults

screens = [
    Screen(
        bottom = bar.Bar([           #widget.Sep(
            #   linewidth = 4,
            #   background = colors["systray"],
            #   foreground = colors["systray"],
            #),
            widget.Spacer(length = 5),
            widget.GroupBox(
                hide_unused = True,
                disable_drag = True,
                toggle = False,
                highlight_method = "block",
                borderwidth = 4,
                this_current_screen_border = colors["blue"],            # block fill color
                block_highlight_text_color = colors["background"],      # block text color
                active = colors["background_darker"],                   # text color
                other_screen_border = colors["grey"],                   # block fill color other screens
                inactive = colors["white"],
                urgent_alert_method = "block",
                urgent_border = colors["purple"],
                urgent_text = colors["red"],
                spacing = 4,
                margin_x = 6,
                margin_y = 3,                                           # push labels down
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
                text_open = 'v'
            ),
            widget.TaskList(
                theme_path = "/usr/share/icons/Papirus/index.theme",
                theme_mode = "preferred",
                highlight_method = 'block',
                icon_size = 18,
                max_title_width = 150,
                margin = 1.9,                   # match to center
                padding = 6.5,                  # size of a block
                fontsize = 18,
                font = "Fredoka",
                border = colors["background"],  # fill current window
                foreground = "#ffffff",         # text colors
                borderwidth = 3,                # icon position
                urgent_border = colors["red"],
                txt_floating = ' ',
                txt_minimized = '_ ',
            ),
            widget.Volume(
                padding = 8,
                emoji = False,
                mute_command = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle",
                volume_down_command = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-",
                volume_up_command = "wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
            ),
            widget.Battery(
                padding = 8,
                format = "{percent:2.0%} ({hour:d}h:{min:02d} left)",
                decorations = [
                    RectDecoration(
                        colour = colors["orange"],
                        **decoration_defaults
                    )
                ]
            ),
            widget.Clock(
                padding = 8,
                format = "%A, %d %b %H:%M",
                mouse_callbacks = {'Button1': lazy.spawn("gsimplecal")},
                decorations = [
                    RectDecoration(
                        colour = colors["orange"],
                        **decoration_defaults,
                    )
                ],
            ),
            ],
            35, # WIDTH
            # margin = 4,
            margin = 2,
            background = colors["transparent"],
        ),
    )
]


