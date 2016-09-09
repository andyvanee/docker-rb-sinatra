#!/bin/bash
if [ "$RACK_ENV" == "production" ];
then
  ruby $APP_FILE -p 80
else
  if [ "$RACK_ENV" == "test" ];
  then
    rake test
  else
    shotgun -I /usr/src/app $APP_FILE -p 80 -o '0.0.0.0'
  fi
fi
