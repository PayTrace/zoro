require "bundler/gem_tasks"
require 'rake/testtask'

lib_dir = File.expand_path('lib')
test_dir = File.expand_path('test')

Rake::TestTask.new do |t|
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = true
end
task "default" => ["test"]

