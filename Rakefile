require 'bundler/gem_tasks'
require 'rake/testtask'
#require 'tasks/all'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/**/*_test.rb']

end

desc "Run tests"
task :default => :test