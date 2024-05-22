if status is-interactive
    set fish_greeting # disable greeting

    if command -q nix-your-shell
        nix-your-shell fish | source
    end

    if command -q starship
        starship init fish | source
    end

    if command -q direnv
        direnv hook fish | source
    end

    if command -q fzf
        fzf --fish | source
    else if test -e /usr/share/fzf/shell/key-bindings.fish
        source /usr/share/fzf/shell/key-bindings.fish
    end

    if command -q eza
        alias ll="eza -l"
        alias la="eza -la"
        alias ls="eza"
    end

    if command -q bat
        alias cat="bat --paging=never"
    end
end
