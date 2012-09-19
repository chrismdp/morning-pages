require "morning-pages/version"
require "morning-pages/folder"
require "morning-pages/config"
require "morning-pages/stats"
require "morning-pages/text_reporter"

require 'fileutils'

module MorningPages
  TARGET = 750
end

class Array
  def mean
    inject(0, &:+) / count.to_f
  end

  def average_length
    map(&:length).mean
  end
end

