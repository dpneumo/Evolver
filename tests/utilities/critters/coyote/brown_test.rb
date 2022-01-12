# frozen_string_literal: true

require_relative '../../../tests'
require_relative '../../../../utilities/critters/coyote/brown'
require_relative '../../../test_helper'

class Tests::Utilities::Critters::Coyote::BrownTest < Minitest::Test
  def setup
    @clr = Utilities::Critters::Coyote::Brown.new
  end

  def test_color_name_is_brown
    assert_equal 'brown', @clr.name
  end

  def test_mutation_probabilities_sum_to_1
    assert_equal 1.00, @clr.mutations.values.sum
  end
end
