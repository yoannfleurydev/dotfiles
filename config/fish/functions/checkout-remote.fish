# Defined in /tmp/fish.wWmc01/checkout-remote.fish @ line 2
function checkout-remote
	set branches (git branch --all | grep -v HEAD)
    set branch (printf '%s\n' $branches | fzf +m)
    git checkout (echo $branch | sed "s/.* //" | set "s#remotes/[^/]*/##")
end
