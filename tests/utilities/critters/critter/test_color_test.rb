# frozen_string_literal: true

require_relative '../../../tests'
require_relative '../../../test_helper'
require_relative '../../../../utilities/critters/critter/colors/test_color'

class Tests::Utilities::Critters::Critter::CritterColors::TestColorTest < Minitest::Test
  def setup
    @clr = Utilities::Critters::Critter::CritterColors::TestColor.new
  end

  def test_color_name_is_test_color
    assert_equal 'test_color', @clr.name
  end

  def test_mutation_probabilities_sum_to_1
    assert_equal 1.00, @clr.mutations.values.sum
  end
end
