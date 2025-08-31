#!/usr/bin/env python3
import i3ipc

# Mapeamento de classes de janelas para ícones.
# Adicione aqui as aplicações que você mais usa!
# Para descobrir a classe de uma janela, use o comando 'xprop WM_CLASS' e clique nela.
ICONS_MAP = {
    "xfce4-terminal": " Terminal ",
    "spotify": "ᯤ Spotify ",
    "zen": "🔍︎ Zen ", # Mantendo o seu "zen"
    "firefox": " Firefox ",
    "google-chrome": " Chrome ",
    "thunar": " Files ",
    "code-oss": " ",
    "jetbrains-idea": "  JetBrains ",
    "vlc": " VLC ",
    "default": "  ", # Ícone padrão para janelas não mapeadas
}

def get_icon_for_window(window):
    """Encontra o ícone apropriado para uma janela com base na sua classe."""
    # Tenta usar a 'window_class' primeiro, que é mais geral
    app_class = (window.window_class or "").lower()
    
    # Se não encontrar, tenta a 'window_instance', que pode ser mais específica
    if app_class not in ICONS_MAP:
        app_class = (window.window_instance or "").lower()

    return ICONS_MAP.get(app_class, ICONS_MAP["default"])

def rename_workspaces(i3, _):
    """
    Esta função é chamada em eventos de janela (abrir, fechar, mover, focar)
    e renomeia todos os workspaces para refletir seu conteúdo.
    """
    for workspace in i3.get_tree().workspaces():
        # Pega os ícones de todas as janelas no workspace
        # O 'set' garante que não haverá ícones duplicados
        icons = {get_icon_for_window(w) for w in workspace.leaves()}
        
        # Formata o novo nome do workspace
        icon_str = " ".join(icons)
        new_name = f"{workspace.num}: {icon_str}"
        
        # Renomeia o workspace
        i3.command(f'rename workspace "{workspace.name}" to "{new_name}"')

def main():
    # Cria a conexão com o i3
    i3 = i3ipc.Connection()

    # Assina os eventos que nos interessam
    # Quando uma janela muda de foco, é aberta/fechada ou movida.
    i3.on(i3ipc.Event.WINDOW_FOCUS, rename_workspaces)
    i3.on(i3ipc.Event.WINDOW_CLOSE, rename_workspaces)
    i3.on(i3ipc.Event.WINDOW_MOVE, rename_workspaces)

    # Inicia o loop principal para escutar os eventos
    print("Script de workspaces dinâmicos iniciado...")
    rename_workspaces(i3, None) # Renomeia tudo na inicialização
    i3.main()

if __name__ == "__main__":
    main()
