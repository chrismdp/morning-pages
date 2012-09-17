require "morning-pages/version"
require "morning-pages/folder"
require "morning-pages/config"
require 'fileutils'

class Array
  def mean
    inject(0, &:+) / count.to_f
  end

  def average_length
    map(&:length).mean
  end
end

