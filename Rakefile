require 'rake/testtask'
require 'bundler'

Bundler::GemHelper.install_tasks

# Don't push the gem to rubygems
ENV["gem_push"] = "false" # Utilizes feature in bundler 1.3.0

Rake::TestTask.new do |t|
  t.libs << 'test'
end

desc "Run tests"
task :default => :test

Rake::Task["release"].enhance do
  spec = Gem::Specification::load(Dir.glob("*.gemspec").first)

  sh "gem inabox pkg/#{spec.name}-#{spec.version}.gem"
end

