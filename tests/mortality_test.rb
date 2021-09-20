# frozen_string_literal: true

require_relative '../utilities/resource'
require_relative '../utilities/mortality'
require_relative 'test_helper'

class MortalityTest < Minitest::Test
  def test_probability_returns_a_result_between_0_and_1
    age = 4

    color_id = 2
    assert_includes 0..1, Mortality.new.probability(age, color_id)
  end

  def test_probability_converts_a_negative_result_to_0
    age = 0
    color_id = 4
    assert_includes 0..1, Mortality.new.probability(age, color_id)
  end

  def test_probability_converts_a_result_gt_1_to_1
    age = 4
    color_id = 0
    assert_equal 1.00, Mortality.new.probability(age, color_id)
  end

  def test_probability_ignores_an_age_lt_0
    age = -1
    color_id = 2
    assert_equal 0, Mortality.new.probability(age, color_id)
  end

  def test_probability_ignores_a_non_integer_age
    age = 4.4
    color_id = 2
    assert_equal 0, Mortality.new.probability(age, color_id)
  end

  def test_probability_ignores_a_color_id_lt_0
    age = 4
    color_id = -2
    assert_equal 0, Mortality.new.probability(age, color_id)
  end

  def test_probability_ignores_a_non_integer_color_id
    age = 4
    color_id = 2.4
    assert_equal 0, Mortality.new.probability(age, color_id)
  end

  def test_probability_returns_0_if_age_is_nil
    age = nil
    color_id = 2
    assert_equal 0, Mortality.new.probability(age, color_id)
  end

  def test_probability_returns_0_if_color_id_is_nil
    age = 4
    color_id = nil
    assert_equal 0, Mortality.new.probability(age, color_id)
  end
end
