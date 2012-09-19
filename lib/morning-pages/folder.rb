module MorningPages
  class Folder
    def initialize(options = {})
      @dir = options[:dir]
      if (@dir && !File.exists?(@dir))
        FileUtils.mkdir_p(@dir)
      end
    end

    def todays_words
      get_words_for(today_path)
    end

    def stats_for_today
      stats = Stats.new(todays_words)
      TextReporter.new(stats).report
    end

    def today_path
      File.expand_path([@dir, Time.now.strftime("%Y\-%m\-%d")].join('/'))
    end

    def get_words_for(path)
      (File.exists?(path) ? File.read(path) : "").split(" ")
    end
  end
end
