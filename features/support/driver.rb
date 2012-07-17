module MorningPages
  module Testing
    require 'aruba/api'
    module EndToEndDriver
      include Aruba::Api
    end
  end
end

ENV['PATH'] = "#{File.expand_path(File.dirname(__FILE__) + '/../../bin')}#{File::PATH_SEPARATOR}#{ENV['PATH']}"
World(MorningPages::Testing::EndToEndDriver)
