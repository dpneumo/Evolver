require 'rake/testtask'

task default: "test"

Rake::TestTask.new(:test) do |task|
 task.libs = %w(lib tests)
 task.pattern = 'tests/**/*_test.rb'
end

Rake::TestTask.new(:bench) do |task|
  task.libs = %w(lib tests)
  task.pattern = 'tests/**/*_benchmark.rb'
end

task :default => :test
