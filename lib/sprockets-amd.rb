require 'sprockets-amd/version'

require 'sprockets-amd/engine'

require "sprockets"
Sprockets::Engines # force autoload
Sprockets.register_engine '.amd', SprocketsAmd::AMDTemplate

module SprocketsAmd

  class << self

    def configure
      yield config
    end

    def config
      SprocketsAmd::AMDTemplate.config
    end

  end

end