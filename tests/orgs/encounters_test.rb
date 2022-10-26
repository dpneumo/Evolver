# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../support/utility_methods'
require_relative '../test/mocks'
require_relative '../../orgs/encounters'

class TestOrg
  include UtilityMethods
  extend Encounters
end

class EncountersTest < Minitest::Test
  def test_encounter_count_returns_an_integer_gt_0
    species = 'vital_critter'
    ratio = 14
    encounters = TestOrg.encounter_count(species:, ratio:)
    assert 0 <= encounters
    assert encounters.is_a? Integer
  end

  def test_encounter_count_returns_0_for_ratio_eq_0
    species = 'vital_critter'
    ratio = 0
    encounters = TestOrg.encounter_count(species:, ratio:)
    assert_equal 0, encounters
    assert encounters.is_a? Integer
  end

  def test_encounter_count_approximates_satiety_for_large_ratios
    species = 'vital_critter'
    ratio = 40
    satiety = VitalCritter.enctr_parms['satiety']
    encounters = TestOrg.encounter_count(species:, ratio:)
    assert_in_delta satiety, encounters, 1
    assert encounters.is_a? Integer
  end

  def test_encounter_count_raises_for_ratio_eq_nil
    species = 'vital_critter'
    ratio = nil
    assert_raises do 
      TestOrg.encounter_count(species:, ratio:)
    end
  end

  def test_encounter_count_raises_for_string_ratio
    species = 'vital_critter'
    ratio = 'one potatoe'
    assert_raises do 
      TestOrg.encounter_count(species:, ratio:)
    end
  end
end