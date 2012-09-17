require 'morning-pages'

describe 'stats' do
  context 'for today' do
    subject { MorningPages::Folder.new(:dir => '/tmp/foo') }
    before(:each) do
      File.stub(:exists? => true)
      File.stub(:read => "foo ba")
    end

    it 'prints out the word count' do
      subject.stats_for_today("foo").should match(/2 words/)
    end

    it 'prints the average word length' do
      subject.stats_for_today("foo").should match(/2\.5/)
    end

    it 'prints whether you hit 750 words yet' do
      subject.stats_for_today("foo").should match(/0.27%/)
      File.stub(:read => "word " * 800)
      subject.stats_for_today("foo").should match(/Congratulations.*awesome/)
    end

    context 'when today has no words yet' do
      before do
        File.stub(:exists? => false)
      end

      it "shows a message to that effect" do
        subject.stats_for_today("foo").should match(/0 words/)
      end

      it "does not show average" do
        subject.stats_for_today("foo").should_not match(/NaN/)
      end
    end
  end
end
