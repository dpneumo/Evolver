# frozen_string_literal: true

#require_relative '../../../tests'
require_relative '../../../test_helper'
require_relative '../../../../utilities/critters/rabbit/rabbit_fertility'

class RabbitObj; extend RabbitFertility; end

class RabbitFertilityTest < Minitest::Test
  def test_rabbit_probability_returns_a_result_between_0_and_1
    age = 4
    color = 'brown'
    assert_includes 0..1, RabbitObj.probability(age: age, color: color)
  end

  def test_rabbit_probability_converts_a_result_gt_1_to_1
    # TODO: fix dependence on actual age and color adj return values
    age = 3
    color = 'chocolate'
    assert_equal 1.00, RabbitObj.probability(age: age, color: color)
  end

  def test_rabbit_probability_ignores_an_age_lt_0
    age = -1
    color = 'brown'
    assert_equal 0, RabbitObj.probability(age: age, color: color)
  end

  def test_rabbit_probability_ignores_a_non_integer_age
    age = 4.4
    color = 'brown'
    assert_equal 0, RabbitObj.probability(age: age, color: color)
  end

  def test_rabbit_probability_ignores_a_non_rabbit_color
    age = 3
    color = 'orange'
    assert_equal 0, RabbitObj.probability(age: age, color: color)
  end

  def test_rabbit_probability_ignores_an_empty_color
    age = 4
    color = ''
    assert_equal 0, RabbitObj.probability(age: age, color: color)
  end

  def test_rabbit_probability_returns_0_if_age_is_nil
    age = nil
    color = 'brown'
    assert_equal 0, RabbitObj.probability(age: age, color: color)
  end

  def test_rabbit_probability_returns_0_if_color_is_nil
    age = 4
    color = nil
    assert_equal 0, RabbitObj.probability(age: age, color: color)
  end
end
