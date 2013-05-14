# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'getup/version'

Gem::Specification.new do |spec|
  spec.name          = "getup"
  spec.version       = Getup::VERSION
  spec.authors       = ["Brad Smith"]
  spec.email         = ["bradleydsmith@gmail.com"]
  spec.description   = %q{A debian based simple timer}
  spec.summary       = %q{Been sitting to long?  time to get up!}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "timers"
  spec.add_dependency "libnotify"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "mocha"
  spec.add_development_dependency "minitest"

end
