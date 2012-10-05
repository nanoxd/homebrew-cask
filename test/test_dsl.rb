require 'test_helper'

make_test_cask 'basic-cask', <<-ENDCASK.undent
  class BasicCask < Cask
    url 'http://localhost/basic.dmg'
    version '1.2.3'
    homepage 'http://localhost/home'
  end
ENDCASK

class TestDsl < MiniTest::Spec
  describe "BasicCask" do
    it "loads properly from its file" do
      basic_cask = Cask.load('basic-cask')
      assert_equal(BasicCask, basic_cask.class)
    end

    it "properly records the url, version, and homepage that are set" do
      basic_cask = Cask.load('basic-cask')
      assert_equal('http://localhost/basic.dmg', basic_cask.url.to_s)
      assert_equal('1.2.3', basic_cask.version)
      assert_equal('http://localhost/home', basic_cask.homepage)
    end
  end
end
