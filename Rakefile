require 'rubygems'
require 'bundler/setup'
require 'releasy'

Releasy::Project.new do
  name "Astrosmash"
  version "0.0.1"

  executable "bin/astrosmash.rb"
  files ['bin/**/*.rb', 'lib/**/*.rb', 'gfx/**/*.*', 'sfx/**/*.*']
  add_link 'http://www.spilth.org', 'spilth.org'
  exclude_encoding

  add_build :osx_app do
    url 'org.spilth.astrosmash'
    wrapper 'support/gosu-mac-wrapper-0.7.41.tar.gz'
    icon 'media/astrosmash.icns'
    add_package :tar_gz
  end
end


