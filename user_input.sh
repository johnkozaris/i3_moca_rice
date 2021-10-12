#!/bin/bash
. ./input_elements.sh

# ------------------------------------------Startup Apps
echo "Select Auto-Startup Applications"
echo "Dunst (Core), Polybar (Core), PulseAudio(Core), Nitroge (Core), Feh (Core), Clipit (Tool),Flameshot (Tool)"
echo "Select Application to be installed"
OPTIONS_VALUES=("JetBrains Toolbox" "Discord" "Signal" "Firefox" "Atom" "VSCode" "PavuControl" "BlueMan" "Alacritty" "Zathura")
OPTIONS_LABELS=("Development" "Social" "Social" "Browser" "Editor" "Editor" "Core" "Core" "Terminal" "Documents")

for i in "${!OPTIONS_VALUES[@]}"; do
	OPTIONS_STRING+="${OPTIONS_VALUES[$i]} (${OPTIONS_LABELS[$i]});"
done

prompt_for_multiselect SELECTED "$OPTIONS_STRING"

for i in "${!SELECTED[@]}"; do
	if [ "${SELECTED[$i]}" == "true" ]; then
		CHECKED+=("${OPTIONS_VALUES[$i]}")
	fi
done
echo "${CHECKED[@]}"
# ------------------------------------------BlueMan
read -p "Do you have a Bluetooth Adapter?(Y)es (N)o" BLANSWER

case "$BLANSWER" in
  [yY] | [yY][eE][sS])
    echo "Yes"
    ;;
  [nN] | [nN][oO])
    echo  "No"
    ;;
  *)
    echo "Please enter Yes or No"
    ;;
esac
# ------------------------------------------Keyboard Layouts
echo Yes
read -p "Do you require extra keyboard layouts? Specify language codes seperated by ',' : ex: el,en  " LANGANSWER
echo "el,en"

case "$BLANSWER" in
  [yY] | [yY][eE][sS])
    echo "Yes"
    ;;
  [nN] | [nN][oO])
    echo  "No"
    ;;
  *)
    echo "Please enter Yes or No"
    ;;
esac

# ------------------------------------------ Wireless
read -p "Do you have a Wireless Adapter? (Y)es (N)o" WLANSWER
echo "Yes"

case "$BLANSWER" in
  [yY] | [yY][eE][sS])
    echo "Yes"
    ;;
  [nN] | [nN][oO])
    echo  "No"
    ;;
  *)
    echo "Please enter Yes or No"
    ;;
esac
# ------------------------------------------ Install Packages
echo "Select Application to be installed"
OPTIONS_VALUES=("JetBrains Toolbox" "Discord" "Signal" "Firefox" "Atom" "VSCode" "PavuControl" "BlueMan" "Alacritty" "Zathura")
OPTIONS_LABELS=("Development" "Social" "Social" "Browser" "Editor" "Editor" "Core" "Core" "Terminal" "Documents")

for i in "${!OPTIONS_VALUES[@]}"; do
	OPTIONS_STRING+="${OPTIONS_VALUES[$i]} (${OPTIONS_LABELS[$i]});"
done

prompt_for_multiselect SELECTED "$OPTIONS_STRING"

for i in "${!SELECTED[@]}"; do
	if [ "${SELECTED[$i]}" == "true" ]; then
		CHECKED+=("${OPTIONS_VALUES[$i]}")
	fi
done
echo "${CHECKED[@]}"

# ------------------------------------------ Save as Config

read -p "Do you want to save your choices for an easy re-Sync in the future?(Y)es (N)o" MAKECONFIGANSWER
echo "Yes"

case "MAKECONFIGANSWER" in
  [yY] | [yY][eE][sS])
    echo "Yes"
    ;;
  [nN] | [nN][oO])
    echo  "No"
    ;;
  *)
    echo "Please enter Yes or No"
    ;;
esac
