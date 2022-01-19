# frozen_string_literal: true

require_relative '../../tests'
require_relative '../../test_helper'
require_relative '../../../orgs/rabbit/vitality'

class Tests::Utilities::Critters::Rabbit::VitalityTest < Minitest::Test
  def setup
    resource = MockToolbox.new.resource
    @vitality = Utilities::Critters::Rabbit::Vitality.new(resource: resource)
  end

  def test_probability_returns_a_result_between_0_and_1
    age = 4
    color_id = 2
    assert_includes 0.0..1.0, @vitality.probability(age: age, color_id: color_id)
  end

  def test_probability_ignores_an_age_lt_0
    age = -1
    color_id = 2
    assert_equal 1.0, @vitality.probability(age: age, color_id: color_id)
  end

  def test_probability_ignores_a_non_integer_age
    age = 4.4
    color_id = 2
    assert_equal 1.0, @vitality.probability(age: age, color_id: color_id)
  end

  def test_probability_ignores_a_color_id_lt_0
    age = 4
    color_id = -2
    assert_equal 1.0, @vitality.probability(age: age, color_id: color_id)
  end

  def test_probability_ignores_a_non_integer_color_id
    age = 4
    color_id = 2.4
    assert_equal 1.00, @vitality.probability(age: age, color_id: color_id)
  end

  def test_probability_returns_1_if_age_is_nil
    age = nil
    color_id = 2
    assert_equal 1.0, @vitality.probability(age: age, color_id: color_id)
  end

  def test_probability_returns_1_if_color_id_is_nil
    age = 4
    color_id = nil
    assert_equal 1.0, @vitality.probability(age: age, color_id: color_id)
  end
end
