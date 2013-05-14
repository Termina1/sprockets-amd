require 'sprockets-amd/version'
require 'sprockets-amd/tilt_engine'

require "sprockets"
Sprockets::Engines # force autoload
Sprockets.register_engine '.amd', SprocketsAmd::TiltEngine

module SprocketsAmd

  class << self

    def configure
      yield config
    end

    def config
      SprocketsAmd::TiltEngine.config
    end

  end

end

require 'sprockets-amd/engine' if defined?(Rails)