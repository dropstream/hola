require 'rake/testtask'
require 'bundler'
require 'netrc'
require 'github_changelog_generator/task'
require 'bump'
require 'github_api'

Bundler::GemHelper.install_tasks

# Don't push the gem to rubygems
ENV["gem_push"] = "false" # Utilizes feature in bundler 1.3.0

Rake::TestTask.new do |t|
  t.libs << 'test'
end

desc "Run tests"
task :default => :test


GitHubChangelogGenerator::RakeTask.new :changelog do |config|
  user, token = Netrc.read["api.github.com"]
  config.user = 'dropstream'
  config.token = token
  config.bug_labels = ["bug", 'Bug', 'defect', 'Defect']
  config.enhancement_labels = ['enhancement', 'Enhancement', 'feature', 'Feature']
end


namespace :bump do
  desc 'Commit version changes'
  task :commit => :changelog do
    fail("Version has not been changed from #{Bump::Bump.current}") if system('git diff --exit-code lib/**version.rb')
    system('git add --update Gemfile.lock')
    system('git add --update CHANGELOG.md')
    system('git add --update lib/**/version.rb')
    system("git commit -m '#{Bump::Bump.current}' && git push origin")
  end
  
  run_bump = lambda do |bump|
    output, status = Bump::Bump.run(bump, commit: false)
    puts output
    abort unless status == 0
  end

  (Bump::Bump::BUMPS + ["current"]).each do |bump|
    if bump == "current"
      desc "Show current gem version"
    else
      desc "Bump #{bump} part of gem version"
    end

    task bump do
      run_bump.call(bump)
      Rake::Task['bump:commit'].invoke
    end
  end
end

namespace :github do
  task :create_pull_request do
    user, token = Netrc.read["api.github.com"]
    spec = Gem::Specification::load(Dir.glob("*.gemspec").first)

    github = Github.new(oauth_token: token, user: 'dropstream', repo: spec.name)
    pull_request = github.pull_requests.create(title: "Release version #{Bump::Bump.current}",
                                                base: 'master',
                                                head: 'development')
    ref = pull_request.head.sha
    puts "Created pull request ##{pull_request.number} for ref #{pull_request.head.sha[0..6]}"

    begin
      puts 'Waiting for repository status checks to complete'
      status = github.repos.statuses.list(ref: ref, combined: true)
      sleep(5)
    end while status.state == 'pending'


    if status.state == 'failure'
      fail('Could not continute release Github Status Check failed') 
    elsif status.state == 'success'
      puts "Repository status check successful, merging pull request ##{pull_request.number}"
      github.pull_requests.merge(number: pull_request.number)
    end
  end

  task :pull do
    system('git pull origin')
  end

  task :push do
    system('git push origin')
  end
end

task 'release:guard_clean' => ['github:create_pull_request', 'github:pull']

# Let bundler's release task do its job, minus the push to Rubygems,
# and after it completes, use "gem inabox" to publish the gem to our
# internal gem server.
Rake::Task["release"].enhance do
  spec = Gem::Specification::load(Dir.glob("*.gemspec").first)
  puts "pushed pkg/#{spec.name}-#{spec.version}.gem"
  #sh "gem inabox pkg/#{spec.name}-#{spec.version}.gem"
end