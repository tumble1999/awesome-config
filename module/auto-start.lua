-- MODULE AUTO-START
-- Run all the apps listed in configuration/apps.lua as run_on_start_up only once when awesome start
-- Run all the apps listed in ~/.config/autostart only once when awesome start
-- Run all the apps listed in ~/.config/autostart-scripts only once when awesome start

local awful = require('awful')
local apps = require('configuration.apps')

local function run_once(cmd)
  local findme = cmd
  local firstspace = cmd:find(' ')
  if firstspace then
    findme = cmd:sub(0, firstspace - 1)
  end
  awful.spawn.with_shell(string.format('pgrep -u $USER -x %s > /dev/null || (%s)', findme, cmd))
end
local function run_autostart_folder(path,openwith)
  local apps = io.popen("ls -AF --format=single-column "..path):lines()
  for app in apps do
    run_once(openwith.." "..path..app)
  end
end

for _, app in ipairs(apps.run_on_start_up) do
  run_once(app)
end




run_autostart_folder("~/.config/autostart","xdg-open")
run_autostart_folder("~/.config/autostart-scripts","bash")