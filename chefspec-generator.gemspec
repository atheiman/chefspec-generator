# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chefspec/generator/version'

Gem::Specification.new do |spec|
  spec.name          = 'chefspec-generator'
  spec.version       = Chefspec::Generator::VERSION
  spec.authors       = ['Austin Heiman']
  spec.email         = ['atheimanksu@gmail.com']

  spec.summary       = 'Generate chefspec tests for an existing cookbook'
  spec.homepage      = 'https://github.com/atheiman/chefspec-generator'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'chefspec', '~> 6.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
