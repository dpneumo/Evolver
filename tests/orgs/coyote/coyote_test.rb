# frozen_string_literal: true

require_relative '../../test_helper'
require_relative '../../../orgs/orgbase'
require_relative '../../../orgs/coyote/coyote'

class CoyoteTest < Minitest::Test
  def setup
    toolbox = Toolbox.new
    @coyote = Coyote.new(toolbox: toolbox)
  end

  def test_coyote_defaults
    assert_equal 'coyote', @coyote.species
  end
end
