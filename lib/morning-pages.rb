require "morning-pages/version"

class Array
  def mean
    inject(0, &:+) / count.to_f
  end

  def average_length
    map(&:length).mean
  end
end

module MorningPages
  def self.setup(options)
    FileUtils.mkdir_p(options[:dir]) unless File.exists?(options[:dir])
  end

  def self.stats_for_today(dir)
    words = get_words_for(today_path(dir)).split(" ")
    [
      "You have written #{words.count} words today.",
      average_word_length(words)
    ].join(" ")
  end

  def self.average_word_length(words)
    words.empty? ? "" : "Average word length: %.2f" % [ words.average_length ]
  end

  def self.today_path(dir)
    File.expand_path([dir, Time.now.strftime("%Y\-%m\-%d")].join('/'))
  end

  def self.get_words_for(path)
    File.exists?(path) ? File.read(path) : ""
  end
end
