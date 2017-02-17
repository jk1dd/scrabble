class Scrabble

  def score(word)
    word.upcase.chars.map do |letter|
      point_values[letter]
    end.reduce(:+)
  end

  def point_values
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end

  def score_with_multipliers(word, times_letter_scored, word_multiplier)
    score_array = word.upcase.chars.map do |letter|
      point_values[letter]
    end
    total_score = score_array.zip(times_letter_scored).map { |x, y| x * y }.reduce(:+)
    if word.length >= 7
      (total_score + 10) * word_multiplier
    else
      total_score * word_multiplier
    end
  end

  def highest_scoring_word(word_list)
    # scores = word_list.map do |word|
    #   score(word)
    # end
    # words_with_scores = word_list.zip(scores)
    # words_with_scores.max_by {|word, score| score}[0]
    scores = {}
    word_list.each do |word|
      scores[word] = score(word)
    end
    greatest_values = scores.max_by {|key, value| value}[1]
    highest_scores = []
    scores.each do |key, value|
      if value == greatest_values
        highest_scores << key
      end
    end
    highest_scores
    highest_scores.each do |word|
      if word.length == 7
        return word
      end
    end
    word_lengths = []
    highest_scores.each do |word|
      word_lengths << word.length
    end
    highest_scores.each do |word|
      if word_lengths.min == word.length
        return word
      end
    end



    # binding.pry
    # words_with_scores.find do |pair|
    #   pair[1].max
    # end
  end

end
