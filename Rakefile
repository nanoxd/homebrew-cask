require 'rake'
require 'rake/testtask'

TEST_DIRECTORY = File.join(Pathname.new(File.expand_path(__FILE__)).parent.realpath, 'test')
puts TEST_DIRECTORY

TEST_FILES = FileList["#{TEST_DIRECTORY}/test_*.rb"]

Dir.chdir TEST_DIRECTORY

task :default => :test

Rake::TestTask.new :test do |t|
  t.libs << Dir.pwd
  t.test_files = TEST_FILES
end
