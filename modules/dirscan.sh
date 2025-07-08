#!/bin/bash

source ../colors.sh

function dir_scan() {
  read -rp "Hedef URL (http:// veya https://): " url
  if [[ -z "$url" ]]; then
    echo -e "${RED}URL boş olamaz.${RESET}"
    exit 1
  fi

  wordlist="wordlists/common_dirs.txt"

  if [[ ! -f "$wordlist" ]]; then
    echo -e "${RED}Wordlist bulunamadı: $wordlist${RESET}"
    exit 1
  fi

  echo -e "${YELLOW}Dizinler taranıyor...${RESET}"

  while read -r dir; do
    status=$(curl -s -o /dev/null -w "%{http_code}" "$url/$dir/")
    if [[ "$status" == "200" || "$status" == "301" || "$status" == "302" ]]; then
      echo -e "${GREEN}[BULUNDU] $url/$dir/${RESET}"
    fi
  done < "$wordlist"

  read -rp "Devam etmek için Enter'a basın..."
}

dir_scan