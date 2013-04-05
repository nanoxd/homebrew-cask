class Cask
  class AppLinker
    def initialize(cask)
      @cask = cask
    end

    def link
      Pathname.glob("#{@cask.destination_path}/**/*.app").each do |app|
        app_path = Cask.appdir.join(app.basename)
        if app_path.directory?
          puts "It seems there is already an app at #{app_path}; not linking."
          next
        end 
        make_alias(app, "#{Cask.appdir}/")
      end
    end

    def make_alias(path, destination)
      self.class.osascript(
        %Q(tell application "Finder" to make alias file at POSIX file "#{destination}" to POSIX file "#{path}")
      )
    end

    def self.osascript(applescript)
      `osascript -e '#{applescript}' 2>/dev/null`.chomp
    end
  end
end
