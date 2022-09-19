# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../orgs/carrot/carrot'

class CarrotTest < Minitest::Test
  def setup
    @carrot = Carrot.new
  end

# Class tests
  def test_Carrot_class_defaults_are_set
    assert_equal 'carrot', Carrot.species
    assert Carrot.satiety
    assert Carrot.max_health
    assert Carrot.max_vigor
    assert Carrot.enctr_scale
  end

  def test_Carrot_colors_returns_an_array
    assert Carrot.colors.is_a? Array
  end

  def test_Carrot_mutations_is_a_hash_of_hashes_with_float_values
    assert Carrot.mutations.is_a? Hash
    Carrot.mutations.each do |key, mutation_hash|
      assert mutation_hash.is_a? Hash
      mutation_hash.values.each do |val|
        assert_equal Float, val.class
      end
    end
  end

  def test_every_Carrot_color_is_a_Carrot_mutations_key
    Carrot.colors.each do |color|
      assert Carrot.mutations.has_key? color
    end
  end

  def test_every_Carrot_color_is_a_mutation_hash_key
    Carrot.mutations.each do |key, mutation_hash|
      Carrot.colors.each do |color|
        assert mutation_hash.has_key? color
      end
    end
  end


# Instance tests
  def test_carrot_defaults
    assert_equal 'yellow', @carrot.color
  end

  def test_a_carrot_instance_knows_its_species
    assert_equal 'carrot', @carrot.species
  end

  def test_can_set_color_in_instance_initialization
    @carrot_con_color = Carrot.new(color: 'mauve')
    assert_equal 'mauve', @carrot_con_color.color
  end

  def test_carrot_eats_prob_is_0
    assert_equal 0.0, @carrot.eats_prob
  end

  def test_carrot_eaten_vulnerability_is_1
    assert_equal 1.0, @carrot.eaten_vulnerability
  end
end
