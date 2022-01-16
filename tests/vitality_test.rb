# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../utilities/vitality'

class VitalityTest < Minitest::Test
  def setup
    resource = MockToolbox.new.resource
    @vitality = Vitality.new(resource: resource)
  end

  def test_probability_returns_a_result_between_0_and_1
    age = 4
    color = 'brown'
    assert_includes 0.0..1.0, @vitality.probability(age: age, color: color)
  end

  def test_probability_ignores_an_age_lt_0
    age = -1
    color = 'brown'
    assert_equal 1.0, @vitality.probability(age: age, color: color)
  end

  def test_probability_ignores_a_non_integer_age
    age = 4.4
    color = 'brown'
    assert_equal 1.0, @vitality.probability(age: age, color: color)
  end

  def test_probability_ignores_a_color_lt_0
    age = 4
    color = -'test_color'
    assert_equal 1.0, @vitality.probability(age: age, color: color)
  end

  def test_probability_ignores_a_non_integer_color
    age = 4
    color = 'test_color'
    assert_equal 1.00, @vitality.probability(age: age, color: color)
  end

  def test_probability_returns_1_if_age_is_nil
    age = nil
    color = 'brown'
    assert_equal 1.0, @vitality.probability(age: age, color: color)
  end

  def test_probability_returns_1_if_color_is_nil
    age = 4
    color = nil
    assert_equal 1.0, @vitality.probability(age: age, color: color)
  end
end
