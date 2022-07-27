# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../orgs/orgbase'
require_relative '../../../orgs/coyote/coyote'

class CoyoteTest < Minitest::Test
  def setup
    @coyote = Coyote.new
  end

  def test_coyote_defaults
    assert_equal 'coyote', @coyote.species
    assert_equal 'black', @coyote.color
  end

  def test_can_set_color_in_instance_initialization
    @coyote_con_color = Coyote.new(color: 'green')
    assert_equal 'green', @coyote_con_color.color
  end
end
