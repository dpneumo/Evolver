# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../orgs/orgbase'
require_relative '../../../orgs/carrot/carrot'

class CarrotTest < Minitest::Test
  def setup
    @carrot = Carrot.new
  end

  def test_carrot_defaults
    assert_equal 'carrot', @carrot.species
    assert_equal 'yellow', @carrot.color
  end

  def test_can_set_color_in_instance_initialization
    @carrot_con_color = Carrot.new(color: 'green')
    assert_equal 'green', @carrot_con_color.color
  end
end
