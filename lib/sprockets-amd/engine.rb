require 'tilt'

module SprocketsAmd

  class AMDTemplate < Tilt::Template
    class << self; 
      attr_accessor :config 
      @config = {}
    end

    self.default_mime_type = 'application/javascript'


    def self.engine_initialized?
      defined? ::AMDTemplateEngine
    end

    def initialize_engine
      require_template_library 'sprockets-amd/template_engine'
    end

    def prepare; end

    def evaluate(scope, locals, &block)
      @output ||= AMDTemplateEngine.new(data, self.class.config[:prefixes]).render
    end

  end

end