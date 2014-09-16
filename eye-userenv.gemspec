# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'eye-userenv/version'

Gem::Specification.new do |spec|
  spec.name          = "eye-userenv"
  spec.version       = Eye::Userenv::VERSION
  spec.authors       = ["Roman Simecek"]
  spec.email         = ["roman@good2go.ch"]
  spec.summary       = %q{Read and load the user envs}
  spec.description   = %q{Read and load the user envs from a specific file}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = Dir[
    'lib/**/*.rb'
  ] + %w[
    LICENSE.txt
    README.md
  ]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "eye"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
