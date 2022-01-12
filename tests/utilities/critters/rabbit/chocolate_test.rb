# frozen_string_literal: true

require_relative '../../../tests'
require_relative '../../../test_helper'
require_relative '../../../../utilities/critters/rabbit/chocolate'

class Tests::Utilities::Critters::Rabbit::ChocolateTest < Minitest::Test
  def setup
    @clr = Utilities::Critters::Rabbit::Chocolate.new
  end

  def test_rabbit_color_name_is_chocolate
    assert_equal 'chocolate', @clr.name
  end

  def test_chocolate_rabbit_mutation_probabilities_sum_to_1
    assert_equal 1.00, @clr.mutations.values.sum
  end
end
