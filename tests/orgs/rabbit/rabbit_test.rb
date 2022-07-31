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
