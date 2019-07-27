# Defined in /tmp/fish.pcHoaB/checkout.fish @ line 2
function checkout
	set branches (git --no-pager branch -vv)
    set branch (printf '%s\n' $branches | fzf +m)
    git checkout (echo "$branch" | awk '{print $1}' | sed "s/.* //")
end
