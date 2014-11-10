lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nav_helper/version'

Gem::Specification.new do |spec|
  spec.name          = 'nav_helper'
  spec.version       = NavHelper::VERSION
  spec.authors       = ['Okhlopkov Anatoly']
  spec.email         = ['ohlopkov0211@gmail.com']
  spec.summary       = 'Helper for building nav links.'
  spec.description   = 'Helper for building nav links.'
  spec.homepage      = 'https://github.com/VortexGrenade/nav_helper.git'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3'
  spec.add_development_dependency 'rspec-rails'
end
