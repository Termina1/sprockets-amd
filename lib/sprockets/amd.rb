require 'amd/version'

require "sprockets"
Sprockets::Engines # force autoload

module Sprockets
  module AMD

    class << self

      def configure
        yield config
      end

      def config
        {}
      end

    end
  end

end

require 'amd/engine' if defined?(Rails)