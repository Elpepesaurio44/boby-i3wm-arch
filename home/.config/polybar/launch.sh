#!/usr/bin/env bash

# 1. Terminar instancias de polybar que ya se estén ejecutando
killall -q polybar

# 2. Esperar a que los procesos se hayan cerrado completamente
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# 3. Lanzar Polybar en todos los monitores detectados
if type "xrandr"; then
  # Para cada monitor conectado, lanza la barra 'mytint2'
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload mytint2 &
  done
else
  # Si no hay xrandr, intenta lanzarla de forma normal
  polybar --reload mytint2 &
fi

echo "Polybar iniciada en todos los monitores..."
