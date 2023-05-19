#!/bin/bash # script BuildLoopReleased.sh

############################################################
# Required parameters for any build script that uses
#   inline build_functions
############################################################

BUILD_DIR=~/Downloads/BuildLoop
OVERRIDE_FILE=LoopConfigOverride.xcconfig
DEV_TEAM_SETTING_NAME="LOOP_DEVELOPMENT_TEAM"

#!inline build_functions.sh

############################################################
# The rest of this is specific to the particular script
############################################################

open_source_warning


URL_THIS_SCRIPT="https://github.com/LoopKit/LoopWorkspace.git"
URL_FOR_LNL="https://github.com/loopnlearn/LoopWorkspace.git"

if [ -z "$CUSTOM_BRANCH" ]; then
    function choose_loop() {
        branch_select ${URL_THIS_SCRIPT} main Loop
    }

    function choose_loop_with_patches() {
        branch_select ${URL_FOR_LNL} main_lnl_patches Loop_lnl_patches
    }
    
    section_separator
    echo -e "${INFO_FONT}You should be familiar with the documenation found at:${NC}"
    echo -e "   https://loopdocs.org"
    echo -e ""
    echo -e "Select which version of Loop to download and build."
    echo -e "   Loop:"
    echo -e "      This is always the current released version"
    echo -e "      More info at https://github.com/LoopKit/Loop/releases"
    echo -e "   Loop with Patches:"
    echo -e "      Adds 2 CGM options, CustomTypeOne LoopPatches, new Logo"
    echo -e "      More info at https://www.loopandlearn.org/main-lnl-patches"
    echo -e "You need Xcode and Xcode command line tools installed"
    section_divider

    options=("Loop" "Loop with Patches" "Cancel")
    actions=("choose_loop" "choose_loop_with_patches" "exit_script")
    menu_select "${options[@]}" "${actions[@]}"
else
    section_separator
    echo -e "You are about to download $CUSTOM_BRANCH branch from"
    echo -e "  ${CUSTOM_URL:-${URL_THIS_SCRIPT}}\n"
    return_when_ready
    branch_select ${CUSTOM_URL:-${URL_THIS_SCRIPT}} $CUSTOM_BRANCH
fi

############################################################
# Standard Build train
############################################################

standard_build_train

############################################################
# Open Xcode
############################################################

section_separator
before_final_return_message
echo -e ""
return_when_ready
cd $REPO_NAME
xed . 
exit_message

