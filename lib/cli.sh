#!/usr/bin/env bash

blue=`tput setaf 4`
green=`tput setaf 2`
red=`tput setaf 1`
reset=`tput sgr0`

set -euo pipefail

echoMessage() {
  echo  -e "${1}${2}...${reset} \n "
}

# Help commands
if [ "${1-}" == "--help" ] || [ "${1-}" == "-h" ]; then
echo "${green}Travela cli
Usage:
  travela  <repo> <path_to_env_file>
Options:
  -h --help        Show help commands.
  -f --frontend    Setup the travela frontend
  -b --backend     Setup the travela backend
  ${reset}
  "
exit 0
fi

if [ "${1-}" == "--frontend" ] || [ "${1-}" == "-f" ] ; then
    repo="https://github.com/andela/travel_tool_front.git"
    folderName="travel_tool_front"
    start="yarn start"

elif  [ "${1-}" == "--backend" ] || [ "${1-}" == "-b" ] ; then
    repo="https://github.com/andela/travel_tool_back.git"
    folderName="travel_tool_back"
    start="yarn start:dev"
else
  echoMessage "${red}" "Please provide specify the repo [--frotoned or --backend]"
fi

if [ -z "${2-}" ] ; then
      echoMessage "${red}" "Please provide the path to your .env file"
    exit 1
  else 
  pathtoenv=$2
fi

clone_repo(){

echoMessage "${blue}" "Cloning the repo"
 git clone  ${repo}
echoMessage "${green}" "Project cloned successful"

}


add_host(){
if ! grep  "travela-local.andela.com" /etc/hosts
then
echoMessage "${blue}" "Adding  travela-local.andela.com to /etc/hosts file "
 echo "127.0.0.1       travela-local.andela.com" >> /etc/hosts
echoMessage "${green}" "Added travela-local.andela.com to /etc/hosts "
fi
}

copy_env(){
echoMessage "${blue}" "Copying .env to project directory "
 mv ${pathtoenv} ${folderName}
 echoMessage "${green}" "successfuly copied .env file"
}

 
install_dependencies(){
echoMessage "${blue}" "cd into project directory "
 cd ${folderName}
echoMessage "${blue}" "Installing dependencies "
 yarn install
 echoMessage "${green}" "Successfuly installed all dependencies"
}

start_app(){
echoMessage "${blue}" "Starting application "
 ${start}
}

main(){
clone_repo
add_host
copy_env
install_dependencies
start_app
}
main

