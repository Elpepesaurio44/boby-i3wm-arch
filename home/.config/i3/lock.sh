#!/bin/sh

# 1. Cargar los colores de Pywal
if [ -f "$HOME/.cache/wal/colors.sh" ]; then
    . "$HOME/.cache/wal/colors.sh"
fi

# 2. Función para quitar el '#' de los colores (i3lock-color lo exige así)
fix_color() {
    echo "$1" | sed 's/#//g'
}

# 3. Asignar colores de Pywal a variables
alpha='dd'
background=$(fix_color "$color0")
selection=$(fix_color "$color8")
yellow=$(fix_color "$color3")
red=$(fix_color "$color1")
magenta=$(fix_color "$color5")
blue=$(fix_color "$color4")
cyan=$(fix_color "$color6")
green=$(fix_color "$color2")
text_color=$(fix_color "$color7")

# 4. Ruta del icono (Cámbiala por la ruta de tu imagen favorita)
# Un tamaño de 100x100px suele quedar perfecto.
icon="$HOME/.config/i3/lock.png"

i3lock \
  --insidever-color=$background$alpha \
  --insidewrong-color=$background$alpha \
  --inside-color=$background"00" \
  --ringver-color=$green$alpha \
  --ringwrong-color=$red$alpha \
  --ring-color=$blue$alpha \
  --line-uses-ring \
  --keyhl-color=$magenta$alpha \
  --bshl-color=$yellow$alpha \
  --separator-color=$background$alpha \
  --verif-color=$green \
  --wrong-color=$red \
  --modif-color=$red \
  --layout-color=$blue \
  --date-color=$text_color \
  --time-color=$text_color \
  --screen 1 \
  --blur 7 \
  --clock \
  --indicator \
  --time-str="%H:%M:%S" \
  --date-str="%A %e %B %Y" \
  --verif-text="Verificando..." \
  --wrong-text="Contraseña Incorrecta" \
  --noinput="Vacío" \
  --radius=120 \
  --ring-width=10 \
  --pass-media-keys \
  --pass-screen-keys \
  --pass-volume-keys \
  --time-font="JetBrainsMono Nerd Font" \
  --date-font="JetBrainsMono Nerd Font" \
  --verif-font="JetBrainsMono Nerd Font" \
  --wrong-font="JetBrainsMono Nerd Font" \
  --centered \
  ${icon:+--image=$icon} # Solo añade la imagen si la ruta existe
