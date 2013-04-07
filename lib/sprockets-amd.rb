require 'sprockets-amd/version'

require 'sprockets-amd/engine'

require "sprockets"
Sprockets::Engines # force autoload
Sprockets.register_engine '.amd', SprocketsAmd::AMDTemplate