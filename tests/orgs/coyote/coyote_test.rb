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
  end

  def test_Coyote_mutations_is_a_hash_of_hashes_with_float_values
    assert Coyote.mutations.is_a? Hash
    Coyote.mutations.each do |key, mutation_hash|
      assert mutation_hash.is_a? Hash
      mutation_hash.values.each do |val|
        assert_equal Float, val.class
      end
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

  def test_a_new_coyote_eats_prob_is_close_to_1
    assert_in_delta 1.0, @coyote.eats_prob, 0.1
  end

  def test_a_1_yo_coyote_with_vigor_and_health_50_has_eaten_vulnerability_near_0
    @coyote.age = 1
    @coyote.health = @coyote.vigor = 50
    assert_in_delta 0.0, @coyote.eaten_vulnerability, 0.1
  end
end
