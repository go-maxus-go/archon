import os
import subprocess

from typing import List  # noqa: F401

from libqtile import layout
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile import hook

from keybindings import keybindings, mod
from panel import createPanel


keys = keybindings

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
    ])

borderWidth = 2
borderFocus='#7b99b7'
borderNormal='#1a1d23'
borderFocusStack='#00897b'

layouts = [
    layout.Columns(
        border_focus=borderFocus,
        border_normal=borderNormal,
        border_focus_stack=borderFocusStack,
        border_width=borderWidth,
    ),
    layout.Max(),
    layout.Floating(
        border_focus=borderFocus,
        border_normal=borderNormal,
        border_width=borderWidth,
    ),
]

widget_defaults = dict(
    font='sans',
    fontsize=16,
    foreground='#efefef',
    padding=3,
)

extension_defaults = widget_defaults.copy()

screens = [Screen(bottom=createPanel())]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod, "control"], "Button1", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class='confirmreset'),  # gitk
        Match(wm_class='makebranch'),  # gitk
        Match(wm_class='maketag'),  # gitk
        Match(wm_class='ssh-askpass'),  # ssh-askpass
        Match(title='branchdialog'),  # gitk
        Match(title='pinentry'),  # GPG key password entry
        Match(title='Bluetooth'),
        Match(wm_class='pavucontrol'),
    ],
    border_focus=borderFocus,
    border_normal=borderNormal,
    border_width=borderWidth,
)
dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

@hook.subscribe.startup
def autostart():
    home = os.path.expanduser('~')
    subprocess.run([home + '/.config/qtile/autostart.sh'])
