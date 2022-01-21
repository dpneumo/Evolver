require 'rake/testtask'

task default: "test"

Rake::TestTask.new do |task|
 task.pattern = "tests/*_test.rb"
 task.test_files = FileList['tests/orgs/*/*_test.rb', 'tests/actors/*_test.rb', 'tests/storage/*_test.rb', 'tests/support/*_test.rb']
end
