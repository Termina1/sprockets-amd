require 'sprockets-amd/view_helpers'

module SprocketsAmd
  class Engine < Rails::Engine
    initializer "sprockets-amd.view_helpers" do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end