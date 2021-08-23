# !/bin/bash


clear
echo -e "\n\n🕒 Please be patient. On older computers and virtual machines, this may take 5-10 minutes or longer to run.\n"

echo -e "\n\n✅ Removing Developer iOS DeviceSupport Library\n"
rm -rf "$HOME/Library/Developer/Xcode/iOS\ DeviceSupport"

echo -e "✅ Removing Developer watchOS DeviceSupport Library\n"
rm -rf "$HOME/Library/Developer/Xcode/watchOS\ DeviceSupport"

echo -e "✅ Removing Developer DerivedData\n"
rm -rf "$HOME/Library/Developer/Xcode/DerivedData"

echo -e "🛑  Please Reboot Now\n\n";
exit 0
