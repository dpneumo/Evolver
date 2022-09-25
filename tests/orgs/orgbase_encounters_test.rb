# frozen_string_literal: true

require_relative '../test_helper'
require_relative '../../orgs/orgbase_encounters'

class TestOrg
  include UtilityMethods
  extend OrgbaseEncounters
end

class OrgbaseEncountersTest < Minitest::Test
	# Test Defaults are implemented
	def test_implements_satiety_and_provides_default
		default_satiety = 20
		assert_equal default_satiety, TestOrg.satiety
	end

	def test_implements_midpoint_ratio_and_provides_default
		default_ratio_midpoint = 10.0
		assert_equal default_ratio_midpoint, TestOrg.ratio_midpoint
	end

	def test_implements_enctr_scale_and_provides_default
		default_enctr_scale = 5.0
		assert_equal default_enctr_scale, TestOrg.enctr_scale
	end

	# Test encounter size logic
  def test_each_creature_class_has_a_unique_enctr_sizes_hash
    oids = Orgbase.subclasses.collect do |klass| 
    	klass.enctr_sizes_hash.object_id 
    end
    assert_nil oids.uniq!
  end

	# Using logistic_encounter
  def test_logistic_encounter_returns_0_for_ratio_1
  	assert_equal 0, TestOrg.send(:logistic_encounter, 0)
  end

  def test_logistic_encounter_returns_0_for_ratio_2
  	assert_equal 10, TestOrg.send(:logistic_encounter, 10.0)
  end

  def test_log2_encounter_returns_0_for_ratio_1
  	assert_equal 0, TestOrg.send(:log2_encounter, 1)
  end

  def test_log2_encounter_returns_0_for_ratio_2
  	assert_equal 5, TestOrg.send(:log2_encounter, 2)
  end
end
