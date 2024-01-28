from libqtile import bar, lazy, widget
from libqtile.config import Screen

from constants import *

lazy = lazy.lazy

screens = [
    Screen(
        bottom = bar.Bar(
            [
                widget.TextBox(
                    foreground = arch_color,
                    text = " " + arch_icon,
                    fontsize = 20,
                    mouse_callbacks = {"Button1": lazy.spawn("firefox https://wiki.archlinux.org")}
                ),
                widget.GroupBox(
                    hide_unused = True,
                    foreground = colors["lightblue"],
                    font = "Fredoka"
                ),

                widget.WindowName(
                    foreground = arch_color,
                    padding = 20,
                    font = "Freokda"
                ),

                widget.TextBox(
                    foreground = widget_group_color,
                    text = widget_rsep,
                    padding = 0,
                    fontsize = widget_sep_size,
                ),

                widget.WidgetBox(
                    widgets = [
                        widget.CPU(
                            foreground = term_colors[3],
                            background = widget_group_color,
                            format = cpu_icon + ' {load_percent}%',
                        ),

                        widget.Memory(
                            foreground = term_colors[2],
                            background = widget_group_color,
                            measure_mem = 'G',
                            format = memory_icon + ' {MemPercent:.0f}%',
                        ),

                        widget.DF(
                            foreground = term_colors[5],
                            background = widget_group_color,
                            visible_on_warn = False,
                            format = disk_icon + ' {r:.0f}%',
                        ),

                        widget.Net(
                            foreground = term_colors[6],
                            background = widget_group_color,
                            format = net_icon + ' {down} ' + down_arrow_icon,
                        ),
                        ],
                    background = widget_group_color,
                    foreground = arch_color,
                    text_closed = '<',
                    text_open = '>',
                ),

                widget.TextBox(
                    foreground = widget_group_color,
                    text = widget_lsep + " ",
                    padding = 0,
                    fontsize = widget_sep_size,
                ),

                widget.TextBox(
                    foreground = widget_group_color,
                    text = widget_rsep,
                    padding = 0,
                    fontsize = widget_sep_size,
                ),

                widget.Battery(
                    background = widget_group_color,
                    foreground = colors["lightblue"],
                    format = "⚡{percent:2.0%} ({hour:d}h:{min:02d} left)"
                ),

                widget.PulseVolume(
                    background = widget_group_color,
                    foreground = term_colors[5],
                    fmt = f"{volume} {{}}"
                ),

               widget.TextBox(
                    foreground = widget_group_color,
                    text = widget_lsep + " ",
                    padding = 0,
                    fontsize = widget_sep_size,
                ),

                widget.TextBox(
                    foreground = widget_group_color,
                    text = widget_rsep,
                    padding = 0,
                    fontsize = widget_sep_size,
                ),
                widget.Systray(
                    background = widget_group_color,
                ),

                widget.TextBox(
                    foreground = widget_group_color,
                    text = widget_lsep + " ",
                    padding = 0,
                    fontsize = widget_sep_size,
                ),

                widget.TextBox(
                    foreground = widget_group_color,
                    text = widget_rsep,
                    padding = 0,
                    fontsize = widget_sep_size,
                ),

                widget.Clock(
                    format = f" {calendar_icon}  %a %m/%d | {clock_icon}  %I:%M",
                    background = widget_group_color,
                    foreground = arch_color,
                    padding = 10,
                ),

                widget.TextBox(
                    foreground = widget_group_color,
                    text = widget_lsep,
                    padding = 0,
                    fontsize = widget_sep_size,
                ),

            ],
            size=bar_size,
            background_opacity = 0.5,
            #opacity = 0.6,
            margin = window_margin,
            border_width = [5, 5, 5, 0],
            border_color = bar_bg,
            background = colors["background"]
        ),
    )
]


