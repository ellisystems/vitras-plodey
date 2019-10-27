#!/bin/bash
env=""
msg=""

function usage() {
  echo
  echo "Usage: $(basename $0) -e <environment> -m <message>"
  echo
  echo "Usage: $(basename $0) -h"
  echo
  echo "Where:"
  echo "    -e : Run, execution or deployment environment"
  echo "    -m : Message header for stdout"
}

while getopts "he:m:" OPTION; do
    case $OPTION in
        h)  usage
            exit 0
            ;;
        e)
            env="$OPTARG"
            ;;
        m)
            msg="$OPTARG"
            ;;
        *)  usage
            exit 0
            ;;
    esac
done
shift $(($OPTIND - 1))
printf "Other arguments: %s\n\n" "$*"

if [ -z $env ]; then
    echo "Invalid argument. Set execution enviroment."
    exit 1
fi

. ${env}.properties
if [ $? -ne 0 ]; then
    echo "ERROR - cannot source enviroment: $env.properties"
    exit 1
fi


cwd=$(dirname $0)

echo "Executing enviroment: $env"
echo "   $msg"
echo
${cwd}/${env}.sh -f "${env}.properties" $*
