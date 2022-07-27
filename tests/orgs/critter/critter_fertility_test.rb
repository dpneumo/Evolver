# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../orgs/critter/critter_fertility'

class CritterFertilityTest < Minitest::Test
  def test_critter_birth_probability_returns_a_result_between_0_and_1
    age = 4
    color = 'test_color1'
    assert_includes 0..1, Critter.birth_probability(age: age, color: color)
  end

  def test_critter_birth_probability_converts_a_result_gt_1_to_1
    # TODO: fix dependence on actual age and color adj return values
    age = 3
    color = 'test_color2'
    assert_equal 1.00, Critter.birth_probability(age: age, color: color)
  end

  def test_critter_birth_probability_ignores_a_non_critter_color
    age = 4
    color = 'Apple'
    assert_equal 0, Critter.birth_probability(age: age, color: color)
  end

  def test_critter_birth_probability_ignores_an_empty_color
    age = 4
    color = ''
    assert_equal 0, Critter.birth_probability(age: age, color: color)
  end
end
