require "morning-pages/version"

class Array
  def mean
    inject(0, &:+) / count.to_f
  end
end

module MorningPages
  def self.setup(options)
    FileUtils.mkdir_p(options[:dir]) unless File.exists?(options[:dir])
  end

  def self.stats_for_today(dir)
    words = File.read(today_path(dir)).split(" ")
    "You have written #{words.count} words today. Average word length: %.2f" % [ words.map(&:length).mean ]
  end

  def self.today_path(dir)
    File.expand_path([dir, Time.now.strftime("%Y\-%m\-%d")].join('/'))
  end
end
