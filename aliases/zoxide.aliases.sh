if command -v zoxide &> /dev/null; then
    alias cd="zd"
zd() {
    if [ $# -eq 0 ]; then
        builtin cd ~ && return
    elif [ -d "$1" ]; then
        builtin cd "$1"
    else
        z "$@" && printf "\U000F17A9 " && pwd || echo "Error: Directory not found"
    fi
}
zo(){
    local items
    items=("..")
    while IFS= read -r line; do
        items+=("$line")
    done < <(ls -1)
    local selected_item
    selected_item=$(printf '%s\n' "${items[@]}" | fzf --layout=reverse --header "$(pwd)" --height 90% --preview "eza --color=always {} -T")
    if [[ -n "$selected_item" ]]; then
        if [[ -d "$selected_item" ]]; then
            cd "$selected_item" || return
            zo  # recursively call zo
        else
            xdg-open "$selected_item" &>/dev/null &
        fi
    fi
}
fi

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
