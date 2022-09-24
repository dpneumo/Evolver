# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../orgs/coyote/coyote'

class CoyoteTest < Minitest::Test
  def setup
    @coyote = Coyote.new
  end

# Class tests
  def test_coyote_class_defaults_are_set
    assert_equal 'coyote', Coyote.species
    assert Coyote.satiety
    assert Coyote.max_health
    assert Coyote.max_vigor
    assert Coyote.enctr_scale
  end

  def test_Coyote_colors_returns_an_array
    assert Coyote.colors.is_a? Array
    Coyote.colors.each do |color|
      assert color.is_a? String
    end
  end

  def test_Coyote_mutations_is_a_hash_of_hashes_with_float_values_summing_to_one
    assert Coyote.mutations.is_a? Hash
    Coyote.mutations.each do |_, mutation_hash|
      assert mutation_hash.is_a? Hash
      assert_equal 1.00, mutation_hash.values.sum
    end
  end

  def test_every_Coyote_color_is_a_Coyote_mutations_key
    Coyote.colors.each do |color|
      assert Coyote.mutations.has_key? color
    end
  end

  def test_every_Coyote_color_is_a_mutation_hash_key
    Coyote.mutations.each do |key, mutation_hash|
      Coyote.colors.each do |color|
        assert mutation_hash.has_key? color
      end
    end
  end

  def test_Coyote_age_curve_always_returns_the_same_hash
    initial_curve = Coyote.age_curve
    assert initial_curve == Coyote.age_curve
    assert_equal Hash, Coyote.age_curve.class
  end

  def test_Coyote_health_curve_always_returns_the_same_hash
    initial_curve = Coyote.health_curve
    assert initial_curve == Coyote.health_curve
    assert_equal Hash, Coyote.health_curve.class 
  end

  def test_Coyote_vigor_curve_always_returns_the_same_hash
    initial_curve = Coyote.vigor_curve
    assert initial_curve == Coyote.vigor_curve
    assert_equal Hash, Coyote.vigor_curve.class 
  end

# Instance tests
  def test_coyote_defaults
    assert_equal 'black', @coyote.color
  end

  def test_a_coyote_instance_knows_its_species
    assert_equal 'coyote', @coyote.species
  end

  def test_can_set_color_in_instance_initialization
    @coyote_con_color = Coyote.new(color: 'mauve')
    assert_equal 'mauve', @coyote_con_color.color
  end
end
