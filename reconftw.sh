#!/bin/bash

# Renkler
RED='\033[1;31m' GREEN='\033[1;32m' CYAN='\033[1;36m' YELLOW='\033[1;33m' RESET='\033[0m' BOLD='\033[1m'

function banner() {
  clear
  echo -e "${CYAN}${BOLD}"
  echo "  ____                  __     _______ _____ "
  echo " |  _ \ ___  ___ _ __  / _|   |__   __|_   _|"
  echo " | |_) / _ \/ _ \ '_ \| |_ ______| |    | |  "
  echo " |  _ <  __/  __/ | | |  _|______| |    | |  "
  echo " |_| \_\___|\___|_| |_|_|        |_|    |_|  "
  echo -e "${RESET}"
  echo -e "${YELLOW}ReconFTW - Basit Etik Hacker Keşif Aracı${RESET}\n"
}

function pause() {
  read -rp "Devam etmek için Enter'a basın..."
}

function main_menu() {
  while true; do
    banner
    echo -e "${GREEN}1) Subdomain Bulma"
    echo "2) Port Tarama"
    echo "3) Dizin Taraması"
    echo "4) Çıkış"
    echo -ne "${CYAN}Seçiminiz: ${RESET}"
    read -r secim
    case $secim in
      1) ./modules/subdomain.sh ;;
      2) ./modules/portscan.sh ;;
      3) ./modules/dirscan.sh ;;
      4) echo -e "${YELLOW}Çıkış yapılıyor...${RESET}"; exit 0 ;;
      *) echo -e "${RED}Geçersiz seçim! Tekrar deneyin.${RESET}"; sleep 1 ;;
    esac
  done
}

main_menu