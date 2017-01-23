#!/bin/bash

# Prepare git for pushing version bump to
git config --global user.name "Karl Falconer"
git config --global user.email karl@falconerdevelopment.com

# configure geminabox to use private gem server
echo -e "---\n:host: http://x:${GEM_PASSWORD}@gems.falconerdevelopment.com" > ~/.gem/geminabox

# release gem
bundle exec bump set ${CIRCLE_TAG//v} --commit-message "version bump [skip ci]" 
bundle exec rake release
echo "Deployment complete"