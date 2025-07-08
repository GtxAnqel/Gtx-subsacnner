#!/bin/bash
read -p "Hedef domain: " domain
for sub in www ftp mail dev test admin ; do
  full="$sub.$domain"
  ping -c 1 "$full" > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    echo "[✓] $full aktif"
  else
    echo "[✗] $full erişilemiyor"
  fi
done