function ultility_scripts {
    section_separator
    echo -e "JONAS WAS HERE"
    echo -e "${INFO_FONT}These utility scripts automate several cleanup actions${NC}"
    echo -e ""
    echo -e " 1. Delete Old Downloads:"
    echo -e "     This will keep the most recent download for each build type"
    echo -e "     It asks before deleting any folders"
    echo -e " 2. Clean Derived Data:"
    echo -e "     Free space on your disk from old Xcode builds."
    echo -e "     You should quit Xcode before running this script."
    echo -e " 3. Xcode Cleanup (The Big One):"
    echo -e "     Clears more disk space filled up by using Xcode."
    echo -e "     * Use after uninstalling Xcode prior to new installation"
    echo -e "     * It can free up a substantial amount of disk space"
    echo -e " 4. Clean Profiles:"
    echo -e "     Deletes any provisioning profiles on your Mac"
    echo -e "     * Next time you build, Xcode will generate a new one"
    echo -e "     * Ensures the next app you build with Xcode will last a year"
    section_divider

    options=(
        "Delete Old Downloads"
        "Clean Derived Data"
        "Xcode Cleanup"
        "Clean Profiles"
        "Return to Menu"
    )
    actions=(
        "run_script 'DeleteOldDownloads.sh'"
        "run_script 'CleanDerived.sh'"
        "run_script 'XcodeClean.sh'"
        "run_script 'CleanProfiles.sh'"
        return
    )
    menu_select "${options[@]}" "${actions[@]}"
}