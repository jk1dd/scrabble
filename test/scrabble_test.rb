gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_multi_letters
    assert_equal 9, Scrabble.new.score_with_multipliers('hello', [1,2,1,1,1], 1)
  end

  def test_it_can_score_multi_letters_with_multiplier
    assert_equal 18, Scrabble.new.score_with_multipliers('hello', [1,2,1,1,1], 2)
  end

  def test_it_can_score_multi_letters_with_multiplier_and_add_bonus
    assert_equal 58, Scrabble.new.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)
  end

  def test_it_can_pick_highest_scoring_word
    assert_equal "home", Scrabble.new.highest_scoring_word(['home', 'word', 'hello', 'sound'])
  end

  def test_it_can_pick_highest_scoring_word_with_fewest_letters
    assert_equal "word", Scrabble.new.highest_scoring_word(['hello', 'word', 'sound'])
  end

  def test_it_can_pick_highest_scoring_word_with_seven_letters
    assert_equal "silence", Scrabble.new.highest_scoring_word(['home', 'word', 'silence'])
  end

  def test_it_will_pick_the_first_listed_if_words_have_same_score_and_length
    assert_equal "word", Scrabble.new.highest_scoring_word(['hi', 'word', 'ward'])
  end

end
