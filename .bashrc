
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.share"

export QT_FONT_DPI=80
export QT_STYLE_OVERRIDE='adwaita'

export XAUTHORITY="${XDG_RUNTIME_DIR}/Xauthority"
export VIMINIT=":source ${XDG_CONFIG_HOME}/vim/vimrc"

export ANDROID_HOME="${HOME}/devlop/android-sdk"

export EDITOR='vim'
export TERM='xterm-256color'

export DEVKITPRO='/opt/devkitpro'
export DEVKITARM="${DEVKITPRO}/devkitARM"
export DEVKITPPC="${DEVKITPRO}/devkitPPC"
export MINGWSDLPC='/home/ladis/devlop/mingw/SDL2/x86_64-w64-mingw32/lib/pkgconfig/'

export PATH="${PATH}:${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/platform-tools:${HOME}/devlop/php:${DEVKITPRO}/tools/bin"

#export MOZ_ACCELERATED=1
#export MOZ_WEBRENDER=1

unset HISTFILE
export LESSHISTFILE='-'
export SQLITE_HISTORY='-'
export NODE_REPL_HISTORY=''

export HISTCONTROL='ignoreboth'
export PS1='\n\e[32m\u@\h \e[33m\w \e[34m$(git-branch)\e[0m\n$ '

function launch {
  "${1}" 2>&1 1>/dev/null &
  disown
}

function git-branch {
  local branch

  branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
  if [[ -n "${branch}" ]]; then
    branch="(${branch})"
  fi

  echo "${branch}"
}

alias pac-files='find / -regextype posix-extended -regex ".+\.pac(new|save)" 2> /dev/null'
alias pac-explicit='pacman -Qeq | sort'
alias pac-orphans='pacman -Qtdq | sort'

alias motherboard='cat /sys/devices/virtual/dmi/id/board_{vendor,name,version}'

alias ls-a='ls -vahl --color=auto --group-directories-first'
alias rl-hid='modprobe -r usbhid; modprobe usbhid'

#alias steam='su -l -s /bin/bash -c "/bin/env PULSE_SERVER=unix:/tmp/steam-audio steam" steam'
alias dotnet='DOTNET_CLI_TELEMETRY_OPTOUT=1 /usr/bin/dotnet'
alias nginx='/usr/bin/nginx -c ~/devlop/nginx/nginx.conf -p ~/devlop/nginx'
alias mvn="/usr/bin/mvn -s '${XDG_CONFIG_HOME}/maven/settings.xml'"
alias sshd="/usr/bin/sshd -f '${XDG_CONFIG_HOME}/sshd/config'"
alias startx="/usr/bin/startx '${XDG_CONFIG_HOME}/X11/xinitrc'"
alias vin='TERM=xterm-color /usr/bin/vim'
alias kbdlight='echo 1 > /sys/devices/platform/sony-laptop/kbd_backlight'
alias xdispoff='xset dpms force standby'
alias dotfiles="/usr/bin/git --git-dir='${HOME}/.dotfiles' --work-tree='${HOME}'"

