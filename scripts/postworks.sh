#!/usr/bin/env bash
#PGTH is the private github token required to authenticate to git, must be present in the environment
#GIT_ORG is the github organization / user name where the repository should be created

function check_return_code () {
  # $1 = return code passed by $?
  # $2 = command successful message
  # $3 = error message
  [[ $1 -eq 0  ]] && echo "$2" || echo "$3"
}


function check_for_errors () {
  check_return_code $1 "$2" "$3"
  [[ $1 -ne 0  ]] && exit 1
}

function check_it_is_NOT_a_git_repository () {
  [ -d .git ] && echo " " || return
  echo "💥 FATAL ERROR! The directory is already a Git repository!"
  exit 1
}

function ensure_the_directory_is_the_new_repository () {
  PWD=$(pwd)
  shopt -s nocasematch
  [[ $PWD =~ $NEW_REPO_NAME  ]] && return $TRUE || echo "💥 seem the repository directory isn't created correctly!"
  shopt -u nocasematch
  exit 1
}

function gh_authentication () {
  echo " "
  echo "🔐 GH login ..."
  gh auth login --with-token < $PGHT
}


function gh_authentication_check () {
  echo " "
  echo "🔐 GH login check..."
  gh auth status
  if [ $? -ne 0 ]; then 
    exit 1
  fi
}

function set_git_credential_helper () {
  echo " "
    echo "🔐 set git credential helper..."
    gh auth setup-git -h=github.com
    if [ $? -ne 0 ]; then
        exit 1
      fi
}

function create_the_repo () {
  echo " "
  echo "⚙️  creating the repository"
  git init
  gh repo create $GIT_ORG/$NEW_REPO_NAME --public --source=. --remote=origin
  check_for_errors $? "☑️  Repository created correctly"  "💥 GitHub client 🙀 terminated with an unexpected exit code..."
}

function set_the_remote () {
  echo " "
  echo "⚙️  set remote for new repository"
  git branch -M main
  git remote set-url origin https://github.com/$GIT_ORG/$NEW_REPO_NAME.git
  check_for_errors $? "☑️  Remore created correctly"  "💥 git command 🙀 terminated with an unexpected exit code..."
}

function npm_install () {
  echo " "
  echo "🚧 npm install 🚧"
  echo "⏱️  long operation ahead, be patient..."
  ensure_the_directory_is_the_new_repository
  npm install
  check_for_errors $? "☑️  npm install completed." "💥 npm install exploded 💣💣💣..."
}

function npm_test () {
  echo " "
  echo "🧪👨‍🔬 time to test if everything is working..."
  ensure_the_directory_is_the_new_repository
  npm test
  check_return_code $? "☑️  npm test setup correctly." "💥 npm test exploded 💣💣💣..."
}

function git_commit_all () {
  echo " "
  echo "🔏 time to write and lock the updates into GitHub."
  git add --all
  git commit -m "chore: tuned the template to the new repo"
  check_for_errors $? "☑️  All the tuned files added to git." "💥 something went wrong during the commit into git..."  
}

function git_push_all () {
  echo " "
  echo "🔏 time to write and lock the updates into GitHub."

  git push --set-upstream origin main
  check_for_errors $? "☑️  everything is committed into GitHub." "💥 pushing the files into GitHub raised a critical error..."
}

function enjoy () {
  echo " "
  echo "🥳 Enjoy! The repo is almost ready to rock 🤘 Just a little more clean up... 📟"
}