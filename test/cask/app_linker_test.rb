require 'test_helper'

describe Cask::AppLinker do
  describe 'linkapps' do
    before do 
      @caffeine = Cask.load('local-caffeine')
      shutup { Cask::Installer.install(@caffeine) }
      @app = @caffeine.destination_path/'Caffeine.app'
    end

    after do
      Cask::Installer.uninstall(@caffeine)
    end

    it "works with an application in the root directory" do
      Cask::AppLinker.new(@caffeine).link
      expected_symlink = Cask.appdir/'Caffeine.app'
    end

    it "works with an application in a subdir" do
      appsubdir = @caffeine.destination_path/'subdir'
      appsubdir.mkpath
      FileUtils.mv @app, appsubdir
      appinsubdir = appsubdir/'Caffeine.app'

      Cask::AppLinker.new(@caffeine).link

      expected_symlink = Cask.appdir/'Caffeine.app'
    end
  end
end
