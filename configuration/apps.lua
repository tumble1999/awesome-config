local filesystem = require('gears.filesystem')
local config_dir = filesystem.get_configuration_dir()
local utils_dir = config_dir .. 'utilities/'

-- Thanks to jo148 on github for making rofi dpi aware!
local with_dpi = require('beautiful').xresources.apply_dpi
local get_dpi = require('beautiful').xresources.get_dpi
local rofi_command = 'env /usr/bin/rofi -dpi ' .. get_dpi() .. ' -width ' .. with_dpi(400) .. ' -show drun -theme ' .. filesystem.get_configuration_dir() .. '/configuration/rofi.rasi -run-command "/bin/bash -c -i \'shopt -s expand_aliases; {cmd}\'"'

return {
  -- List of apps to start by default on some actions
  default = {
    terminal = 'mate-terminal',
    rofi = rofi_command,
    lock = 'i3lock-fancy',
    quake = 'alacritty',
    -- screenshot = 'flameshot gui', --'~/.config/awesome/configuration/utils/screenshot -m',
    -- region_screenshot = 'screenshot -r -s', --'~/.config/awesome/configuration/utils/screenshot -r',
    -- delayed_screenshot = 'screenshot -d 10 -r', --'~/.config/awesome/configuration/utils/screenshot --delayed -r',
    -- ss_and_edit_screenshot = 'screenshot -r',
    
    -- Editing these also edits the default program
    -- associated with each tag/workspace
    browser = 'brave',
    editor = 'codium', -- gui text editor
   -- social = 'discord',
    social = 'element-desktop',
    vm = 'virt-manager',
    game = 'steam',
    files = 'caja',
    music = 'spotify'
  },
  -- List of apps to start once on start-up
  run_on_start_up = {
    'picom -b --experimental-backends --dbus --config ' .. config_dir .. '/configuration/picom.conf', -- Composite
    'ibus-daemon --xim --daemonize', -- Ibus daemon for keyboard
    'scream-start', -- scream audio sink
    'numlockx on', -- enable numlock
    'udiskie --no-automount --smart-tray',
    'blueman-applet', -- Bluetooth tray icon
    '/usr/lib/mate-polkit/polkit-mate-authentication-agent-1', -- Polkit agent
    'thunderbird60', -- Email client
    'xscreensaver',
    'sleep 5 && kdeconnect-indicator',
    '~/.config/awesome/configuration/awspawn', -- Spawn "dirty" apps that can linger between sessions
    'flameshot', -- screenshot
  -- '~/setup-audio.sh',
  }
}
