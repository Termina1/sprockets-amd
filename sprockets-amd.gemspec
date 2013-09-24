# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sprockets/amd/version"

Gem::Specification.new do |s|
  s.name          = 'sprockets-amd'
  s.version       = Sprockets::AMD::VERSION
  s.date          = '2013-04-05'
  s.summary       = "Simple preprocessor for JavaScript files for adding AMD style definitions"
  s.description   = "Simple preprocessor for JavaScript files for adding AMD style definitions"
  s.authors       = ["Vyacheslav Shebanov"]
  s.email         = 'terminal2010@gmail.com'
  s.files         = `git ls-files`.split($/)
  s.require_paths = ["lib", "lib/sprockets"]
  s.license       = "MIT"
  s.homepage      = 'https://github.com/Termina1/sprockets-amd'
end