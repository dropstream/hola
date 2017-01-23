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
  if s.respond_to?(:metadata)
    s.metadata['allowed_push_host'] = "http://gems.falconerdevelopment.com"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency("rake")
  spec.add_development_dependency('chandler')
  spec.add_development_dependency('github_changelog_generator')
  spec.add_development_dependency('netrc')
  spec.add_development_dependency('bump')
  spec.add_development_dependency('github_api')
  spec.add_development_dependency('test-unit')

  spec.required_rubygems_version = Gem::Requirement.new(">= 0") if spec.respond_to? :required_rubygems_version=
  if spec.respond_to? :specification_version then
    spec.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end