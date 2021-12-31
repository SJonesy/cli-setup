# Update the configuration section, then add "source [this-file.sh]"
# to the end of ~/.bashrc

### CONFIGURATION ###
ZIP_CODE=60625
### END CONFIGURATION ###

C_END=$(echo -e '\033[00m')
PS1='\[\033[01;32m\][$(date +%H:%M)] \[\033[01;34m\]\w/${C_END} \$ '

source bash-aliases.sh
source ./utils/wttr.sh "${ZIP_CODE}?0&u"

fortune|cowsay|lolcat
