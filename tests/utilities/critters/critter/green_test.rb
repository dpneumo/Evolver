# frozen_string_literal: true

require_relative '../../../tests'
require_relative '../../../test_helper'
require_relative '../../../../utilities/critters/critter/colors/green'

class Tests::Utilities::Critters::Critter::CritterColors::GreenTest < Minitest::Test
  def setup
    @clr = Utilities::Critters::Critter::CritterColors::Green.new
  end

  def test_color_name_is_green
    assert_equal 'green', @clr.name
  end

  def test_mutation_probabilities_sum_to_1
    assert_equal 1.00, @clr.mutations.values.sum
  end
end
