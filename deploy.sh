#!/bin/bash

# Prepare git for pushing version bump to
git config --global push.default simple
git config --global user.name "Karl Falconer"
git config --global user.email karl@falconerdevelopment.com

# configure geminabox to use private gem server
echo -e "---\n:host: http://x:${GEM_PASSWORD}@gems.falconerdevelopment.com" > ~/.gem/geminabox

# bump Ruby Gem version
sed -i -e "s/VERSION = .*/VERSION = \"${CIRCLE_TAG//v}\"/" lib/hola/version.rb
bundle
git add --update lib/hola/version.rb
git add --update Gemfile.lock
git commit -m "version bump [skip ci]"

# release gem, also creates tag
bundle exec rake release
echo "Deployment complete"