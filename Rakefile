require "bundler/gem_tasks"
task :default => [:specs, :cukes]

desc "Run unit tests"
task :specs do
  sh "rspec spec"
end

desc "Run end-to-end tests"
task :cukes do
  sh "cucumber"
end
