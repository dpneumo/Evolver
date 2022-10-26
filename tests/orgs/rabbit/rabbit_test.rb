# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../test/interfaces/orgbase_interface_test'
require_relative '../../test/interfaces/mock_creatures_interface_test'
require_relative '../../../orgs/rabbit/rabbit'

class RabbitTest < Minitest::Test
  include OrgbaseInterfaceTest
  include MockCreaturesInterfaceTest
  def setup
    @rabbit = @object = Rabbit.new
  end

# Class tests
  def test_Rabbit_class_defaults_are_set
    assert_equal 'rabbit', Rabbit.species
    assert Rabbit.satiety
    assert Rabbit.max_health
    assert Rabbit.max_vigor
  end

  def test_Rabbit_colors_returns_an_array
    assert Rabbit.colors.is_a? Array
    Rabbit.colors.each do |color|
      assert color.is_a? String
    end
  end

  def test_Rabbit_mutations_is_a_hash_of_hashes_with_float_values
    assert Rabbit.mutations.is_a? Hash
    Rabbit.mutations.each do |_, mutation_hash|
      assert mutation_hash.is_a? Hash
      assert_equal 1.00, mutation_hash.values.sum
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

  def test_Rabbit_age_curve_always_returns_the_same_hash
    initial_curve = Rabbit.age_curve
    assert initial_curve == Rabbit.age_curve
    assert_equal Hash, Rabbit.age_curve.class
  end

  def test_Rabbit_health_curve_always_returns_the_same_hash
    initial_curve = Rabbit.health_curve
    assert initial_curve == Rabbit.health_curve
    assert_equal Hash, Rabbit.health_curve.class 
  end

  def test_Rabbit_vigor_curve_always_returns_the_same_hash
    initial_curve = Rabbit.vigor_curve
    assert initial_curve == Rabbit.vigor_curve
    assert_equal Hash, Rabbit.vigor_curve.class 
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
end
