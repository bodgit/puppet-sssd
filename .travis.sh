#!/bin/bash

sudo add-apt-repository -y ppa:raphink/augeas
sudo apt-get update
sudo apt-get install augeas-tools \
                     augeas-lenses \
                     libaugeas0 \
                     libaugeas-dev \
                     libxml2-dev

gem install bundler
bundle install
