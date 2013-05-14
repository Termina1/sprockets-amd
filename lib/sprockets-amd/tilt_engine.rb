require 'tilt'
require_relative 'template_engine'

module SprocketsAmd

  class TiltEngine < Tilt::Template
    class << self;
      attr_accessor :config
    end

    self.config = {}

    self.default_mime_type = 'application/javascript'

    def self.engine_initialized?
      defined? ::TemplateEngine
    end

    def initialize_engine
      require_template_library 'sprockets-amd/template_engine'
    end

    def prepare; end

    def evaluate(scope, locals, &block)
      @output ||= TemplateEngine.new(data, self.class.config).render
    end

  end

end
