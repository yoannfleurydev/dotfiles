# Defined in /tmp/fish.dWhpv8/checkout.fish @ line 2
function checkout
	set branches (git --no-pager branch -vv)
    set branch (printf '%s\n' $branches | fzf +m)
    if test $status -eq 0
        git checkout (echo "$branch" | awk '{print $1}' | sed "s/.* //")
    end
end
