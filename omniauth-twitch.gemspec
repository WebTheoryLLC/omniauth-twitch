# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/twitch/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-twitch"
  spec.version       = OmniAuth::Twitch::VERSION
  spec.authors       = ["Jonathan Gertig (Webtheory) and William Holt (Webtheory)"]
  spec.email         = ["jcgertig@gmail.com or sithtoast@gmail.com"]
  spec.summary       = 'Twitch OAuth2 Strategy for OmniAuth'
  spec.homepage      = "https://github.com/WebTheoryLLC/omniauth-twitch"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1.1'

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
