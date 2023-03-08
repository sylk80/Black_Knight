#!/usr/bin/env bash

NEW_REPO_NAME=$1
TRUE=0
FALSE=1
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source ${DIR}/postworks.sh
source ${DIR}/integration.sh

gh_authentication
gh_authentication_check
set_git_credential_helper
check_it_is_NOT_a_git_repository
create_the_repo
set_the_remote
npm_install
npm_test
integrate_with_the_external_analysis_tools
git_commit_all
git_push_all
enjoy