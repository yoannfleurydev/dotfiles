# Defined in /tmp/fish.FIUC4y/checkout.fish @ line 2
function checkout
    set branches (git --no-pager branch -vv)
    set branch (printf '%s\n' $branches | fzf +m --preview 'git diff (git merge-base master {1})..{1} --name-status')
    if test $status -eq 0
        git checkout (echo "$branch" | awk '{print $1}' | sed "s/.* //")
    end
end
