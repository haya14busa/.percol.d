# Functions
function exists { which $1 &> /dev/null }

# load percol sources
if [ -d ~/.percol.d/zsh/plugins/ ]; then
    for f (~/.percol.d/zsh/plugins/*) source "${f}"
fi

bindkey '^o' percol_src
bindkey '^r' percol_select_history
# bindkey '^G^A' percol-git-recent-all-branches # XXX: usage?
bindkey '^g^r' percol-git-recent-remote-branches
bindkey '^g^b' percol-git-recent-branches
bindkey "^g^l" percol-git-log
bindkey "^gb" percol-git-branch

bindkey '^xb' percol-cdr


# NOTE:
# - [ターミナル版anything的なpercolをzawの代わりに試してみた - $shibayu36->blog;](http://shibayu36.hatenablog.com/entry/2013/10/06/184146)
