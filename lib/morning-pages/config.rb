require 'yaml'

module MorningPages
  class Config
    def initialize(config_path)
      @config_path = config_path
      containing_folder = File.dirname(config_path)

      unless (File.exists?(containing_folder))
        FileUtils.mkdir_p(containing_folder)
      end

      @config = {}
      if (File.exists?(@config_path))
        @config = YAML.load(File.read(@config_path))
      end
    end

    def registered?
      @config.include? :username
    end

    def register!(params)
      File.open(@config_path, 'w') { |f| f.write(@config.merge(params).to_yaml) }
    end
  end
end
