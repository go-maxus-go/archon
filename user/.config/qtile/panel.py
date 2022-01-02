import os

from libqtile import bar, widget, qtile


class Panel(bar.Bar):
    def __init__(self, widgets, size, **config):
        bar.Bar.__init__(self, widgets, size, **config)
    
    def _configure(self, qtile, screen):
        super()._configure(qtile, screen)
        super().show(is_show=False)

def runScript(script):
    home = os.path.expanduser('~/.config/archon/scripts/')
    return qtile.cmd_spawn(home + script)

def createWidgets():
    return [
        widget.Image(
            filename='~/.config/archon/icons/power.svg',
            margin=4,
            mouse_callbacks = {'Button1': lambda: runScript('open_power_menu.sh')},
        ),
        widget.CurrentLayout(),
        widget.GroupBox(
            inactive="#606060",
            borderwidth=4,
        ),
        widget.TaskList(
            icon_size=0,
            borderwidth=4,
            padding=4,
        ),
        widget.Image(
            filename='~/.config/archon/icons/bluetooth.svg',
            margin=4,
            mouse_callbacks = {'Button1': lambda: runScript('launch_bluetooth_manager.sh')},
        ),
        widget.Image(
            filename='~/.config/archon/icons/wifi.svg',
            margin=4,
            mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn('nm-connection-editor')},
        ),
        widget.Image(
            filename='~/.config/archon/icons/volume.svg',
            margin=4,
            mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn('pavucontrol')},
        ),
        widget.Battery(
            format='{percent:2.0%}',
            update_interval=60,
        ),
        widget.Systray(),
        widget.Clock(
            format='%a %d-%m-%Y %H:%M',
            mouse_callbacks = {"Button1": lambda: qtile.cmd_spawn('gsimplecal')},
            update_interval=30,
        ),
    ]

def createPanel():
    return Panel(
        createWidgets(),
        32,
        background='#282c34',
    )