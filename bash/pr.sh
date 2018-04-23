token=$GITHUB_PERSONAL_ACCESS_TOKEN
user=`whoami`
owner=`git remote -v | head -1 | cut -f2 | cut -d'/' -f1 | cut -d':' -f2`
repo=`git remote -v | head -1 | cut -f2 | cut -d'/' -f2  | cut -d'.' -f1`
base=$1
head=`git rev-parse --abbrev-ref HEAD`
pr=`curl -X POST -u $user:$token "https://api.github.com/repos/$owner/$repo/pulls" -d '{"title":"'$head'","body":"PR sent via github api","head":"'$head'","base":"'$base'"}'`
echo $pr
number=`echo $pr | grep '^  "number":' | awk '{print $2}' | sed 's/,//'`
curl -X PATCH -u $user:$token "https://api.github.com/repos/$owner/$repo/issues/$number" -d '{"assignees":["'$user'"]}'
curl -X POST -u $user:$token "https://api.github.com/repos/$owner/$repo/pulls/$number/requested_reviewers" -d '{"reviewers":["akiratsai"]}'
