#!/bin/bash

# Colores y estilo
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
GREEN='\033[0;32m'
RED='\033[0;31m'
BOLD='\033[1m'
NC='\033[0m'

# Función de limpieza al salir
trap ctrl_c INT
function ctrl_c() {
    echo -e "\n${RED}[!] Instalación cancelada por el usuario.${NC}"
    exit 1
}

clear
# Título de Bienvenida
echo -e "${MAGENTA}${BOLD}"
echo "  __  __ _ _             ____       _                "
echo " |  \/  (_) |rd_   _    / ___|  ___| |_ _   _ _ __  "
echo " | |\/| | | / / | | |   \___ \ / _ \ __| | | | '_ \ "
echo " | |  | | |   <| |_| |    ___) |  __/ |_| |_| | |_) |"
echo " |_|  |_|_|_|\_\\__,_|   |____/ \___|\__|\__,_| .__/ "
echo "                                              |_|    "
echo -e "${CYAN}             Hatsune Miku Dotfiles System${NC}"
echo "-------------------------------------------------------"
echo -e "${BOLD}Este script instalará:${NC}"
echo -e " 1. Dependencias del sistema (Pacman/Yay)"
echo -e " 2. Configuraciones de ZSH y Starship"
echo -e " 3. Tema GRUB de Hatsune Miku"
echo -e " 4. Optimización Visual (Matrix Ly & LoveCandy)"
echo "-------------------------------------------------------"

read -p "Presiona [ENTER] para comenzar la instalación o [CTRL+C] para salir..."

# --- 1. INSTALACIÓN DE DEPENDENCIAS (Basado en tu archivo) ---
echo -e "\n${CYAN}[1/5] Instalando paquetes de Pacman...${NC}"
DEPENDENCIAS=(
    fastfetch ly git alacritty arandr polybar rofi feh python-pywal 
    pcmanfm ttf-jetbrains-mono-nerd zsh lsd zsh-autosuggestions 
    zsh-syntax-highlighting starship picom ttf-font-awesome cmatrix 
    cava libcaca yazi ffmpegthumbnailer poppler jq fzf imagemagick 
    python3 cmus eza ueberzugpp neovim make unzip gcc ripgrep fd 
    libfm-extra file-roller gvfs gvfs-mtp gvfs-nfs gvfs-smb tumbler 
    poppler-glib lxappearance materia-gtk-theme papirus-icon-theme 
    xorg-xsetroot mpv audacious zoxide base-devel
)

sudo pacman -S --needed --noconfirm "${DEPENDENCIAS[@]}"

# --- 2. INSTALACIÓN DE YAY (Si no existe) ---
if ! command -v yay &> /dev/null; then
    echo -e "\n${CYAN}[2/5] Instalando Yay (AUR Helper)...${NC}"
    git clone https://aur.archlinux.org/yay.git
    cd yay && makepkg -si --noconfirm && cd ..
    rm -rf yay
fi

echo -e "${CYAN}Instalando paquetes de AUR...${NC}"
yay -S --noconfirm i3lock-color xautolock

# --- 3. CONFIGURACIÓN DE PACMAN Y LY (Tu script miku-setup integrado) ---
echo -e "\n${CYAN}[3/5] Aplicando Miku-Setup (Matrix & LoveCandy)...${NC}"
# LoveCandy
sudo sed -i 's/^#Color/Color/' /etc/pacman.conf
if ! grep -q "ILoveCandy" /etc/pacman.conf; then
    sudo sed -i '/^Color/a ILoveCandy' /etc/pacman.conf
fi
# Matrix Ly
if [ -f "/etc/ly/config.ini" ]; then
    sudo sed -i 's/^#*animate =.*/animate = true/' /etc/ly/config.ini
    sudo sed -i 's/^#animation =.*/animation = 0/' /etc/ly/config.ini
fi

# --- 4. INSTALACIÓN DEL GRUB TEMA MIKU ---
echo -e "\n${CYAN}[4/5] Instalando Tema GRUB de Hatsune Miku...${NC}"
# Asumimos que el script está en la carpeta Hatsune Miku/
if [ -f "./Hatsune Miku/install.sh" ]; then
    cd "Hatsune Miku"
    chmod +x install.sh
    sudo ./install.sh
    cd ..
else
    echo -e "${RED}[!] No se encontró el instalador del GRUB en ./Hatsune Miku/install.sh${NC}"
fi

# --- 5. COPIA DE ARCHIVOS Y ZSH ---
echo -e "\n${CYAN}[5/5] Configurando ZSH y Dotfiles...${NC}"
# Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Plugins de ZSH
ZSH_CUSTOM_PLUGINS="$HOME/.oh-my-zsh/custom/plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM_PLUGINS}/zsh-autosuggestions 2>/dev/null
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM_PLUGINS}/zsh-syntax-highlighting 2>/dev/null

# Aplicar Starship si existe el archivo starship.toml en la carpeta actual
if [ -f "./starship.toml" ]; then
    mkdir -p ~/.config
    cp ./starship.toml ~/.config/starship.toml
fi

echo -e "\n${GREEN}${BOLD}¡INSTALACIÓN COMPLETADA! ✨${NC}"
echo -e "${CYAN}Reinicia tu sistema para ver los cambios en Ly y GRUB.${NC}"
