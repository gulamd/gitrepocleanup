#!/bin/bash

##
# Script to delete remote git branches
##

# Fetch the remote resources
git fetch

# Loop through all remote merged branches
for branch in $(git branch -r --merged | grep -v HEAD | grep -v main | grep -v master | grep -v master | sed /\*/d); do
        if [ -z "$(git log -1 --since='Jun 15, 2020' -s ${branch})" ]; then
                echo -e `git show --format="%ci %cr %an" ${branch} | head -n 1` \\t$branch
                remote_branch=$(echo ${branch} | sed 's#origin/##' )
                # To delete the branches uncomment the bellow git delete command
                git push origin --delete ${remote_branch}
        fi
done
