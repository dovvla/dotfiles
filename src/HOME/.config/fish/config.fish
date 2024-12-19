# Start SSH agent
ssh_agent
if uwsm check may-start && uwsm select
	exec systemd-cat -t uwsm_start uwsm start default
end
