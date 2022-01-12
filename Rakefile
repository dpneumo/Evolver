require 'rake/testtask'

task default: "test"

Rake::TestTask.new do |task|
 task.pattern = "tests/*_test.rb"
 task.test_files = FileList['tests/utilities/critters/*/*_test.rb']
end
