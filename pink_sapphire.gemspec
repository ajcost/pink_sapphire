# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pink_sapphire/version'

Gem::Specification.new do |spec|
  spec.name          = "pink_sapphire"
  spec.version       = PinkSapphire::VERSION
  spec.authors       = ["Adam James Costarino"]
  spec.email         = ["adam.james.lavelle@gmail.com"]

  spec.summary       = %q{Nueral Network Library for Ruby}
  #spec.description   = %q{TODO: Write a longer description or delete this line.}
  #pec.homepage      = "TODO: Put your gem's website or public repo URL here."

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = Dir['lib/**/*.rb']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
end
