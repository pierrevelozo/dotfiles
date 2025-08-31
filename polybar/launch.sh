#!/usr/bin/env sh

# Termine instâncias de barras em execução
killall -q polybar

# Espere até que os processos em execução terminem
while pgrep -x polybar >/dev/null; do sleep 1; done

# Lance a Polybar, usando a configuração padrão ~/.config/polybar/config.ini
# A linha abaixo irá lançar a barra chamada "example"
polybar example &

echo "Polybar lançada..."
