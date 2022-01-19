# frozen_string_literal: true

require_relative 'test_helper'

class UtilityMethodsTest < Minitest::Test
  include UtilityMethods

  def test_roll
    threesided = {1 => 0.2, 2 => 0.3, 3 => 0.5}
    results = Hash.new {|h,side| h[side] = 0 }
    (1..1000).reduce(results) do |results,_|
      throw = roll(loaded_die: threesided)
      results[throw] += 1
      results
    end
    assert_equal 1000, results[1]+results[2]+results[3]
    assert_in_delta 200, results[1], 40
    assert_in_delta 300, results[2], 60
    assert_in_delta 500, results[3], 100
  end

  def test_flip
    assert_equal 10, flip_results(coin: 1.0)[true]
    assert_equal 10, flip_results(coin: 0.0)[false]
    res = flip_results(coin: 0.5,times: 100)[true]
    assert_in_delta 50, res, 10
  end

  def flip_results(coin:,times: 10)
    results = Hash.new {|h,toss| h[toss] = 0 }
    (1..times).reduce(results) do |results,_|
      results[flip(biased_coin: coin)] += 1
      results
    end
  end

  def test_mean_returns_0_for_count_0
    assert_equal 0, mean(count: 0, sum: 10)
  end

  def test_mean_returns_mean_of_count_values
    assert_equal 2.5, mean(count: 4, sum: 10)
  end
end

