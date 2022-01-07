# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../models/coyote'

class CoyoteTest < Minitest::Test
  def setup
    toolbox = Toolbox.new
    @coyote = Coyote.new(toolbox: toolbox)
  end

  def test_coyote_defaults
    assert_equal 'coyote', @coyote.species_name
    assert_equal 1, @coyote.color_id
  end
end
