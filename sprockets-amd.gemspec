# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sprockets-amd/version"

Gem::Specification.new do |s|
  s.name        = 'sprockets-amd'
  s.version     = SprocketsAmd::VERSION
  s.date        = '2013-04-05'
  s.summary     = "Simple preprocessor for JavaScript files for adding AMD style definitions"
  s.description = "Simple preprocessor for JavaScript files for adding AMD style definitions"
  s.authors     = ["Vyacheslav Shebanov"]
  s.email       = 'terminal2010@gmail.com'
  s.files       = ["lib/sprockets-amd.rb", "lib/sprockets-amd/engine.rb", "lib/sprockets-amd/version.rb", "lib/sprockets-amd/template_engine.rb"]
  s.homepage    = 'https://github.com/Termina1/sprockets-amd'

  s.add_dependency "tilt"

end