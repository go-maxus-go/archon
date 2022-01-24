import os

from libqtile.lazy import lazy

from libqtile.config import Key


mod = "mod4"
alt = "mod1"
ctrl = "control"
shift = "shift"

def runScript(script):
    scriptPath = os.path.expanduser("~/.config/archon/scripts/" + script)
    return lazy.spawn("sh " + scriptPath)

layoutKeys = [
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),

    Key([mod, shift], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, shift], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, shift], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, shift], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    Key([mod, ctrl], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, ctrl], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, ctrl], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, ctrl], "k", lazy.layout.grow_up(), desc="Grow window up"),

    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    Key([mod], "s", lazy.layout.toggle_split(), desc="Toggle stack split mode"),
    Key([mod], "f", lazy.window.toggle_floating(), desc="Toggle floating mode"),
    Key([mod], "Down", lazy.window.toggle_minimize(), desc="Toggle minimize mode"),
    Key([mod], "Up", lazy.window.toggle_fullscreen(), desc="Toggle minimize mode"),

    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, shift], "Tab", lazy.prev_layout(), desc="Toggle between layouts"),
]

applicationKeys = [
    Key([mod], "Return", runScript("open_terminal.sh"), desc="Launch terminal"),
    Key([mod], "space", runScript("launch_launcher.sh"), desc="Open a launcher app"),

    Key([mod], "e", runScript("open_file_manager.sh"), desc="Open a file manager"),
    Key([mod], "v", runScript("open_vim.sh"), desc="Open vim"),
    Key([mod, shift], "s", runScript("launch_screenshot_tool.sh"), desc="Launch screenshot tool"),
]

multimediaKeys = [
    Key([alt, ctrl], "Left", runScript("volume_down.sh"), desc="Volume down"),
    Key([], "XF86AudioLowerVolume", runScript("volume_down.sh"), desc="Volume down"),
    Key([alt, ctrl], "Right", runScript("volume_up.sh"), desc="Volume up"),
    Key([], "XF86AudioRaiseVolume", runScript("volume_up.sh"), desc="Volume up"),

    Key([alt, ctrl], "Up", runScript("brightness_up.sh"), desc="Brightness down"),
    Key ([], "XF86MonBrightnessUp", runScript("brightness_up.sh"), desc="Brightness down"),

    Key([alt, ctrl], "Down", runScript("brightness_down.sh"), desc="Brightness up"),
    Key ([], "XF86MonBrightnessDown", runScript("brightness_down.sh"), desc="Brightness up"),
]

controlKeys = [
    Key([mod, alt], "space", lazy.hide_show_bar(), desc="Toggle bar"),

    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, shift], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, shift], "q", lazy.shutdown(), desc="Shutdown Qtile"),
]

keybindings = layoutKeys + applicationKeys + multimediaKeys + controlKeys
