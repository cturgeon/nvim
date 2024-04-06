-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "AdventureTime"

-- \x1b is the escape char
config.keys = {
  {
    key = "UpArrow",
    mods = "ALT",
    action = act.Multiple({
      act.SendKey({ key = "Escape" }),
      act.SendKey({ key = "8" }),
      act.SendKey({ key = "k" }),
    }),
  },
  {
    key = "DownArrow",
    mods = "ALT",
    action = act.Multiple({
      act.SendKey({ key = "Escape" }),
      act.SendKey({ key = "8" }),
      act.SendKey({ key = "j" }),
    }),
  },
  {
    key = "LeftArrow",
    mods = "CMD",
    action = act.Multiple({
      act.SendKey({ key = "Escape" }),
      act.SendKey({ key = "I" }),
    }),
  },
  {
    key = "LeftArrow",
    mods = "ALT",
    action = act.Multiple({
      act.SendKey({ key = "Escape" }),
      act.SendKey({ key = "B" }),
      act.SendKey({ key = "i" }),
    }),
  },
  {
    key = "RightArrow",
    mods = "CMD",
    action = act.Multiple({
      act.SendKey({ key = "Escape" }),
      act.SendKey({ key = "A" }),
    }),
  },
  {
    key = "RightArrow",
    mods = "ALT",
    action = act.Multiple({
      act.SendKey({ key = "Escape" }),
      act.SendKey({ key = "W" }),
      act.SendKey({ key = "W" }),
      act.SendKey({ key = "i" }),
    }),
  },
  {
    key = "Backspace",
    mods = "CMD",
    action = act.Multiple({
      act.SendKey({ key = "Escape" }),
      act.SendKey({ key = "d" }),
      act.SendKey({ key = "d" }),
      act.SendKey({ key = "i" }),
    }),
  },
  {
    key = "Backspace",
    mods = "ALT",
    action = act.Multiple({
      act.SendKey({ key = "Escape" }),
      act.SendKey({ key = "d" }),
      act.SendKey({ key = "a" }),
      act.SendKey({ key = "w" }),
      act.SendKey({ key = "i" }),
    }),
  },
  {
    key = "s",
    mods = "CMD",
    action = act.SendKey({
      key = "s",
      mods = "CTRL",
    }),
  },
  {
    key = "a",
    mods = "CMD",
    action = act.Multiple({
      act.SendKey({ key = "Escape" }),
      act.SendKey({ key = "g" }),
      act.SendKey({ key = "g" }),
      act.SendKey({ key = "V" }),
      act.SendKey({ key = "G" }),
    }),
  },
  {
    key = "/",
    mods = "CMD",
    action = act.Multiple({
      act.SendKey({ key = "g" }),
      act.SendKey({ key = "c" }),
    }),
  },
}

for i = 1, 8 do
  -- CMD+ALT + number to activate that window
  table.insert(config.keys, {
    key = tostring(i),
    mods = "CMD",
    action = act.ActivateWindow(i - 1),
  })
end

-- and finally, return the configuration to wezterm
return config
