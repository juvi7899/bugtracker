require 'rspec/core/rake_task'

task :run do
  RSpec::Core::RakeTask.new(:spec)
  Rake::Task[:spec].invoke
  `xdg-open coverage/index.html`
end

task :default => :run
