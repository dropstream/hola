# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'hola/version'

Gem::Specification.new do |spec|
  spec.name          = "hola"
  spec.version       = Hola::VERSION
  spec.authors       = ["Nick Quaranto"]
  spec.email         = %q{nick@quaran.to}
  spec.description   = %q{A simple hello world gem}
  spec.summary       = %q{Hola!}
  spec.homepage      = %q{http://rubygems.org/gems/hola}
  spec.license       = "UNKNOWN"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "http://gems.falconerdevelopment.com"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency("rake")
  spec.add_development_dependency('test-unit')
  spec.add_development_dependency('geminabox', "~> 0.13.5")
end