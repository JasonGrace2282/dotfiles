from keybinds.movement import movement
from keybinds.shortcuts import shortcuts
from keybinds.volume import volume
from itertools import chain


keys = list(chain(
    movement,
    shortcuts,
    volume
))
