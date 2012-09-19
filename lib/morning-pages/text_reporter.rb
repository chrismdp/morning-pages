module MorningPages
  class TextReporter < Struct.new(:stats)
    def report
      [
        target(stats),
        "You have written #{stats.count} words today.",
        average_word_length(stats)
      ].join("\n")
    end

    def average_word_length(stats)
      stats.count > 0 ?
        "Average word length: %.2f." % [ stats.average_length ] :
        ""
    end

    def target(stats)
      stats.count >= MorningPages::TARGET ?
        "Congratulations! You have reached the target today -- you are awesome!" :
        "You have written %.2f%% of the target today." % [stats.count * 100.0 / TARGET]
    end
  end
end
