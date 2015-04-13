# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tokenify/version'

Gem::Specification.new do |spec|
  spec.name          = 'tokenify'
  spec.version       = Tokenify::VERSION
  spec.authors       = ['Tanmay Sinha']
  spec.email         = ['tanmay3011@gmail.com']
  spec.summary       = %q{ An utility which provides a class method `tokenify`. It accepts list of field name for a model(i.e. attribute present in db for that model) and creates a unique token for each object of that model }
  spec.description   = %q{ An utility which provides a class method `tokenify`. It accepts list of field name for a model(i.e. attribute present in db for that model) and creates a unique token for each object of that model }
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler',  '~> 1.7'
  spec.add_development_dependency 'rake',     '~> 10.0'
end
