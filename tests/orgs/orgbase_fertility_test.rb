# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../orgs/orgbase'

class OrgbaseFertilityTest < Minitest::Test
  # Test Orgbase validations
  def test_orgbase_birth_probability_ignores_an_age_lt_0
    age = -1
    color = 'test_color1'
    assert_equal 0.0, Orgbase.birth_probability(age: age, color: color)
  end

  def test_orgbase_birth_probability_ignores_a_non_integer_age
    age = 4.4
    color = 'test_color1'
    assert_equal 0.0, Orgbase.birth_probability(age: age, color: color)
  end

  def test_orgbase_birth_probability_returns_0_if_age_is_nil
    age = nil
    color = 'test_color1'
    assert_equal 0.0, Orgbase.birth_probability(age: age, color: color)
  end

  def test_orgbase_birth_probability_returns_0_if_color_is_nil
    age = 4
    color = nil
    assert_equal 0.0, Orgbase.birth_probability(age: age, color: color)
  end
end
