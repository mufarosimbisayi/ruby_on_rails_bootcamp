module Taillste
  class Drum

    def beat
      [1,4,9]
    end

    def shuffle
      [9, 1, 4]
    end

    def count
      "1\n.\n.\n4\n.\n.\n.\n.\n9\n"
    end

    def played_with
      "Both arms and legs"
    end

  end

  class Beat_box < Drum
    
    def beat
      [1, 5, 7]
    end

    def shuffle
      [7,5,1]
    end

    def count
      "1\n.\n.\n.\n5\n.\n7\n"
    end

    def played_with
      "Mouth"
    end
  end

  class Clap < Drum

    def beat
      [2,3,7,8]
    end

    def shuffle
      self.beat.shuffle
    end

    def count
      "2\n3\n.\n.\n.\n7\n8\n"
    end

    def played_with
      "both_hands"
    end
  end
end

if 1 == 2
  a = Taillste::Clap.new
  sample_b = a.shuffle
  sample_c = a.shuffle
  beat = a.beat
  puts "sample_b = #{sample_b}, sample_c = #{sample_c} and beat = #{beat}"
  puts (sample_b != sample_c && sample_c != beat)
end
