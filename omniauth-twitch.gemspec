# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/twitch/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-twitch-helix"
  spec.version       = OmniAuth::Twitch::VERSION
  spec.authors       = ["Jonathan Gertig (Webtheory), William Holt (Webtheory) and Piotr Jaworski"]
  spec.email         = ["jcgertig@gmail.com, sithtoast@gmail.com, piotrek.jaw@gmail.com"]
  spec.summary       = 'Twitch OAuth2 Strategy for OmniAuth'
  spec.homepage      = "https://github.com/paladinsoftware/omniauth-twitch-helix"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1.1'

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
