# frozen_string_literal: true

require_relative '../../../tests'
require_relative '../../../test_helper'
require_relative '../../../../utilities/critters/coyote/colors/white'

class Tests::Utilities::Critters::Coyote::WhiteTest < Minitest::Test
  def setup
    @clr = Utilities::Critters::Coyote::CoyoteColors::White.new
  end

  def test_color_name_is_white
    assert_equal 'white', @clr.name
  end

  def test_mutation_probabilities_sum_to_1
    assert_equal 1.00, @clr.mutations.values.sum
  end
end
