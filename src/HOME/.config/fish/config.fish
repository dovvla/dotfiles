# Start SSH agent
ssh_agent
if uwsm check may-start; then
    exec uwsm start hyprland.desktop
end
