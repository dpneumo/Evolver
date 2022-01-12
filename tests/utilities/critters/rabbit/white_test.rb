# frozen_string_literal: true

require_relative '../../../tests'
require_relative '../../../test_helper'
require_relative '../../../../utilities/critters/rabbit/white'

class Tests::Utilities::Critters::Rabbit::WhiteTest < Minitest::Test
  def setup
    @clr = Utilities::Critters::Rabbit::White.new
  end

  def test_rabbit_color_name_is_white
    assert_equal 'white', @clr.name
  end

  def test_white_rabbit_mutation_probabilities_sum_to_1
    assert_equal 1.00, @clr.mutations.values.sum
  end
end
