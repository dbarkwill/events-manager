#!/bin/sh
# This script checks if the container is started for the first time.

CONTAINER_FIRST_STARTUP="CONTAINER_FIRST_STARTUP"
if [ ! -e /$CONTAINER_FIRST_STARTUP ]; then
    touch /$CONTAINER_FIRST_STARTUP
    # place your script that you only want to run on first startup.
    rake db:prepare && rake assets:precompile && bundle exec unicorn -c config/unicorn.rb
else
    # script that should run the rest of the times (instances where you 
    # stop/restart containers).
    bundle exec unicorn -c config/unicorn.rb
fi