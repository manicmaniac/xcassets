# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xcassets/version'

Gem::Specification.new do |spec|
  spec.name = 'xcassets'
  spec.version = XCAssets::VERSION
  spec.authors = ['Ryosuke Ito']
  spec.email = ['rito.0305@gmail.com']

  spec.summary = 'Generates *.xcassets'
  spec.description = spec.summary
  spec.homepage = 'https://github.com/manicmaniac/xcassets'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.6.0'
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files = Dir['lib/**/*.rb']
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'fastimage'
end
