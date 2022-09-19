# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../orgs/rabbit/rabbit'

class RabbitTest < Minitest::Test
  def setup
    @rabbit = Rabbit.new
  end

# Class tests
  def test_Rabbit_class_defaults_are_set
    assert_equal 'rabbit', Rabbit.species
    assert Rabbit.satiety
    assert Rabbit.max_health
    assert Rabbit.max_vigor
    assert Rabbit.enctr_scale
  end

  def test_Rabbit_colors_returns_an_array
    assert Rabbit.colors.is_a? Array
  end

  def test_Rabbit_mutations_is_a_hash_of_hashes_with_float_values
    assert Rabbit.mutations.is_a? Hash
    Rabbit.mutations.each do |key, mutation_hash|
      assert mutation_hash.is_a? Hash
      mutation_hash.values.each do |val|
        assert_equal Float, val.class
      end
    end
  end

  def test_every_Rabbit_color_is_a_Rabbit_mutations_key
    Rabbit.colors.each do |color|
      assert Rabbit.mutations.has_key? color
    end
  end

  def test_every_Rabbit_color_is_a_mutation_hash_key
    Rabbit.mutations.each do |key, mutation_hash|
      Rabbit.colors.each do |color|
        assert mutation_hash.has_key? color
      end
    end
  end

# Instance tests
  def test_rabbit_defaults
    assert_equal 'black', @rabbit.color
  end

  def test_a_rabbit_instance_knows_its_species
    assert_equal 'rabbit', @rabbit.species
  end

  def test_can_set_color_in_instance_initialization
    @rabbit_con_color = Rabbit.new(color: 'mauve')
    assert_equal 'mauve', @rabbit_con_color.color
  end

  def test_a_new_rabbit_eats_prob_is_close_to_1
    assert_in_delta 1.0, @rabbit.eats_prob, 0.1
  end

  def test_a_1_yo_rabbit_with_vigor_and_health_50_has_eaten_vulnerability_near_0
    @rabbit.age = 1
    @rabbit.health = @rabbit.vigor = 50
    assert_in_delta 0.0, @rabbit.eaten_vulnerability, 0.1
  end
end
