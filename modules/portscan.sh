#!/bin/bash

source ../colors.sh

function port_scan() {
  read -rp "Hedef IP veya domain: " target
  if [[ -z "$target" ]]; then
    echo -e "${RED}Hedef boş olamaz.${RESET}"
    exit 1
  fi

  echo -e "${YELLOW}Portlar taranıyor (örn: 20-100)...${RESET}"
  read -rp "Port aralığı: " range

  if [[ -z "$range" ]]; then
    echo -e "${RED}Port aralığı boş olamaz.${RESET}"
    exit 1
  fi

  for port in $(seq $(echo $range | cut -d- -f1) $(echo $range | cut -d- -f2)); do
    timeout 1 bash -c "echo > /dev/tcp/$target/$port" 2>/dev/null && echo -e "${GREEN}[AÇIK] Port: $port${RESET}"
  done

  read -rp "Devam etmek için Enter'a basın..."
}

port_scan