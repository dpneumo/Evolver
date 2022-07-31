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
end
