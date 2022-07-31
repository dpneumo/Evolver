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
