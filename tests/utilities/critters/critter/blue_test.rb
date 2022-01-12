# frozen_string_literal: true

require_relative '../../../tests'
require_relative '../../../../utilities/critters/critter/blue'
require_relative '../../../test_helper'

class Tests::Utilities::Critters::Critter::BlueTest < Minitest::Test
  def setup
    @clr = Utilities::Critters::Critter::Blue.new
  end

  def test_color_name_is_blue
    assert_equal 'blue', @clr.name
  end

  def test_mutation_probabilities_sum_to_1
    assert_equal 1.00, @clr.mutations.values.sum
  end
end
