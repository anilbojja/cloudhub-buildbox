#!/bin/bash
set -e

mkdir -p $HOME/.m2
cp /config/settings.xml $HOME/.m2/settings.xml

exec "$@"

