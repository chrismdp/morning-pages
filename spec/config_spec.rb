require 'morning-pages'

describe 'config' do
  subject { MorningPages::Config.new('new-folder/file') }
  let(:yaml) { "---\n:username: test\n:email: test@example.com\n" }
  before do
    FileUtils.stub(:mkdir_p)
  end
  context 'not pre-existing' do
    before do
      File.stub(:exists? => false)
    end

    it 'creates the folder' do
      FileUtils.should_receive(:mkdir_p).with("new-folder")
      subject
    end

    it 'is not registered' do
      subject.should_not be_registered
    end

    it 'allows saving to file' do
      file = double
      File.stub(:open).with('new-folder/file', 'w').and_yield(file)
      file.should_receive(:write).with(yaml)
      subject.register!(:username => 'test', :email => 'test@example.com')
    end
  end
  context 'with an existing folder but no file' do
    before do
      File.stub(:exists?).with('new-folder').and_return(true)
      File.stub(:exists?).with('new-folder/file').and_return(false)
    end

    it 'does not create the folder' do
      FileUtils.should_not_receive(:mkdir_p)
      subject
    end

    it 'is not registered' do
      subject.should_not be_registered
    end
  end

  context 'with existing file' do
    before do
      File.stub(:exists? => true)
      File.stub(:read => yaml)
    end

    it 'is registered' do
      subject.should be_registered
    end
  end
end
