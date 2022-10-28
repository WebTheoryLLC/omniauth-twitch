# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/twitch/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-twitch"
  spec.version       = OmniAuth::Twitch::VERSION
  spec.authors       = ["Dean Perry", "Jonathan Gertig (Webtheory)", "William Holt (Webtheory)"]
  spec.email         = ["dean@deanpcmad.com", "jcgertig@gmail.com", "sithtoast@gmail.com"]
  spec.summary       = 'Twitch OAuth2 Strategy for OmniAuth'
  spec.homepage      = "https://github.com/WebTheoryLLC/omniauth-twitch"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1.6'

  spec.add_development_dependency "bundler", "~> 2.1"
  spec.add_development_dependency "rake"
end
