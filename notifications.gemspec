# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'notifications/version'

Gem::Specification.new do |spec|
  spec.name          = "notifications"
  spec.version       = Notifications::VERSION
  spec.authors       = ["Adrian Toczydłowski"]
  spec.email         = ["adrian.toczydlowski@gmail.com"]
  spec.description   = %q{Simply generates email notifications.}
  spec.summary       = %q{Notifications system}
  spec.homepage      = "http://www.antdesk.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rails-observers"
  spec.add_dependency 'activemodel', '~> 4.0'
  spec.add_development_dependency 'minitest',     '>= 3'
  spec.add_development_dependency 'railties', '~> 4.0'
  spec.add_development_dependency 'activerecord', '~> 4.0'
end
