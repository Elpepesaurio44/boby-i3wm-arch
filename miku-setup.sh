#!/bin/bash

# Colores para la terminal
CYAN='\033[0;36m'
PINK='\033[0;35m'
NC='\033[0m' # No Color

echo -e "${CYAN}Iniciando configuración estilo Miku...${NC}"

# 1. Configurar Animación Matrix en Ly
LY_CONFIG="/etc/ly/config.ini"
if [ -f "$LY_CONFIG" ]; then
    echo -e "${PINK}[1/2]${NC} Activando animación en Ly..."
    sudo sed -i 's/^#*animate =.*/animate = true/' "$LY_CONFIG"
    # Asegurarse de que no esté comentada la línea de animación
    sudo sed -i 's/^#animation =.*/animation = 0/' "$LY_CONFIG"
else
    echo -e "Configuración de Ly no encontrada en $LY_CONFIG"
fi

# 2. Configurar ILoveCandy en Pacman
PACMAN_CONF="/etc/pacman.conf"
if [ -f "$PACMAN_CONF" ]; then
    echo -e "${PINK}[2/2]${NC} Activando ILoveCandy en Pacman..."
    
    # Activar Color si está comentado
    sudo sed -i 's/^#Color/Color/' "$PACMAN_CONF"
    
    # Agregar ILoveCandy si no existe
    if ! grep -q "ILoveCandy" "$PACMAN_CONF"; then
        sudo sed -i '/^Color/a ILoveCandy' "$PACMAN_CONF"
    fi
    
    # Opcional: Activar descargas paralelas para mayor velocidad
    sudo sed -i 's/^#ParallelDownloads/ParallelDownloads/' "$PACMAN_CONF"
else
    echo -e "No se encontró pacman.conf"
fi

echo -e "${CYAN}¡Listo! Ly tendrá Matrix y Pacman se verá como LoveCandy. ✨${NC}"
