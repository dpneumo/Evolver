# frozen_string_literal: true

require_relative '../../../tests'
require_relative '../../../../utilities/critters/rabbit/black'
require_relative '../../../test_helper'

class Tests::Utilities::Critters::Rabbit::BlackTest < Minitest::Test
  def setup
    @clr = Utilities::Critters::Rabbit::Black.new
  end

  def test_rabbit_color_name_is_black
    assert_equal 'black', @clr.name
  end

  def test_black_rabbit_mutation_probabilities_sum_to_1
    assert_equal 1.00, @clr.mutations.values.sum
  end
end
