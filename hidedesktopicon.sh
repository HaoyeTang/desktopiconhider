#!/bin/bash
ls -a /usr/share/applications/

echo 
cd /usr/share/applications/ || exit

read -r -e -p "Enter the thing you want to hide:" thing
pathtothing="/usr/share/applications/$thing"

if [ -e "$thing" ]; then
    if grep -Fxq "NoDisplay=true" "$thing"; then
        echo "It is already hidden!"
    else
        echo NoDisplay=true >> "$thing"
        echo "It's now hidden!"
    fi
else
    if [ -e "$thing.desktop" ]; then
        if grep -Fxq "NoDisplay=true" "$thing.desktop"; then
            echo "It is already hidden!"
        else
            echo NoDisplay=true >> "$thing.desktop"
            echo "It's now hidden!"
        fi
    else
        if [ -e "$pathtothing.desktop" ]; then
            if grep -Fxq "NoDisplay=true" "$pathtothing.desktop"; then
                echo "It is already hidden!"
            else
                echo NoDisplay=true >> "$pathtothing.desktop"
                echo "It's now hidden!"
            fi
    	else
            if [ -e "$pathtothing" ]; then
                if grep -Fxq "NoDisplay=true" "$pathtothing"; then
                    echo "It is already hidden!"
                else
                    echo NoDisplay=true >> "$pathtothing"
                    echo "It's now hidden!"
                fi
            else
                echo "File doesn't exist, bitch"
            fi
        fi
    fi
fi
