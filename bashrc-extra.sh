C_END=$(echo -e '\033[00m')
PS1='\[\033[01;32m\][$(date +%H:%M)] \[\033[01;34m\]\w/${C_END} \$ '

source ~/projects/cli-setup/utils/wttr.sh

fortune|cowsay|lolcat
