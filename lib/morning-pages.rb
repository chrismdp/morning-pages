require "morning-pages/version"

module MorningPages
  def self.setup(options)
    FileUtils.mkdir_p(options[:dir]) unless File.exists?(options[:dir])
  end
end
