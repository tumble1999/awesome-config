local filesystem = require('gears.filesystem')

-- Thanks to jo148 on github for making rofi dpi aware!
local with_dpi = require('beautiful').xresources.apply_dpi
local get_dpi = require('beautiful').xresources.get_dpi
local rofi_command = 'env /usr/bin/rofi -dpi ' .. get_dpi() .. ' -width ' .. with_dpi(400) .. ' -show drun -theme ' .. filesystem.get_configuration_dir() .. '/configuration/rofi.rasi -run-command "/bin/bash -c -i \'shopt -s expand_aliases; {cmd}\'"'

return {
  -- List of apps to start by default on some actions
  default = {
    -- terminal = 'env x-terminal-emulator -e /usr/bin/env TERM=xterm-256color byobu',
    terminal = 'mate-terminal',
    rofi = rofi_command,
    lock = 'i3lock-fancy',
    quake = 'alacritty',
    screenshot = 'screenshot -m -s', --'~/.config/awesome/configuration/utils/screenshot -m',
    region_screenshot = 'screenshot -r -s', --'~/.config/awesome/configuration/utils/screenshot -r',
    delayed_screenshot = 'screenshot -d 10 -r', --'~/.config/awesome/configuration/utils/screenshot --delayed -r',
    ss_and_edit_screenshot = 'screenshot -r',
    
    -- Editing these also edits the default program
    -- associated with each tag/workspace
    browser = 'brave',
    editor = 'codium', -- gui text editor
    social = 'discord',
    vm = 'virt-manager',
    game = 'steam',
    files = 'caja',
    music = 'spotify'
  },
  -- List of apps to start once on start-up
  run_on_start_up = {
    'compton --config ' .. filesystem.get_configuration_dir() .. '/configuration/compton.conf',
    -- 'nm-applet --indicator', -- wifi
    -- 'blueberry-tray', -- Bluetooth tray icon
    'blueman-applet', -- Bluetooth tray icon
    --'xfce4-power-manager', -- Power manager
    'ibus-daemon --xim --daemonize', -- Ibus daemon for keyboard
    'scream-start', -- scream audio sink
    'numlockx on', -- enable numlock
    -- '/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager
    --'/usr/lib/x86_64-linux-gnu/libexec/polkit-kde-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)', -- credential manager
    -- 'blueman-tray', -- bluetooth tray
    'thunderbird', -- Email client
    -- Add applications that need to be killed between reloads
    -- to avoid multipled instances, inside the awspawn script
    'xscreensaver',
    'sleep 5 && kdeconnect-indicator',
    '~/.config/awesome/configuration/awspawn', -- Spawn "dirty" apps that can linger between sessions
    'pipewire',
    'pipewire-pulse',
    'pipewire',
  -- '~/setup-audio.sh',
    'keepassxc',
  }
}
