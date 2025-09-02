#!/bin/bash

#==========================================================
#
#
#   ██████╗  ██████╗ ██╗  ██╗   ██╗██████╗  █████╗ ██████╗
#   ██╔══██╗██╔═══██╗██║  ╚██╗ ██╔╝██╔══██╗██╔══██╗██╔══██╗
#   ██████╔╝██║   ██║██║   ╚████╔╝ ██████╔╝███████║██████╔╝
#   ██╔═══╝ ██║   ██║██║    ╚██╔╝  ██╔══██╗██╔══██║██╔══██╗
#   ██║     ╚██████╔╝███████╗██║   ██████╔╝██║  ██║██║  ██║
#   ╚═╝      ╚═════╝ ╚══════╝╚═╝   ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝
#   Startup script
#
#   Created by Pierre Velozo - https://pierrevelozo.com
#
#==========================================================

# Termine instâncias de barras em execução
killall -q polybar
# Espere até que os processos em execução terminem
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Encontra o monitor primário e os ativos
PRIMARY_MONITOR=$(xrandr --query | grep -w 'connected' | grep 'primary' | cut -d' ' -f1)
ACTIVE_MONITORS=$(xrandr --query | grep -w 'connected' | cut -d' ' -f1)

# Lança uma barra para cada monitor ATIVO
for m in $ACTIVE_MONITORS; do
  if [[ "$m" == "$PRIMARY_MONITOR" ]]; then
    # Lança a barra primária (com systray) no monitor primário
    echo "--- Lançando barra primária em $m ---"
    MONITOR=$m polybar --reload primary &
  else
    # Lança a barra secundária (sem systray) nos outros
    echo "--- Lançando barra secundária em $m ---"
    MONITOR=$m polybar --reload secondary &
  fi
done

echo "Polybar lançada..."
