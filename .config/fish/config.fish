function rcd
    set tmpfile "/tmp/pwd-from-ranger"
    ranger --choosedir=$tmpfile $argv
    set rangerpwd (cat $tmpfile)
    if test "$PWD" != $rangerpwd
        cd $rangerpwd
    end
end

function venv
    . ~/venv/$argv/bin/activate.fish
end

function ll
    ls -latrh
end

function su
    sudo -Es
end

function cat
    type bat >/dev/null 2>&1 && bat $argv || command cat $argv
end

function grep
    type rg >/dev/null 2>&1 && rg $argv || command grep $argv
end

function ping
    type mtr >/dev/null 2>&1 && mtr $argv || command ping $argv
end

function traceroute
    type mtr >/dev/null 2>&1 && mtr $argv || command traceroute $argv
end

# Auto-completion for ssh-add.
function __fish_ssh_add
  # basename -a -s .pub ~/.ssh/id_*
  string replace -r '.*id_(\w+)\.pub$' '$1' ~/.ssh/id_*.pub
end
complete -f -c ssh-add -a '(__fish_ssh_add)'

# Auto-completion for venv environments.
function __fish_venv_envs
  basename -a ~/venv/*/
end
complete -f -c venv -a '(__fish_venv_envs)'

# Auto-completion for conda environments.
function __fish_conda_envs
  basename -a ~/.conda/envs/*/
end
function __fish_conda_env_commands
  string replace -r '.*_([a-z]+)\.py$' '$1' /lib/python*/site-packages/conda_env/cli/main_*.py
end
complete -f -c conda -n '__fish_conda_using_command env' -a '(__fish_conda_env_commands)'
complete -f -c conda -n '__fish_conda_using_command activate' -a '(__fish_conda_envs)'

# pyenv (alternative in .profile)
status --is-interactive; and pyenv init - | source
status --is-interactive; and pyenv virtualenv-init - | source
