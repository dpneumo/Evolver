# frozen_string_literal: true

require_relative '../../../tests'
require_relative '../../../../utilities/critters/coyote/test_color'
require_relative '../../../test_helper'

class Tests::Utilities::Critters::Coyote::TestColorTest < Minitest::Test
  def setup
    @clr = Utilities::Critters::Coyote::TestColor.new
  end

  def test_color_name_is_test_color
    assert_equal 'test_color', @clr.name
  end

  def test_mutation_probabilities_sum_to_1
    assert_equal 1.00, @clr.mutations.values.sum
  end
end
