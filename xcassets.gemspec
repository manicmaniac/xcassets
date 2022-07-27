# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xcassets/version'

Gem::Specification.new do |spec|
  spec.name          = 'xcassets'
  spec.version       = XCAssets::VERSION
  spec.authors       = ['Ryosuke Ito']
  spec.email         = ['rito.0305@gmail.com']

  spec.summary       = 'Generates *.xcassets'
  spec.description   = 'Generates *.xcassets'
  spec.homepage      = 'https://github.com/manicmaniac/xcassets'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'fastimage', '~> 1.8.1'
end
