# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../support/utility_methods'
require_relative '../../orgs/vitality'

class TestOrg
  include UtilityMethods
  extend Vitality
end

class VitalityTest < Minitest::Test
  def test_survival_probability_returns_value_between_0_and_1
    age = 3
    color = 'gray'
    species = 'vital_critter'
    vitality = TestOrg.survival_probability(species:, color:, age:)
    assert 0.0 <= vitality
    assert vitality <= 1.0 
  end

  def test_survival_probability_returns_0_if_age_lt_0
    age = -1
    color = 'gray'
    species = 'vital_critter'
    assert_equal 0.0, TestOrg.survival_probability(species:, color:, age:)
  end

  def test_survival_probability_returns_0_if_age_is_a_non_integer
    age = 4.4
    color = 'gray'
    species = 'vital_critter'
    assert_equal 0.0, TestOrg.survival_probability(species:, color:, age:)
  end

  def test_survival_probability_raises_ArgumentError_for_a_nil_age_argument
    age = nil
    color = 'gray'
    species = 'vital_critter'
    assert_raises ArgumentError do
      TestOrg.survival_probability(species:, color:, age:)
    end 
  end

  def test_orgbase_survival_probability_returns_0_if_color_is_not_a_string
    age = 4
    color = 9
    species = 'vital_critter'
    assert_equal 0.0, TestOrg.survival_probability(species:, color:, age:)
  end

  def test_survival_probability_raises_raises_ArgumentError_for_a_nil_color_argument
    age = 3
    color = nil
    species = 'vital_critter'
    assert_raises ArgumentError do
      TestOrg.survival_probability(species:, color:, age:)
    end 
  end

  def test_survival_probability_raises_raises_ArgumentError_for_a_nil_species_argument
    age = 3
    color = 'gray'
    species = nil
    assert_raises ArgumentError do
      TestOrg.survival_probability(species:, color:, age:)
    end 
  end

  def test_survival_probability_returns_0_for_age_not_in_vitality_hash_keys
    age = 99
    color = 'gray'
    species = 'vital_critter'
    assert_equal 0.0, TestOrg.survival_probability(species:, color:, age:)
  end

  def test_survival_probability_returns_0_for_color_not_in_vitality_hash_keys
    age = 3
    color = 'What?'
    species = 'vital_critter'
    assert_equal 0.0, TestOrg.survival_probability(species:, color:, age:)
  end

  def test_survival_probability_raises_NameError_for_species_not_in_vitality_hash_keys
    age = 3
    color = 'gray'
    species = 'boing_boing'
    assert_raises NameError do 
      TestOrg.survival_probability(species:, color:, age:)
    end
  end
end
