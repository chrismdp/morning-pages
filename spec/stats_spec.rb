require 'morning-pages'

module MorningPages
  describe 'stats' do
    context 'for today' do
      it 'prints out the word count' do
        File.stub(:read => "foo bar")
        MorningPages.stats_for_today("/tmp").should match(/2 words/)
      end

      it 'prints the average word length' do
        File.stub(:read => "foo ba")
        MorningPages.stats_for_today("/tmp").should match(/2\.5/)
      end
    end
  end
end
