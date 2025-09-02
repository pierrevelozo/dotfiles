#!/bin/bash

#==========================================================
#
#   Created by Pierre Velozo - https://pierrevelozo.com
#
#   Este script usa o i3-msg e o jq para encontrar o título da janela
#   que está em foco DENTRO do monitor que a Polybar está rodando.
#   A variável $MONITOR é fornecida pelo nosso script launch.sh
#
#==========================================================

i3-msg -t get_tree | \
jq -r --arg monitor "$MONITOR" '
    # A função "recurse" desce por toda a árvore de janelas do i3
    # Em seguida, selecionamos o "output" (monitor) com o nome correto
    .. | select(.type?) | select(.name == $monitor and .type == "output") |
    # Dentro da árvore daquele monitor, encontramos o container que está focado
    .. | select(.focused?) | select(.focused == true) |
    # Finalmente, pegamos o nome (título) da janela
    .name
'