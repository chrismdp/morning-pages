require 'yaml'
require 'httparty'

module MorningPages
  class Config
    def initialize(config_path, server)
      @config_path = config_path
      @server = server
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
      response = HTTParty.post("#{@server}/register", :body => params)
      save(params.merge(:key => response.fetch("key")))
      write!
    end

    private

    def save(params)
      @config.merge!(params)
    end

    def write!
      File.open(@config_path, 'w') { |f| f.write(@config.to_yaml) }
    end
  end
end
