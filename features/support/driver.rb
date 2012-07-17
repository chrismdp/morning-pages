require 'aruba/api'
module MorningPages
  module Testing
    module EndToEndDriver
      include Aruba::Api
    end
  end
end

ENV['PATH'] = [
  File.expand_path(File.dirname(__FILE__) + '/../../bin'),
  File.expand_path(File.dirname(__FILE__) + '/../../features/bin'),
  ENV['PATH']
].join File::PATH_SEPARATOR

ENV['EDITOR'] = 'fake-editor'
World(MorningPages::Testing::EndToEndDriver)
