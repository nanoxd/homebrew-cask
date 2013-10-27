class SublimeText < Cask
  url 'http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2.dmg'
  homepage 'http://www.sublimetext.com/2'
  version '2.0.2'
  sha1 '14fba173566d4415f1881a38ad98cf22144f1f63'
  link 'Sublime Text 2.app'

  spec :beta do
    url 'http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%20Build%203047.dmg'
    version '3047'
    sha1 'cf20f30d0b0d406ced76784d9bdd63f817868f74'
    link 'Sublime Text.app'
  end
end
