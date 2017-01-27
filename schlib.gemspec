# frozen_string_literal: true
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'schlib/version'

Gem::Specification.new do |spec|
  spec.name          = 'schlib'
  spec.version       = Schlib::VERSION
  spec.authors       = ['schasse']
  spec.email         = ['mail@sebastianschasse.de']

  spec.summary       = "schasse's ruby library with selected essentials"
  spec.description   = 'schlib is a library with selected useful classes.'
  spec.homepage      = 'https://github.com/schasse/schlib'
  spec.license       = 'MIT'

  unless spec.respond_to?(:metadata)
    raise 'You are only allowed to push this gem to rubygems :p.'
  end
  spec.metadata['allowed_push_host'] = 'https://rubygems.org/'

  spec.files = Dir['lib/**/*.rb']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'pry', '~> 0.0'
  spec.add_development_dependency 'rubocop', '~> 0.0'
end
