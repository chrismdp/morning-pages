require 'morning-pages'

describe 'stats' do
  context 'for today' do
    let(:folder) { MorningPages::Folder.new(:dir => '/tmp/foo') }
    let(:stats) { MorningPages::Stats.new(folder.todays_words) }
    subject { MorningPages::TextReporter.new(stats) }

    before(:each) do
      File.stub(:exists? => true)
      File.stub(:read => "foo ba")
    end

    it 'prints out the word count' do
      subject.report.should match(/2 words/)
    end

    it 'prints the average word length' do
      subject.report.should match(/2\.5/)
    end

    it 'prints your percentage to go' do
      subject.report.should match(/0.27%/)
    end

    context "when written 800 words" do
      before { File.stub(:read => "word " * 800) }

      it "shows a nice message" do
        subject.report.should match(/Congratulations.*awesome/)
      end
    end

    context 'when today has no words yet' do
      before do
        File.stub(:exists? => false)
      end

      it "shows a message to that effect" do
        subject.report.should match(/0 words/)
      end

      it "does not show average" do
        subject.report.should_not match(/NaN/)
      end
    end
  end
end
