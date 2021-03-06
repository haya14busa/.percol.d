function percol-git-recent-branches () {
    local selected_branch=$(git for-each-ref --format='%(refname)' --sort=-committerdate refs/heads | \
        perl -pne 's{^refs/heads/}{}' | \
        percol --query "$LBUFFER")
    if [ -n "$selected_branch" ]; then
        BUFFER="git checkout ${selected_branch}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N percol-git-recent-branches

function percol-git-recent-remote-branches () {
    local selected_branch=$(git for-each-ref --format='%(refname)' --sort=-committerdate refs/remotes | \
        perl -pne 's{^refs/remotes/}{}' | \
        percol --query "$LBUFFER")
    if [ -n "$selected_branch" ]; then
        BUFFER="git checkout -t ${selected_branch}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N percol-git-recent-remote-branches

function percol-git-recent-all-branches () {
    local selected_branch=$(git for-each-ref --format='%(refname)' --sort=-committerdate refs/heads refs/remotes | \
        perl -pne 's{^refs/(heads|remotes)/}{}' | \
        percol --query "$LBUFFER")
    if [ -n "$selected_branch" ]; then
        BUFFER="git checkout -t ${selected_branch}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N percol-git-recent-all-branches

function percol-git-branch () {
    local selected_branch=$(git for-each-ref --format='%(refname)' --sort=-committerdate refs/heads | \
        perl -pne 's{^refs/heads/}{}' | \
        percol)
    if [ -n "$selected_branch" ]; then
        BUFFER=${BUFFER}${selected_branch}
        CURSOR=$#BUFFER
    fi
    zle clear-screen
}
zle -N percol-git-branch
