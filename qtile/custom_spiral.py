from libqtile.layout import Spiral as QtileSpiral
from libqtile.command.base import expose_command
from enum import Enum

class DIRECTION(Enum):
    LEFT = "left"
    RIGHT = "right"

class Spiral(QtileSpiral):
    def move_horizontal(self, direction: DIRECTION):
        def lower(arg1: float, arg2: float) -> bool:
            return arg1 < arg2
        def higher(arg1: float, arg2: float) -> bool:
            return arg1 > arg2

        x_comp = lower if direction == DIRECTION.LEFT else higher
        x_diff_func = min if direction == DIRECTION.LEFT else max

        info = self.info()
        if not info["focused"]:
            return
        # get coordinates of top left corner of windows
        coords = info["layout_info"]
        focused_x, focused_y, *_ = coords[info["current"]]

        diff = tuple(focused_x - x for x, *_ in coords if x_comp(x, focused_x))
        if not diff:
            return
        min_x_diff = x_diff_func(diff)
        # find the windows that are a minimal x distance away
        min_x = [
            (idx, x, y) for idx, (x, y, *_) in enumerate(coords) if focused_x - x == min_x_diff
        ]
        # and sort by how close their y value is to the current
        min_x.sort(key=lambda x: abs(focused_y - coords[x[0]][1]))

        new_idx = min_x[0][0]
        # go to window by index
        self.clients.current_index = new_idx
        self.group.focus(self.clients[new_idx])

    @expose_command()
    def right(self) -> None:
        self.move_horizontal(direction=DIRECTION.RIGHT)

    @expose_command()
    def left(self) -> None:
        self.move_horizontal(direction=DIRECTION.LEFT)
