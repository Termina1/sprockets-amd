require 'sprockets-amd/view_helpers'

module SprocketsAmd
  class Engine < Rails::Engine
    initializer "sprockets-amd.view_helpers" do |app|
      app.config.to_prepare do
        ActionController::Base.send :helper, ViewHelpers
      end
    end
  end
end