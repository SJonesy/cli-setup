# Update the configuration section, then add "source [this-file.sh]"
# to the end of ~/.bashrc

### CONFIGURATION ###
ZIP_CODE=60625
### END CONFIGURATION ###

# LOAD OTHER STUFF
source bash-aliases.sh

# SET PROMPT
C_END=$(echo -e '\033[00m')
PS1='\[\033[01;32m\][$(date +%H:%M)] \[\033[01;34m\]\w/${C_END} \$ '

# DISPLAY MOTD
echo "" > weather_report.txt
source ./utils/wttr.sh "${ZIP_CODE}?0&u" >> weather_report.txt
fortune|cowthink >> fortune.txt
python utils/padprint.py 45 weather_report.txt fortune.txt
rm weather_report.txt fortune.txt

