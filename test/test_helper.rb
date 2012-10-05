# add cask lib to load path
$:.push(File.expand_path(__FILE__+'/../../lib'))

# piggyback on homebrew testing environment
require '/usr/local/Library/Homebrew/test/testing_env'
require 'minitest/spec'
require 'cask'

# we need a Taps dir in Homebrew's test playground
TEST_CASK_PATH = Cask.tapspath.join('phinze-cask', 'Casks')
TEST_CASK_PATH.mkpath

def make_test_cask(cask_name, content)
  File.write(TEST_CASK_PATH.join("#{cask_name}.rb"), content)
end
