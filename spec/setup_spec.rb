require 'morning-pages'

describe 'setup' do
  context 'with a new folder' do
    it 'creates the folder' do
      FileUtils.should_receive(:mkdir_p)
      MorningPages.setup(:dir => 'new-folder')
    end
  end
  context 'with an existing folder' do
    it 'does nothing' do
      FileUtils.should_not_receive(:mkdir_p)
      MorningPages.setup(:dir => '.')
    end
  end
end
