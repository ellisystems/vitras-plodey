#!/bin/bash
echo "Args: $@"
env_file=""
while getopts "f:" OPTION; do
    case $OPTION in
        f)
            env_file="$OPTARG"
            ;;
        *)
            ;;
    esac
done
shift $(($OPTIND - 1))

. $env_file
if [ $? -ne 0 ]; then
    echo "ERROR - cannot source enviroment: $env.properties"
    exit 1
fi

if [ -z $PROP1 ]; then
    echo "ERROR - expected environment variable: PROP1"
    exit 1
fi

echo "PROP1: $PROP1"
