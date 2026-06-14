hl.bind(MOD .. " + SHIFT + F", hl.dsp.window.float({ action = "toggle" }))

-- rearrange windows with SHIFT+move focus keys
hl.bind(MOD .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(MOD .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))
hl.bind(MOD .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(MOD .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))

-- Move focus with MOD + arrow keys
hl.bind(MOD .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(MOD .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(MOD .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(MOD .. " + j", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with MOD + [0-9]
for i = 1, 10 do
    hl.bind(MOD .. " + " .. (i % 10), hl.dsp.focus({ workspace = i }))
end

-- Move active window to a workspace with MOD + SHIFT + [0-9]
for i = 1, 10 do
    hl.bind(MOD .. " + SHIFT + " .. (i % 10), hl.dsp.window.move({ workspace = i }))
end

hl.bind(MOD .. " + mouse:272", hl.dsp.window.drag())
hl.bind(MOD .. " + mouse:273", hl.dsp.window.resize())

hl.bind(MOD .. " + SHIFT + right", hl.dsp.window.resize({ x = 10, y = 0, relative = true }))
hl.bind(MOD .. " + SHIFT + left", hl.dsp.window.resize({ x = -10, y = 0, relative = true }))
hl.bind(MOD .. " + SHIFT + up", hl.dsp.window.resize({ x = 0, y = -10, relative = true }))
hl.bind(MOD .. " + SHIFT + down", hl.dsp.window.resize({ x = 0, y = 10, relative = true }))
