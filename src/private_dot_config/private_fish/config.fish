export PATH="$HOME/.local/bin:$PATH"

function has
    command -v $argv > /dev/null 2>&1 && return 0 || return 1
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    if has starship
        starship init fish | source
    end

    if has atuin
        atuin import auto > /dev/null 2>&1
        atuin init fish | source
    end

    if has bat
        alias cat="bat --paging=never"
        function help
            $argv --help 2>&1 | bat --paging=never -l=help
        end
    end

    if has nvim
        alias vi="nvim"
        alias vim="nvim"
        export EDITOR="nvim"
    end

    if has eza
        alias ls='eza --icons -l -g -h --time-style long-iso'
    end

    if has fd
        alias find='fd -HI'
    end

    if has rg
        alias grep='rg --no-line-number'
    end

    if has fzf
        if has fd; then
            export FZF_CTRL_T_COMMAND='fd --strip-cwd-prefix --type file --follow --hidden --exclude .git --color=always'
            export FZF_DEFAULT_COMMAND='fd --strip-cwd-prefix --type file --follow --hidden --exclude .git --color=always'
            function fcd
                set selected (fd --type d -HI . "$(pwd)" | fzf --tac --no-multi --ansi --preview 'eza --icons -l -g -h --time-style long-iso {}' | awk '{print $1}')
                if test -n "$selected"
                    cd $selected
                end
            end
            function fvim
                set selected (fd --type f -HI . "$(pwd)" | fzf --tac --no-multi --ansi --preview 'bat --paging=never {}' | awk '{print $1}')
                if test -n "$selected"
                    vim $selected
                end
            end
        end
        export FZF_DEFAULT_OPTS='--ansi'

        function fkill
            set selected (ps -ef | fzf --tac --no-multi --ansi --preview 'echo {}' | awk '{print $2}')
            if test -n "$selected"
                kill $selected
            end
        end

        function fssh
            set selected (cat ~/.ssh/config | fzf --tac --no-multi --ansi --preview 'echo {}' | awk '{print $2}')
            if test -n "$selected"
                ssh $selected
            end
        end
    end

    if has gitui
        alias g="gitui"
    end

    if has dog
        alias nslookup="dog"
    end

    if has navi
        navi widget fish | source
    end

end
