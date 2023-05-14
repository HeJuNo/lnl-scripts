#!/bin/bash # script BuildxDrip4iOS.sh

############################################################
# Required parameters for any build script that uses
#   inline build_functions
############################################################

BUILD_DIR=~/Downloads/BuildxDrip4iOS
OVERRIDE_FILE=xDripConfigOverride.xcconfig
DEV_TEAM_SETTING_NAME="XDRIP_DEVELOPMENT_TEAM"

# value of 2 adds additional line to Override file in repo
USE_OVERRIDE_IN_REPO="2"
ADDED_LINE_FOR_OVERRIDE=("MAIN_APP_DISPLAY_NAME=xDrip4iO5" \
    "MAIN_APP_BUNDLE_IDENTIFIER=com.\$(DEVELOPMENT_TEAM).xdripswift")

# sub modules are not required
CLONE_SUB_MODULES="0"

#!inline build_functions.sh


############################################################
# The rest of this is specific to the particular script
############################################################

initial_greeting


############################################################
# Welcome & Branch Selection
############################################################

URL_THIS_SCRIPT="https://github.com/JohanDegraeve/xdripswift.git"

function choose_main_branch() {
    branch_select ${URL_THIS_SCRIPT} master xDrip4iOS
}

if [ -z "$CUSTOM_BRANCH" ]; then
    section_separator
    echo -e "\n${RED}${BOLD}You are running the script to build xDrip4iOS${NC}"
    echo -e " If you have not read the docs - please review before continuing"
    echo -e "    https://xdrip4ios.readthedocs.io/en/latest/"

    options=("Continue" "Cancel")
    actions=("choose_main_branch" "cancel_entry")
    menu_select "${options[@]}" "${actions[@]}"
else
    branch_select ${URL_THIS_SCRIPT} $CUSTOM_BRANCH
fi

############################################################
# Standard Build train
############################################################

standard_build_train

############################################################
# Open Xcode
############################################################

section_separator
before_final_return_message_without_watch
echo -e ""
return_when_ready
cd $REPO_NAME
xed . 
exit_message
