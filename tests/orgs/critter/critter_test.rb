# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../orgs/critter/critter'

class CritterTest < Minitest::Test
  def setup
    @critter = Critter.new
  end

# Class tests
  def test_Critter_class_defaults_are_set
    assert_equal 'critter', Critter.species
    assert Critter.satiety
    assert Critter.max_health
    assert Critter.max_vigor
    assert Critter.enctr_scale
  end

  def test_Critter_colors_returns_an_array
    assert Critter.colors.is_a? Array
  end

  def test_Critter_mutations_is_a_hash_of_hashes_with_float_values
    assert Critter.mutations.is_a? Hash
    Critter.mutations.each do |key, mutation_hash|
      assert mutation_hash.is_a? Hash
      mutation_hash.values.each do |val|
        assert_equal Float, val.class
      end
    end
  end

  def test_every_Critter_color_is_a_Critter_mutations_key
    Critter.colors.each do |color|
      assert Critter.mutations.has_key? color
    end
  end

  def test_every_Critter_color_is_a_mutation_hash_key
    Critter.mutations.each do |key, mutation_hash|
      Critter.colors.each do |color|
        assert mutation_hash.has_key? color
      end
    end
  end

  def test_Critter_age_curve_always_returns_the_same_hash
    initial_curve = Critter.age_curve
    assert initial_curve == Critter.age_curve
    assert_equal Hash, Critter.age_curve.class
  end

  def test_Critter_health_curve_always_returns_the_same_hash
    initial_curve = Critter.health_curve
    assert initial_curve == Critter.health_curve
    assert_equal Hash, Critter.health_curve.class 
  end

  def test_Critter_vigor_curve_always_returns_the_same_hash
    initial_curve = Critter.vigor_curve
    assert initial_curve == Critter.vigor_curve
    assert_equal Hash, Critter.vigor_curve.class 
  end

# Instance tests
  def test_critter_defaults
    assert_equal 'red', @critter.color
  end

  def test_a_critter_instance_knows_its_species
    assert_equal 'critter', @critter.species
  end

  def test_can_set_color_in_instance_initialization
    @critter_con_color = Critter.new(color: 'green')
    assert_equal 'green', @critter_con_color.color
  end
end
