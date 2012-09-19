module MorningPages
  class Stats < Struct.new(:words)
    def count
      words.count
    end

    def average_length
      words.average_length
    end

    def post!(config)
      config.post_stats!(:count => count, :average_length => average_length)
    end
  end
end
