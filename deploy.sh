#!/bin/bash
CIRCLE_TAG=v0.3.0-rc7
# Prepare git for pushing version bump to
#git config --global push.default simple
#git config --global user.name "Karl Falconer"
#git config --global user.email karl@falconerdevelopment.com

# configure geminabox to use private gem server
#echo -e "---\n:host: http://x:${GEM_PASSWORD}@gems.falconerdevelopment.com" > ~/.gem/geminabox

# release gem
sed -i -e "s/VERSION = .*/VERSION = \"${CIRCLE_TAG//v}\"/" lib/hola/version.rb
bundle
git add --update lib/hola/version.rb
git add --update Gemfile.lock
git commit -m "version bump [skip ci]"
#bump set ${CIRCLE_TAG//v} --commit-message "version bump [skip ci]" 
bundle exec rake release
echo "Deployment complete"