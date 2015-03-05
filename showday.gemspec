# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'showday/version'

Gem::Specification.new do |spec|
  spec.name          = 'showday'
  spec.version       = Showday::VERSION
  spec.authors       = ['jjuarez']
  spec.email         = ['javier.juarez@tuenti.com']

  spec.summary       = 'Inverse Julian day'
  spec.description   = 'Inverse Julian day'
  spec.homepage      = 'http://github.com/jjuarez/showday'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split('\x0').reject { |f| f.match(/^(test|spec|features)\//) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(/^exe\//) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'choice'
  spec.add_development_dependency 'bundler', '~> 1.8'
  spec.add_development_dependency 'rake', '~> 10.0'
end
