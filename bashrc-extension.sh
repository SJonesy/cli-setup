# Update the configuration section, then add "source [this-file.sh]"
# to the end of ~/.bashrc

### CONFIGURATION ###
ZIP_CODE=60625
### END CONFIGURATION ###

# SETUP
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# LOAD OTHER STUFF
source $SCRIPT_DIR/bash-aliases.sh

# SET PROMPT
C_END=$(echo -e '\033[00m')
GREEN=$(echo -e '\033[01;32m')
BLUE=$(echo -e '\033[01;34m')
# surrounding the colors with \[ and \] fixes trailing text problems
# see: https://askubuntu.com/a/598816
PS1='\[${GREEN}\][$(date +%H:%M)] \[${BLUE}\]\w/\[${C_END}\] \$ '

# DISPLAY MOTD
neofetch
echo "" > weather_report.txt
source $SCRIPT_DIR/utils/wttr.sh "${ZIP_CODE}?0&u" >> weather_report.txt
fortune|cowthink >> fortune.txt
python $SCRIPT_DIR/utils/padprint.py 47 fortune.txt weather_report.txt
rm weather_report.txt fortune.txt

