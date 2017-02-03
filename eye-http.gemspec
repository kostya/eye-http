# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'eye-http/version'

Gem::Specification.new do |spec|
  spec.name          = "eye-http"
  spec.version       = Eye::Http::VERSION
  spec.authors       = ["'Konstantin Makarchev'"]
  spec.email         = ["'kostya27@gmail.com'"]
  spec.summary       = %q{Http interface for the Eye gem.}
  spec.description   = %q{Http interface for the Eye gem.}
  spec.homepage      = "https://github.com/kostya/eye-http"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'eye',      '~> 0.9'
  spec.add_dependency 'reel',     '~> 0.5.0'
  spec.add_dependency 'reel-rack'
  spec.add_dependency 'cuba'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", '<2.14'
  spec.add_development_dependency "rr"
end
