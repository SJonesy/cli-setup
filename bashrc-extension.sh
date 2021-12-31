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
PS1='\[\033[01;32m\][$(date +%H:%M)] \[\033[01;34m\]\w/${C_END} \$ '

# DISPLAY MOTD
echo "" > weather_report.txt
source $SCRIPT_DIR/utils/wttr.sh "${ZIP_CODE}?0&u" >> weather_report.txt
fortune|cowthink >> fortune.txt
python $SCRIPT_DIR/utils/padprint.py 45 weather_report.txt fortune.txt
rm weather_report.txt fortune.txt

