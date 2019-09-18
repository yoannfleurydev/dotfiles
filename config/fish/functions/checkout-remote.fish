# Defined in /home/yfleury/.config/fish/functions/checkout-remote.fish @ line 2
function checkout-remote
	git fetch
    set branches (git branch --all | grep -v HEAD)
    set branch (printf '%s\n' $branches | fzf +m)
    git checkout (echo $branch | sed "s/.* //" | sed "s#remotes/[^/]*/##")
end
