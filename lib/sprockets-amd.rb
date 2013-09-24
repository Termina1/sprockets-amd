require 'sprockets-amd/version'

require "sprockets"
Sprockets::Engines # force autoload

module SprocketsAmd

  class << self

    def configure
      yield config
    end

    def config
      {}
    end

  end

end

require 'sprockets-amd/engine' if defined?(Rails)