git init -b main
git add . 
git commit -m "."
gh repo create APP_NAME --public
git remote add origin GITHUB_URL
git branch -M GIT_BRANCH
git push -u origin GIT_BRANCH
