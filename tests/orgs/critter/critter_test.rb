# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../orgs/orgbase'
require_relative '../../../orgs/critter/critter'

class CritterTest < Minitest::Test
  def setup
    @critter = Critter.new
  end

  def test_critter_defaults
    assert_equal 'critter', @critter.species
    assert_equal 'red', @critter.color
  end

  def test_can_set_color_in_instance_initialization
    @critter_con_color = Critter.new(color: 'green')
    assert_equal 'green', @critter_con_color.color
  end
end
