#!/usr/bin/env bash
#SONAR is the private sonarcloud token required to access sonarcloud, must be present in the environment
#SNYK is the private snyk token required to access snyk, must be present in the environment
#GIT_ORG is the github organization / user name where the repository should be created

function integrate_with_the_external_analysis_tools () {
  echo " "
  echo "🔌 Integration with the external analysis platforms."
  connect_with_sonarcloud
  connect_with_snyk
}

function connect_with_sonarcloud () {
  echo "🧙‍♀️ Sonarcloud connection in progress..."
  if [ $SONAR = "" ]; then
    echo "☹️ your SONARCLOUD_TOKEN environmental variable isn't defined."
    echo "⚠️ export the token into your .*shrc"
    echo "🔗 please read more here: https://docs.sonarqube.org/latest/extend/web-api/#WebAPI-UserToken"
    echo "💥 Sonarcloud integration failed."
    return
  else
    create_the_github_sonarcloud_secret
    browse_the_GitHub_repositories
    get_the_new_repository_UID
    create_the_new_sonarcloud_project
  fi
  echo "🚀 Sonarcloud connected."
}

function create_the_github_sonarcloud_secret () {
  echo "🔑 SONAR_TOKEN secret creation in progress..."
  gh secret set SONAR_TOKEN -R $GIT_ORG/$NEW_REPO_NAME -b $SONAR
  check_return_code $? \
                    "☑️ The secret SONAR_TOKEN is created." \
                    "❌ The creation of the secret SONAR_TOKEN raised an error."
}

function browse_the_GitHub_repositories () {
  echo "🔎 Search for the new GitHub repos..."
  curl -u $SONAR: \
      'https://sonarcloud.io/api/alm_integration/list_repositories?organization='$GIT_ORG \
      --compressed > /tmp/.sonarcloud.repositories.js
  sleep 1
}

function get_the_new_repository_UID () {
  echo "🔎 Collect the GitHub project UID..."

  cat /tmp/.sonarcloud.repositories.js | jq | jq '.repositories[].installationKey' > /tmp/.sonarcloud.repositories.installationKeys.js
  grep "/$NEW_REPO_NAME|" /tmp/.sonarcloud.repositories.installationKeys.js > /tmp/.sonarcloud.repositories.installationKey.js
  echo "💳 the project key is `cat /tmp/.sonarcloud.repositories.installationKey.js`"
}

function create_the_new_sonarcloud_project () {
  echo "🦹 Sonarcloud project creation..."
  INSTALLATION_KEY=`cat /tmp/.sonarcloud.repositories.installationKey.js| sed 's/"//g'`
  curl -u $SONAR: \
        'https://sonarcloud.io/api/alm_integration/provision_projects' \
        -H 'Referer: https://sonarcloud.io/projects/create' \
        --data-raw "installationKeys=$INSTALLATION_KEY&organization=$GIT_ORG" \
        --compressed
  check_return_code $? \
                    "\n🥳 SonarCloud connected successfully." \
                    "\n❌ SonarCloud connection error. 😰 Don't panic 😱..."
}

function connect_with_snyk () {
  echo "👮 Snyk connection in progress..."
  echo "🔍 Search for the SNYK snyk token..."
  if [ $SNYK = "" ]; then
    echo "☹️ your SNYK environmental variable isn't defined."
    echo "⚠️ install snyk client and export the token into your .*shrc"
    echo "🔗 to install the client read here: https://github.com/snyk/snyk#installation"
    echo "   to get the API token run 'snyk config get api'."
    echo "💥 Snyk integration failed."
    return
  else
    echo "🔑 SNYK_TOKEN secret creation in progress..."
    gh secret set SNYK_TOKEN -R $GIT_ORG/$NEW_REPO_NAME -b $SNYK
  fi
  echo "\n🛡️ Snyk connected."
}