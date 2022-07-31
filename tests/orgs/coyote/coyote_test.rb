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
